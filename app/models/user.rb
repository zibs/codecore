class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: [:slugged, :history]

  has_many :projects, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :skills, dependent: :destroy

  has_many :linkings, dependent: :destroy
  has_many :links, through: :linkings

  mount_uploader :image, ImageUploader
  mount_uploader :resume, ResumeUploader


  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_secure_password

  before_validation :downcase_email

  validates :password, length: { minimum: 5 }, on: :create
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
            uniqueness: true,
            format: VALID_EMAIL_REGEX

before_create { generate_token(:auth_token) }

  def full_name
    "#{first_name} #{last_name}".titleize
  end



  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UsersMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end


private

  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end

end
