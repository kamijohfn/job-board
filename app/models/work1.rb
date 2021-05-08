class Work1 < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '血液浄化' },
    { id: 3, name: '呼吸療法' },
    { id: 4, name: '人工心肺' },
    { id: 5, name: '心カテ' },
    { id: 6, name: '内視鏡' },
    { id: 7, name: '機器管理' },
    { id: 8, name: '血液浄化・機器管理' },
    { id: 9, name: '血液浄化・呼吸療法' },
    { id: 10, name: '血液浄化・呼吸療法・人工心肺' },
    { id: 11, name: '血液浄化・呼吸療法・人工心肺・機器管理' }
  ]

  include ActiveHash::Associations
  has_many :jobs

end