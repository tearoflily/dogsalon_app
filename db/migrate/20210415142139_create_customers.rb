class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :last_name, null: false
      t.string :first_name
      t.string :furigana_last_name
      t.string :furigana_first_name
      t.integer :postcode
      t.string :address, null: false
      t.integer :homephone
      t.integer :mobilephone, null: false
      t.string :images

      t.timestamps
    end
  end
end
