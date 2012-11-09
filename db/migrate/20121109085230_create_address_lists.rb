class CreateAddressLists < ActiveRecord::Migration
  def change
    create_table :address_lists do |t|
      t.integer :user_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
