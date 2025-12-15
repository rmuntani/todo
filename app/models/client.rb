class Client < ApplicationRecord
  # The associations could be deleted or nullified, but for simplicity, I'll just leave them as is.
  # My idea is that the plan should be archived rather than deleted when a client is removed, but
  # the requirement could be different than that.
  has_many :plans
  has_many :providers, through: :plans
  has_many :journal_entries
end
