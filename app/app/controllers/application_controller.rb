class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end

  # rescue_from Exception, :with => :render_404

private

  def render_404(e)
    logger.debug e
    render :template => 'error_pages/404', :layout => false, :status => :not_found
  end

end
