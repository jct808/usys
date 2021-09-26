class Order < ApplicationRecord
    validates :customer, :phone, presence: true

    belongs_to :user
    has_many :items
    accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

    # Enumerize
    extend Enumerize
    enumerize :status, in: {:尚未送貨 => 1, :尚未付款 => 2, :結單 => 3}, default: :尚未送貨

end