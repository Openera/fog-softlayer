module Fog
  module Storage
    class Softlayer
      class Real

        # Creates or updates object metadata.
        #
        # ==== Parameters
        # * container<~String> - Name for container, should be < 256 bytes and must not contain '/'
        # * object<~String> - Name for object
        # * data<~String|File> - data to upload
        # * options<~Hash> - config headers for object. Defaults to {}.
        #
        # cf. http://developer.openstack.org/api-ref/object-storage/?expanded=create-or-update-object-metadata-detail
        def update_object_metadata(container, object, options={})
          special_headers = ['Content-Type', 'Content-Encoding', 'Content-Disposition', 'X-Delete-At']
          
          # Get current file metadata as we need to provide all metadata items for the POST action
          object_info = head_object(container, object).headers
          existing_headers = object_info.select do |k,_| 
            k.start_with?("X-Object-Meta-") || special_headers.include?(k.to_s)
          end 

          headers_to_add = options.inject({}) do |memo, (k, v)| 
            k = (k.to_s.start_with?('X-Object-Meta-') || 
                 special_headers.include?(k.to_s)
                ) ? k.to_s : "X-Object-Meta-#{k}"
            memo[k] = v 
            memo 
          end

          params = {
            :expects  => 202,
            :headers  => existing_headers.merge(headers_to_add),
            :method   => 'POST',  # POST is more efficient that the COPY method
            :path     => "#{Fog::Softlayer.escape(container)}/#{Fog::Softlayer.escape(object)}",
            :read_timeout => 1 # Force Read failure on large objects and return
          }

          # Support manifest files
          params[:query] = 'multipart-manifest=get' if object_info["X-Object-Manifest"] && !object_info["X-Object-Manifest"].empty?

          request(params)
        rescue Excon::Error::Timeout # Large Object support
          true
        end
      end
    end
  end
end
