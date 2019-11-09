class PremiumController < ApplicationController
  before_action :authenticate_user!, except: 'info'

  def get_purchase
    render 'premium/purchase'
  end

  def post_purchase
    if current_user.premium_purchases.active.exists?
      purchase = current_user.premium_purchases.active.first
      @expries_at = purchase.expries_at + PremiumPurchase::PERIOD_DEFAULT.days
      purchase.update(expries_at: @expries_at)
    else
      @expries_at = Time.now + PremiumPurchase::PERIOD_DEFAULT.days
      current_user.premium_purchases.create(expries_at: @expries_at)
    end

    redirect_to '/premium/thankyou'
  end
end