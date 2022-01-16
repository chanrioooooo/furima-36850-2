FactoryBot.define do
  factory :item do
<<<<<<< Updated upstream
    product_name  { '商品名' }
    explanation   { '商品説明' }
    category_id   { 2 }
    situation_id  { 2 }
    consignor_id  { 2 }
    area_id       { 2 }
    day_id        { 2 }
    price         { 300 }

    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
=======
    
  end
end
>>>>>>> Stashed changes
