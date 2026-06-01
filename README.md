# String Calculator

A Ruby implementation of the String Calculator TDD Kata by Roy Osherove.

## TDD Approach

This project was built using strict Test-Driven Development (TDD).

### Red → Green → Refactor

1. **Red** — Write one failing test
2. **Green** — Write minimum code to pass
3. **Refactor** — Clean up if needed
4. **Commit** — One behavior per commit

Each commit represents one completed Red → Green → Refactor cycle with all tests passing.

### One Test At A Time

- Never write two failing tests at once
- Never write code without a failing test
- Never jump ahead to future requirements

## Why No binding.pry

Using `binding.pry` during TDD means:
- You are debugging instead of letting tests guide you
- Your test is not specific enough
- You have stopped trusting the process

TDD philosophy: **if a test fails, the failure message should tell you exactly what to fix.**

## Usage

```ruby
calculator = StringCalculator.new

calculator.add("")        # => 0
calculator.add("1")       # => 1
calculator.add("1,2")     # => 3
calculator.add("1\n2,3")  # => 6
calculator.add("//;\n1;2") # => 3
calculator.add("//[***]\n1***2***3") # => 6
calculator.add("//[*][%]\n1*2%3")   # => 6
```

## Running Tests

```bash
bundle exec rspec
```

## RuboCop

```bash
bundle exec rubocop
```

## Ruby Version

ruby-3.3.6
