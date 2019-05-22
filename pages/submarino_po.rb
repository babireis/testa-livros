require_relative '../livro'

class SubmarinoPage
    include Capybara::DSL
    
    def acessa
        visit 'https://www.submarino.com.br/'
    end

    def encontra_livro(livro)
        acessa
        click_link 'Livros'
        livros = all(:css, 'img[alt^=Livro]')
        livros[0].click          
        livro.titulo = find('#product-name-default').text
        livro.autor = find('a[class^=author-name] span[class^=text]').text
        ficha = find('div[id=info-section] table tbody tr', text: 'ISBN-10')
        livro.isbn = ficha.all('td')[1].text    
    end

end