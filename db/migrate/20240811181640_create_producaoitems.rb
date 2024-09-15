class CreateProducaoitems < ActiveRecord::Migration[5.2]
  def change
    create_table :producaoitems do |t|
      t.integer :opr_codigo
      t.integer :opr_subcodigo
      t.integer :opi_item
      t.string :pro_codigo
      t.string :opi_referencia
      t.string :opi_descricao
      t.integer :opi_quantidade
      t.integer :opi_qtdeseparado
      t.references :producao, foreign_key: true

      t.timestamps
    end
  end
end
