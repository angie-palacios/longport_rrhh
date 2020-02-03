class AddBusinessIdToUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :business, :string
    add_reference :users, :business, index: true, foreign_key: true
  end
end
