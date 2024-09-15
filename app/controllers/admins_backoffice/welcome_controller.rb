class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @producaos = Producao.all.page(params[:page]).per(12)
  end

  def show
    @producao = Producao.find(params[:id])
  end  
end