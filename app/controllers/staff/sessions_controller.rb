class Staff::SessionsController < Staff::Base

    def new
        if current_staff_member
            redirect_to :staff_root
        else
            @form = Staff::LoginForm.new(params[:staff_login_form])
            render :new
        end
    end

    def create
        @form = Staff::LoginForm.new(login_params)
        if @form.email.present?
            staff_member = StaffMember.find_by("LOWER(email) = ?",  @form.email)
        end
        if Staff::Authenticator.new(staff_member).authenticate(@form.password)
                session[:staff_member_id] = staff_member.id
                session[:last_access_time]  = Time.current 
                logger.debug "iiiiiiiiii#{session[:staff_member_id].inspect}"
                logger.debug "iiiiiiiiii#{session[:staff_access_time].inspect}"
                flash.notice = "ログインしました"
                redirect_to :staff_root
        else
            flash.now.alert = "メールアドレスまたはパスワードが正しくないです"
            render :new
        end
    end

    def destroy
        session.delete(:staff_member_id)
        flash.alert = "ログアウトしました"
        redirect_to :staff_root
    end
    private def login_params
        params.require(:staff_login_form).permit(:email, :password)
    end

end
