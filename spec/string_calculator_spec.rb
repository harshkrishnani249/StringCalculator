# frozen_string_literal: true

require 'spec_helper'
require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    let(:calculator) { StringCalculator.new }

    it 'returns 0 for empty string' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(calculator.add('5')).to eq(5)
    end

    it 'returns the sum of two numbers' do
      expect(calculator.add('1,2')).to eq(3)
    end

    it 'handles newlines as delimiters' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'returns sum of numbers with custom delimiter' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises exception for negative numbers' do
      expect { calculator.add('1,-2,3') }.to raise_error(ArgumentError, 'negative numbers not allowed: -2')
    end

    it 'ignores numbers greater than 1000' do
      expect(calculator.add('2,1001')).to eq(2)
    end

    it 'returns sum of numbers with delimiter of any length' do
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'returns sum of numbers with multiple delimiters' do
      expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
    end
  end
end
