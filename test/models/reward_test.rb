require 'test_helper'
require 'pry'


class RewardTest < ActiveSupport::TestCase

  test 'A reward can be created' do
    reward = build(:reward)
    assert reward.valid?
  end

  test 'A reward cannot be created without a dollar amount' do
    reward = build(:reward, dollar_amount: nil)
    assert reward.invalid?, 'Reward should be invalid without dollar amount'
  end

  test 'A reward cannot be created without a description' do
    reward = build(:reward, description: nil)
    assert reward.invalid?, 'Reward should be invalid without a description'
  end

  test 'Reward dollar amount must be positive' do
    reward = build(:reward)
    assert reward.valid?
  end

end
