class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.string :title
      t.string :description
      t.string :status
      t.integer :parent_id

      t.timestamps
    end
  end
end
