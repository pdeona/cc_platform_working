class User
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  include Mongoid::Document

  attr_accessor :password, :password_confirmation

  field :username
  embeds_many :positions

  field :encrypted_password, type: String, encrypted: {random_iv: true}

  validates :username, presence: true, format: { with: VALID_EMAIL_REGEX },
                       uniqueness: true
  validates :password, length: {minimum: 4, maximum: 16}
  validates_confirmation_of :password, :message => "Password confirmation did not match"
  validates :password_confirmation, presence: true

end
