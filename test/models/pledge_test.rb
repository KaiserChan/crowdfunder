require_relative '../test_helper'
require 'pry'


class PledgeTest < ActiveSupport::TestCase
  test 'A pledge can be created' do

    #binding pry
    owner = new_user
    owner.save
    project = new_project
    project.user = owner
    project.save
    pledgie = new_user
    pledgie.email = "pledgie@gmail.com"
    pledgie.save
    pledge = build(:pledge,project: project,user: pledgie)
    pledge.save
    assert pledge.valid?
    assert pledge.persisted?
  end

  test 'owner cannot back own project' do
    owner = new_user
    owner.save
    project = new_project
    project.user = owner
    project.save
    pledge = build(:pledge,project: project)
    pledge.user = owner
    pledge.save
    assert pledge.invalid?, 'Owner should not be able to pledge towards own project'

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
