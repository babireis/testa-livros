require_relative '../livro'

class CulturaPage
    include Capybara::DSL
    
    def acessa
        visit('https://www.livrariacultura.com.br/')
    end

    def busca_livro(livro)
        acessa
        find('input[id=Ntt-responsive]').set livro.isbn
        find('#search-box-submit').click 
        a = find('#results div[class*=author-title-ev]').text 
        autor = a.gsub(/[^A-Za-z0-9 ]/, '').tr('.','')
       
    end

end