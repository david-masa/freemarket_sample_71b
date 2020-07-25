class Condition < ActiveHash::Base
  self.data = [
    {id: 1, name: '新品'}, {id: 2, name: 'とても良い'}, {id: 3, name: '普通'},
    {id: 4, name: '少しの汚れ、傷'}, {id: 5, name: 'かなり古い'}
  ]
end