class SeedProducts < ActiveRecord::Migration
  def change
    Product.create({
    :title => 'Dostoevskiy',
    :description => 'Dostoevskiy pizza is a pizza that usually consists of a cheese and tomato base with pieces of ham and pineapple. Often versions will have mixed peppers, mushrooms and bacon. Another variety consists of pineapple and Canadian bacon or American Bacon. It is the most popular pizza, accounting for 15% of pizza sales',
    :price => 600,
    :size => 30,
    :is_spicy => false,
    :is_veg => false,
    :is_best_offer => true,
    :path_to_image => '/images/dostoevskiy.jpg',
    })
  end
end