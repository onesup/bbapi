class Proof < ActiveRecord::Base
  belongs_to :bookkeeping
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",
                 :storage => :s3,
                 :s3_credentials => "#{Rails.root}/config/s3.yml",
                 :bucket => 'rorlab'
end
