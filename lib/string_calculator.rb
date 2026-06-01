# frozen_string_literal: true

# Calculates sum of numbers provided as a string.
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter(numbers)
    nums = numbers.split(delimiter).map(&:to_i).reject { |n| n > 1000 }

    validate_negatives!(nums)
    nums.sum
  end

  private

  def extract_delimiter(numbers)
    return [/[,\n]/, numbers] unless numbers.start_with?('//')

    delimiter, numbers = numbers[2..].split("\n", 2)
    [delimiter, numbers]
  end

  def validate_negatives!(nums)
    negative_nums = nums.select(&:negative?)
    raise ArgumentError, "negative numbers not allowed: #{negative_nums.join(', ')}" if negative_nums.any?
  end
end
