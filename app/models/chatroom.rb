require 'combinatorics'

class Chatroom < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :options, through: :answers, dependent: :destroy
  has_many :option_tags, through: :options, dependent: :destroy
  has_many :tags, through: :option_tags, dependent: :destroy

  def current_question
    options.last.question
  end

  def matched_wines
    wines = Wine.where(id: 0)

    # TODO Request SQL

    wines
  end
end
