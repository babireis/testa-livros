require_relative '../pages/submarino_po'
require_relative '../pages/cultura_po'
require_relative '../pages/amazon_po'

describe 'Testa-Livros' do

    describe 'Busca de Livros' do
        context 'Quando encontro um Livro na Submarino' do
            before(:all) do
                @submarino = SubmarinoPage.new
                @cultura = CulturaPage.new
                @amazon = AmazonPage.new
                @livro = Livro.new
                @submarino.encontra_livro(@livro)
            end

            it 'então procuro na Livraria Cultura pelo ISBN do livro', :cultura do        
                expect(@cultura.busca_livro(@livro)).to include @livro.autor 
            end

            it 'então procuro o livro na Amazon através do ISBN', :amazon do        
                expect(@amazon.busca_livro(@livro)).to include @livro.autor     
            end
        end
    end 
end