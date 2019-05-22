require_relative '../pages/submarino_po'
require_relative '../pages/cultura_po'
require_relative '../pages/amazon_po'

describe 'Testa-Livros', :testa_livros do

    before(:each) do
        @submarino = SubmarinoPage.new
        @cultura = CulturaPage.new
        @amazon = AmazonPage.new
        @livro = Livro.new
        @submarino.encontra_livro(@livro)
    end

    it 'Busca livro na Livraria Cultura', :cultura do        
        expect(@cultura.busca_livro(@livro)).to include @livro.autor 
    end

    it 'Busca livro na Amazon', :amazon do        
        expect(@amazon.busca_livro(@livro)).to include @livro.autor     
    end
end