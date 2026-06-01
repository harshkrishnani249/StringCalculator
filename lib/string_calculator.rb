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

    delimiter_section, numbers = numbers[2..].split("\n", 2)

    if delimiter_section.start_with?('[')
      delimiters = delimiter_section.scan(/\[([^\]]+)\]/).flatten
      [Regexp.union(delimiters), numbers]
    else
      [delimiter_section, numbers]
    end
  end

  def validate_negatives!(nums)
    negative_nums = nums.select(&:negative?)
    raise ArgumentError, "negative numbers not allowed: #{negative_nums.join(', ')}" if negative_nums.any?
  end
end
