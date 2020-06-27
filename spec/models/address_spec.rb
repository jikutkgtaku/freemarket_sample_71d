require 'rails_helper'
describe Address do
  describe '#create' do

    # 必須項目のテストコード
    

    it "post_numberがない場合は登録できないこと" do
      address = build(:address, post_number: "")
      address.valid?
      expect(address.errors[:post_number]).to include("を入力してください")
    end

    it "firstnameがない場合は登録できないこと" do
      address = build(:address, firstname: "")
      address.valid?
      expect(address.errors[:firstname]).to include("を入力してください")
    end

    it "lastnameがない場合は登録できないこと" do
      address = build(:address, lastname: "")
      address.valid?
      expect(address.errors[:lastname]).to include("を入力してください")
    end

    it "prefectureがない場合は登録できないこと" do
      address = build(:address, prefecture: "")
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "addressがない場合は登録できないこと" do
      address = build(:address, address: "")
      address.valid?
      expect(address.errors[:address]).to include("を入力してください")
    end

     # 氏名は全角ひらがな・漢字・カタカナであること
     it 'lastnameが全角であること（半角カナではない）' do
      address = build(:address, lastname: "ｱｱ")
      address.valid?
      expect(address.errors[:lastname]).to include("は不正な値です")
    end

    it 'lastnameが全角であること（半角英語ではない）' do
      address = build(:address, lastname: "aa")
      address.valid?
      expect(address.errors[:lastname]).to include("は不正な値です")
    end

    it 'lastnameが全角であること（半角数字ではない）' do
      address = build(:address, lastname: "11")
      address.valid?
      expect(address.errors[:lastname]).to include("は不正な値です")
    end
 
    it 'lastnameが全角であること（全角数字ではない）' do
      address = build(:address, lastname: "２２２")
      address.valid?
      expect(address.errors[:lastname]).to include("は不正な値です")
    end
 
    it 'lastnameが全角ひらがなであれば登録できる' do
      address = build(:address, lastname: "ああ")     
      expect(address).to be_valid 
    end
   
    it 'lastnameが全角漢字であれば登録できる' do
      address = build(:address, lastname: "嗚呼")     
      expect(address).to be_valid 
    end

    it 'lastnameが全角カタカナであれば登録できる' do
      address = build(:address, lastname: "アア")     
      expect(address).to be_valid 
    end

    it 'firstnameが全角であること（半角カナではない）' do
      address = build(:address, firstname: "ｲｲ")
      address.valid?
      expect(address.errors[:firstname]).to include("は不正な値です")
    end

    it 'firstnameが全角であること（半角英語ではない）' do
      address = build(:address, firstname: "ee")
      address.valid?
      expect(address.errors[:firstname]).to include("は不正な値です")
    end

    it 'firstnameが全角であること（半角数字ではない）' do
      address = build(:address, firstname: "11")
      address.valid?
      expect(address.errors[:firstname]).to include("は不正な値です")
    end

    it 'firstnameが全角であること（全角数字ではない）' do
      address = build(:address, firstname: "１１")
      address.valid?
      expect(address.errors[:firstname]).to include("は不正な値です")
    end

    it 'firstnameが全角ひらがなであれば登録できる' do
      address = build(:address, firstname: "ああ")     
      expect(address).to be_valid 
    end

    it 'firstnameが全角漢字であれば登録できる' do
      address = build(:address, firstname: "嗚呼")     
      expect(address).to be_valid 
    end

    it 'firstnameが全角カタカナであれば登録できる' do
      address = build(:address, firstname: "アア")     
      expect(address).to be_valid 
    end
    
    #tel_number関連
    it 'tel_numberが10文字で登録出来ること' do
      address = build(:address, tel_number: "0123456789")
      expect(address).to be_valid 
    end

    it 'tel_numberが11文字で登録出来ること' do
      address = build(:address, tel_number: "01234567890")
      expect(address).to be_valid 
    end

    it 'tel_numberが9文字で登録出来ないこと' do
      address = build(:address, tel_number: "012345678")
      address.valid?
      expect(address.errors[:tel_number]).to include("は10文字以上で入力してください")
    end

    it 'tel_numberが12文字で登録出来ないこと' do
      address = build(:address, tel_number: "012345678910")
      address.valid?
      expect(address.errors[:tel_number]).to include("は11文字以内で入力してください")
    end

    it 'tel_numberにひらがなが入ると登録できない' do
      address = build(:address, tel_number: "0900000000あ")
      address.valid?
      expect(address.errors[:tel_number]).to include("は数値で入力してください")
    end

    it 'tel_numberに全角カタカナが入ると登録できない' do
      address = build(:address, tel_number: "0900000000ア")
      address.valid?
      expect(address.errors[:tel_number]).to include("は数値で入力してください")
    end

    it 'tel_numberに半角カタカナが入ると登録できない' do
      address = build(:address, tel_number: "0900000000ｱ")
      address.valid?
      expect(address.errors[:tel_number]).to include("は数値で入力してください")
    end

    it 'tel_numberに半角英語が入ると登録できない' do
      address = build(:address, tel_number: "0900000000a")
      address.valid?
      expect(address.errors[:tel_number]).to include("は数値で入力してください")
    end

    it 'tel_numberに全角数字が入ると登録できない' do
      address = build(:address, tel_number: "0900000000９")
      address.valid?
      expect(address.errors[:tel_number]).to include("は数値で入力してください")
    end

    it 'tel_numberに全角英語が入ると登録できない' do
      address = build(:address, tel_number: "0900000000Ａ")
      address.valid?
      expect(address.errors[:tel_number]).to include("は数値で入力してください")
    end

  end
end