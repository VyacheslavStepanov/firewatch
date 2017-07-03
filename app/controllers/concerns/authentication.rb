module Authentication
  extend ActiveSupport::Concern

  included do
    helper do
      def current_user
        super.decorate if user_signed_in?
      end
    end
  end

  private

  def devise_parameter_sanitizer
    resource_class == User ? User::ParameterSanitizer.new(User, :user, params) : super
  end
end
