class Order < ActiveRecord::Base
    belongs_to :customer
    belongs_to :coffee

    def receipt
        puts "#{self.customer.name} ordered a #{self.coffee.title} for #{self.price}"
    end

    def self.most_expensive
        self.all.sort{ |a , b| a.price <=> b.price }.last
    end
end