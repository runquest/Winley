# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Region.create(name: 'Mendoza Province', location: 'Argentina', description: 'The Mendoza Province is one of Argentinas most important wine regions, accounting for nearly two-thirds of the countrys entire wine production.')
  Winery.create(region_id: '1', name: 'Domaine St. Diego', description: 'Hidden off a country road next to an old ivy-covered church, chime the bell of this tiny garage winery whose owner and winemaker is considered one of the fathers of Mendocino terroir.')
    Bottle.create(winery_id: '1', name: 'MercadoLibre Argentina', grape: 'Malbec', vintage: '2000', label_image: 'http://mla-s2-p.mlstatic.com/vino-felipe-rutini-cosecha-1983-388001-MLA20260857539_032015-O.jpg', more_url: 'http://www.google.com', description: 'Malbec (pronounced: [mal.bɛk]) is a purple grape variety used in making red wine. The grapes tend to have an inky dark color and robust tannins, and are known as one of the six grapes allowed in the blend of red Bordeaux wine. The French plantations of Malbec are now found primarily in Cahors in South West France. It is increasingly celebrated as an Argentine varietal wine and is being grown around the world.')
    Bottle.create(winery_id: '1', name: 'Segunda Copa', grape: 'Cabernet', vintage: '1987', label_image: 'http://mla-s2-p.mlstatic.com/vino-felipe-rutini-cosecha-1983-388001-MLA20260857539_032015-O.jpg', more_url: 'http://www.google.com', description: 'Malbec (pronounced: [mal.bɛk]) is a purple grape variety used in making red wine. The grapes tend to have an inky dark color and robust tannins, and are known as one of the six grapes allowed in the blend of red Bordeaux wine. The French plantations of Malbec are now found primarily in Cahors in South West France. It is increasingly celebrated as an Argentine varietal wine and is being grown around the world.')
  Winery.create(region_id: '1', name: 'Kaiken', description: 'Just as Kaikenes (wild geese, indigenous to Patagonia) fly over Patagonia, criss-crossing the land between Chile and Argentina.')
      Bottle.create(winery_id: '2', name: 'Pircas Negras', grape: 'Mendoza', vintage: '2001', label_image: 'http://mla-s2-p.mlstatic.com/vino-felipe-rutini-cosecha-1983-388001-MLA20260857539_032015-O.jpg', more_url: 'http://www.google.com', description: 'Malbec (pronounced: [mal.bɛk]) is a purple grape variety used in making red wine. The grapes tend to have an inky dark color and robust tannins, and are known as one of the six grapes allowed in the blend of red Bordeaux wine. The French plantations of Malbec are now found primarily in Cahors in South West France. It is increasingly celebrated as an Argentine varietal wine and is being grown around the world.')

  Winery.create(region_id: '1', name: 'Mendel', description: 'Mendel Winery embodies the union of Roberto de la Mota - one of Argentina\'s most respected and experienced winemakers - with a nearly century-old Argentine family, whose sole objective is to produce wine of unquestionable, superior quality.')

Region.create(name: 'Salta Province', location: 'Argentina', description: 'The famous wines of the Valles Calchaquíes region near Cafayate are produced in numerous vineyards of diverse sizes (mainly Torrontés, Malbec and Cabernet Sauvignon).')

