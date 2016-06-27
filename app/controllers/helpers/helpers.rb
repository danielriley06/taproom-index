module Sinatra
  module TaproomIndex
    module Helpers
      def redirect_if_not_logged_in
        if !logged_in?
          redirect "/login?error=You have to be logged in to do that"
        end
      end

      def logged_in?
        !!session[:user_id]
      end

      def current_user
        User.find(session[:user_id])
      end
    end
  end
end
