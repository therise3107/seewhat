class Space < ActiveRecord::Base
	belongs_to :user

	validates :planet,presence: true, length: {maximum: 20},
				uniqueness: true
	validates :des, presence: true, length: { minimum: 6}
	validates :user_id , presence: true			
end
