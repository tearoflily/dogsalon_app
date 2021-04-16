class ChangePhonePostcodeTypeToCustomer < ActiveRecord::Migration[6.0]
  def up
    change_column :customers, :postcode, :string
    change_column :customers, :homephone, :string
    change_column :customers, :mobilephone, :string
  end

  def down
    change_column :customers, :postcode, :integer
    change_column :customers, :homephone, :integer
    change_column :customers, :mobilephone, :integer
  end
end
