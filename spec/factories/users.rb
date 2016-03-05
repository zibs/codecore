FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    password_digest "MyString"
    hidden false
    admin false
    valid false
    available false
    description "MyText"
    image "MyString"
  end
end
