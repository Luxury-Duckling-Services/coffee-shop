20.times do
    Customer.create(name: Faker::Name.unique.name)
end

10.times do
    Coffee.create(title: Faker::Coffee.unique.blend_name)
end

10.times do
    Order.create(price: 3 + rand()*20, customer_id: Customer.all.sample.id, coffee_id: Coffee.all.sample.id)
end