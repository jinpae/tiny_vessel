module UsersHelper
	def profile_image_for(user, *css_class)
		url = "https://secure.gravatar.com/avatar/#{user.gravatar_id}d=mm"

		image_tag url, alt: 'User Profile Image', class: css_class
	end
end
