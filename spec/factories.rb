FactoryGirl.define do
  factory :tag do
    name { |n| "tag-#{n}" }
  end
end
