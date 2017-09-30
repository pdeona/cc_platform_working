class User
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  include Mongoid::Document

  field :username
  embeds_many :positions

  field :encrypted_password, type: String, encrypted: {random_iv: true}

  validates :username, presence: true, format: { with: VALID_EMAIL_REGEX },
                       uniqueness: true
  validates :password, length: {minimum: 4, maximum: 16}
  validates :positions, presence: false
end
