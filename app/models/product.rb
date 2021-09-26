class Product < ApplicationRecord

  def display_price
    price
  end

  # Set paginate per pages
  paginates_per 24

  belongs_to :supplier
  belongs_to :category
  belongs_to :location

  has_many :items

  # Add Location scope
  scope :location, ->(located) { where(location: located) }

  # Paperclip setting
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/, /JPE?G\z/]

  # Enumerize
  extend Enumerize
  enumerize :status, in: { :正常供貨 => 1, :庫存 => 2, :停產 => 3 }, default: :正常供貨

  def self.search(search)
    if search
      where("lower(products.name) LIKE :search OR lower(suppliers.name) LIKE :search", search: "%#{search.downcase}%").uniq
      # where(["name LIKE :search", search: "%#{search}%"])
    else
      all
    end
  end

  def id_name
    "#{id} - #{name}"
  end

  def supplier=(name)
    self.supplier = Supplier.find_by_name(name) if name.presence?
  end
end
