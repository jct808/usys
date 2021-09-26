class Supplier < ApplicationRecord
  validates :name, :phone, presence: true, uniqueness: true
  validates :id, uniqueness: true
  has_many :products

  # Enumerize
  extend Enumerize
  enumerize :status, in: { 正常供貨: 0, 庫存: 1, 停產: -1 }, default: :正常供貨

  def to_s
    name
  end
end
