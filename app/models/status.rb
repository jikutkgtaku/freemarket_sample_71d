class Status < ActiveHash::Base
  self.data = [
    {id: 1, name: '出品中'},
    {id: 2, name: '入金待ち'},
    {id: 3, name: '発送待ち'},
    {id: 4, name: '発送中'},
    {id: 5, name: '到着済み'}
  ]
end
