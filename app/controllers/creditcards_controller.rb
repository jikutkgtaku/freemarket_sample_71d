class CreditcardsController < ApplicationController
  require "payjp"
  before_action :set_card
  before_action :set_item, only: [:buy, :pay]


  def show
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
    @images = @item.images.all
    
    @address = Address.find(current_user.id)
    if @item.seller == User.find(current_user.id)
      redirect_to item_path(@item.id), alert: "あなたが出品した商品です"
    else
      if @item.buyer.present?
        redirect_to item_path(@item.id), alert: "売り切れています"
      else
        if user_signed_in?
          @user = current_user

          if @user.creditcard.present?
            Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
            @card = Creditcard.find_by(user_id: current_user.id)
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
          else
          end
        else
          redirect_to user_session_path, alert: "ログインしてください"
        end
      end
    end
  end

  def pay
    @images = @item.images.all

    if @item.buyer.present?
      redirect_to item_path(@item.id), alert: "売り切れています"
    else
      @item.with_lock do
        if current_user.creditcard.present?
          @card = Creditcard.find_by(user_id: current_user.id)
          Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
          charge = Payjp::Charge.create(
            amount: @item.price,
            customer: Payjp::Customer.retrieve(@card.customer_id),
            currency: 'jpy'
          )
        else
          Payjp::Charge.create(
            amount: @item.price,
            card: params['payjp-token'],
            currency: 'jpy'
          )
        end
        @purchase = @item.update(buyer_id: current_user.id)
      end
    end
  end

  private
  def set_card
    @card = Creditcard.find_by(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
