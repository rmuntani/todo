class CreateJournalEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :journal_entries do |t|
      t.text :entry
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
