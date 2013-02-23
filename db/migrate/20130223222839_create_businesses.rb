class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.integer :business_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.integer :latitude
      t.integer :longitude
      t.string :phone_number

      t.timestamps
    end
  end
end
