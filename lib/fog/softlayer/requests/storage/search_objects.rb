module Fog
  module Storage
    class Softlayer
      class Real

        # Search api on objects.
        #
        # ==== Parameters
        # * container<~String> - Name for container, should be < 256 bytes and must not contain '/'
        # * object<~String> - Name for object
        # * options<~Hash> - config headers for object. Defaults to {}.
        #
        # cf. https://wiki.openstack.org/wiki/MetadataSearchAPI
        # cf. http://sldn.softlayer.com/article/API-Operations-Search-Services
        #
        # Please use the OSMS API
        #
        # Example: search of objects where upload was not complete
        # CONN.search_objects('masv-test', { q: 'true', field: 'meta.success'})
        def search_objects(container, query_params={})
          default_query_params = {
            type: 'object',
            format: :json
          }

          params = {
            :expects => 200,
            :headers => { 'X-Context' => 'search' },
            :method => 'GET',
            :query => default_query_params.merge(query_params),
            :path => "#{Fog::Softlayer.escape(container)}"
          }

          request(params)
        end
      end
    end
  end
end
