require "faker"

FactoryBot.define do
  def custom_uid
    num = ""
    8.times do
      num.concat(rand(0..9).to_s)
    end
    num.to_i
  end

  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    uid { Faker::Bank.account_number(digits: 8) }
  end
end
