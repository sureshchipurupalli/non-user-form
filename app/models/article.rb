class Article < ApplicationRecord

belongs_to :user
 has_many :article_photos, :dependent => :destroy
 accepts_nested_attributes_for :article_photos
has_attached_file :image
validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

end
