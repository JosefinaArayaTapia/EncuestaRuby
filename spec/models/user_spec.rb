require 'rails_helper'


RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:provider) }
  it { should_not allow_value("araya.tapia.j@gmail").for(:email) }
  it { should allow_value("araya.tapia.j@gmail.com").for(:email) }
end
