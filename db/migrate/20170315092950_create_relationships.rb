class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :follower, index: true #references他のテーブルへの外部キーを表すカラムを生成
      t.references :followed, index: true #複合インデックス？

      t.timestamps null: false
      
      t.index [:follower_id, :followed_id], unique: true #ユニーク制約テーブルの項目が重複してはいけない
    end
  end
end
