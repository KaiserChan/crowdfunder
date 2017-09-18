class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount,:project_id, presence: true
  validates :user_id, presence: true
  validate :unique_user

  def unique_user
    if project.user_id == user_id
      errors.add(:user_id,"Project owner cannot pledge own project!")
    end
  end

end
