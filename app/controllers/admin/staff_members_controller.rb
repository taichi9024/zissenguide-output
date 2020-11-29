class Admin::StaffMembersController < Admin::Base
    def index
        @staffmembers = StaffMember.order(:family_name_kana, :given_name_kana)
    end

    def show
        @staffmember = StaffMember.find_by(id: params[:id])
    end

    def new
        @staffmember = StaffMember.new
    end

    def create
        @staffmember = StaffMember.new(staff_params)
        if @staffmember.save
            flash.alert = ("#{@staffmember.family_name}を登録しました")
            redirect_to :admin_staff_members
        else
            render :new
        end
    end

    def edit
        @staffmember = StaffMember.find_by(id: params[:id])
    end

    def update
        @staffmember = StaffMember.find_by(id: params[:id])
        if @staffmember.update(staff_params)
            flash.notice = "#{@staffmember.family_name}の内容しました"
            redirect_to :admin_staff_members
        else
            render :edit
        end
    end

    def destroy
        @staffmember = StaffMember.find_by(id: params[:id])
        @staffmember.destroy
        redirect_to :admin_staff_members
    end

    def staff_params
        params.require(:staff_member).permit(:email,:family_name, :given_name, :family_name_kana, :given_name_kana, :password, :start_date , :end_date)
    end


end

