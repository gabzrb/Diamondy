class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :contacts
  has_many :annonces
  mount_uploader :photo, PhotoUploader
  # after_create :send_welcome_email

  # def send_welcome_email
  #   UserMailer.welcome(self).deliver_now
  # end

  def give_admin!
    self.admin = true
    save
    puts "Felicitation vous etes admin!"
    true
  end

  def remove_admin!
    self.admin = false
    save
    puts "Felicitation vous n'etes plus admin!"
    true
  end
end



