# Brewery.create!([
#   {name: "Git Brew", email: "gitgud@gmail.com", profile_img: "http://www.taptrail.com/wp-content/uploads/2016/03/barrels.jpg", password_digest: nil},
#   {name: "Maltxample", email: "brewmail@gmail.com", profile_img: "https://images.pexels.com/photos/162463/factory-beer-production-brewery-162463.jpeg?cs=srgb&dl=alcohol-beer-brewery-162463.jpg&fm=jpg", password_digest: nil}

# ])

# Beer.create!([
#   {name: "Hammertime", style: "Pilsner", ibu: 20, srm: 5, description: "Can't age this!", glassware: "Pilsner glass", image: "http://whatcomwebsite-inflightstudio.netdna-ssl.com/wp-content/uploads/sites/10/2016/09/pilsner-1.jpg", brewery_id: 1, abv: "5.4"},
#   {name: "Lager Those!", style: "Bier de garde", ibu: 10, srm: 17, description: "Traditional French style ale", glassware: "Tulip", image: "https://www.kegworks.com/wp/wp-content/uploads/2017/05/Tulip-Glass.jpg", brewery_id: 2, abv: "7.6"},
#   {name: "Porthurdur", style: "Porter", ibu: 37, srm: 40, description: "I mAdE a PoRtEr GuYs!", glassware: "Nonice pint", image: "https://thebeerhop.com/wp-content/uploads/2017/02/beerkit_mr_malt_all_grain_robustporter.jpg", brewery_id: 1, abv: "6.2"}
# ])

# Event.create!([
#   {title: "Hammertime release", scheduled_date: nil, location: "Taproom", content: "Introducing our newest addition to the year-round line up!", image: "http://bbrew-stage.s3.amazonaws.com/2018/05/02/15/28/50/600/D.C._MASH_2015_Rare_Bottles_11.jpg", brewery_id: 1}
# ])

Format.create!([
  {name: "Growler", unit_type: "glass", single_unit_volume: "64.0", pack: 1, case: 1},
  {name: "Pint", unit_type: "glass", single_unit_volume: "16.9", pack: 1, case: 1},
  {name: "Crowler", unit_type: "glass", single_unit_volume: "32.0", pack: 1, case: 1},
  {name: "1/2 bbl", unit_type: "Keg", single_unit_volume: "1984.0", pack: 1, case: 1},
  {name: "1/4 bbl", unit_type: "Keg", single_unit_volume: "992.0", pack: 1, case: 1},
  {name: "1/6 bbl", unit_type: "Keg", single_unit_volume: "660.0", pack: 1, case: 1},
  {name: "Cans 4/12 case", unit_type: "Can", single_unit_volume: "12.0", pack: 6, case: 4},
  {name: "Cans 6/12 case", unit_type: "Can", single_unit_volume: "12.0", pack: 4, case: 6},
  {name: "Cans 4/16 case", unit_type: "Can", single_unit_volume: "16.0", pack: 6, case: 4},
  {name: "Cans 6/16 case", unit_type: "Can", single_unit_volume: "16.0", pack: 4, case: 6},
  {name: "Bottles 4/12 case", unit_type: "Bottle", single_unit_volume: "12.0", pack: 6, case: 4},
  {name: "Bottles 6/12 case", unit_type: "Bottle", single_unit_volume: "12.0", pack: 4, case: 6},
  {name: "Bottles 12/22 case", unit_type: "Bottle", single_unit_volume: "22.0", pack: 1, case: 22}
])

# BeerFormat.create!([
#   {beer_id: 1, format_id: 1},
#   {beer_id: 1, format_id: 2},
#   {beer_id: 2, format_id: 2},
#   {beer_id: 2, format_id: 1},
#   {beer_id: 3, format_id: 3}
# ])

# EventBeer.create!([
#   {event_id: 1, beer_id: 1},
#   {event_id: 1, beer_id: 3}
# ])
