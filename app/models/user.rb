class User
  include Mongoid::Document
  field :username
  embeds_many :positions
  field :encrypted_password, type: String, encrypted: {random_iv: true}
end
