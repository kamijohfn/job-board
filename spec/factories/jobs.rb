FactoryBot.define do
  factory :job do
    name               {Faker::Commerce.product_name}
    salary_id          {Faker::Number.within(range: 2..12)}
    area_id            {Faker::Number.within(range: 2..48)}
    work1_id           {Faker::Number.within(range: 2..12)}
    work2_id           {Faker::Number.within(range: 2..12)}
    work3_id           {Faker::Number.within(range: 2..12)}
    test_month_id      {Faker::Number.within(range: 2..14)}
    test_day_id       {Faker::Number.within(range: 2..32)}
    test_id            {Faker::Number.within(range: 2..12)}
    note               {Faker::Lorem.sentence}
    association :user
    
    after(:build) do |job|
      job.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end

    
  end
end
