# == Schema Information
#
# Table name: prizes
#
#  id         :bigint(8)        not null, primary key
#  objet      :string
#  ranking    :integer
#  reward     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_prizes_on_game_id  (game_id)
#  index_prizes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#  fk_rails_...  (user_id => users.id)
#

class Prize < ApplicationRecord
  belongs_to :game
  belongs_to :user
end
