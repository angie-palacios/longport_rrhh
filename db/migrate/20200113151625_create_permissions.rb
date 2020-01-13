class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.string :code
      t.string :name
      t.string :description
      t.boolean :apply

      t.timestamps
    end
  end
end
