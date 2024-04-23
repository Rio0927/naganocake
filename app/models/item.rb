class Item < ApplicationRecord
    has_one_attached :image
    belongs_to :genre
    has_many :cart_items, dependent: :destroy
    
    #アプリケーション完成させよう2, 14章
    def get_image(width, height)
        unless image.attached?
          file_path = Rails.root.join('app/assets/images/item.png')
          image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        image.variant(resize_to_limit: [100, 100]).processed
    end
end
