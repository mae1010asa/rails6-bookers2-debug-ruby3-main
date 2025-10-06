class Group < ApplicationRecord
  
  has_many :groupusers, dependent: :destroy
  has_one_attached :group_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }


  def get_group_image
    (group_image.attached?) ? group_image : 'no_image.jpg'
  end

end
