FactoryGirl.define do
  factory :post do
    user
    sequence(:title) {|n| 'post_title_%d' % n }
    sequence(:content) {|n| 'post_content_%d' % n }
    type ""
    factory :invalid_post do
      user nil
      title nil
      content nil
    end
  end
end
