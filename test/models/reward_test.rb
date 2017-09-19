require 'test_helper'
require 'pry'


class RewardTest < ActiveSupport::TestCase

  test 'A reward can be created' do
    reward = build(:reward)

    assert reward.valid?
    assert reward.persisted?
  end

  test 'A reward cannot be created without a dollar amount' do
    project = build(:project)
    reward = build(:project, dollar_amount= nil)
    assert reward.invalid?, 'Reward should be invalid without dollar amount'
    assert reward.new_record?, 'Reward should not save without dollar amount'
  end

  test 'A reward cannot be created without a description' do
    project = build(:project)
    reward = build(:rewards, description: nil)
    assert reward.invalid?, 'Reward should be invalid without a description'
    assert reward.new_record?, 'Reward should not save without a description'
  end

  test 'Reward dollar amount must be positive' do
    project = build(:project)
    user = build(:user)
    reward = build(:reward)
    assert reward.valid?
    assert reward.persisted?
  end


end
