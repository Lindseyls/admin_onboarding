class CreateRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :roles do |t|
      t.string :title
      t.integer :permission_level

      t.timestamps
    end
  end
end
