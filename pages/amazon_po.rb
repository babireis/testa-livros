require_relative '../livro'

class AmazonPage
    include Capybara::DSL
    
    def acessa
        visit('https://www.amazon.com.br/')
    end

    def busca_livro(livro)
        self.acessa
        find('#twotabsearchtextbox').set livro.isbn
        find('input[type=submit]').click 
        within('#search') do
           links = all('a[href*="keywords"')
           links[0].click
        end

        within('#bylineInfo') do
            autor = all('a[href*="field-author"]')
            autor[0].text            
        end
    end

end