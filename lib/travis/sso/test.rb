module Travis
  module SSO
    class Test < Session
      class << self
        attr_reader :user

        def sign_in(user)
          @user ||= user
        end

        def sign_out
          @user = nil
        end
      end

      def authenticated?(request)
        !!self.class.user
      end

      def login(request)
        return unless self.class.user

        set_user(request, self.class.user)
        pass(request)
      end
    end
  end
end

