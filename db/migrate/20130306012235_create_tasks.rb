class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.references :list
      t.date :due_date
      t.integer :priority
      t.boolean :completed

      t.timestamps
    end
    add_index :tasks, :list_id
  end
end
