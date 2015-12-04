require 'active_record'
require 'bcrypt'

require_relative 'deck'

class User < ActiveRecord::Base
  include BCrypt

  has_many :decks, dependent: :destroy
  validates :name, :email, :password, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 2 }

  # Modify for nil password hash
  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
