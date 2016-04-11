class SeedOtherProducts < ActiveRecord::Migration
  def change
    Product.create({
    :title => 'Pizza of peace',
    :description => 'Pizza of peace is a pizza that usually consists of a pepper and cucumber base with pieces of ham. Often versions will have mixed mushrooms and bacon.',
    :price => 520,
    :size => 32,
    :is_spicy => true,
    :is_veg => false,
    :is_best_offer => false,
    :path_to_image => '/images/peace.jpg'
    })

    Product.create({
    :title => 'Pepperony',
    :description => 'Pepperoni is characteristically soft, slightly smoky, and bright red in color. Thinly sliced pepperoni is a popular pizza topping in American-style pizzerias and is used as filling in the West Virginia pepperoni roll. It is also used to make some varieties of submarine sandwiches.',
    :price => 580,
    :size => 28,
    :is_spicy => false,
    :is_veg => false,
    :is_best_offer => false,
    :path_to_image => '/images/pepperony.jpg'
    })

    Product.create({
    :title => 'Vegetable',
    :description => 'Quick and easy recipe that is great at parties and showers. You can use any combination of chopped veggies and cheeses-whatever your family likes!',
    :price => 350,
    :size => 32,
    :is_spicy => false,
    :is_veg => true,
    :is_best_offer => false,
    :path_to_image => '/images/veg_pizza.jpg'
    })

  end
end
