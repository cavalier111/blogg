class Article < ApplicationRecord
	belongs_to :user
	mount_uploader :image, ImageUploader
	acts_as_votable
	has_many :comments, dependent: :destroy, as: :commentable
	validates :title, presence: true, length: { minimum: 5 }
	
	end

