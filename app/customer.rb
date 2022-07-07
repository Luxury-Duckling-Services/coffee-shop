class Customer < ActiveRecord::Base
    has_many :orders
    has_many :coffees, through: :orders

    def self.names
        self.all.map { |c|
            c.name
        }
    end

    def order_coffee(coffee_title: , price:)
        order = Order.create(price: price , customer_id: self.id, coffee_id: Coffee.find_by(title: coffee_title).id)
        order.receipt
    end

    def total_purchases_amount
        self.orders.map {|o| o.price}.sum
    end

    def dislike_coffee(coffee_title)
        order = Order.order(id: :desc).find_by(coffee_id: Coffee.find_by(title: coffee_title).id , customer_id: self.id)
        order.destroy
        puts "#{self.name} has been refunded #{order.price}"
    end


end