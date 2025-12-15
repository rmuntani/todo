class JournalEntry < ApplicationRecord
  include JournalEntryScopes

  belongs_to :client
end
