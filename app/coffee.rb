class Coffee < ActiveRecord::Base
    has_many :orders
    has_many :customers, through: :orders

    def unique_customer_names
        self.customers.uniq().map {|c| c.name}
    end

    def self.most_ordered
        ids = Order.all.map {|o| o.coffee_id}
        Coffee.find(ids.max_by {|i| ids.count(i) })
    end
end