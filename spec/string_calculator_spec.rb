# frozen_string_literal: true

require 'spec_helper'
require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns 0 for empty string' do
      calculator = StringCalculator.new
      expect(calculator.add('')).to eq(0)
    end
    it 'returns the number itself for a single number' do
      calculator = StringCalculator.new
      expect(calculator.add('5')).to eq(5)
    end
  end
end
