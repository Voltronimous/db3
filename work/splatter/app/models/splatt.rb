class Splatt < ActiveRecord::Base

  #validations
	validates :splatt, presence: true
	validates :splatt, length: { maximum 160 }

  belongs_to :user
end
