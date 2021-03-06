module Fog
  module Compute
    class OneAndOne

      class Real

        ##
        # Returns a list of a firewall policy's rules
        # URL: [https://cloudpanel-api.1and1.com/documentation/1and1/v1/en/documentation.html#firewall_policies__firewall_id__rules_get]
        ##
        def list_firewall_rules(firewall_id)
          
          params = {
            'method' => :get,
            'endpoint' => "/firewall_policies/#{firewall_id}/rules"
          }

          request(params)

        end

      end # Real

      
      class Mock

        def list_firewall_rules(firewall_id)
          
          # Search for firewall to return
          if firewall = self.data[:firewalls].find {
            |hash| hash['id'] == firewall_id
          }
          else
            raise Fog::Errors::NotFound.new('The requested resource could
              not be found.')
          end

          # Return Response Object to User
          response = Excon::Response.new
          response.status = 202
          response.body = firewall['rules']
          response

        end

      end # Mock

    end # OneAndOne
  end # Compute
end # Fog