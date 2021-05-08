class Salary < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '15万円' },
    { id: 3, name: '16万円' },
    { id: 4, name: '17万円' },
    { id: 5, name: '18万円' },
    { id: 6, name: '19万円' },
    { id: 7, name: '20万円' },
    { id: 8, name: '21万円' },
    { id: 9, name: '22万円' },
    { id: 10, name: '23万円' },
    { id: 11, name: '24万円' },
    { id: 12, name: '25万円' }
  ]

  include ActiveHash::Associations
  has_many :jobs

end