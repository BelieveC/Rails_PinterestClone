class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image,styles:{medium:"300*300>"}
	validates_attachment_content_type :image, :content_type=> /\Aimage\/.*\Z/
end
