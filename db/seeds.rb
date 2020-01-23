restaurants = ["Gino's Pizzeria", "Mel's Diner", "French Bistro", "21", "Bailey's Grill & Bar", "O'Sullivan's", "Bangkok Garden", "Good Company", "Uncle Julio's", "Damn Good Burgers", "Olive Garden", "Las Tinajas", "Ray's Smokehouse", "Salute", "Sushi Go", "China Village", "San Antonio's", "The Shed", "Annie's Steakhouse", "The Silver Diner"]

def random_lat
    rand(-90..90)
end

def random_lon
    rand(-180..180)
end

# restaurant (name)
restaurants.each do |restaurant|
    Restaurant.find_or_create_by(name: restaurant, lat: random_lat, lon: random_lon)
end

# dish (name, restaurant_id(optional), price, cost) - 10 dishes per restaurant

def random_cost
    rand(1..10)
end

# Gino's Pizzeria
gino_dishes = ["penne pasta", "spaghetti", "pizza margherita", "pepperoni pizza", "pasta primavera", "chicken fettuccine", "chicken carbonara", "linguine with clam sauce", "breadsticks", "green salad", "cheese pizzaszswae"]
gino_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 1, price: random_cost * 2.0, cost: random_cost)
end

# Mel's Diner
mel_dishes = ["waffles", "ultimate cheeseburger", "country fried steak", "apple pie", "rib eye steak", "chicken alfredo", "grilled chicken sandwich", "cheesesteak sandwich", "cherry pie", "pancakes", "blueberry pie", "chili con carne", "omelette", "cornbread", "french onion soup", "BLT", "club sandwich", "chicken avocado wrap", "onion rings", "fudge sundae", "chicken tenders"]
mel_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 2, price: random_cost * 2.0, cost: random_cost)
end

# French Bistro
bistro_dishes = ["iceberg salad", "ham sandwich", "croissant", "bleu cheese salad", "escargot", "petit fours", "gruyere sandwich", "goat cheese sandwich", "nutella crepe", "raspberry & chocolate crepe"]
bistro_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 3, price: random_cost * 10.0, cost: random_cost)
end

# 21
twenty_one_dishes = ["tomato & basil soup", "filet mignon", "baked Alaska", "steak & lobster", "creme brulee", "roasted potatoes", "eggplant souffle", "swordfish", "coconut prawns", "macaroni & cheese"]
twenty_one_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 4, price: random_cost * 20.0, cost: random_cost)
end

# Bailey's Grill & Bar
bailey_dishes = ["cheeseburger", "fish & chips", "bangers & mash", "bacon cheeseburger", "crispy chicken sandwich", "grilled cheese", "buffalo wings", "chocolate milkshake", "grilled chicken sandwich", "barbecue ribs"]
bailey_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 5, price: random_cost * 1.5, cost: random_cost)
end

# O'Sullivan's
sullivan_dishes = ["ultimate bangers & mash", "shepherd's pie", "chicken pot pie", "hamburger", "chicken wings", "ribs", "cheesy fries", "nachos", "Irish stew", "lamb cutlet"]
sullivan_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 6, price: random_cost * 2.5, cost: random_cost)
end

# Bangkok Garden
bangkok_dishes = ["pad Thai", "spring rolls", "red curry", "green curry", "Thai fried rice", "drunken noodles", "tom yum soup", "yellow curry", "papaya salad", "deep fried prawns"]
bangkok_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 7, price: random_cost * 5.0, cost: random_cost)
end

# Good Company
good_dishes = ["chocolate donut", "coconut donut", "apple fritter", "maple bar", "maple bacon donut", "bear claw", "turkey sandwich", "green salad", "cinnamon twist", "chicken noodle soup", "chocolate cake donut", "glazed donut", "glazed cake donut", "lemon glazed donut", "blueberry scone", "lemon poppy seed scone", "almond scone", "iceburg wedge salad", "hot chocolate", "dark roast coffee", "medium roast coffee", "cinnamon roll", "donut holes"]
good_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 8, price: random_cost * 6.0, cost: random_cost)
end

# Uncle Julio's
julio_dishes = ["beef enchiladas", "chicken enchiladas", "chimichanga", "beef burrito", "chicken burrito", "fajitas", "flautas", "nachos", "fried rice", "refried beans"]
julio_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 9, price: random_cost * 7.0, cost: random_cost)
end

