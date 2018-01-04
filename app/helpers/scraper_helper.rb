module ScraperHelper
  def self.parse_json_data(data)
    data = JSON.parse(data).map do |hero|
      self.parse_hero_json_data hero
    end
    JSON.pretty_generate(data)
  end

  def self.parse_hero_json_data(hero)
    @data = {}
    @keys = {
        'heroics' => 'heroicAbilities',
        'abilities' => 'abilities'
    }

    @data['trait'] = @values = {
        'name' => '',
        'description' => '',
        'slug' => '',
        'image' => ''
    }

    @stats = {
        'damage' => hero['stats']['damage'] ||= 0,
        'utility' => hero['stats']['utility'] ||= 0,
        'survivability' => hero['stats']['survivability'] ||= 0,
        'complexity' => hero['stats']['complexity'] ||= 0
    }

    @keys.each_key  do |key|
      needle = @keys[key]
      if !hero[needle].nil?
        @data[key] = hero[needle].map do |item|

          #pre = Config.get('hero_image_pre').include?(hero['slug']) ? Config.get('hero_image_pre')[hero['slug']] : ''
          #ability_image = ImageHelper.pull_image(hero['slug'], Config.image_urls['trait'] % [hero['slug'], "#{pre}#{item['slug']}"])

          {
              'name' => item['name'],
              'description' => item['description'],
              'slug' => item['slug'],
              'image' => ''#ability_image
          }
        end
      else
        @data[key] = @values
      end
    end

    if !hero['trait'].nil?

      # pre = Config.get('hero_image_pre').include?(hero['slug']) ? Config.get('hero_image_pre')[hero['slug']] : ''
      # trait_image = ImageHelper.pull_image(hero['slug'], Config.image_urls['trait'] % [hero['slug'], "#{pre}#{hero['trait']['slug']}"])

      @data['trait'] = {
          'name' => hero['trait']['name'],
          'description' => hero['trait']['name'],
          'slug' => hero['trait']['slug'],
          'image' => ''#trait_image
      }
    end

    {
        'name' => hero['name'],
        'slug' => hero['slug'],
        'title' => hero['title'],
        'description' => hero['baseHeroInfo']['role']['description'] ||= hero['role']['description'],
        'role' => {
            'name' => hero['baseHeroInfo']['role']['name'] ||= hero['role']['name'],
            'slug' => hero['baseHeroInfo']['role']['slug'] ||= hero['role']['slug'],
            'description' => hero['baseHeroInfo']['role']['description'] ||= hero['role']['description'],
        },
        'type_of_hero' => hero['baseHeroInfo']['type']['name'] ||= hero['type']['name'],
        'franchise' => hero['franchise'],
        'difficulty' => hero['difficulty'],
        'live' => hero['revealed'],
        'poster_image' => '',#ImageHelper.pull_image(hero['slug'], Config.image_urls['bust'] % hero['slug']),
        'stats' => @stats,
        'trait' => @data['trait'],
        'abilities' => @data['abilities'],
        'heroics' => @data['heroics'],
        #'original' => hero
    }
  end
end
