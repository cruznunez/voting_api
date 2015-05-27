require 'test_helper'

class CandidateTest < ActiveSupport::TestCase

  test "candidate exists" do
    assert Candidate.new
  end

  test "validate name and party" do
    human = Candidate.new(name: "Bob", party: "Yes, please.")
    assert human.save
  end

  test "validate name and party 2" do
    human = Candidate.new(name: "Bob")
    refute human.save
  end
end
