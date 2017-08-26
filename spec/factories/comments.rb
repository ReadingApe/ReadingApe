FactoryGirl.define do
  factory :comment do
    user
    sequence(:content) {|n| %/Comment Content #{n}/ }
    association :commentable, factory: :user

    factory :invalid_comment do
      user nil
      content nil
      commentable nil
    end

    factory :bare_comment do
      user nil
      content nil
      commentable nil
    end
  end
end