# Damn Good Burgers
burgers_dishes = ["Hawaii burger", "spicy chicken burger", "double bacon burger", "mushroom burger", "bleu cheese burger", "loaded fries", "veggie burger", "chili cheese fries", "grilled chicken burger", "hot wings burger"]
burgers_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 10, price: random_cost * 4.0, cost: random_cost)
end

# Olive Garden
olive_dishes = ["chicken fettuccine alfredo", "spaghetti with meatballs", "angel hair pasta", "baked ziti with scallops", "beef ravioli", "lasagna", "garlic knots", "mediterranean salad", "penne pasta in white sauce", "cheese ravioli"]
olive_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 11, price: random_cost * 5.0, cost: random_cost)
end

# Las Tinajas
tinajas_dishes = ["pimientos fritos", "tortilla de patata", "meat kebab", "Argentine steak with rice", "carne asada", "pollo asada", "arranque de rotena", "barra de pan", "papas fritas", "chorizo kebab", "paella negro"]
tinajas_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 12, price: random_cost * 3.0, cost: random_cost)
end

# Ray's Smokehouse
ray_dishes = ["steak and ribs", "just ribs", "pulled pork platter", "pulled pork sandwich", "beef brisket platter", "beef brisket sandwich", "smoked sausage", "jambalaya", "red beans & rice", "creole fries"]
ray_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 13, price: random_cost * 1.5, cost: random_cost)
end

# Salute
salute_dishes = ["shrimp primavera", "soup du jour", "steak & mashed potatoes", "split pea soup", "braised leeks", "smoked pork jowl", "scallop sashimi", "vegan charcuterie", "malted custard french toast", "risotto"]
salute_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 14, price: random_cost * 12.0, cost: random_cost)
end

# Sushi Go
sushi_dishes = ["California roll", "Philadelphia roll", "avocado roll", "tuna roll", "shrimp tempura roll", "miso soup", "salmon roll", "eel roll", "mango & papaya roll", "dragon roll"]
sushi_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 15, price: random_cost * 5.0, cost: random_cost)
end

# China Village
china_dishes = ["orange chicken", "kung pao chicken", "sweet & sour pork", "pork fried rice", "wonton soup", "chow mein", "spicy beef & broccoli", "egg rolls", "roasted duck", "dumplings"]
china_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 16, price: random_cost, cost: random_cost)
end

# San Antonio's
antonio_dishes = ["bocadillo manchego", "bocadillo chorizo", "bocadillo queso de cabra", "bocadillo jamon serrano", "gelato", "gazpacho", "paella carne", "paella marisco", "ropa vieja", "galletas almendras"]
antonio_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 17, price: random_cost * 2.0, cost: random_cost)
end

# The Shed
shed_dishes = ["pulled pork sandwich", "coleslaw", "red beans & rice", "crawfish boil", "alligator sausage", "fried okra", "beef brisket sandwich", "shrimp po boy", "hush puppies", "blackened catfish"]
shed_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 18, price: random_cost * 1.5, cost: random_cost)
end

# Annie's Steakhouse
annie_dishes = ["ribeye steak", "sirloin steak", "T-bone steak", "skirt steak", "flank steak", "steak & lobster", "chicken fried steak", "bleu cheese and steak salad", "potatoes au gratin", "sweet potato fries"]
annie_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 19, price: random_cost * 3.0, cost: random_cost)
end

# The Silver Diner
silver_dishes = ["giant cheeseburger", "giant bacon burger", "french toast", "blueberry pancakes", "chocolate chip pancakes", "strawberry waffles", "tacos", "chicken sandwich", "buffalo chicken wrap", "curly fries"]
silver_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 20, price: random_cost * 2.0, cost: random_cost)
end

# tag
tags = ["spicy", "vegetarian", "dessert", "gluten-free", "italian dish", "american food", "southern food", "breakfast dish", "vegan", "raw fish"]
tags.each do |tag|
    Tag.find_or_create_by(name: tag)
end

exotic = Tag.create!(name: "exotic fare")
exoticDish1 = Dish.find_by(name: "papaya salad")
DishTag.create!(dish_id: exoticDish1.id, tag_id: exotic.id)
exoticDish2 = Dish.find_by(name: "swordfish")
DishTag.create!(dish_id: exoticDish2.id, tag_id: exotic.id)
exoticDish3 = Dish.find_by(name: "paella negro")
DishTag.create!(dish_id: exoticDish3.id, tag_id: exotic.id)



