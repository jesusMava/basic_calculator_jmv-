#require "basic_calculator_jmv/version"

module BasicCalculatorJmv
  class Error < StandardError; end
  # Your code goes here...

	class Environments
		def variables
			@array_number = []

			2.times do
				push_numbers
			end

			loop do
				puts 'Do you want to add another number? y/n'
				answer = gets.chomp

				break if answer === 'n'

				push_numbers
			end

			@array_number
		end

		def push_numbers
			puts 'Enter the number'
			@array_number.push(gets.to_i)
		end

		def operator
			puts 'Please choose an operator'
			gets.chomp
		end
	end

	class Operations
		def result(array_numbers, operator)
      if array_numbers.include?(0) && operator == "/"
        result = 0
      else
        first_number = array_numbers.delete_at(0)

          result = array_numbers.reduce(first_number) do |total, number|
            total.send(operator, number)
          end
      end
			puts "The Result is #{result}"
		end

	end

	environments = Environments.new
	Operations.new.result(environments.variables, environments.operator)
end

