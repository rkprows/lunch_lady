require 'pry'

class Food 
	attr_accessor :name, :price
	# :description, :calories, :fat, :carbs, :protein

	def initialize(name, price) #description, calories, fat, carbs, protein)
		@name = name
		@price = price
	end
end

#sub class
class Main < Food
	def initialize(name, price) #description, calories, fat, carbs, protein)
		super(name, price) # description, calories, fat, carbs, protein)
	end
end

#sub class
class Side < Food
	def initialize(name, price) #description, calories, fat, carbs, protein, sugar)
		super(name, price) #description, calores, fat, carbs, protein)
		#@sugar = sugar
	end
end

# pizza = { name: 'Pizza', price: '$ 4.00'}
# tacos  = { name: 'Tacos', price: '$ 3.50'}
# burger = { name: 'Burger', price: '$ 5.00'}
# lasagna = { name: 'Lasagna', price: '$ 4.50'}

def menu_main
	pizza = Main.new('Pizza', '4.00')
	tacos = Main.new('Tacos', '3.50')
	burger = Main.new('Burger', '5.00')
	lasagna = Main.new('Lasagna', '4.50')

	puts "What main dish would you like?"
	puts "1. #{pizza.name} - $#{pizza.price}"
	puts "2. #{tacos.name} - $#{tacos.price}"
	puts "3. #{burger.name} - $#{burger.price}"
	puts "4. #{lasagna.name} -  $#{lasagna.price}"
	user_input1 = gets.strip.to_i
	#push user input to array
	verify_1(user_input1)
end

def verify_1(user_input1)
	if user_input1 == 1 || user_input1 == 2 || user_input1 == 3 || user_input1 == 4
		menu_side
	else
		puts "I'm sorry, I didn't catch that. Please selet an item number."
		menu_main
	end
end

def menu_side
	fries = Side.new('French Fries', '1.50')
	salad = Side.new('Garden Salad', '2.00')
	soup = Side.new('Soup of the Day', '1.75')
	brownie = Side.new('Brownie', '1.00')
	cookie = Side.new('Cookie', '1.25')

puts "Please select a side:"
	puts "1. #{fries.name} - $#{fries.price}"
	puts "2. #{salad.name} - $#{salad.price}"
	puts "3. #{soup.name} - $#{soup.price}"
	puts "4. #{brownie.name} - $#{brownie.price}"
	puts "5. #{cookie.name} - $#{cookie.price}"
	user_input2 = gets.strip.to_i 
	if user_input2 == 1 || user_input2 == 2 || user_input2 == 3 || user_input2 == 4 || user_input2 == 5
		more_sides
	else
		puts "I'm sorry, I didn't catch that. Please selet an item number."
		menu_side
	end
	# push user input to array
	# verify_2(user_input2)
end

# 	


def more_sides
	fries = Side.new('French Fries', '1.50')
	salad = Side.new('Garden Salad', '2.00')
	soup = Side.new('Soup of the Day', '1.75')
	brownie = Side.new('Brownie', '1.00')
	cookie = Side.new('Cookie', '1.25')
	
	puts "Would you like to add another side? Y/N"
	user_input3 = gets.strip.downcase.to_s
  
  if user_input3 == 'y'
  puts "Please select a side:"
	puts "1. #{fries.name} - $#{fries.price}"
	puts "2. #{salad.name} - $#{salad.price}"
	puts "3. #{soup.name} - $#{soup.price}"
	puts "4. #{brownie.name} - $#{brownie.price}"
	puts "5. #{cookie.name} - $#{cookie.price}"
	user_input = gets.strip.to_i
	more_sides
	else
		checkout
	end
end

# def sides_2
# end 


def checkout
	puts "OMG!"
	#use array to total 
end


puts "Welcome to the Ruby Lunch Room!"
menu_main





