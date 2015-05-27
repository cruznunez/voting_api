class VoterController < ApplicationController
  def create
    voter = Voter.new(name: params[:name], party: params[:party])
    if voter.save
      render json: voter
    else
      render json: voter.errors
    end
  end

  def show
    render json: Voter.find_by_id(params[:id])
  end

  def update
    updatee = Voter.find_by_id(params[:id])
    if updatee.update(name: params[:name], party: params[:party])
      render json: Voter.find_by_id(params[:id])
    else
      render json: Voter.errors
    end
  end
end
