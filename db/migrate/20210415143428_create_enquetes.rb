class CreateEnquetes < ActiveRecord::Migration[6.0]
  def change
    create_table :enquetes do |t|
      t.integer :know_shop
      t.string :know_shop_comment
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
