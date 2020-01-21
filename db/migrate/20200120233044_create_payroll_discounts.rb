class CreatePayrollDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :payroll_discounts do |t|
      t.references :user, forenkey: true
      t.string :value_discount
      t.string :month_discount
      t.text :concept

      t.timestamps
    end
  end
end
