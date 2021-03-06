module Fog
  module Compute
    class OneAndOne

      class Real

        ##
        # Returns a list of a monitoring policy's ports
        # URL: [https://cloudpanel-api.1and1.com/documentation/1and1/v1/en/documentation.html#monitoring_policies__monitoring_policy_id__ports_get]
        ##
        def list_ports(monitoring_policy_id)

          # Request
          params = {
            'method' => :get,
            'endpoint' => "/monitoring_policies/#{monitoring_policy_id}/ports"
          }

          request(params)

        end

      end # Real

      
      class Mock

        def list_ports(monitoring_policy_id)
          
          # Search for MP
          if monitoring_policy = self.data[:monitoring_policies].find {
            |hash| hash['id'] == monitoring_policy_id
          }
          else
            raise Fog::Errors::NotFound.new('The requested resource could
              not be found.')
          end

          # Return Response Object to User
          response = Excon::Response.new
          response.status = 200
          response.body = monitoring_policy['ports']
          response

        end

      end # Mock

    end # OneAndOne
  end # Compute
end # Fog