class ApplicationController < ActionController::Base
    # ニックネームを保存できるようにするための処理
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image, :grade, :faculty])
  end
  
 
end
