class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :role
  validates :email, presence: true, uniqueness: true

  enum role: [:default, :admin]
end
