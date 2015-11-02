class Entry < ActiveRecord::Base
	has_and_belongs_to_many :categories

	has_many :datum
  accepts_nested_attributes_for :datum, :reject_if => :all_blank, :allow_destroy => true

	has_many :widgets, -> { order(:index) }
	accepts_nested_attributes_for :widgets, :reject_if => :all_blank, :allow_destroy => true

  has_attached_file :thumbnail, styles: { small: "200x200" };
  validates_attachment_content_type :thumbnail, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
