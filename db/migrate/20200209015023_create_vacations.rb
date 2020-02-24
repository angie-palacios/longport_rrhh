class CreateVacations < ActiveRecord::Migration[5.1]
  def change
    create_table :vacations do |t|
      t.references :user, foreign_key: true
      t.date :initial_date_first_period
      t.date :finality_date_first_period
      t.date :initial_date_second_period
      t.date :finality_date_second_period
      t.string :days_paid
      t.date :initial_date_first_pay
      t.date :finality_date_first_pay
      t.text :observations

      t.timestamps
    end
  end
end
