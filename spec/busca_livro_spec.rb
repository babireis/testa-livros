require_relative '../livro'

describe 'Testa-Livros' do

    before(:each) do
        @livro = Livro.new
    end

    it 'Busca livros' do
        visit 'https://www.submarino.com.br/'
        click_link 'Livros'
      
        livros = all(:css, 'img[alt^=Livro]')
        livros[0].click  

       @livro.titulo = find('#product-name-default').text
       puts @livro.titulo

       @livro.autor = find('a[class^=author-name] span[class^=text]').text
       puts @livro.autor

       ficha = find('div[id=info-section] table tbody tr', text: 'ISBN-10')
       @livro.isbn = ficha.all('td')[1].text
       puts isbn
    end

    after(:each) do
        Capybara.current_session.driver.quit  
    end

end