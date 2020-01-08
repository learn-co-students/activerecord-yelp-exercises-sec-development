restaurants = ["Gino's Pizzeria", "Mel's Diner", "French Bistro", "21", "Bailey's Grill & Bar", "O'Sullivan's", "Bangkok Garden", "Good Company", "Uncle Julio's", "Damn Good Burgers", "Olive Garden", "Las Tinajas", "Ray's Smokehouse", "Salute", "Sushi Go", "China Village", "San Antonio's", "The Shed", "Annie's Steakhouse", "The Silver Diner"]

# restaurant (name)
restaurants.each do |restaurant|
    Restaurant.find_or_create_by(name: restaurant)
end

# dish (name, restaurant_id(optional)) - 10 dishes per restaurant

# Gino's Pizzeria
gino_dishes = ["penne pasta", "spaghetti", "pizza margherita", "pepperoni pizza", "pasta primavera", "chicken fettuccine", "chicken carbonara", "linguine with clam sauce", "breadsticks", "green salad", "cheese pizzaszswae"]
gino_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 1)
end

# Mel's Diner
mel_dishes = ["waffles", "ultimate cheeseburger", "country fried steak", "apple pie", "rib eye steak", "chicken alfredo", "grilled chicken sandwich", "cheesesteak sandwich", "cherry pie", "pancakes", "blueberry pie", "chili con carne", "omelette", "cornbread", "french onion soup", "BLT", "club sandwich", "chicken avocado wrap", "onion rings", "fudge sundae", "chicken tenders"]
mel_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 2)
end

# French Bistro
bistro_dishes = ["iceberg salad", "ham sandwich", "croissant", "bleu cheese salad", "escargot", "petit fours", "gruyere sandwich", "goat cheese sandwich", "nutella crepe", "raspberry & chocolate crepe"]
bistro_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 3)
end

# 21
twenty_one_dishes = ["tomato & basil soup", "filet mignon", "baked Alaska", "steak & lobster", "creme brulee", "roasted potatoes", "eggplant souffle", "swordfish", "coconut prawns", "macaroni & cheese"]
twenty_one_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 4)
end

# Bailey's Grill & Bar
bailey_dishes = ["cheeseburger", "fish & chips", "bangers & mash", "bacon cheeseburger", "crispy chicken sandwich", "grilled cheese", "buffalo wings", "chocolate milkshake", "grilled chicken sandwich", "barbecue ribs"]
bailey_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 5)
end

# O'Sullivan's
sullivan_dishes = ["ultimate bangers & mash", "shepherd's pie", "chicken pot pie", "hamburger", "chicken wings", "ribs", "cheesy fries", "nachos", "Irish stew", "lamb cutlet"]
sullivan_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 6)
end

# Bangkok Garden
bangkok_dishes = ["pad Thai", "spring rolls", "red curry", "green curry", "Thai fried rice", "drunken noodles", "tom yum soup", "yellow curry", "papaya salad", "deep fried prawns"]
bangkok_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 7)
end

# Good Company
good_dishes = ["chocolate donut", "coconut donut", "apple fritter", "maple bar", "maple bacon donut", "bear claw", "turkey sandwich", "green salad", "cinnamon twist", "chicken noodle soup", "chocolate cake donut", "glazed donut", "glazed cake donut", "lemon glazed donut", "blueberry scone", "lemon poppy seed scone", "almond scone", "iceburg wedge salad", "hot chocolate", "dark roast coffee", "medium roast coffee", "cinnamon roll", "donut holes"]
good_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 8)
end

# Uncle Julio's
julio_dishes = ["beef enchiladas", "chicken enchiladas", "chimichanga", "beef burrito", "chicken burrito", "fajitas", "flautas", "nachos", "fried rice", "refried beans"]
julio_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 9)
end

