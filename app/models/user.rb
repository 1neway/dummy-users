
class User < ActiveRecord::Base

  def self.create_login(name, email, password)
    my_password = BCrypt::Password.create(password)
    user = User.create(name: name, email: email, password_hash: my_password)
  end

  def self.validate_login(email, password_input)
    @user = User.find_by_email(email)
    p @user.password_hash

    password_encrypted = BCrypt::Password.new(@user.password_hash)
    password_encrypted == password_input
  end
end
