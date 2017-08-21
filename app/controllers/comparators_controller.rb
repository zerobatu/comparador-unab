class ComparatorsController < ApplicationController
  def compare
    @user = User.new(compare_params)
    @user.build_query
    if @user.save
      @bancos = Banco.compare(@user.query)
    else
      render "home/index"
    end
  end

  private
    def compare_params
      params.require(:user).permit(
        :email,
        :name,
        :rut,
        :birthday,
        query_attibutes: [
          :instalment,
          :amount
        ]
      )
    end

end
