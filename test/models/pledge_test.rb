require_relative '../test_helper'
require 'pry'


class PledgeTest < ActiveSupport::TestCase
  test 'A pledge can be created' do
    user1 = create(:user, first_name:'Tally')
    user2 = create(:user, first_name:'Mally')
    project1 = create(:project)
    pledge = build(:pledge, user:user2,project:project1)
    assert pledge.valid?
  end

  test 'owner cannot back own project' do
    user1 = create(:user, first_name:'Tally')
    user2 = create(:user, first_name:'Mally')
    project1 = create(:project, user: user1)
    pledge = build(:pledge, user:user1,project:project1)

    refute pledge.valid?

  end


end
