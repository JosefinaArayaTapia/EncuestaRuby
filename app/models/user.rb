class User < ActiveRecord::Base


  validates :email, presence: true, email: true
  validates :uid, presence: true
  validates :provider, presence: true
  has_many :tokens


  def self.from_omniauth(data)
    #Recibe un Hash de Datos
    # {provider:'facebook',uid:'1245',info:{email:'araya.tapia....',nombre:'josefina '}}

    User.where(provider: data[:provider], uid: data[:uid]).first_or_create do |user|
      user.email = data[:info][:email]
    end
  end
end


