# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Seed file to populate the database with dummy data

require "faker"

# Destroy existing records to start fresh
OrderProduct.destroy_all
Order.destroy_all
CartProduct.destroy_all
Product.destroy_all
Cart.destroy_all
User.destroy_all



# Create users
10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
    billing_address: Faker::Address.full_address,
    delivery_address: Faker::Address.full_address,
    password: '123456', #TOUJOURS UTILISER DEVISE POUR LA MIGRATION USER, SINON TROP DE BUG
    password_confirmation: '123456',
    isadmin: Faker::Boolean.boolean # Add admin status
  )
end

# Create orders
10.times do
  order = Order.create!(
    status: Faker::Lorem.word,
    startedate: Faker::Date.backward(days: 30),
    total_price: Faker::Number.decimal(l_digits: 2),
    user: User.all.sample
  )
end

# Create fake carts
users_ids = User.pluck(:id)  # Get all user IDs
users_ids.each do |user_id|
  # Check if the user already has a cart
  next if Cart.exists?(user_id: user_id)

  Cart.create!(
    total_price: rand(1.0..1000.0), 
    user_id: user_id,  # Assign the user ID directly
    startedate: Time.now - rand(1..30).days,
    created_at: Time.now - rand(1..30).days,
    updated_at: Time.now - rand(1..30).days
  )
end


# Create Charcuterie products

lonza = Product.create!(
  title: "lonza",
  category: "Charcuterie",
  subtitle: "Le capocollo, également connu sous le nom de lonza, est une viande de salaison raffinée au goût prononcé, bien connue au niveau national.",
  description: "Cette longe de porc est produite avec la viande la plus noble du porc, c'est-à-dire les faisceaux musculaires du cou, comme on peut également le déduire du nom de capocollo, qui adhèrent aux vertèbres cervicales et sont farcis de boyau naturel. La viande n'est pas hachée, c'est donc un saucisson de consistance compacte, avec une alternance de gras et de maigre, ce qui le rend tendre à la coupe et au goût.
  C'est un produit qui a de la personnalité, sa saveur est délicate mais forte grâce au long processus de massage qu'il subit pour être salé et assaisonné uniformément. L'assaisonnement dure 90 jours et est entièrement naturel.",
  price: 20
  )
  lonza.photo.attach( io: File.open(Rails.root.join('app/assets/images/products/lonza_01.png')),
    filename: 'lonza_01.png')

coppa = Product.create!(
  title: "Coppa",
  category: "Charcuterie",
  subtitle: "La coppa est une charcuterie traditionnelle de la région de Parme. C'est la meilleure partie de l'échine de porcs de plus d'un an et de plus de 180 kg qui est utilisée.",
  description: "La Coppa est un fleuron de la charcuterie Italienne.
  Un vieillissement d’au moins 3 mois, en partie en compagnie de baies de genièvre, confère à la coppa de la Vallée d’Aoste un goût incomparable de douceur et de délicatesse. Excellent pour enrichir les charcuteries ou pour garnir de savoureux sandwichs !",
  price: 20
  )
  coppa.photo.attach( io: File.open(Rails.root.join('app/assets/images/products/coppa_01.png')),
    filename: 'coppa_01.png')

proscuitto_cotto = Product.create!(
  title: "Proscuitto Cotto",
  category: "Charcuterie",
  subtitle: "Une recette authentique italienne, avec une cuisson dans un bouillon aromatique lui confère son goût parfumé, fruité, intense et délicat.",
  description: "Il Mongibello è uno dei fiori all’occhiello dell'azienda Etnasalumi. Nasce dalla maestria dei nostri mastri salumieri, prodotto da cosce selezionate di suini Italiani ed un’attenta lavorazione rigorosamente artigianale che inizia con la selezione delle cosce e la disossatura, seguita da siringatura manuale della salamoia in vena, massaggio manuale per 36 ore e una macerazione in salamoia e spezie aromatiche Siciliane per cinque giorni, un’attenta e lenta cottura a vapore che può durare non meno di 10/14 ore completano il processo di lavorazione.
  Il risultato è un prodotto unico nel suo genere per gusto e bontà.
  Gustalo in un antipasto casereccio alla siciliana o in un panino all'olio per uno snack gustoso e nutriente che profuma di Sicilia.",
  price: 17
  )
  proscuitto_cotto.photo.attach( io: File.open(Rails.root.join('app/assets/images/products/prosciutto-cotto_01.png')),
    filename: 'prosciutto-cotto_01.png')

guanciale = Product.create!(
  title:"Guanciale",
  category:"Charcuterie",
  subtitle: "Le Guanciale est l'aliment idéal pour vos pâtes carbonara.",
  description: "Le guanciale affiné en croûte de poivre, un véritable chef-d'œuvre de la charcuterie ombrienne, au goût généreux et prononcé, inimitable et prêt pour mille recettes.
  Le guanciale n'est absolument pas traité mais seulement assaisonné de sel et de poivre, puis soumis à un affinage d'environ 45-60 jours.",
  price: "14"
  )
  guanciale.photo.attach( io: File.open(Rails.root.join('app/assets/images/products/guanciale_01.png')),
    filename: 'guanciale_01.png')


