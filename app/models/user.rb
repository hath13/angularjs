class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
          authentication_keys: [:login]
  validates :name, uniqueness: {case_sensitive: false}, length: {minimum: 6}
  has_many :posts, dependent: :destroy
  has_attached_file :avatar,
                    path: ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
                    url: "/system/:attachment/:id/:style/:basename.:extension",
                    styles: {
                      thumb: "75x75",
                      small: "150x150"
                    }
  validates_attachment :avatar,
                        presence: true,
                        size: {in: 0..10.megabytes},
                        content_type: {content_type: /^image\/(jpeg|png|gif|tiff)$/}
  attr_accessor :login
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(name) = :value OR lower(email) = :value",{value: login.downcase}]).first
    else
      where(conditions).first
    end
  end
end
