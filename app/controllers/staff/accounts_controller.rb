class Staff::AccountsController < Staff::Base
    before_action :set_staff

    def show
        @staff_member = @current_staff_member
    end

    def edit
        @staff_member = @current_staff_member
    end

    def update
        @staff_member = @current_staff_member
        if @staffmember.update(staff_params)
            flash.now.notice = "情報を更新しました"
            redirect_to :staff_account
        elseß
            render :edit
        end
    end

        private 

        def set_staff
            if current_staff_member
              @staff_member = @current_staff_member
            end
        end

        def staff_params
            params.require(:staff_member).permit(:email, :family_name, :given_name)
        end
end
