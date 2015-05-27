require 'test_helper'

class CandidateTest < ActiveSupport::TestCase

  test "exists" do
    assert Candidate.new
  end

  test "validation" do
    human1 = Candidate.new(name: "Bob", party: "Yes, please.")
    human2 = Candidate.new(name: "Bob")
    assert human1.save
    refute human2.save
  end

  test "can be voted for" do
    will = Candidate.create(name: "Will Smith", party: "Fresh")
    jaden = Voter.create(name: "Jaden Smith", party: "Fresh")
    vote = Vote.create(voter: jaden, candidate: will)
    assert_equal 1, will.votes.count
  end
end
