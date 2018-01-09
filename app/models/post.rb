class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: {minimum: 5}
	validates :title, uniqueness: {message: "already taken"}
	validates :body, presence: true

end
