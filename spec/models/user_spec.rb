require 'rails_helper'
describe User do
  describe '#create' do

    # 必須項目のテストコード
    it "nikcnameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "emailの中間に@がない場合、登録できないこと" do
      user = build(:user, email: "email")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "emailの中間に@がある場合、登録できること" do
      user = build(:user, email: "email@email")
      expect(user).to be_valid
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "lastnameがない場合は登録できないこと" do
      user = build(:user, lastname: "")
      user.valid?
      expect(user.errors[:lastname]).to include("can't be blank")
    end

    it "firstnameがない場合は登録できないこと" do
      user = build(:user, firstname: "")
      user.valid?
      expect(user.errors[:firstname]).to include("can't be blank")
    end

    it "firstname_kanaがない場合は登録できないこと" do
      user = build(:user, firstname_kana: "")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("can't be blank")
    end

    it "lastname_kanaがない場合は登録できないこと" do
      user = build(:user, lastname_kana: "")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("can't be blank")
    end

    it "birth_yearがない場合は登録できないこと" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end

    it "birth_monthがない場合は登録できないこと" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end

    it "birth_dayがない場合は登録できないこと" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end

    it "tel_numberがない場合は登録できないこと" do
      user = build(:user, tel_number: "")
      user.valid?
      expect(user.errors[:tel_number]).to include("can't be blank")
    end

    it "post_numberがない場合は登録できないこと" do
      user = build(:user, post_number: "")
      user.valid?
      expect(user.errors[:post_number]).to include("can't be blank")
    end

    it "prefectureがない場合は登録できないこと" do
      user = build(:user, prefecture: "")
      user.valid?
      expect(user.errors[:prefecture]).to include("can't be blank")
    end

    it "cityがない場合は登録できないこと" do
      user = build(:user, city: "")
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end

    it "addressがない場合は登録できないこと" do
      user = build(:user, address: "")
      user.valid?
      expect(user.errors[:address]).to include("can't be blank")
    end

    #文字数制限のある項目のテストコード
    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

    it "passwordが6文字以下であれば登録できないこと" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
    end


    # 一意性のテストコード
    it "重複したemailが存在する場合登録できないこと" do      
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 氏名は全角ひらがな・漢字・カタカナであること
    it 'lastnameが全角であること（半角カナではない）' do
      user = build(:user, lastname: "ｱｱ")
      user.valid?
      expect(user.errors[:lastname]).to include("is invalid")
    end

    it 'lastnameが全角であること（半角英語ではない）' do
      user = build(:user, lastname: "aa")
      user.valid?
      expect(user.errors[:lastname]).to include("is invalid")
    end

    it 'lastnameが全角であること（半角数字ではない）' do
      user = build(:user, lastname: "11")
      user.valid?
      expect(user.errors[:lastname]).to include("is invalid")
    end
 
    it 'lastnameが全角であること（全角数字ではない）' do
      user = build(:user, lastname: "２２２")
      user.valid?
      expect(user.errors[:lastname]).to include("is invalid")
    end
 
    it 'lastnameが全角ひらがなであれば登録できる' do
      user = build(:user, lastname: "ああ")     
      expect(user).to be_valid 
    end
   
    it 'lastnameが全角漢字であれば登録できる' do
      user = build(:user, lastname: "嗚呼")     
      expect(user).to be_valid 
    end

    it 'lastnameが全角カタカナであれば登録できる' do
      user = build(:user, lastname: "アア")     
      expect(user).to be_valid 
    end

    it 'firstnameが全角であること（半角カナではない）' do
      user = build(:user, firstname: "ｲｲ")
      user.valid?
      expect(user.errors[:firstname]).to include("is invalid")
    end

    it 'firstnameが全角であること（半角英語ではない）' do
      user = build(:user, firstname: "ee")
      user.valid?
      expect(user.errors[:firstname]).to include("is invalid")
    end

    it 'firstnameが全角であること（半角数字ではない）' do
      user = build(:user, firstname: "11")
      user.valid?
      expect(user.errors[:firstname]).to include("is invalid")
    end

    it 'firstnameが全角であること（全角数字ではない）' do
      user = build(:user, firstname: "１１")
      user.valid?
      expect(user.errors[:firstname]).to include("is invalid")
    end

    it 'firstnameが全角ひらがなであれば登録できる' do
      user = build(:user, firstname: "ああ")     
      expect(user).to be_valid 
    end

    it 'firstnameが全角漢字であれば登録できる' do
      user = build(:user, firstname: "嗚呼")     
      expect(user).to be_valid 
    end

    it 'firstnameが全角カタカナであれば登録できる' do
      user = build(:user, firstname: "アア")     
      expect(user).to be_valid 
    end

    # 氏名のカナは全角カタカナのみ
    it 'firstname_kanaが全角カタカナであること（半角カナではない）' do
      user = build(:user, firstname_kana: "ｲｲ")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("is invalid")
    end

    it 'firstname_kanaが全角カタカナであること（ひらがなではない）' do
      user = build(:user, firstname_kana: "いい")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("is invalid")
    end

    it 'firstname_kanaが全角カタカナであること（全角英語ではない）' do
      user = build(:user, firstname_kana: "ｒｑ")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("is invalid")
    end

    it 'firstname_kanaが全角カタカナであること（半角英語ではない）' do
      user = build(:user, firstname_kana: "EE")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("is invalid")
    end

    it 'firstname_kanaが全角カタカナであること（数字ではない）' do
      user = build(:user, firstname_kana: "11")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("is invalid")
    end

    it 'firstname_kanaが全角カタカナであれば登録できる' do
      user = build(:user, firstname_kana: "イイ")     
      expect(user).to be_valid 
    end

    it 'lastname_kana,が全角カタカナであること（半角カナではない）' do
      user = build(:user, lastname_kana: "ｱｱ")
      user.valid?
      expect(user.errors[:lastname_kana,]).to include("is invalid")
    end

    it 'lastname_kana,が全角カタカナであること（ひらがなではない）' do
      user = build(:user, lastname_kana: "ああ")
      user.valid?
      expect(user.errors[:lastname_kana,]).to include("is invalid")
    end

    it 'lastname_kana,が全角カタカナであること（全角英語ではない）' do
      user = build(:user, lastname_kana: "ｒｑ")
      user.valid?
      expect(user.errors[:lastname_kana,]).to include("is invalid")
    end

    it 'lastname_kana,が全角カタカナであること（半角英語ではない）' do
      user = build(:user, lastname_kana: "aa")
      user.valid?
      expect(user.errors[:lastname_kana,]).to include("is invalid")
    end

    it 'lastname_kana,が全角カタカナであること（数字ではない）' do
      user = build(:user, lastname_kana: "22")
      user.valid?
      expect(user.errors[:lastname_kana,]).to include("is invalid")
    end


  end
end