require "pry"

class Customer

    @@all= []

    attr_reader :name, :age

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end
  
    def new_meal(waiter, total, tip)
        # initializes a meal using the current Customer instance, a provided Waiter instance and a total and tip
        Meal.new(waiter, self, total, tip)
    end

    def meals
        # returns an Array of Meal instances associated with this customer
        Meal.all.select {|meal| meal.customer == self}
    end

    def waiters
        # returns an Array of Waiter instances associated with this customer's meals
        self.meals.map  {|meal| meal.waiter}
    end

end