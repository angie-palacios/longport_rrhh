class CreateJoinTablePermissionsRol < ActiveRecord::Migration[5.1]
  def change
    create_join_table :permissions, :rols do |t|
      t.references :permission, foreign_key: true
      t.references :rols, foreign_key: true
    end
  end
end
