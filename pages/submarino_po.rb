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
        autor = livro.autor.gsub(/[^A-Za-z0-9 ]/, '').tr('.','')
        livro.autor = autor  
        ficha = all('div[id=info-section] table tbody tr', text: 'ISBN')
        livro.isbn = ficha[0].all('td')[1].text    
        nome = livro.titulo.gsub(/[^A-Za-z0-9 ]/, '').tr(' ','_')
        page.save_screenshot('log/'+ nome +'.png') 
    
    end


end