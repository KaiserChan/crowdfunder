class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner

<<<<<<< HEAD
  validates :title, :user_id, :description, :goal, :start_date, :end_date, presence: true
=======
  validates :title, :description, :goal, :start_date, :end_date, presence: true

  

>>>>>>> da61e43890eae5541f9d7578a5242217cdaa0c54



end
