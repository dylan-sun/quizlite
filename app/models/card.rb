require 'active_record'

require_relative 'deck'

class Card < ActiveRecord::Base
  belongs_to :deck
  validates :question, :answer, presence: true
end
