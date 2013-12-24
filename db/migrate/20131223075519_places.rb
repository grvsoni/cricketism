class Places < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name, :limit => 50, :null => false
      t.string :fips104, :limit => 2, :null => false
      t.string :iso2, :limit => 2, :null => false
      t.string :iso3, :limit => 3, :null => false
      t.string :ison, :limit => 4, :null => false
      t.string :internet, :limit => 2, :null => false
      t.string :capital, :limit => 25
      t.string :map_reference, :limit => 50
      t.string :nationality_singular, :limit => 35
      t.string :nationaiity_plural, :limit => 35
      t.string :currency, :limit => 30
      t.string :currency_code, :limit => 3
      t.integer :population
      t.string :title, :limit => 50
      t.string :comment, :limit => 255
    end

    create_table :regions do |t|
       t.references :country, :null => false
       t.string :name, :limit => 45, :null => false
       t.string :code, :limit => 8, :null => false
       t.string :adm1code, :limit => 4, :null => false
     end

    create_table :cities do |t|
      t.references :country, :null => false
      t.references :region, :null => false
      t.integer :dma_id
      t.string :name, :limit => 45, :null => false
      t.float :latitude, :null => false
      t.float :longitude, :null => false
      t.string :timezone, :limit => 10, :null => false
      t.string :county, :limit => 25
      t.string :code, :limit => 4
    end
    add_index :cities, :name


    execute "LOAD DATA INFILE '#{Rails.root}/db/Countries.txt' INTO TABLE countries
      FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n';"

    execute "LOAD DATA INFILE '#{Rails.root}/db/Regions.txt' INTO TABLE regions
      FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n';"

    execute "LOAD DATA INFILE '#{Rails.root}/db/Cities.txt' INTO TABLE cities
      FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n';"

    change_table :countries do |t|
      t.timestamps
    end

    change_table :regions do |t|
      t.timestamps
    end

    change_table :cities do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :countries
    drop_table :regions
    drop_table :cities
  end
end
