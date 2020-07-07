class CreateDisclaimers < ActiveRecord::Migration[5.1]
  def change
    create_table :disclaimers do |t|
      t.references :employee, index: true, foreign_key: {to_table: :users}
      t.references :city, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at
      t.references :creator, index: true, foreign_key: {to_table: :users}
      t.references :business, foreign_key: true
      t.boolean :aceepted, default: true

      t.timestamps
    end
  end
end
