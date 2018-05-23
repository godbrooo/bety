# == Schema Information
#
# Table name: games
#
#  id          :bigint(8)        not null, primary key
#  dead_line   :datetime
#  description :text
#  photo       :string
#  price       :integer
#  status      :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Game < ApplicationRecord
  has_many :prizes
  has_many :bets
end
