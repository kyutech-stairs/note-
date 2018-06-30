class Price < ApplicationRecord
  belongs_to :article
  enum min: {free_min_plan:0, min_plan_1: 10, min_plan_2: 100, min_plan_3: 500, min_plan_4: 1000 }
  enum max: {free_max_plan:0, max_plan_1: 500, max_plan_2: 1000 ,max_plan_3: 2000, max_plan_4: 5000 }
  enum rate: {free_rate_plan:0, high: 1, normal: 2, low: 3 }

  validates :min, presence: true
  validates :max, presence: true
  validates :rate, presence: true

end