Region.create(name: 'Sonoma Valley', location: 'California', description: 'After leaving the Andes, the Maipo flows through the valley that bears its name. It is the best known wine-producing region in Chile.')
  Winery.create(region_id: '3', name: 'Paradise Ridge Winery', description: 'Paradise Ridge owners are such proponents of public art; they’ve created a sculpture garden on the property — Marijke’s Grove.')
  Winery.create(region_id: '3', name: 'Truett-Hurst Winery', description: 'Yes, there is an actual Dry Creek that runs through the same-named AVA. One of the best places to experience it is at this down-to-earth, essentially Sonoma County winery. ')
      Bottle.create(winery_id: '5', name: 'Casina Di Cornia', grape: 'Pinot Gris', vintage: '2001', label_image: 'http://mla-s2-p.mlstatic.com/vino-felipe-rutini-cosecha-1983-388001-MLA20260857539_032015-O.jpg', more_url: 'http://www.google.com', description: 'Malbec (pronounced: [mal.bɛk]) is a purple grape variety used in making red wine. The grapes tend to have an inky dark color and robust tannins, and are known as one of the six grapes allowed in the blend of red Bordeaux wine. The French plantations of Malbec are now found primarily in Cahors in South West France. It is increasingly celebrated as an Argentine varietal wine and is being grown around the world.')
      Bottle.create(winery_id: '5', name: 'Caboo', grape: 'Mendoza', vintage: '2001', label_image: 'http://mla-s2-p.mlstatic.com/vino-felipe-rutini-cosecha-1983-388001-MLA20260857539_032015-O.jpg', more_url: 'http://www.google.com', description: 'Malbec (pronounced: [mal.bɛk]) is a purple grape variety used in making red wine. The grapes tend to have an inky dark color and robust tannins, and are known as one of the six grapes allowed in the blend of red Bordeaux wine. The French plantations of Malbec are now found primarily in Cahors in South West France. It is increasingly celebrated as an Argentine varietal wine and is being grown around the world.')



Region.create(name: 'Ramona', location: 'California', description: 'Notable among current agricultural pursuits in Ramona is rapidly growing wine grape production. The 89,000-acre (360 km2) Ramona Valley American Viticultural Area surrounds the town.')
  Winery.create(region_id: '4', name: 'Milagro Farm Vineyards', description: 'he first wells were drilled on site and, most importantly, the first vineyards were planted. 500 vines each of Cabernet Sauvignon and Chardonnay grapes went in the ground to eventually make wine for personal consumption.')


Region.create(name: 'San Luis Obispo County', location: 'California', description: 'The mainstays of the economy are California Polytechnic State University with its almost 20,000 students, tourism, and agriculture. San Luis Obispo County is the third largest producer of wine in California, surpassed only by Sonoma and Napa Counties.')

Region.create(name: 'Burgundy', location: 'France', description: 'Burgundy is one of France\'s main wine producing areas. It is well known for both its red and white wines, mostly made from Pinot noir and Chardonnay grapes, respectively, although other grape varieties can be found, including Gamay, Aligote, Pinot blanc, and Sauvignon blanc.')

User.create(email: "test@wine.com", fname: "Test", lname: "Wine", password: "testwine", password_confirmation: "testwine", avatar_url: "https://cdn1.iconfinder.com/data/icons/ninja-things-1/1772/ninja-simple-512.png", description: "Wine tasting enthusiast.")
User.create(email: "aiste@aiste.ca", fname: "Aiste", lname: "Ulo", password: "aktyvai", password_confirmation: "aktyvai", avatar_url: "https://cdn3.iconfinder.com/data/icons/users-6/100/654854-user-women-512.png", description: "TBD")

Event.create(title: 'Wedding Shower', venue: 'Hotel', date: 'Fri, Nov 26, 11', duration: 60, user_id: 1, description: 'Great event')
Event.create(title: 'New wines presentation', venue: 'New country', date: 'Sat, Mar 26, 16', duration: 60, user_id: 1, description: 'You cannot miss')
Event.create(title: 'Aiste\'s birthday', venue: 'Hotel', date: 'Sun, May 26, 16', duration: 60, user_id: 1, description: 'You have to be here')
Event.create(title: 'Solice', venue: 'Far far land', date: 'Mon, Aug 26, 12', duration: 90, user_id: 2, description: 'Lots of delicious wine')
Event.create(title: 'Christmas sales', venue: 'Some winery', date: 'Tue, Jul 26, 11', duration: 120, user_id: 2, description: 'Taste it yourself')