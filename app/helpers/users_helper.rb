module UsersHelper
	def profile_image_for(user, *css_class)
		url = "https://secure.gravatar.com/avatar/#{user.gravatar_id}?d=mm"

		image_tag url, alt: 'User Profile Image', class: css_class
	end

	def bio_for(user)
		(content_tag :p, user.bio, class: 'bio') if user.bio.present?
	end

	def social_links_for(user)
		if user.has_social_links?
			content_tag :div, class: 'social_links' do
				concat(social_link_to "https://twitter.com/#{user.twitter_id}", 'fa fa-twitter') if user.twitter_id.present?

				concat(social_link_to "https://github.com/#{user.github_id}", 'fa fa-github') if user.github_id.present?

				concat(social_link_to "https://linkedin.com/in/#{user.linkedin_id}", 'fa fa-linkedin-square') if user.linkedin_id.present?

				concat(social_link_to user.website_url, 'fa fa-globe') if user.website_url.present?
			end
		end
	end

	def social_link_to(url, fa_class)
		link_to url, target: '_blank', class: 'social' do
			content_tag :i, nil, class: fa_class
		end
	end
end
