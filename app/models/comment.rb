class Comment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :think

  belongs_to :user
  belongs_to :job

  validates :text, presence: true #, : :think_id, numericality: { other_than: 1 } #どちらかあればコメントできる

  #def think_numericality?
    #validates :think_id, numericality: { other_than: 1 }
  #end

end
