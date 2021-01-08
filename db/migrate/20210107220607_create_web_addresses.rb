class CreateWebAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :web_addresses do |t|
      t.string :title
      t.string :full_address
      t.string :short_address

      t.timestamps
    end
  end
end
