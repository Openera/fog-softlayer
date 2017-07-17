module Fog
  module Storage
    class Softlayer
      class Real

        # Update a dynamic large object manifest
        #
        # Re-used from put_dynamic_obj_manifest
        #
        # @param container [String] Name for container where +object+ will be stored. Should be < 256 bytes and must not contain '/'
        # @param object [String] Name for manifest object.
        # @param options [Hash] Config headers for +object+.
        # @option options [String] 'X-Object-Manifest' ("container/object") "<container>/<prefix>" for segment objects.
        #
        # @raise [Fog::Storage::Softlayer::NotFound] HTTP 404
        # @raise [Excon::Errors::BadRequest] HTTP 400
        # @raise [Excon::Errors::Unauthorized] HTTP 401
        # @raise [Excon::Errors::HTTPStatusError]
        #
        # @see http://docs.openstack.org/api/openstack-object-storage/1.0/content/dynamic-large-object-creation.html
        def post_dynamic_obj_manifest(container, object, options = {})
          path = "#{Fog::Softlayer.escape(container)}/#{Fog::Softlayer.escape(object)}"
          headers = {'X-Object-Manifest' => path}.merge(options)
          request(
            :expects  => 202,
            :headers  => headers,
            :method   => 'POST',
            :path     => path
          )
        end

      end
    end
  end
end
