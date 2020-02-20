class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.date :date
      t.time :time
      t.string :address
      t.text :delivery_instructions
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
