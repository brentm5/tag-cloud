FactoryGirl.define do
  factory :tag do
    name { |n| "tag-#{n}" }
  end

  factory :mapped_value do
    value { |n| "Here is my Value #{n}" }
    tag
  end
end
