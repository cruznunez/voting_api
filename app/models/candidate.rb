class Candidate < ActiveRecord::Base
  has_many :votes
  validates :name, presence: true, uniqueness: true
  validates :party, presence: true
end
