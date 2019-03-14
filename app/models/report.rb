# == Schema Information
#
# Table name: reports
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  text       :text
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  picture    :string
#  user_id    :integer
#

class Report < ApplicationRecord
	before_save :find_city

	belongs_to :user
	belongs_to :city, optional: true
	has_many :likes, dependent: :destroy

	validates_presence_of :title, :text, :latitude, :longitude

	scope :ordered_by_likes, -> { left_joins(:likes).group(:id).order('COUNT(likes.id) DESC') }

	mount_uploader :picture, ImageUploader

	protected

	def find_city
		results = Geocoder.search([latitude, longitude])
		begin
			self.city = City.where(name: results.first.city).first_or_create
		rescue
		end
	end
end

