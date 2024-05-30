FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    password { "qwe123" }
    password_confirmation { "qwe123" }
  end
end
