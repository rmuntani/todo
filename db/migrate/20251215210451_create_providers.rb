class CreateProviders < ActiveRecord::Migration[8.1]
  def change
    create_table :providers do |t|
      t.string :name
      # I'm keeping this and Client's email as not unique for now, as there's not
      # enough information as if that should be unique or not.
      #
      # Providers and Clients have name and email, which indicates it could be useful to have this attribute
      # in a separate model used for authentication and so forth. But doing that is too premature given
      # the request.
      t.string :email

      # Timestamps were kept because I usually prefer having them from the start
      t.timestamps
    end
  end
end
