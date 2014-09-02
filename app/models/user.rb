class User < ActiveRecord::Base
  has_secure_password
  has_many :data_sets
  validates :email, presence: true
  validates :email, uniqueness: true
end
