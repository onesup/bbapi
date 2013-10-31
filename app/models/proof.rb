class Proof < ActiveRecord::Base
  belongs_to :bookkeeping
  belongs_to :user
  has_attached_file :picture, :styles => { :medium => "600x600>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",
                 :storage => :s3,
                 :s3_credentials => "#{Rails.root}/config/s3.yml",
                 :bucket => 'rorlab'
end
