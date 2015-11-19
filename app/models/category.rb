class Category < ActiveRecord::Base
  has_many :entries
  has_attached_file :thumbnail, styles: { small: "1500, 250" }
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
end
