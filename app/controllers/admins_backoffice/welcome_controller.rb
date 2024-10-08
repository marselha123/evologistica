class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @producaos = Producao.all.page(params[:page]).per(12)
  end

  def show
    @producao = Producao.find(params[:id])
  end  

  def new
    @producao = Producao.new
  end
  
  def create
    @producao = Producao.new(params_producao)
    if @producao.save
      redirect_to admins_backoffice_producoes_path, notice: "Produção cadastrada com sucesso!"
    else
      render :new
    end  
  end  

  def update
    @producao = Producao.update(params_producao)
    if @producao.save
      redirect_to admins_backoffice_producoes_path, notice: "Produção atualizada com sucesso!"
    else
      render :edit
    end  
  end

  def destroy
    @producao = Producao.destroy
    if @producao.save
      redirect_to admins_backoffice_producoes_path, notice: "Produção excluída com sucesso!"
    else
      render :index
    end  
  end


end