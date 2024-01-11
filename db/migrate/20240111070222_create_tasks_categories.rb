class CreateTasksCategories < ActiveRecord::Migration[7.1]
  def change
    drop_table :tasks_categories
    create_table :categories_tasks do |t|
      t.belongs_to :task
      t.belongs_to :category

      t.timestamps
    end
  end
end
