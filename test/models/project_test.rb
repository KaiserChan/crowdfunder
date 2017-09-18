require 'test_helper'
require 'pry'
class ProjectTest < ActiveSupport::TestCase

  test 'valid project can be created' do
    owner = new_user
    owner.save
    project = new_project
    project.user = owner
    project.save
    assert project.valid?
    assert project.persisted?
    assert project.user
  end

  test 'project is invalid without owner' do
    project = new_project
    project.user = nil
    project.save
    assert project.invalid?, 'Project should not save without owner.'
  end

  test 'Project goal must be positive' do
    owner = new_user
    owner.save
    project = new_project
    project.user = owner
    project.goal = 1
    project.save
    assert project.valid?
    assert project.persisted?
    assert project.user
  end

  test 'Project start_date must be in future' do
    owner = new_user
    owner.save
    project = new_project
    project.user = owner
    project.start_date = Date.today + 1.day
    project.save
    assert project.valid?
    assert project.persisted?
    assert project.user
  end

  test 'Project end_date must be greater than start_date' do
    owner = new_user
    owner.save
    project = new_project
    project.user = owner
    project.start_date = Date.today + 1.day
    project.end_date = Date.today + 2.day
    project.save
    assert project.valid?
    assert project.persisted?
    assert project.user
  end
  def new_project
    Project.new(
      title:       'Cool new boardgame',
      description: 'Trade sheep',
      start_date:  Date.today,
      end_date:    Date.today + 1.month,
      goal:        50000
    )
  end

  def new_user
    User.new(
      first_name:            'Sally',
      last_name:             'Lowenthal',
      email:                 'sally@example.com',
      password:              'passpass',
      password_confirmation: 'passpass'
    )
  end

end
