
# Yelp API Project
##### by [@stefaniejz](https://github.com/stefaniejz) & [@aminamos](https://github.com/aminamos)

## Project Requirements:

1. Access a Sqlite3 Database using ActiveRecord.
2. Project should have at minimum three models including one join model. It must have a many-to-many relationship.
3. Project should seed a database using data collected from a CSV, website via scraping, or an API.
4. Models should have methods that answer interesting questions about the data. For example, if you've collected info about movie reviews, what is the most popular movie? What movie has the most reviews?
5. Provide a CLI to display the return values of your interesting methods.
6. Use OOD

## Description
This application uses data from Yelp API and provides users restaurants which meet their searching requirements. It collects users' transaction record to track their spending habits. It can also save customers' information for restaurants' owners.

## Installation
1. Fork and clone the repo
2. `$ Bundle install` to get dependencies
3. `$ rake start` to enter the application
4. If necessary, `CTRL+C` / `CMD+C` to hard-exit the application

Once the visit is recorded, the restaurant will know that the user visited. 

## Main Menu
  - Choose customer or restaurant owner role
  - Exit the application

## Customer navigation
  - Search for a restaurant
    - Choose a restaurant to visit
      - Enter amount spent at the restaurant
        - View total amount spent at all restaurants
        - View favorite (most visited) restaurant
        - View all restaurants visited
        - Return to main user menu
        - Edit name
        - Delete user from database
  - Return to main menu

## Restaurant owner navigation
  - Enter restaurant name
    - View total amount earned by restaurant
    - View list of VIP customers (visitors with > 3 visits)
    - View list of all customers
    - Return to main menu

## Contributions
Please read the CONTRIBUTING.md file for guidance.

## Help and Questions
Open an issue to ask the owners of the project questions.
