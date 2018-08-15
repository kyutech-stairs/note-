class Price < ApplicationRecord
  belongs_to :article
  enum rate: { free: 0, high: 10, middle: 20, low: 50 }
  validate :price_validation
  validate :now_price_validation

  validates :min, presence: true, inclusion: { in: 0..1000}, exclusion: { in: 1..99 }
  validates :max, presence: true, inclusion: { in: 0..10000}, exclusion: { in: 1..99 }
  validates :rate, presence: true
  validates :now_price, presence: true, inclusion: { in: 0..10000 }, exclusion: { in: 1..99 }

  def price_validation
    if min.nil? ||  max.nil? || rate.nil?
    elsif min>max 
      errors.add(:min, " : 開始価格を最高価格より小さく設定してください")
    elsif min==0 && (max!=0 || rate != "free")
      errors.add(:min, " : 開始価格が0の時最高価格・レートを0に設定してください")
    end
  end
  def now_price_validation
    if min >= 100
      if now_price < min
        errors.add(:now_price, "now price は min 以上でなくてはなりません")
      elsif now_price > max
        errors.add(:now_price, "now price は max 以下でなくてはなりません")
      end
    end
  end
end
