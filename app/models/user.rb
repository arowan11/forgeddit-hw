class User < ApplicationRecord
  has_many :shares
  has_many :comments
  has_many :votes
  validates :email, uniqueness: true

  def password=(unhashed_password)
    @_password = BCrypt::Password.create(unhashed_password)
    self.password_digest = @_password
  end

  def password
    @_password ||= BCrypt::Password.new(password_digest)
  end

end
