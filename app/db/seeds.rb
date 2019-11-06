# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed categories
categories = Category.create([
  {
    name: 'Heathy food',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique justo id elit bibendum'
  },
  {
    name: 'Meaty food',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique justo id elit bibendum'
  },
  {
    name: 'Vegan food',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique justo id elit bibendum'
  },
  {
    name: 'Beef dish',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique justo id elit bibendum'
  },
  {
    name: 'Pork dish',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique justo id elit bibendum'
  },
])

# Seed recipes
categories.each do |category|
  recipes = Recipe.create([
    {
      name: 'Steak with boiled vegetables',
      time_to_cook: 1.5,
      energy: 2000,
      recipe: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique justo id elit bibendum pharetra non vitae lectus. Mauris libero felis, dapibus a ultrices sed, commodo vitae odio. Sed auctor tellus quis arcu tempus, egestas tincidunt augue pellentesque. Suspendisse vestibulum sem in eros maximus, pretium commodo turpis convallis. Aenean scelerisque orci quis urna tempus, vitae interdum velit aliquet.',
      image: 'assets/bg-img/8.jpg',
      is_premium: false,
      category: category
    },
    {
      name: 'Friend eggs with ham',
      time_to_cook: 1.5,
      energy: 2000,
      recipe: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique justo id elit bibendum pharetra non vitae lectus. Mauris libero felis, dapibus a ultrices sed, commodo vitae odio. Sed auctor tellus quis arcu tempus, egestas tincidunt augue pellentesque. Suspendisse vestibulum sem in eros maximus, pretium commodo turpis convallis. Aenean scelerisque orci quis urna tempus, vitae interdum velit aliquet.',
      image: 'assets/bg-img/7.jpg',
      is_premium: false,
      category: category
    },
    {
      name: 'Friend eggs with ham',
      time_to_cook: 1.5,
      energy: 2000,
      recipe: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique justo id elit bibendum pharetra non vitae lectus. Mauris libero felis, dapibus a ultrices sed, commodo vitae odio. Sed auctor tellus quis arcu tempus, egestas tincidunt augue pellentesque. Suspendisse vestibulum sem in eros maximus, pretium commodo turpis convallis. Aenean scelerisque orci quis urna tempus, vitae interdum velit aliquet.',
      image: 'assets/bg-img/10.jpg',
      is_premium: false,
      category: category
    },
    {
      name: 'Mushrooms with pork chop',
      time_to_cook: 1.5,
      energy: 2000,
      recipe: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique justo id elit bibendum pharetra non vitae lectus. Mauris libero felis, dapibus a ultrices sed, commodo vitae odio. Sed auctor tellus quis arcu tempus, egestas tincidunt augue pellentesque. Suspendisse vestibulum sem in eros maximus, pretium commodo turpis convallis. Aenean scelerisque orci quis urna tempus, vitae interdum velit aliquet.',
      image: 'assets/bg-img/9.jpg',
      is_premium: false,
      category: category
    }
  ])

# Seed ingredient
  recipes.each do |recipe|
    Ingredient.create([
      {
        name: 'Beef steak',
        unit: 'g',
        amount: '500',
        recipe: recipe
      },
      {
        name: 'Egg',
        unit: '',
        amount: '2',
        recipe: recipe
      },
      {
        name: 'Pepper',
        unit: 'g',
        amount: '10',
        recipe: recipe
      },
      {
        name: 'Butter',
        unit: 'g',
        amount: '50',
        recipe: recipe
      },
      {
        name: 'Onion',
        unit: '',
        amount: '1',
        recipe: recipe
      }
    ])
  end
end
