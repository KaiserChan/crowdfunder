require 'test_helper'
require 'pry'
class ProjectTest < ActiveSupport::TestCase

  test 'valid project can be created' do
    project = build(:project)
    assert project.valid?
  end

  test 'project is invalid without owner' do
    user1 = build(:user, first_name: "Joe")
    project = build(:project, user: user1)
    assert project.invalid?, 'Project should not save without owner.'
  end

  test 'Project goal must be positive' do
    project = build(:project, goal:-5)
    refute project.valid?
  end

  test 'Project start_date must be in future' do
    project = build(:project, start_date:Date.today - 1.day)
    refute project.valid?
  end

  test 'Project end_date must be greater than start_date' do
    project = build(:project, end_date: Date.today - 1.day)
    refute project.valid?
  end


end
