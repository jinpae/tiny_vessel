Rails.application.routes.draw do
  devise_for :users

	resources :forum_posts do
		resources :forum_replies, module: :forum_posts
	end

	resources :users, only: [:show]

  root 'home#index'
end
