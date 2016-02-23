class RankingController < ApplicationController
    # Login first
    before_action :logged_in_user
    
    def have
        @item_ids = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id').keys
        @type = "haves"
        @items = Item.find(@item_ids).sort_by{|o| @item_ids.index(o.id)}
        @number = 0
        @rankingTilte = "Have ランキング"
    end
    
    def want
        # こちらも上記のように
        @item_ids = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id').keys
        @type = "wants"
        @items = Item.find(@item_ids).sort_by{|o| @item_ids.index(o.id)}
        @number = 0
         @rankingTilte = "Want ランキング"
    end
  
  
end