10.times do
    all_but_sushi = Restaurant.all.select do |rest|
        rest.name != "Sushi Go"
    end
    all_but_sushi.each do |rest|
        rest.dishes.each do |dish|
            random_tag = (1..10).to_a.sample
            DishTag.find_or_create_by(dish_id: dish.id, tag_id: random_tag)
        end
    end
end

vegetarian = Tag.find_by(name: 'vegetarian')
sushi = Restaurant.find_by(name: "Sushi Go")
sushi.dishes.each do |dish|
    DishTag.find_or_create_by(dish: dish, tag: vegetarian)
end

# other dummy data
mcdonalds = Restaurant.find_or_create_by(name: 'McDonalds', lat: random_lat, lon: random_lon)

Dish.find_or_create_by(name: "french fries", restaurant_id: mcdonalds.id, price: 0.5, cost: 0.25)
Dish.find_or_create_by(name: "Big Mac", restaurant_id: mcdonalds.id, price: 2.0, cost: 0.5)

dish = Dish.find_by(name: 'BLT')
tag = Tag.find_or_create_by(name: 'contains mayonnaise')

DishTag.find_or_create_by(dish_id: dish.id, tag_id: tag.id)

Tag.find_or_create_by(name: 'contains nuts')

# customers (name, lat, lon)

jenny = Customer.find_or_create_by(name: "Jenny Ingram", lat: random_lat, lon: random_lon)
ster = Customer.find_or_create_by(name: "Sterling Paul", lat: random_lat, lon: random_lon)
oscar = Customer.find_or_create_by(name: "Oscar Boscar", lat: random_lat, lon: random_lon)
lucy = Customer.find_or_create_by(name: "Lucy Goosey", lat: random_lat, lon: random_lon)

# orders (orderer_id, restaurant_id)

def random_orderer
    rand(1..Customer.count)
end

100.times do
    Order.create!(orderer_id: random_orderer, restaurant_id: rand(1..Restaurant.count))
end

# dish_orders (order_id, dish_id)

Order.all.each do |order|
    restaurant_id = order.restaurant_id
    dishes = Dish.select{|dish| dish.restaurant_id == restaurant_id}.slice(0, 3)

    dishes.each do |dish|
        DishOrder.find_or_create_by!(order_id: order.id, dish_id: dish.id)
    end
end


# reviews (content, rating, date, reviewer_id, restaurant_id)

Review.find_or_create_by(content: "This place stinks, literally.", rating: rand(1..5), reviewer_id: rand(1..4), restaurant_id: rand(1..21), date: Time.now)
Review.find_or_create_by(content: "So gross...", rating: rand(1..5), reviewer_id: rand(1..4), restaurant_id: rand(1..21), date: Time.now)
Review.find_or_create_by(content: "Excellent!", rating: rand(1..5), reviewer_id: rand(1..4), restaurant_id: rand(1..21), date: Time.now)
Review.find_or_create_by(content: "Too expensive and the plates are too tiny.", rating: rand(1..5), reviewer_id: rand(1..4), restaurant_id: rand(1..21), date: Time.now)
Review.find_or_create_by(content: "I would have my wedding reception here.", rating: rand(1..5), reviewer_id: rand(1..4), restaurant_id: rand(1..21), date: Time.now)
Review.find_or_create_by(content: "Totally my new favorite place.", rating: rand(1..5), reviewer_id: rand(1..4), restaurant_id: rand(1..21), date: Time.now)
Review.find_or_create_by(content: "I saw cockroaches in the corner.", rating: rand(1..5), reviewer_id: rand(1..4), restaurant_id: rand(1..21), date: Time.now)
Review.find_or_create_by(content: "Too many vegetables.", rating: rand(1..5), reviewer_id: rand(1..4), restaurant_id: rand(1..21), date: Time.now)
Review.find_or_create_by(content: "Very good and satisfying meal.", rating: rand(1..5), reviewer_id: rand(1..4), restaurant_id: rand(1..21), date: Time.now)
Review.find_or_create_by(content: "As a person of renown concerning both my taste for atmosphere and a refined palate, I can state with unequivocal firmness in my strong belief that this place is a culinary revelation.", rating: rand(1..5), reviewer_id: rand(1..4), restaurant_id: rand(1..21), date: Time.now)






