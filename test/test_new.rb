# test, not in database (instance only)
# -----
# 10 users
    $amin = User.new(name: "Amin", zipcode: "98122")
    $evan = User.new(name: "Evan", zipcode: "98106")
    $farand = User.new(name: "Farand", zipcode: "98122")
    $gabrielle = User.new(name: "Gabrielle", zipcode: "98104")
    $ryan = User.new(name: "Ryan", zipcode: "98101")
    $kelliann = User.new(name: "Kelliann", zipcode: "98102")
    $kirk = User.new(name: "Kirk", zipcode: "98102")
    $sean = User.new(name: "Sean", zipcode: "98104")
    $silva = User.new(name: "Silva", zipcode: "98106")
    $stephanie = User.new(name: "Stephanie", zipcode: "98101")

    # five restaurants
    $honey_hole = Restaurant.new(name: "Honey Hole", zipcode: "98122")
    $lola = Restaurant.new(name: "Lola", zipcode: "98101")
    $donuts = Restaurant.new(name: "Donuts", zipcode: "98102")
    $bbq = Restaurant.new(name: "BBQ", zipcode: "98104")
    $pasta = Restaurant.new(name: "Pasta", zipcode: "98106")

    # 20 checks
    $check1 = Check.new(price: 500, user_id: 1, restaurant_id: 1)
    $check2 = Check.new(price: 1000, user_id: 1, restaurant_id: 3)
    $check3 = Check.new(price: 1500, user_id: 1, restaurant_id: 1)
    $check4 = Check.new(price: 2000, user_id: 2, restaurant_id: 2)
    $check5 = Check.new(price: 2500, user_id: 2, restaurant_id: 2)
    $check6 = Check.new(price: 3000, user_id: 2, restaurant_id: 3)
    $check7 = Check.new(price: 3500, user_id: 3, restaurant_id: 3)
    $check8 = Check.new(price: 4000, user_id: 3, restaurant_id: 2)
    $check9 = Check.new(price: 4500, user_id: 3, restaurant_id: 3)
    $check10 = Check.new(price: 5000, user_id: 4, restaurant_id: 4)
    $check11 = Check.new(price: 500, user_id: 4, restaurant_id: 5)
    $check12 = Check.new(price: 1000, user_id: 5, restaurant_id: 5)
    $check13 = Check.new(price: 1500, user_id: 5, restaurant_id: 4)
    $check14 = Check.new(price: 2000, user_id: 6, restaurant_id: 4)
    $check15 = Check.new(price: 2500, user_id: 6, restaurant_id: 3)
    $check16 = Check.new(price: 3000, user_id: 7, restaurant_id: 4)
    $check17 = Check.new(price: 3500, user_id: 3, restaurant_id: 3)
    $check18 = Check.new(price: 4000, user_id: 3, restaurant_id: 2)
    $check19 = Check.new(price: 4500, user_id: 7, restaurant_id: 1)
    $check20 = Check.new(price: 5000, user_id: 8, restaurant_id: 1)

