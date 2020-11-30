class Admin::Base < ApplicationController
    
    private def current_administrator
        if session[:current_administrator_id]
            @current_administrator ||= Administrator.find_by(id: session[:current_administrator_id])
        end
    end

    def authorize
        unless current_administrator
            flash.notice = "管理者としてログインしてください"
            redirect_to :admin_login
        end
    end
helper_method :current_administrator
end