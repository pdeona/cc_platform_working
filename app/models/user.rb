class User
  VALID_EMAIL_REGEX = /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  attr_accessor :password, :password_confirmation
  # attr_protected :password_hash

  before_save :encrypt_password

  field :username
  embeds_many :positions

  validates_format_of :username, with: VALID_EMAIL_REGEX, message: 'Please provide a valid email.'
  validates_uniqueness_of :username, message: 'Email is already registered'

  field :password_hash, type: String

  validates_length_of :password, minimum: 6, maximum: 16, :message => "Password Must Be Longer Than 6 Characters."
  validates_presence_of :password_confirmation, :message => "Password Confirmation Must Match Given Password."

  def self.authenticate(email, password)
    if password_correct?(email, password)
      # Success!
      true
    else
      # Failed! :(
      false
    end
  end

  def self.password_correct?(user_email, password)
    user = find_by username: user_email
    return if user.nil?
    user_pass = BCrypt::Password.new(user.password_hash)
    user_pass == password
  end

  protected

  def encrypt_password
    if @password_confirmation == @password
      self.password_hash = BCrypt::Password.create(@password)
    end
  end

end
