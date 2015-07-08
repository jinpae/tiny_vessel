class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.for(:sign_in).concat([
				:username,
				:name,
				:bio,
				:twitter_id,
				:github_id,
				:linkedin_id,
				:website_url
			])

			devise_parameter_sanitizer.for(:account_update).concat([
				:username,
				:name,
				:bio,
				:twitter_id,
				:github_id,
				:linkedin_id,
				:website_url
			])
		end

		def current_user?(user)
			current_user == user
		end

		helper_method :current_user?
end
