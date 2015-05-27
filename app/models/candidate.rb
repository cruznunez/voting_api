class Candidate < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :party, presence: true
end
