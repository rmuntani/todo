class Plan < ApplicationRecord
  belongs_to :client
  belongs_to :provider

  # I had to check the right syntax for this in Rails docs
  # https://guides.rubyonrails.org/active_record_validations.html#uniqueness
  validates :client, uniqueness: { scope: :provider }

  # I had to Google the right syntax for this
  enum :tier, {
    basic: 0,
    premium: 10
  }
end
