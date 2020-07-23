class ShippingWay < ActiveHash::Base
  self.data = [
    {id: 1, name: '未定', group: "1"},
    {id: 2, name: 'ゆうパック', group: "1"},
    {id: 3, name: 'クロネコヤマト', group: "1"},
    {id: 4, name: 'ネコポス', group: "1"},
    {id: 5, name: '飛脚メール便', group: "1"},
    {id: 6, name: '宅急便コンパクト', group: "1"},
    {id: 7, name: 'レターパックライト', group: "1"},
    {id: 8, name: 'レターパックプラス', group: "1"},
    {id: 9, name: 'ゆうパケット', group: "1"},
    {id: 10, name: 'スマートレター', group: "1"},
    {id: 11, name: 'クリックポスト', group: "1"},
    {id: 12, name: 'ゆうメール', group: "1"},
    {id: 13, name: '普通郵便（定形、定形外）', group: "1"},

    {id: 14, name: '未定', group: "2"},
    {id: 15, name: 'ゆうパック', group: "2"},
    {id: 16, name: 'ゆうメール', group: "2"},
    {id: 17, name: 'クロネコヤマト', group: "2"},
  ]
end
