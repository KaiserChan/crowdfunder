
FactoryGirl.define do
  factory :project do
    title "Cool new boardgame"
    description "Trade Sheep"
    start_date Date.today
    end_date Date.today + 1.month
    goal 50000
    user
  end
end
