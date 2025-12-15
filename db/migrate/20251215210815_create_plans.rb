class CreatePlans < ActiveRecord::Migration[8.1]
  def change
    # Plan cannot be a simple join table because it has a string for its tier.

    create_table :plans do |t|
      # I prefer using enums over strings for this field due to the
      # methods Rails provides when using them
      t.integer :tier

      t.references :client, null: false, foreign_key: true
      t.references :provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
