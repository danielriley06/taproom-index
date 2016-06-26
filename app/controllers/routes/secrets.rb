module Sinatra
  module TaproomIndex
    module Routing
      module Secrets

        def self.registered(app)
          show_breweries = lambda do
            require_logged_in
            erb :'breweries/breweries'
          end

          app.get  '/breweries', &show_breweries
        end

      end
    end
  end
end
