require 'rails_helper'


RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:provider) }
  it { should_not allow_value("araya.tapia.j@gmail").for(:email) }
  it { should allow_value("araya.tapia.j@gmail.com").for(:email) }

  it "Deberia crear un Usuario si el uid y el provider no existen" do

    user = FactoryGirl.create(:user)
    expect {
      User.from_omniauth({uid: '12345', provider: 'facebook', info: {email: 'araya.tapia.j@gmail.com'}})
    }.to change(User, :count).by(1)
  end


  it "Deberia Encontrar un Usuario si el uid y el provider ya existen" do

    user = FactoryGirl.create(:user)
    expect {
      User.from_omniauth({uid: user.uid, provider: user.provider})
    }.to change(User, :count).by(0)
  end

  it "Deberia Retornar el Usuario encontrado si el provider y el uid existe" do

    user = FactoryGirl.create(:user)
    expect(User.from_omniauth({uid: user.uid, provider: user.provider})).to  eq(user)

  end

end
