puts "🌱 Seeding spices..."

# Seed your database here
electronic_names = ["Smart Phone", "Microwave Oven", "Smart TV", "Refrigerator", "Digital Camera", "Dishwasher"]

Brand.create(name: "Samsung")
Brand.create(name: "Apple")
Brand.create(name: "LG")
Brand.create(name: "Canon")
Brand.create(name: "Sony")

Brand.all.each do |brand|
    2.times do
        Electronic.create(name: electronic_names.sample, price: rand(100..800), brand_id: brand.id)
    end
end

puts "✅ Done seeding!"
