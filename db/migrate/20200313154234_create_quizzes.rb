class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.references :disclaimer, foreign_key: true
      t.string :content
      t.text :response_content

      t.timestamps
    end
  end
end
