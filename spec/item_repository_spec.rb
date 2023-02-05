require 'item_repository'

RSpec.describe ItemRepository do

  def reset_items_table
    seed_sql = File.read('spec/seeds_items.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager_test' })
    connection.exec(seed_sql)
  end
  
  describe ItemRepository do
    before(:each) do 
      reset_items_table
    end
  
    it 'returns all items' do
      
      repo = ItemRepository.new
      items = repo.all

      expect(items.length).to eq(2)

      expect(items[0].id).to eq('1')
      expect(items[0].name).to eq('Shirt')
      expect(items[0].price).to eq('15')
      expect(items[0].qty).to eq('50')

      expect(items[1].id).to eq('2')
      expect(items[1].name).to eq('Sweat')
      expect(items[1].price).to eq('30')
      expect(items[1].qty).to eq('100')
    end  
  end
end