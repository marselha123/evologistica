class CreateLocalizacaos < ActiveRecord::Migration[5.2]
  def change
    create_table :localizacaos do |t|
      t.string :linha, limit: 20 
      t.string :armazem, limit: 3
      t.string :rua, limit: 3
      t.string :predio, limit: 3
      t.string :andar, limit: 3
      t.string :slot, limit: 3
      t.string :endereco, limit: 20
      t.string :classificacao, limit: 20
      t.string :acesso, limit: 20
      t.string :volume, limit: 30

      t.timestamps
    end
  end
end
