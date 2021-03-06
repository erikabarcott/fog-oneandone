module Fog
  module Compute
    class OneAndOne

      class Real

        ##
        # Returns a list of the server's private networks
        # URL: [https://cloudpanel-api.1and1.com/documentation/1and1/v1/en/documentation.html#servers__server_id__private_networks_get]
        ##
        def list_server_private_networks(server_id)
          
          params = {
            'method' => :get,
            'endpoint' => "/servers/#{server_id}/private_networks"
          }

          request(params)

        end

      end # Real

      
      class Mock

        def list_server_private_networks(server_id)
          
          # Search for server
          if server = self.data[:servers].find {
            |hash| hash['id'] == server_id
          }
          else
            raise Fog::Errors::NotFound.new('The requested resource could
              not be found.')
          end

          # Return Response Object to User
          response = Excon::Response.new
          response.status = 200
          response.body = server['private_networks']
          response

        end

      end # Mock

    end # OneAndOne
  end # Compute
end # Fog