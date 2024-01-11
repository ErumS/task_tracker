class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

  has_and_belongs_to_many :categories
  has_many :tasks

  after_create :save_user_category

  def admin?
    categories.map(&:name).include?("admin")
  end

  private

  def save_user_category
    self.categories.find_or_create_by!(name: "admin", resource_type: "User")
    p "save_user_category", ActiveRecord::Base.connection_pool.db_config.name
  end
end
