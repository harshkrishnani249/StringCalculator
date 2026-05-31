# frozen_string_literal: true

# Calculates sum of numbers provided as a string.
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    numbers.split(',').sum(&:to_i)
  end
end
