require_relative '../livro'

class AmazonPage
    include Capybara::DSL
    
    def acessa
        visit('https://www.amazon.com.br/')
    end

    def busca_livro(livro)
        self.acessa
        find('input[id=Ntt-responsive]').set livro.isbn
        find('#search-box-submit').click 
        find('#results div[class*=author-title-ev]').text        
    end

end