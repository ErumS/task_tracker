class Category < ApplicationRecord
  validates :name, presence: true
  before_save :check_resource_type
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tasks

  private

  def check_resource_type
    ApplicationRecord.subclasses.map(&:name).include?(resource_type)
  end
end