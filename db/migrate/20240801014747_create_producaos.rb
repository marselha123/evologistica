class CreateProducaos < ActiveRecord::Migration[5.2]
  def change
    create_table :producaos do |t|
      t.integer :opr_codigo
      t.integer :opr_subcodigo
      t.integer :prp_codigo
      t.string :opr_situacao
      t.string :opr_descricao
      t.string :opr_numeroserie
      t.string :opr_numeropedidocliente
      t.string :opr_tipofrete
      t.string :opr_estado
      t.string :opr_cidade
      t.date :opr_liberadoem

      t.timestamps
    end
  end
end
