# def validate_password(email, 
# end

def current_user
  @current_user ||= User.find_by_email(session["user_id"])
end



# sha256 = Digest::SHA256.new
# digest = sha256.digest message
