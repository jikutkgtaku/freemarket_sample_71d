class CreditcardsController < ApplicationController
  require "payjp"

  def new
    @card = Creditcard.where(user_id: current_user.id)
    redirect_to creditcard_path(current_user.id) if @card.exists?
  end

  def create
    #credential.ymlに登録したpayjpのapiキーの取得
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    #falshメッセージを導入しているため、後ほど実装
    if params["payjp_token"].blank?
      redirect_to action: "new", alert: "クレジットカードを登録できませんでした。"
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"],
        metadate: {user_id: current_user.id}
      )
      @card = Creditcard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)

      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "create"
      end
    end
  end

  def show
  end

  # 商品購入確認ページをbuyアクションと定義して行う。

  def buy
  end
end
