class AdminsBackoffice::ProducaoItemsController < AdminsBackofficeController
  def index
    @producao_items = Produtocao_item.alll.order(:opi_item).page(params[:page])
  end  
end
