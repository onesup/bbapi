class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable

  has_many :group_members, foreign_key: :member_id, dependent: :destroy
  has_many :membered_groups, class_name: 'Group', through: :group_members, source: :group
  has_many :created_groups, class_name: 'Group', foreign_key: :owner_id, dependent: :nullify         
  has_many :categories, foreign_key: :owner_id, dependent: :nullify
  
end
