class Person < ApplicationRecord
  has_many :ownerships
  has_many :cars, through: :ownerships, :dependent => :destroy
end
