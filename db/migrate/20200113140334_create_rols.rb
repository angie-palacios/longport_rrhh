class CreateRols < ActiveRecord::Migration[5.1]
  def change
    create_table :rols do |t|
      t.string :code
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
