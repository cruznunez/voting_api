class VoterController < ApplicationController

  #before_action :authenticate rescue :show

  def create
    voter = Voter.new(name: params[:name], party: params[:party]
    #, security_key: ApiKey.create!
    )
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
    voter = Voter.find(params[:id])
    if voter.update?(params)
      render json: Voter.find_by_id(params[:id])
    else
      render json: Voter.errors
    end
  end

  private def authenticate
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end

end
