class Post < ApplicationRecord
    has_attached_file :image, styles: { large: "1000x1000>", medium: "800x800>", thumb: "100x100>" },  
    default_url: ":style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    belongs_to :user
end
