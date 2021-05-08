class Job < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :salary
  belongs_to :area
  belongs_to :work1
  belongs_to :work2
  belongs_to :work3
  belongs_to :test_month
  belongs_to :test_day
  belongs_to :test

  belongs_to :user
  has_many :comments
  has_one_attached :image
  has_one_attached :image2  #修正

  with_options presence: true do
      validates :name
      validates :image

    with_options numericality: { other_than: 1 } do
        validates :salary_id 
        validates :area_id 
        validates :work1_id
        validates :test_month_id
        validates :test_id
      end

    end

  #validates :note 
  #validates :work2_id
  #validates :work3_id
  #validates :test_day_id

  def self.search(search)
    if search != ""
      Job.where('name LIKE(?)', "%#{search}%")  #nemeを検索する
    else
      Job.all
    end
  end

end
