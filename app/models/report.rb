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
#

class Report < ApplicationRecord
	validates_presence_of :title, :text, :latitude, :longitude
	mount_uploader :picture, ImageUploader
	belongs_to :user
	has_many :likes, dependent: :destroy


end

