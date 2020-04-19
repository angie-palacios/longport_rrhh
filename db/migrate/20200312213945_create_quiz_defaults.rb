class CreateQuizDefaults < ActiveRecord::Migration[5.1]
  def change
    create_table :quiz_defaults do |t|
      t.string :content

      t.timestamps
    end
  end
end
