require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email must be unique" do
    user1 = build(:user,first_name:'sue')
    user2 = build(:user, first_name: 'bob')
    assert user1.valid?
    assert user2.valid?
  end

  test "user must include password_confirmation on create" do
    user = build(:user, password_confirmation: nil)
    refute user.valid?
  end

  test "password must match confirmation" do
    user = build(:user, password_confirmation: 'nopasspass')
    refute user.valid?
  end

  test "password must be at least 8 characters long" do
    user = build(:user, password: 'four')
    refute user.valid?
  end
end
