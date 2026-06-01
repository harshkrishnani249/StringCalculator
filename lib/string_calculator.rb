# frozen_string_literal: true

# Calculates sum of numbers provided as a string.
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?('//')
      delimiter, numbers = numbers[2..].split("\n", 2)
      return numbers.split(delimiter).sum(&:to_i)
    end

    numbers.split(/[,\n]/).sum(&:to_i)
  end
end
