class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  attr_accessor :password

  before_create :encrypt
  after_save :clear_password
  #validates that all fields has a value (is present)
  validates :first_name, :last_name, :email, :password, presence: true
  #validates password length
  validates :password, length: {in: 6..20}
  #validates email uniqueness - doesn't allow using same emails in the db
  validates :email, uniqueness: {case_sensitive: false, message: 'has been used for sign up before.'} 
  #validates email format
  validates_format_of :email, :with =>/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, :message =>'invalid format!'


  def encrypt
    if @password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(@password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

end
