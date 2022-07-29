# frozen_string_literal: true

require 'marvel/client'

class ApiMarvel
  attr_accessor :client

  def initialize
    @client = Marvel::Client.new
  end
end
