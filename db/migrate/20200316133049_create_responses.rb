class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.references :quiz, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
