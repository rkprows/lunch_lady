require 'pry'

@main = {
	pizza: {name: 'Pizza', price: 4.05},
	tacos: {name: 'Tacos', price: 3.55},
	burger: {name: 'Burger', price: 5.55},
	lasagna: {name: 'Lasagna', price: 4.55} 
}

@side = {
	fries: {name: 'Fries', price: 1.55},
	salad: {name: 'Salad', price: 2.05},
	soup: {name: 'Soup', price: 1.75},
	brownie: {name: 'Brownie', price: 0.99},
	cookie: {name: 'Cookie', price: 1.25}
}

@choices = []
@sum = []


def main_menu
	puts "What would you like?"
	puts "#{@main[:pizza][:name]} - #{@main[:pizza][:price]}"
	puts "#{@main[:tacos][:name]} - #{@main[:tacos][:price]}"
	puts "#{@main[:burger][:name]} - #{@main[:burger][:price]}"
	puts "#{@main[:lasagna][:name]} - #{@main[:lasagna][:price]}"
	puts "Type exit to quit"
	user_input1 = gets.strip.downcase.to_s
	if user_input1 == 'pizza' || user_input1 == 'tacos'  || user_input1 == 'burger' || user_input1 == 'lasagna'
		@choices << user_input1
		@sum << 
		side_menu
	elsif user_input1 == 'exit'
	exit(0) 
	else
		puts "I'm sorry, I didn't catch that. Please selet an item number."
		main_menu
	end
end

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
	if @choices.include? 'pizza'
		@sum << @main[:pizza][:price]
	end
	if @choices.include? 'tacos'
		@sum << @main[:tacos][:price]
	end
	if @choices.include? 'burger'
		@sum << @main[:burger][:price]
	end
	if @choices.include? 'lasagna'
		@sum << @main[:lasagna][:price]
	end 
	if @choices.include? 'fries'
		@sum << @side[:fries][:price]
	end
	if @choices.include? 'salad'
		@sum << @side[:salad][:price]
	end
	if @choices.include? 'soup'
		@sum << @side[:soup][:price]
	end
	if @choices.include?'brownie'
		@sum << @side[:brownie][:price]
	end
	if @choices.include?'cookie'
		@sum << @side[:cookie][:price]
	end
	puts "Your total comes to:"
	total = @sum.reduce(:+)
	puts total '$'
	puts "Thank you for eating at the Ruby Lunch Room!"
end
	
while true
@choices.clear
@sum.clear
puts "Welcome to the Ruby Lunch Room!"
main_menu
end
