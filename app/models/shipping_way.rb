class Shipping_way < ActiveHash::Base
  self.data = [
    {id: 1, name: 'ヤマト宅急便'},
    {id: 2, name: 'ゆうパック'},
    {id: 3, name: '飛脚宅急便'},
    {id: 4, name: 'ネコポス'},
    {id: 5, name: '飛脚メール便'},
    {id: 6, name: '宅急便コンパクト'},
    {id: 7, name: 'レターパックライト'},
    {id: 8, name: 'レターパックプラス'},
    {id: 9, name: 'ゆうパケット'},
    {id: 10, name: 'スマートレター'},
    {id: 11, name: 'クリックポスト'},
    {id: 12, name: 'ゆうメール'},
    {id: 13, name: '普通郵便（定形、定形外）'},
    {id: 14, name: 'ヤマト便'}
  ]
end
