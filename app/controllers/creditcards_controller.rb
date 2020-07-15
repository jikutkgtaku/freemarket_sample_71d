class CreditcardsController < ApplicationController
  require "payjp"


  def show
    @card = Creditcard.find_by(user_id: current_user.id)
    
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer_card = customer.cards.retrieve(@card.payjp_id)

      @card_brand = @customer_card.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.png"
      when "JCB"
        @card_src = "jcb.png"
      when "MasterCard"
        @card_src = "master.png"
      when "American Express"
        @card_src = "amex.png"
      when "Diners Club"
        @card_src = "diners.png"
      when "Discover"
        @card_src = "discover.png"
      end

      @exp_month = @customer_card.exp_month.to_s
      @exp_year = @customer_card.exp_year.to_s.slice(2,3)
    end
  end


  def new
    @card = Creditcard.where(user_id: current_user.id)
    redirect_to creditcard_path(current_user.id) if @card.exists?
  end

  def create
    #credential.ymlに登録したpayjpのapiキーの取得
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    #falshメッセージを導入しているため、後ほど実装
    if params['payjp_token'].blank?
      redirect_to action: "new", alert: "クレジットカードを登録できませんでした。"
    else
      customer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp_token'],
      metadata: {user_id: current_user.id}
      )
      @card = Creditcard.new(user_id: current_user.id, customer_id: customer.id, payjp_id: customer.default_card)

      if @card.save
      else
        redirect_to action: "create"
      end
    end
  end

  def destroy
    @card = Creditcard.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)

      customer.delete
      @card.delete
      if @card.destroy
        redirect_to action: "new"
      else
        redirect_to creditcard_path(current_user.id), alert: "削除できませんでした。"
      end
    end

  end

  # 商品購入確認ページをbuyアクションと定義して行う。

  def buy
  end
end
