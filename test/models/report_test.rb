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

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
