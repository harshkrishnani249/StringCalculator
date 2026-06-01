# frozen_string_literal: true

# Calculates sum of numbers provided as a string.
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?('//')
      delimiter, numbers = numbers[2..].split("\n", 2)
      return numbers.split(delimiter).sum(&:to_i)
    end

    nums = numbers.split(/[,\n]/).map(&:to_i)
    negative_nums = nums.select(&:negative?)
    raise ArgumentError, "negative numbers not allowed: #{negative_nums.join(', ')}" if negative_nums.any?

    nums.sum
  end
end
