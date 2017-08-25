class ReportsController < ApplicationController
  before_action :authenticate_admin!

  def queries
    @users = User.all
    respond_to do |format|
      format.xlsx { response.headers['Content-Disposition'] = 'attachment; filename="consultas_de_creditos.xlsx"' }
    end
  end
end
