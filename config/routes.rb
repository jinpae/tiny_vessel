Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: :registrations }

	resources :forum_posts, path: 'forum' do
		collection do
			get :general
			get 'front-end'
			get 'back-end'
			get :design
		end

		resources :forum_replies, path: 'replies', module: :forum_posts
	end

	resources :users, only: [:show]

  root 'home#index'
end
