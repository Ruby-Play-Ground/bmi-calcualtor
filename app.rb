def check_i(num)
    if !num.is_a? Float || num == 0
        puts "-- Invalid Input [#{num}], Only positive numbers allowed" 
        return false
    end
    true
end

def cm_to_m(num)
    num / 100
end

BMI_TYPES = {
    a: "kg-cm",
    b: "lb-in"
}

class Calculator
    def initialize(type)
        @type = type
    end

    def get_BMI(weight, height)
        @type == BMI_TYPES[:a] ? 
            (weight / (cm_to_m(height) ** 2)).round(2) : 
            (713 * (weight / (height ** 2))).round(2)
    end
end

puts "-- Welcome to BMI Calculator App"
puts "-- Please type [a] for using kg/cm Metrics"
puts "-- Please type [b] for using lb/in Metrics"
print ">> "

user_selection = gets.chomp.to_s
if !["a","b"].include? user_selection
    puts "-- Unknown Selection [#{user_selection}]"
    exit(0)
end

calculate_method = BMI_TYPES[user_selection.to_sym];

if user_selection == "a"
    puts "-- Please enter your weight in kilograms(kg)"
    print ">> "
    weight = gets.chomp.to_f
    if !check_i weight then exit(0) end

    puts "-- Please enter your height in centimeter(cm)"
    print ">> "
    height = gets.chomp.to_f
    if !check_i height then exit(0) end
else     
    puts "-- Please enter your weight in pounds(lb)"
    print ">> "
    weight = gets.chomp.to_f
    if !check_i weight then exit(0) end

    puts "-- Please enter your height in inches(in)"
    print ">> "
    height = gets.chomp.to_f
    if !check_i height then exit(0) end
end

calculator = Calculator.new(calculate_method)

puts "-- Your BMI is #{calculator.get_BMI(weight, height)}"