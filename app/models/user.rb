# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  username               :string
#  bio                    :text
#  twitter_id             :string
#  github_id              :string
#  linkedin_id            :string
#  website_url            :string
#  admin                  :boolean          default(FALSE)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :forum_posts
	has_many :forum_replies

	validates :username,
		length: { minimum: 6 },
		allow_blank: true,
		format: /\A[A-Z0-9]+[-_]*[A-Z0-9]+\z/i,
		uniqueness: { case_sensitive: false }

	def gravatar_id
		Digest::MD5::hexdigest(email.downcase)
	end

	def identity
		case
		when name.present?
			name
		when username.present?
			username
		else
			email
		end
	end

	def has_social_links?
		twitter_id.present? || github_id.present? || linkedin_id.present? || website_url.present?
	end
end
