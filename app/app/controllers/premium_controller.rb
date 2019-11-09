class PremiumController < ApplicationController
  before_action :authenticate_user!,
                :check_premium,
                except: 'info'

  def get_purchase
    render 'premium/purchase'
  end

  def post_purchase
    @expries_at = Time.now + PremiumPurchase::PERIOD_DEFAULT.days
    current_user.premium_purchases.create(expries_at: @expries_at)
    redirect_to '/premium/thankyou'
  end

private

  def check_premium
    if current_user&.is_premium?
      redirect_back fallback_location: home_path
    end
  end
end