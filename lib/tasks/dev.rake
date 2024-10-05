namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
    task setup: :environment do
      if Rails.env.development?
        show_spinner("Apagando BD...") { %x(rails db:drop) }
        show_spinner("Criando BD...") { %x(rails db:create) }
        show_spinner("Migrando BD...") { %x(rails db:migrate) }
      end  
        show_spinner("Criando o Administrador padrão...") { %x(rails dev:add_default_admin) }
        show_spinner("Adicionando ordem de producao...") { %x(rails dev:add_producoes) }
        show_spinner("Adicionando itens da ordem de producao...") { %x(rails dev:add_producao_items) }
        
#      else
#        puts "Você não está em ambiente de desenvolvimento!"
#      end
    end

  desc "Adiciona o administrador padrão"
    task add_default_admin: :environment do
      Admin.create!(
        email: 'admin@admin.com',
        password: 123456,
        password_confirmation: 123456
      )
    end
     

   # nova task
   desc "Adiciona outros administradores extras"
   task add_producoes: :environment do
     50.times do |i|
       Producao.create!(
         opr_codigo: Faker::Number.number(digits: 6),
         opr_subcodigo: 1,
         prp_codigo: Faker::Number.number(digits: 6),
         opr_situacao: 'EP',
         opr_descricao: Faker::Name.name,
         opr_numeroserie: '1234567890098',
         opr_tipofrete: 'CIF',
         opr_estado: Faker::Address.state_abbr,
         opr_cidade: Faker::Address.city,
         opr_liberadoem: Date.today
       )
     end
    end

     desc "Adicionando itens da ordem de producao"
     task add_producao_items: :environment do
       Producao.all.each do |producao|
         rand(5..10).times do |i|
           Producaoitem.create!(
            producao: producao,
            opr_codigo: producao.opr_codigo,
            opr_subcodigo: 1,
            opi_item: i,
            opi_descricao: Faker::Commerce.product_name,
            opi_referencia: Faker::Commerce.promotion_code(digits: 2),
            opi_quantidade: i
           )
         end     
       end  
      end
      
    private
      
    def show_spinner(msg_start, msg_end = "Concluído!")
        spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
        spinner.auto_spin
        yield
        spinner.success("(#{msg_end})")    
     end
   
end
