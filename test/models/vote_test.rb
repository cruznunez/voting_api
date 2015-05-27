require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "vote exists" do
    assert Vote.new
  end

  test "vote validation" do
    vote = Vote.new(voter_id: 1, candidate_id: 1)
    vote.save
  end

  test "vote can have voter" do
    human = Voter.create(name: "Voter", party: "LAN")
    vote = Vote.create(voter_id: human.id, candidate_id: 1)
    assert_equal "Voter", vote.voter.name
  end

  test "vote can have candidate" do
    human = Candidate.create(name: "Candidate", party: "WAN")
    vote = Vote.create(voter_id: 1, candidate_id: human.id)
    assert_equal "Candidate", vote.candidate.name
  end
end
