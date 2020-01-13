class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :nit
      t.string :phone
      t.string :address
      t.string :site_web
      t.string :email
      t.text :description
      t.string :logo

      t.timestamps
    end
  end
end
