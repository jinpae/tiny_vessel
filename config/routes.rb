Rails.application.routes.draw do
  devise_for :users

	resources :forum_posts do
		resources :forum_replies, module: :forum_posts
	end

  root 'home#index'
end
