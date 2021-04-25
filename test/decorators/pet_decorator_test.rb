# frozen_string_literal: true

require 'test_helper'

class PetDecoratorTest < ActiveSupport::TestCase
  def setup
    @pet = Pet.new.extend PetDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
