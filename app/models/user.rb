class User
  include Mongoid::Document
  field :username
  embeds_many :positions
  field :password
end
