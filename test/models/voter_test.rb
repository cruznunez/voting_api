require 'test_helper'

class VoterTest < ActiveSupport::TestCase

  test "exists" do
    assert Voter.new
  end

  test "validation" do
    human1 = Voter.new(name: "string", party: "LAN")
    human2 = Voter.new(party: "WAN")
    assert human1.save
    refute human2.save
  end

  test "can vote" do
    human = Voter.new(name: "Le-a", party: "Birthday")
    candi = Candidate.new(name: "Ted", party: "Bachelor")
    vote = Vote.new(voter: human, candidate: candi)
    assert human.save
    assert candi.save
    assert vote.save
    assert_equal 1, human.votes.count
    assert_equal "Ted", human.votes.first.candidate.name
  end
end
