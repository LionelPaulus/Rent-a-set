class Photo < ApplicationRecord
  belongs_to :place

  has_attached_file :image,
    :storage => :cloudinary,
    :path => ':id/:filename',
    styles: {
      :thumb => "100x100#",
      :medium => "300x300>",
      :high => "1280x720"
    }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
