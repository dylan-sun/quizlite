require 'active_record'

require_relative 'user'
require_relative 'card'

class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards, dependent: :destroy
  validates :name, presence: true
  # validates_uniqueness_of :name, scope: :user
end