mortadella = Product.create!(
  title: "Mortadella",
  category:"Charcuterie",
  subtitle: "La mortadelle, communément nommée Mortadella par les Italiens, fait partie des spécialités de la charcuterie italienne incontournables. La mortadelle est un  IGP (indication géographique protégée) et est originaire de Bologne.",
  description: "La mortadelle est une charcuterie très ancienne dont l’origine remonterait à la renaissance. Selon différentes sources, la recette de la mortadelle serait attribuable à Cristoforo di Messiburgo. Majordome au service du cardinal Hippolyte 1er d’Este et auteur d’un des plus importants traités de gastronomie de l’histoire.",
  price: 16
  )
  mortadella.photo.attach( io: File.open(Rails.root.join('app/assets/images/products/mortadella_01.png')),
    filename: 'mortadella_01.png')


mortadella_al_pistacchio = Product.create!(
  title:"Mortadella al pistacchio",
  category:"Charcuterie",
  subtitle: "La Mortadelle aux pistaches a un arôme intense et légèrement épicé.",
  description: "La Mortadella est une charcuterie typique de l’Émilie-Romagne produite à partir de coupes de porc sélectionnées : un produit incomparable et inimitable qui résulte d’une sélection rigoureuse de matières premières de haute qualité.
  La consistance de la Mortadelle est souple et charnue, et lorsqu’elle est coupée, elle est d’une couleur rose intense avec des pistaches vertes. La Mortadelle aux pistaches a un arôme intense et légèrement épicé. Le goût rappelle les notes perçues par le nez et la saveur est délicate mais corsée.",
  price: 17
  )
  mortadella_al_pistacchio.photo.attach( io: File.open(Rails.root.join('app/assets/images/products/salame-al-pistacchio_01.png')),
    filename: 'salame-al-pistacchio_01.png')


pancetta = Product.create!(
  title:"Pancetta",
  category:"Charcuterie",
  subtitle: "La pancetta est une transformation alimentaire de la charcuterie italienne, à base de poitrine de porc salée, poivrée et séchée pendant environ trois mois",
  description: "La pancetta est également appelée ventresca di maiale (poitrine de porc) et est préparée en prenant la poitrine, y compris la partie grasse et les muscles abdominaux, du même porc.
  Visuellement, cette viande séchée présente la partie musculaire de couleur rosée, tandis que la graisse apparaît blanche, sauf dans la version fumée où elle est de couleur jaunâtre : à cet égard, il faut rappeler que le fumage se fait avec des bois peu résineux, préférant donc des arbres comme le genévrier, le chêne et le hêtre.
  On le trouve sous différentes formes et types : il y a le lard roulé, de forme ronde, avec ou sans couenne, préparé à partir de porcs plus maigres, très savoureux et doux.",
  price: 15
  )
  pancetta.photo.attach( io: File.open(Rails.root.join('app/assets/images/products/pancetta_01.png')),
    filename: 'pancetta_01.png')


porchetta = Product.create!(
  title:"Porchetta",
  category:"Charcuterie",
  subtitle: "La Porchetta aux herbes (cochon de lait rôti) est un mets distinctif de la tradition culinaire des régions centrales de l’Italie, réputé pour ses racines anciennes.",
  description: "Il s’agit d’un plat singulier, riche en goûts, grâce à l’utilisation d’épices diverses. La Porchetta aux herbes est élaborée à partir de viande de porc rigoureusement choisie, assurant ainsi une qualité inégalée, puis assaisonnée de sel, poivre et diverses épices et arômes naturels. Le bouquet d’épices employé pour parfumer la Porchetta pendant sa préparation confère à cette spécialité un parfum unique et mémorable. La saveur exquise de ce plat réside dans une harmonie parfaite entre les arômes et les épices.",
  price: 20
  )
  porchetta.photo.attach( io: File.open(Rails.root.join('app/assets/images/products/porchetta_01.png')),
    filename: 'porchetta_01.png')


proscuitto_san_daniele = Product.create!(
  title:"Proscuitto San Daniele",
  category:"Charcuterie",
  subtitle: "Le prosciutto di San Daniele est l'appellation d'origine d'un jambon préservée via une AOP, originaire de San Daniele del Friuli, en province d'Udine, dans la région Frioul-Vénétie Julienne, en Italie.",
  description: "Le Prosciutto di San Daniele naît entre les mains expertes de maîtres jambonniers qui, grâce à un savoir ancien et à des règles strictes, transforment la viande et le sel en un chef-d’œuvre de saveur et de délicatesse. Le Prosciutto di San Daniele a une saveur équilibrée et parfaite. Voici quelques conseils pour le découper et le conserver correctement à la maison aussi et le savourer toujours au mieux de ses qualités",
  price: 35
  )
  proscuitto_san_daniele.photo.attach( io: File.open(Rails.root.join('app/assets/images/products/prosciutto_san_daniele_01.png')),
    filename: 'prosciutto_san_daniele_01.png')


