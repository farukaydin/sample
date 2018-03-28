class User < ApplicationRecord
  has_many :users

  validates :name, :age, presence: true
end
