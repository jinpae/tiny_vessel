class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :store_location

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

		def store_location
		  # store last url - this is needed for post-login redirect to whatever the user last visited.
		  return unless request.get? 
		  if (request.path != "/users/sign_in" &&
		      request.path != "/users/sign_up" &&
		      request.path != "/users/password/new" &&
		      request.path != "/users/password/edit" &&
		      request.path != "/users/confirmation" &&
		      request.path != "/users/sign_out" &&
		      !request.xhr?) # don't store ajax calls
		    session[:previous_url] = request.fullpath 
		  end
		end

		def after_sign_in_path_for(resource)
			session[:previous_url] || root_path
		end

		def require_correct_user(forum_object)
			unless current_user == forum_object.user
				if forum_object.methods.include?(:forum_post)
					# forum_object is a forum reply, so redirect to its post's show page
					redirect_to forum_object.forum_post
				else
					# forum_object is a forum post, so redirect to its show page
					redirect_to forum_object
				end
			end
		end

		helper_method :current_user?
end
