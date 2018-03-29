class User < ApplicationRecord
  has_many :projects

  validates :name, :age, presence: true
end
