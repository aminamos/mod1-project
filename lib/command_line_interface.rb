
def welcome
  puts "Welcome!"
end

def get_user_from_user
  puts
  puts "Please enter a user name"
  puts
  # use gets to capture the user's input. This method should return that input, downcased.
  STDIN.gets.chomp
end

def get_age_from_user
    puts "Please enter a user age"
    # use gets to capture the user's input. This method should return that input, downcased.
    STDIN.gets.chomp
end

def get_zipcode_from_user
    puts
    puts "Please enter a search zipcode"
    # use gets to capture the user's input. This method should return that input, downcased.
    STDIN.gets.chomp
end



