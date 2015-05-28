class Voter < ActiveRecord::Base
  has_many :votes
  validates :name, presence: true
  validates :party, presence: true

  def update?(params)
    update(params.permit(:name, :party))
  end
end
