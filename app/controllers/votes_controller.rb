class VotesController < ApplicationController
  def create
    vote = Vote.new(params.permit(:voter_id, :candidate_id))
    if vote.save
      #render json: vote
      redirect_to votes_create_path
    else
      render json: vote.errors
    end
  end

  def destroy
    vote = Vote.find(params[:id]) rescue Vote.new
    vote.destroy
    redirect_to votes_index_path
  end

  def index
    render json: Vote.all
  end
end
