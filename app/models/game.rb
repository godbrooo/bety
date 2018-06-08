# == Schema Information
#
# Table name: games
#
#  id                   :bigint(8)        not null, primary key
#  category             :integer          default("winner")
#  dead_line            :datetime
#  description          :text
#  match_challenger_bet :integer          default("match_nul")
#  name_a               :string
#  name_b               :string
#  objet                :string
#  photo                :string
#  price                :integer
#  status               :integer          default("pending")
#  title                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Game < ApplicationRecord
  has_many :prizes, dependent: :destroy
  has_many :bets, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  enum status: [ :pending, :ongoing, :closed]
  enum category: [ :winner, :ranking, :match]
  enum match_challenger_bet: [ :match_nul, :equipe_a_gagne, :equipe_b_gagne]

  accepts_nested_attributes_for :prizes, reject_if: :all_blank
  validates :title, presence: true

end
