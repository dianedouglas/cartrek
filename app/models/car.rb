class Car < ApplicationRecord
  has_many :ownerships
  has_many :people, through: :ownerships, :dependent => :destroy
end
