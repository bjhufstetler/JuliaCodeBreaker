# libraries
using Random
using Printf

# Define a function to parse the input data into an integer vector
function ParseInput(obj)
   j = zeros(0)
   for i in obj; j = append!(j, parse(Int64, i)) end
   return j
end

# Create the secret code
code = shuffle!(Array(0:9))[1:4]

println("Guess four non-repeating numbers. \n")
guessCount = 0

while true
    global guessCount
    guessCount += 1
    guessInput = ParseInput(input()) # Get a guess input from the user
    correctNumbers = 0 # initialize
    correctPlaces = 0 # initialize
    for guessIndex in 1:4 # check each index in the guess for a match or an exact match
        for codeIndex in 1:4
            global code
            if guessInput[guessIndex] == code[codeIndex] # check if the guess element is in the code
                correctNumbers += 1
                if guessIndex == codeIndex; correctPlaces += 1 end # check if the guess element matches exactly the code
            end
        end
    end
    # Give the user some feedback about their guess
    @printf("Attempt %2.0f, %1.0f%1.0f%1.0f%1.0f, contains %1.0f correct number(s) with %1.0f in the correct place.\n", guessCount, guessInput[1], guessInput[2], guessInput[3], guessInput[4], correctNumbers, correctPlaces)

    if correctPlaces == 4 # check if guess matches code perfectly
        @printf("Congratulations! You've guessed the code, %1.0f%1.0f%1.0f%1.0f! In only %2.0f tries.", guessInput[1], guessInput[2], guessInput[3], guessInput[4], guessCount)
        break
    end
end
