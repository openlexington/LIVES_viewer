class CreateViolations < ActiveRecord::Migration
  def change
    create_table :violations do |t|
      t.integer :business_id
      t.date :date
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
