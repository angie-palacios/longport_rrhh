class CreateDisclaimerQuizDefaults < ActiveRecord::Migration[5.1]
  def change
    create_table :disclaimer_quiz_defaults do |t|
      t.references :disclaimer, foreign_key: true
      t.references :quiz_default, foreign_key: true

      t.timestamps
    end
  end
end
