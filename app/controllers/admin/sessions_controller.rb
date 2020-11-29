class Admin::SessionsController < Admin::Base
    def new
        @form = Admin::LoginForm.new
    end

    def create
        @form = Admin::LoginForm.new(admin_params)
        if @form.email.present?
            admin = Administrator.find_by("LOWER(email) = ?" , @form.email)
            session[:current_administrator_id] = admin.id
            logger.debug "#{session[:current_administrator_id].inspect}"
            flash.notice = "ログインしました"
            redirect_to :admin_root
        end
    end

    def destroy
        session.delete(:current_administrator_id)
        flash.notice = "ログアウトしました"
        redirect_to :admin_root
    end

    private

    def admin_params
        params.require(:admin_login_form).permit(:email, :password)
    end
end