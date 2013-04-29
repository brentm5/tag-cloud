FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| "tag-#{n}" }
    description 'Here is my really long description for my tag'
  end

  factory :mapped_value do
    sequence(:value) { |n| "Here is my Value #{n}" }
    tag
  end

  factory :user do
    name 'Bob'
    sequence(:email) { |n| "email-#{n}@example.com" }
  end
end
