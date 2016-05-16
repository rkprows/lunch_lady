require 'pry'

@main = {
	pizza: {name: 'Pizza', description:'4 cheese personal pizza with marinara sauce.', price: 4.05},
	tacos: {name: 'Tacos', description: 'Beef tacos on corn tortillas with all the toppings', price: 3.55},
	burger: {name: 'Burger', description: 'All beef patty with cheddar cheese, ketchup, mayo, lettuce, tomato, and onion.', price: 5.55},
	lasagna: {name: 'Lasagna', description: 'Noodles, red sauce, ricotta, topped with mozzarella and parmesan', price: 4.55} 
}

@side = {
	fries: {name: 'Fries', price: 1.55},
	salad: {name: 'Salad', price: 2.05},
	soup: {name: 'Soup', price: 1.75},
	brownie: {name: 'Brownie', price: 0.99},
	cookie: {name: 'Cookie', price: 1.25}
}

@nutrition = {
	pizza: {fat: 23, calories: 500, carbs: 45},
	tacos: {fat: 18, calories: 360, carbs: 34},
	burger: {fat: 33, calories: 590, carbs: 43},
	lasagna: {fat: 30, calories: 344, carbs: 39},
	fries: {fat: 15, calories: 320, carbs: 43},
	salad: {fat: 13, calories: 210, carbs: 18},
	soup: {fat: 5, calories: 110, carbs: 18},
	brownie: {fat: 24, calories: 410 , carbs: 46},
	cookie: {fat: 10, calories: 220, carbs: 30}
}

@choices = []
@sum = []
@wallet = []


def wallet
	puts "What is your budget for lunch today?"
	@user_input = gets.strip.to_i
	main_menu
end

def main_menu
	puts "What would you like?"
	puts "#{@main[:pizza][:name]} - #{@main[:pizza][:price]}"
	puts "#{@main[:tacos][:name]} - #{@main[:tacos][:price]}"
	puts "#{@main[:burger][:name]} - #{@main[:burger][:price]}"
	puts "#{@main[:lasagna][:name]} - #{@main[:lasagna][:price]}"
	puts "Select 'view' to see food descriptions"
	puts "Type 'info' to see nutritional content"
	puts "Type exit to quit"
	user_input1 = gets.strip.downcase.to_s
	if user_input1 == 'pizza' || user_input1 == 'tacos'  || user_input1 == 'burger' || user_input1 == 'lasagna'
		@choices << user_input1
		side_menu
	elsif user_input1 == 'view'
		main_descriptions
	elsif user_input1 == 'info'
		main_nutrition
	elsif user_input1 == 'exit'
	exit(0) 
	else
		puts "I'm sorry, I didn't catch that. Please selet an item number."
		main_menu
	end
end

def main_descriptions
		puts "#{@main[:pizza][:name]} : #{@main[:pizza][:description]}"
		puts "#{@main[:tacos][:name]} : #{@main[:tacos][:description]}"
		puts "#{@main[:burger][:name]} : #{@main[:burger][:description]}"
		puts "#{@main[:lasagna][:name]} : #{@main[:lasagna][:description]}"
		
		puts "Type return to go back to main menu"
	input = gets.strip.to_s
	if input == 'return'
		main_menu
	else
		"I'm sorry, I didn't catch that. Please try again."
	end
end

# def main_nutrition
# 	puts "#{@nutrition[:pizza][]}"


def side_menu
	puts "Please choose a side:"
	puts "#{@side[:fries][:name]} - #{@side[:fries][:price]}"
	puts "#{@side[:salad][:name]} -  #{@side[:salad][:price]}"
	puts "#{@side[:soup][:name]} - #{@side[:soup][:price]}"
	puts "#{@side[:brownie][:name]} - #{@side[:brownie][:price]}"
	puts "#{@side[:cookie][:name]} - #{@side[:cookie][:price]}"
	puts "Type exit to quit"
	user_input2 = gets.strip.downcase.to_s
	if user_input2 == 'fries' || user_input2 == 'salad'  || user_input2 == 'soup' || user_input2 == 'brownie' || user_input2 == 'cookie'
	@choices << user_input2
	more_sides
	elsif user_input2 == 'exit' || user_input2 == 'quit'
		puts "Thank you for stopping by!"
		exit(0)
	else
		puts "I'm sorry, I didn't catch that. Please selet an item number."
		side_menu
	end
end

def more_sides
	puts "Would you like to select another side? Y/N"
	user_input3 = gets.strip.downcase.to_s
	if user_input3 == 'y' || user_input3 == "yes"
	side_menu
	else
		order_repeat
	end
end

def order_repeat
	puts "Here is your order:"
	puts @choices
	puts "Does this look correct? Y/N"
	user_input4 = gets.strip.downcase.to_s
	if user_input4 == 'y' || user_input4 == 'yes'
	check_out
	else 
		puts "I'm sorry. Would you like to re-order? Y/N"
		user_input5 = gets.strip.downcase.to_s
		if user_input5 == 'y' || user_input5 == 'yes'
			@choices.clear
			main_menu
		else
			check_out
		end
	end
end

def check_out
@choices.each do |choice|
  choice_sym = choice.to_sym
  if @main.keys.include?(choice_sym)
    @sum << @main[choice_sym][:price]
  elsif @side.keys.include?(choice_sym)
    @sum << @side[choice_sym][:price]
  end
end
	puts "Your total comes to:"
 	puts '$' '%.2f' % @sum.reduce(:+)
 	if @sum.reduce(:+) > @user_input
 		puts "I'm sorry, you do not have enough in your wallet. Please make other selections"
 		@choices.clear
 		@sum.clear
 		main_menu
 	elsif @sum.reduce(:+) < @user_input
	puts "Thank you!"
	#find a way to indicate their change
	farewell
end
end

def farewell
puts "Would you like to place another order? Y/N"
user_input6 = gets.strip.downcase
if user_input6 == 'y'
	wallet
else
	puts "Thank you for visiting the Ruby Lunch Room! Have a nice day!"
	exit(0)
end
end
	
while true
@choices.clear
@sum.clear
puts "Welcome to the Ruby Lunch Room!"

wallet
end
