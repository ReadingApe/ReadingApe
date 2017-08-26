FactoryGirl.define do
  factory :authentication do
    user
    sequence(:provider) {|n| 'auth_provider_%d' % n }
    sequence(:uid) {|n| 'auth_uid_%d' % n }
    sequence(:token) {|n| 'auth_token_%d' % n }
    secret "MyString"
    email "MyString"
    name "MyString"
    nickname "MyString"
    image "MyString"

    factory :invalid_authentication do
      provider nil
      uid nil
      token nil
    end
  end
end
