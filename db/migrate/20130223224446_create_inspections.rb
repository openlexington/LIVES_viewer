class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.integer :business_id
      t.integer :score
      t.date :date
      t.string :description
      t.string :inspection_type

      t.timestamps
    end
  end
end
