# == Schema Information
#
# Table name: games
#
#  id          :bigint(8)        not null, primary key
#  category    :integer          default("winner")
#  dead_line   :datetime
#  description :text
#  photo       :string
#  price       :integer
#  status      :integer          default("pending")
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
