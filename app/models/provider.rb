class Provider < ApplicationRecord
  has_many :plans
  has_many :clients, through: :plans
end
