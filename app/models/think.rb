class Think < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '見学希望' },
    { id: 3, name: '受験希望' },
    { id: 4, name: '相談希望' },
    { id: 5, name: '検討中' }
  ]

  include ActiveHash::Associations
  has_many :comments

end