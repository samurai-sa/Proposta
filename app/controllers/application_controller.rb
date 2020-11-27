class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search
    
    def set_search
        @search = Post.ransack(params[:q])
        @search.sorts = 'updated_at desc' if @search.sorts.empty?
        @search_posts = @search.result.page(params[:page]).per(10)
    end
    
    def after_sign_in_path_for(resource)
        posts_path
    end
  
    def after_update_path_for(resource)
        posts_path
    end
    
    protected

    def configure_permitted_parameters
        added_attrs = [ :email, :username, :password, :password_confirmation, :usertype, :userimage ]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
end
