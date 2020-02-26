# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#  name                   :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :name, presence: true
  cattr_accessor :current_user
  has_many :likes, dependent: :destroy
  has_many :reports, dependent: :destroy

  def to_s
  	"#{name}"
  end
end

#class User < ActiveRecord::Base
#  devise :database_authenticatable, :registerable,
#         :confirmable, :recoverable, :validatable # ...
#  validates_uniqueness_of :username
#end