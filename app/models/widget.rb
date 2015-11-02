class Widget < ActiveRecord::Base
  belongs_to :entry

  has_attached_file :image, styles: { small: "200x200" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
