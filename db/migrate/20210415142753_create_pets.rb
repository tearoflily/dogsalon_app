class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :pet_name, null: false
      t.integer :breed, null: false
      t.datetime :birthday
      t.integer :gender
      t.text :pet_comment
      t.datetime :vaccine_day
      t.string :hospital_name
      t.boolean :dermatitis
      t.string :dermatitis_comment
      t.boolean :disease
      t.string :disease_comment
      t.boolean :flea
      t.string :flea_comment
      t.text :customer_request
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
