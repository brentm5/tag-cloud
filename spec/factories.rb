FactoryGirl.define do
  factory :tag do
    name { |n| "tag-#{n}" }
  end

  factory :mapped_value do
    value { |n| "Here is my Value #{n}" }
    tag
  end

  factory :user do
    name 'Bob'
    email { |n| "email-#{n}@example.com" }
  end
end
