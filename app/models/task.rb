class Task < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :user, class_name: "User", foreign_key: :user_id

  enum status: {
    "not_started": "not_started",
    "in_progress": "in_progress",
    "completed": "completed"
  }

  before_create :save_task_status

  private

  def save_task_status
    self.status ||= "not_started"
  end
end