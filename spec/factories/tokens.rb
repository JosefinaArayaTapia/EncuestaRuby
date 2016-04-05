FactoryGirl.define do
  factory :token do

    expires_at '2015-02-29 21:21:32'
    association :user, factory: :user

  end

end