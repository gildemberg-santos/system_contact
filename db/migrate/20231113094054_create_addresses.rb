class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :neighborhood
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
