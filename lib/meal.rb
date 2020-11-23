class Meal

    @@all= []

    attr_reader :waiter, :customer, :total, :tip

    def initialize(waiter, customer, total, tip)
        @waiter = waiter
        @tip = tip
        @total = total
        @customer = customer
        @@all << self
    end

    def self.all
        @@all
    end

end