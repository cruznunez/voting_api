require 'securerandom'

class ApiKey < ActiveRecord::Base

  before_create :generate_access_token
  belongs_to :voter

  private def generate_access_token
    self.access_token = SecureRandom.hex
  end
end