# # Create Cheese Category

caciocavallo = Product.create!(
  title: "Caciocavallo",
  category: "Fromage",
  subtitle: "Fromage du sud de l'italie, qui ressemble à de la mozzarella fumée.",
  description: "Le Caciocavallo est un fromage à pâte filée affiné, traditionnel du sud de l’Italie. Il est produit avec du lait de vache auquel on ajoute simplement du sel et de la présure d’agneau ou de chevreau. L’origine du lait utilisé pour ce Caciocavallo est italienne.
  Il a un goût doux, délicat et modérément savoureux et une odeur aromatique de lait frais. Sa croûte est fine, dure et de couleur jaune paille, qui a tendance à être plus foncée si le fromage est plus mûr.",
  price: 15
  )
  caciocavallo.photo.attach( io: File.open(Rails.root.join('app/assets/images/products/caciocavallo_01.png')),
    filename: 'caciocavallo_01.png')

pecorino = Product.create!(
  title: "Pecorino",
  category: "Fromage",
  subtitle: "Le Pecorino est un fromage à pâte pressée cuite à base de lait de brebis. Il nous vient d’Italie en Sardaigne.",
  description: "En réalité, il existe plusieurs variétés du fromage Pecorino et chacun dispose d’une appellation AOP. Celui originaire de Sardaigne est appelé Pecorino Sardo ou Fiore Sardo. Il en existe d’ailleurs deux types : le Pecorino Sardo frais ou Dolce et le Pecorino Sardo affiné ou Maturo. La différence entre eux réside dans leurs techniques de traitement, leur taille et leur saveur.",
  price: 14
  )
  caciocavallo.photo.attach( io: File.open(Rails.root.join('app/assets/images/products/pecorino_01.png')),
    filename: 'pecorino_01.png')

parmiggiano = Product.create!(
  title: "Parmiggiano",
  category: "Fromage",
  subtitle: "T'es plutôt parmesan ou fromage râpé dans les pâtes ?",
  description: "Ce n'est certainement pas un hasard si l'on trouve une référence au Parmigiano Reggiano dans le Decameron de Boccaccio, l'un des chefs-d'œuvre de la littérature italienne. En fait, il est considéré comme le 'Roi des fromages', le symbole incontesté de la haute qualité et du bon goût du Made in Italy.
  Le nom du fromage Parmesan dérive de ses zones de production : les provinces de Parme, Reggio Emilia, le côté ouest de Bologne et Modène en Emilie-Romagne, ainsi qu'une partie de Mantoue en Lombardie, sur la rive sud-est du fleuve Pô.",
  price: 35
  )
  parmiggiano.photo.attach( io: File.open(Rails.root.join('app/assets/images/products/pecorino_01.png')),
    filename: 'pecorino_01.png')

ricotta = Product.create!(
  title: "Ricotta",
  category: "Fromage",
  subtitle: "La Ricotta affinée salée est une variété de ricotta typique du sud de l'Italie, en particulier de la Sicile où elle est produite principalement avec du lait de brebis ou de chèvre.",
  description: "Contrairement à la ricotta fraîche, la version salée subit une courte maturation (environ trente jours) et est saupoudrée de sel, ce qui lui donne un arôme fort qui rehausse les autres saveurs.
  C’est un produit laitier versatile, produit dans ce cas avec du lait de bufflonne et de Campanie 100% entier, qui peut être dégusté seul, peut-être en apéritif ou avec des légumes, mais il est aussi excellent râpé sur des pâtes au lieu du fromage plus classique.",
  price: 14
  )
  ricotta.photo.attach( io: File.open(Rails.root.join('app/assets/images/products/ricotta_01.png')),
    filename: 'ricotta_01.png')

# 10.times do
#   product = Product.create!(
#     title: Faker::Commerce.product_name,
#     category: Faker::Commerce.department(max: 1, fixed_amount: true),
#     subtitle: Faker::Lorem.sentence,
#     description: Faker::Lorem.paragraph,
#     price: Faker::Commerce.price(range: 0..100.0, as_string: false)
#   )
#     product.photo.attach( io: File.open(Rails.root.join('app/assets/images/products/caciocavallo_01.png')),
#     filename: 'caciocavallo.png')
# end


# Create cart products
10.times do
  CartProduct.create!(
    cart: Cart.all.sample,
    product: Product.all.sample,
    quantity: Faker::Number.between(from: 1, to: 10)
  )
end
    
# Create order products
10.times do
  OrderProduct.create!(
    order: Order.all.sample,
    product: Product.all.sample,
    quantity: Faker::Number.between(from: 1, to: 10)
  )
end
 
puts "Seed data created successfully!"
