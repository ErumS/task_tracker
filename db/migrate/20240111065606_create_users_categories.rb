class CreateUsersCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :users_categories do |t|
      t.belongs_to :user
      t.belongs_to :category

      t.timestamps
    end
  end
end
