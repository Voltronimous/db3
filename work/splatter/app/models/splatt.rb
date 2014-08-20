class Splatt < ActiveRecord::Base

  #validations
	validates :body, presence: true
	validates :body, length: { maximum: 160 }
	validates :user_id, presence: true

  belongs_to :user
end
