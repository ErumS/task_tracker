class CreateCategoriesUsers < ActiveRecord::Migration[7.1]
  def change
    drop_table :users_categories
    create_table :categories_users do |t|
      t.belongs_to :user
      t.belongs_to :category

      t.timestamps
    end
  end
end
