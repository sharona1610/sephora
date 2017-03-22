class User < ApplicationRecord

  validates :name,
    presence: true,
    length: { in: 8..72}

validates :mail,
  presence: true,
  uniqueness: {case_sensitive: false}

has_secure_password

def self.authenticate(params)
  User.find_by_mail(params[:email]).try(:authenticate, params[:password])
end

end
