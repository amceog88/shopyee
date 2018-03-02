namespace :dev do


  task fake_product: :environment do
    Product.destroy_all
    1000.times do |i|
      name = FFaker::Product.product_name

      Product.create!(
        name: name,
        price: (rand(10) + 1) * 50,
        image: File.open("#{Rails.root}/public/product_image/product#{rand(1...10)}.jpg"),
        description: FFaker::Lorem.paragraph
      )
    end
    product.save!
    puts "now you have #{Product.count} restaurants data"
  end
end