# Damn Good Burgers
burgers_dishes = ["Hawaii burger", "spicy chicken burger", "double bacon burger", "mushroom burger", "bleu cheese burger", "loaded fries", "veggie burger", "chili cheese fries", "grilled chicken burger", "hot wings burger"]
burgers_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 10)
end

# Olive Garden
olive_dishes = ["chicken fettuccine alfredo", "spaghetti with meatballs", "angel hair pasta", "baked ziti with scallops", "beef ravioli", "lasagna", "garlic knots", "mediterranean salad", "penne pasta in white sauce", "cheese ravioli"]
olive_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 11)
end

# Las Tinajas
tinajas_dishes = ["pimientos fritos", "tortilla de patata", "meat kebab", "Argentine steak with rice", "carne asada", "pollo asada", "arranque de rotena", "barra de pan", "papas fritas", "chorizo kebab"]
tinajas_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 12)
end

# Ray's Smokehouse
ray_dishes = ["steak and ribs", "just ribs", "pulled pork platter", "pulled pork sandwich", "beef brisket platter", "beef brisket sandwich", "smoked sausage", "jambalaya", "red beans & rice", "creole fries"]
ray_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 13)
end

# Salute
salute_dishes = ["shrimp primavera", "soup du jour", "steak & mashed potatoes", "split pea soup", "braised leeks", "smoked pork jowl", "scallop sashimi", "vegan charcuterie", "malted custard french toast", "risotto"]
salute_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 14)
end

# Sushi Go
sushi_dishes = ["California roll", "Philadelphia roll", "avocado roll", "tuna roll", "shrimp tempura roll", "miso soup", "salmon roll", "eel roll", "mango & papaya roll", "dragon roll"]
sushi_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 15)
end

# China Village
china_dishes = ["orange chicken", "kung pao chicken", "sweet & sour pork", "pork fried rice", "wonton soup", "chow mein", "spicy beef & broccoli", "egg rolls", "roasted duck", "dumplings"]
china_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 16)
end

# San Antonio's
antonio_dishes = ["bocadillo manchego", "bocadillo chorizo", "bocadillo queso de cabra", "bocadillo jamon serrano", "gelato", "gazpacho", "paella carne", "paella marisco", "ropa vieja", "galletas almendras"]
antonio_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 17)
end

# The Shed
shed_dishes = ["pulled pork sandwich", "coleslaw", "red beans & rice", "crawfish boil", "alligator sausage", "fried okra", "beef brisket sandwich", "shrimp po boy", "hush puppies", "blackened catfish"]
shed_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 18)
end

# Annie's Steakhouse
annie_dishes = ["ribeye steak", "sirloin steak", "T-bone steak", "skirt steak", "flank steak", "steak & lobster", "chicken fried steak", "bleu cheese and steak salad", "potatoes au gratin", "sweet potato fries"]
annie_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 19)
end

# The Silver Diner
silver_dishes = ["giant cheeseburger", "giant bacon burger", "french toast", "blueberry pancakes", "chocolate chip pancakes", "strawberry waffles", "tacos", "chicken sandwich", "buffalo chicken wrap", "curly fries"]
silver_dishes.each do |dish|
    Dish.find_or_create_by(name: dish, restaurant_id: 20)
end

# tag
tags = ["spicy", "vegetarian", "dessert", "gluten-free", "italian dish", "american food", "southern food", "breakfast dish", "vegan", "raw fish"]
tags.each do |tag|
    Tag.find_or_create_by(name: tag)
end

10.times do 
    Dish.all.each do |dish|
        random_tag = (1..10).to_a.sample
        DishTag.find_or_create_by(dish_id: dish.id, tag_id: random_tag)
    end
end

# other dummy data
mcdonalds = Restaurant.find_or_create_by(name: 'McDonalds')

Dish.find_or_create_by(name: "french fries", restaurant_id: mcdonalds.id)
Dish.find_or_create_by(name: "Big Mac", restaurant_id: mcdonalds.id)



