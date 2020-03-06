class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :code
      t.string :name_es
      t.string :name_en

      t.timestamps
    end
  end
end
