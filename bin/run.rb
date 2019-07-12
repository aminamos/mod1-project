require_relative "../config/environment.rb"

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/" # trailing / because we append the business id to the path

DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "San Francisco, CA"
SEARCH_LIMIT = 5

def startCLI
  welcome
  while true
    puts "Please choose your role.
    1. Customer
    2. Restaurant owner
    3. Exit app"
    puts

    choice = STDIN.gets.chomp.to_i
    if choice == 1
      start_customer_CLI
    elsif choice == 2
      start_owner_CLI
    elsif choice == 3
      puts "Goodbye, thank you for using our app."
      return
    end
  end
end

def start_customer_CLI
  name = get_user_from_user
  userid = User.find_by(name: name)
  current_user = User.where(id: userid).first

  if current_user != nil
    puts
    puts "Welcome back, #{current_user.name}!"
    puts
  else
    current_user = User.create(name: name, age: nil, zipcode: nil)
  end

  while true
    puts "Please enter a search term."
    term = STDIN.gets.chomp
    zipcode = get_zipcode_from_user
    restaurants = search(term, zipcode)
    puts
    restaurants.each_with_index do |restaurant, index|
      puts "#{index + 1}. #{restaurant["name"]}"
    end
    puts "6. Change my mind."
    puts
    puts "Choose between 1 to 6."
    chosen = STDIN.gets.chomp.to_i
    if chosen == 6
      next
    else
      puts
      puts "#{restaurants[chosen - 1]["name"]}, good choice!"
      break
    end

  end

  chosen_restaurant = Restaurant.where(name: restaurants[chosen - 1]["name"]).first
  if chosen_restaurant == nil
    chosen_restaurant = Restaurant.create(name: restaurants[chosen - 1]["name"],
                                          rating: restaurants[chosen - 1]["rating"],
                                          zipcode: restaurants[chosen - 1]["location"]["zip_code"],
                                          category: restaurants[chosen - 1]["categories"][0]["title"])
  end
  puts
  puts "How much did you spend on this meal? "
  price = (STDIN.gets.chomp.to_f * 100).to_i

  current_check = Check.create(price: price, user: current_user, restaurant: chosen_restaurant)
  while true
    puts
    puts "Choose from 1 to 6.
    1. View total amount you have spent.
    2. Your favorite restaurant.
    3. Restaurants you have visited.
    4. Go back to main menu.
    5. Edit personal information.
    6. Delete personal data.
    "
    choice = STDIN.gets.chomp.to_i
    if choice == 1
      puts
      puts "#{current_user.name} total spent #{current_user.total_amount_spent} dollars."
    elsif choice == 2
      puts
      puts "#{current_user.name}'s favorite restaurant is #{current_user.favorite}."
    elsif choice == 3
      puts
      puts "#{current_user.name} has visited #{current_user.visited_restaurant}."
    elsif choice == 4
      return
    elsif choice == 5
      puts
      puts "Please enter your new name."
      new_name = STDIN.gets.chomp.to_s
      current_user.update(name: new_name)
    elsif choice == 6
      puts
      puts "Confirm delete personal data.
      1. YES
      2. NO"
      confirm = STDIN.gets.chomp.to_i
      if confirm == 1
        current_user.destroy
        break
      elsif confirm == 2
        next
      end
    end
  end
end

def start_owner_CLI
  puts "Please enter your restaurant's name."
  name = STDIN.gets.chomp.to_s
  restaurant = Restaurant.where(name: name).first
  while true
    puts "Choose from 1 to 4.
    1. View total amount you have earned.
    2. List of VIP customers.
    3. List of customers.
    4. Go back to main menu.
    "
    choice = STDIN.gets.chomp.to_i
    if choice == 1
      puts "#{name} has earned #{restaurant.total_amount_earned} dollars."
    elsif choice == 2
      puts "#{name}'s VIP customer(s):"
      restaurant.vip_customers
    elsif choice == 3
      puts "#{restaurant.customers} visited #{name}."
    elsif choice == 4
      return
    end
  end
end

def search(term, zipcode)
  url = "#{API_HOST}#{SEARCH_PATH}"
  params = {
    term: term,
    location: zipcode,
    limit: SEARCH_LIMIT
  }

  response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
  response.parse["businesses"]
end
