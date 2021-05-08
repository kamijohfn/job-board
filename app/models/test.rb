class Test < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '筆記' },
    { id: 3, name: '専門試験' },
    { id: 4, name: '小論文' },
    { id: 5, name: 'SPI' },
    { id: 6, name: '面接' },
    { id: 7, name: '筆記・面接' },
    { id: 8, name: '専門試験・面接' },
    { id: 9, name: '小論文・面接' },
    { id: 10, name: '筆記・小論文・面接' },
    { id: 11, name: '専門試験・小論文・面接' },
    { id: 12, name: '専門試験・SPI・面接'}
  ]

  include ActiveHash::Associations
  has_many :jobs

end