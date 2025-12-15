module JournalEntryScopes
  # The scope is used for organization only, even though methods could be in the JournalEntry for now. I prefer
  # establishing this division (scopes in this app/scopes) from the start.
  extend ActiveSupport::Concern

  included do
    scope :ordered_by, ->(latest_first: true) {
      order_used = latest_first ? :desc : :asc
      order(journal_entries: { created_at: order_used })
    }

    # I preferred making this scope instead of using something like client.journal_entries.order(...)
    # because that joins all query methods in a single method, making it simpler
    # to use and understand.
    scope :for_client, ->(client, latest_first: true) {
      if client
        where(client: client).ordered_by(latest_first: latest_first)
      else
        none
      end
    }

    scope :for_provider, ->(provider, latest_first: true) {
      if provider
        # Uniquenes off clients to providers association makes entries not duplicate.
        # Adding the constraint to the DB would guarantee that is always the case, but I
        # prefer having little business logic in the DB, leaving such techniques for scenarios where
        # it is really required.
        joins(client: :providers)
          .where(providers: { id: provider.id })
          .ordered_by(latest_first: latest_first)
          .uniq
      else
        none
      end
    }
  end
end
