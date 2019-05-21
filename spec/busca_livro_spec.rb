describe 'Testa-Livros' do

    it 'Busca livros' do
        visit 'https://www.submarino.com.br/'
        click_link 'Livros'

        find('img[alt^=Livro]').click
      

        sleep 2
    end

end