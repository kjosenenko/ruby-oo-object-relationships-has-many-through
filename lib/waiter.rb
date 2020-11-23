class Waiter

    @@all= []

    attr_reader :name, :experience

    def initialize(name, experience)
        @name = name
        @experience = experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        # initializes a meal using the current Waiter instance, a provided Customer instance and a total and tip
        Meal.new(self, customer, total, tip)
    end

    def meals
        # returns an Array of Meal instances associated with this waiter
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        # returns the Customer instance associated with the meal that received the largest tip
        best_tipper = Meal.all.max_by do |meal|
            meal.tip
        end
        best_tipper.customer
    end

end