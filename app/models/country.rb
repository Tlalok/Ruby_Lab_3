class Country < ApplicationRecord
	has_many :towns
	has_many :comments, as: :commentable  

	validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
