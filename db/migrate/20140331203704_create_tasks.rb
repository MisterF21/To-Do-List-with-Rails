class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.column :task, :string

      t.timestamps
    end
  end
end
