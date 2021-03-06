module ParkingDay
  module Helpers
    module HttpAuth
 
      def auth
        @auth ||= Rack::Auth::Basic::Request.new(request.env)
      end
 
      def unauthorized!(realm="TBG Parking Day")
        response['WWW-Authenticate'] = %(Basic realm="#{realm}")
        throw :halt, [ 401, 'Authorization Required' ]
      end
 
      def bad_request!
        throw :halt, [ 400, 'Bad Request' ]
      end
 
      def authorized?
        request.env['REMOTE_USER']
      end
 
      def authorize(username, password)
       if username = settings(:admin)[:user] && password = settings(:admin)[:password]
         return true
       end
       false
      end
 
      def require_administrative_privileges
        return if authorized?
        unauthorized! unless auth.provided?
        bad_request! unless auth.basic?
        unauthorized! unless authorize(*auth.credentials)
        request.env['REMOTE_USER'] = auth.username
      end
 
      def admin?
        authorized?
      end
 
    end
  end
end