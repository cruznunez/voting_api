require 'test_helper'

class VoterControllerTest < ActionController::TestCase

  test "should be able to create" do
    assert_difference("Voter.count") do
      post :create, {name: "Name", party: "Tea"}
    end
    assert_equal "Name", Voter.last.name
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get update" do
    voter = Voter.create(name: "first", party: "first")
    patch :update, {id: voter.id, name: "change", party: "change"}
    assert_response :success
    voter.reload
    assert_equal "change", voter.name
    assert_equal "change", voter.party
  end

end
