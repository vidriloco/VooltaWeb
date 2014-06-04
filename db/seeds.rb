#encoding: utf-8
factory = RGeo::Geographic.spherical_factory(:srid => 4326)

# Japanese food category image
Image.create(
  :image_type => "icon",
  :url => "https://s3.amazonaws.com/hiroo/japanese-food-category%402x.png",
  :name => "Japanese food category image"
)  

# Food icon
Image.create(
  :image_type => "icon",
  :url => "https://s3.amazonaws.com/hiroo/food-icon%402x.png",
  :name => "Food Icon"
)

# Museum icon
Image.create(
  :image_type => "icon",
  :url => "https://s3.amazonaws.com/hiroo/museum-icon%402x.png",
  :name => "Museum Icon"
)

# Chomp chomp
Image.create(
  :image_type => "photo",
  :url => "https://farm6.staticflickr.com/5476/14349979093_b7c00135d0_c.jpg",
  :name => "Chomp chomp (POI)"
)

# Jardin del arte
Image.create(
  :image_type => "photo",
  :url => "https://farm6.staticflickr.com/5111/14326475471_df30f0a257_b.jpg",
  :name => "Jardin del Arte (POI)"
)

# Paseo dominical main pic
@dom=Image.create(
  :image_type => "photo",
  :url => "https://farm4.staticflickr.com/3168/3105727421_110fb70897_o.jpg",
  :name => "Paseo dominical"
)

# Coyoacán main pic
@co = Image.create(
  :image_type => "photo",
  :url => "https://farm6.staticflickr.com/5575/14143225309_c989c90559_b.jpg",
  :name => "Coyoacán"
)

# Santa María la Ribera main pic
@sm = Image.create(
  :image_type => "photo",
  :url => "https://farm3.staticflickr.com/2930/14329894295_6c2d54731a_c.jpg",
  :name => "Santa María"
)

@user = User.create(
  :username => "vidriloco", 
  :email => "vidriloco@gmail.com", 
  :password => "123456789", 
  :password_confirmation => "123456789", 
  :full_name => "Alejandro Cruz")
  
@dom_bg = Image.create(
  :image_type => "background",
  :url => "https://farm6.staticflickr.com/5038/14306850576_abaa2dd0c2_o.jpg",
  :name => "Blue and gray BG"
)  

@sm_bg = Image.create(
  :image_type => "background",
  :url => "https://farm6.staticflickr.com/5554/14306851226_ed3364cdb4_o.jpg",
  :name => "Yellow and soft gray BG"
)

@paseo_resource = TripResource.create(identifier: 'paseo_dominical')
@coyo_resource = TripResource.create(identifier: 'coyo')

Trip.create(
  :title => "Coyoacán",
  :details => "En esta ruta te llevamos a conocer el pintoresco barrio de Coyoacán, el lugar que Frida Kahlo llamaba hogar",
  :lang => "es",
  :distance => "6 km",
  :complexity => "Media",
  :available => true,
  :background_image_id => @sm_bg.id,
  :main_image_id => @co.id,
  :user_id => @user.id,
  :origin_coordinate => factory.parse_wkt('POINT(-99.166489 19.427401)'),
  :end_coordinate => factory.parse_wkt('POINT(-99.1686179395347 19.4266576391348)'),
  :trip_resource_id => @coyo_resource.id)
  
Trip.create(
  :title => "Paseo Dominical",
  :details => "Cada domingo, Reforma abre paso a ciclistas y peatones que realizan actividades deportivas y que cambian la ciudad",
  :lang => "es",
  :distance => "4 km",
  :complexity => "Fácil",
  :available => true,
  :background_image_id => @dom_bg.id,
  :main_image_id => @dom.id,
  :user_id => @user.id,
  :origin_coordinate => factory.parse_wkt('POINT(-99.166489 19.427401)'),
  :end_coordinate => factory.parse_wkt('POINT(-99.1686179395347 19.4266576391348)'),
  :trip_resource_id => @paseo_resource.id)
  
Trip.create(
  :title => "Paseo Dominical",
  :lang => "en",
  :details => "Every sunday, there is an sporting activity on Reforma street, come, get a bicycle and cycle with",
  :distance => "5 mi",
  :complexity => "Easy",
  :available => true,
  :background_image_id => @dom_bg.id,
  :main_image_id => @dom.id,
  :user_id => @user.id,
  :origin_coordinate => factory.parse_wkt('POINT(-99.166489 19.427401)'),
  :end_coordinate => factory.parse_wkt('POINT(-99.1686179395347 19.4266576391348)'),
  :trip_resource_id => @paseo_resource.id)