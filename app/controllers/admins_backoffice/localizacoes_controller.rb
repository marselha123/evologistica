class AdminsBackoffice::LocalizacoesController < AdminsBackofficeController
  def index
    @localizacoes = Localizacao.all.page(params[:page]).per(20)
  end

  def show
    @localizacao = Localizacao.find(params[:id])
  end  

  def new
    @localizacao = Localizacao.new
  end
  
  def create
    @localizacao = Localizacao.new(params_localizacao)
    if @localizacao.save
      redirect_to admins_backoffice_localizacoes_path, notice: "Localização cadastrada com sucesso!"
    else
      render :new
    end  
  end  

  def update
    @localizacao = Localizacao.update(params_localizacao)
    if @localizacao.save
      redirect_to admins_backoffice_localizacoes_path, notice: "Localização atualizada com sucesso!"
    else
      render :edit
    end  
  end

  def destroy
    @localizacao = Localizacao.destroy
    if @localizacao.save
      redirect_to admins_backoffice_localizacoes_path, notice: "Localização excluída com sucesso!"
    else
      render :index
    end  
  end

end
