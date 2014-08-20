class User < ActiveRecord::Base

	#validations
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :email, uniqueness: true
	validates :email, uniqueness: { case_sensitive: false}
	validates :password, length: {minimum: 8}, if: :strong?

	def strong?
		password =~ /.*\d+.*/ && \
		password =~ /.*[a-z]+.*/ && \
		password =~ /.*[A-Z].*/
	end
	
	validates :blurb, length: { maximum: 1000 }


	has_many :splatts

	has_and_belongs_to_many :follows,
	  class_name: "User",
	  join_table: :follows,
	  foreign_key: :follower_id,
	  association_foreign_key: :followed_id

	has_and_belongs_to_many :followed_by,
	  class_name: "User",
	  join_table: :follows,
	  foreign_key: :followed_id,
	  association_foreign_key: :follower_id
end
