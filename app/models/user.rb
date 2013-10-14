class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :group_members, foreign_key: :member_id, dependent: :destroy
  has_many :membered_groups, class_name: 'Group', through: :group_members, source: :group
  has_many :created_groups, class_name: 'Group', foreign_key: :owner_id, dependent: :nullify         
  has_many :categories, foreign_key: :owner_id, dependent: :nullify
  has_many :bookkeepings_issued_by_me, class_name: 'Bookkeeping', foreign_key: 'issuer_id'
  has_many :bookkeepings_written_by_me, class_name: 'Bookkeeping', foreign_key: 'writer_id'
  
  before_save :ensure_authentication_token
  
  # token_authenticable is deprecated
  # https://gist.github.com/josevalim/fb706b1e933ef01e4fb6

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end
 
  private
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

end
