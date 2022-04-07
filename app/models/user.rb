class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, format: { with: /\A(?=.*).{8,72}\z/, message: "Špatný formát" }, if: :password_required?

  before_save :downcase_email!

  has_many :sessions, dependent: :destroy
  has_many :user_verifications, dependent: :destroy

  def confirmed?
    !email_confirmed_at.nil?
  end

  def confirm
    update(email_confirmed_at: Time.now)
  end

  def unconfirm
    update(email_confirmed_at: nil)
  end

  private

    def password_required?
      password_digest.nil? || !password.blank?
    end

    def downcase_email!
      email&.downcase!
    end
end
