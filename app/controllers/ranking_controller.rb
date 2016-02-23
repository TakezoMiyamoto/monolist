class RankingController < ApplicationController
    
    def have
        @item_ids = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id').keys
        @type = "haves"
        @items = Item.find(@item_ids).sort_by{|o| @item_ids.index(o.id)}
        @number = 0
    end
    
    def want
        # こちらも上記のように
        @item_ids = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id').keys
        @type = "wants"
        @items = Item.find(@item_ids).sort_by{|o| @item_ids.index(o.id)}
        @number = 0
    end
  
  
end
