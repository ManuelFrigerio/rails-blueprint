module Admin
  class UsersController < BaseController

    before_action :get_user, only: [:show]

    def index
      @users = User.order(created_at: :desc)
    end

    def show
    end

    def become
      sign_in(:user, User.find(params[:id]), { :bypass => true })
      redirect_to root_path
    end

    private

    def get_user
      @user = User.find_by(id: params[:id])
      redirect_to users_admin_index_path unless @user
    end

  end
end