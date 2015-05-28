require 'test_helper'

class VotesControllerTest < ActionController::TestCase

  test "should create with voter and candidate ids only" do
    voter = Voter.create(name: "Mr. Voter", party: "Testing")
    candidate = Candidate.create(name: "Mr. Candidate", party: "Testing")
    assert_difference("Vote.count"){post :create, {voter_id: voter, candidate_id: candidate}}
    vote = Vote.create(voter_id: voter.id, candidate_id: candidate.id)
    assert_equal "Mr. Voter", vote.voter.name
    assert_equal "Mr. Candidate", vote.candidate.name
  end

  test "should get destroy" do
    voter = Voter.create(name: "Mr. Voter", party: "Testing")
    candidate = Candidate.create(name: "Mr. Candidate", party: "Testing")
    vote = Vote.create(voter_id: voter.id, candidate_id: candidate.id)
    assert_difference("Vote.count", -1){delete :destroy, {id: vote}}
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
