pays_nord = ["France", "Mongolie", "Grèce", "Israël", "Russie"]
pays_sud = ["Cameroun", "Equateur", "Chili", "Colombie", "Indonésie"]


puts "Quel mois part-on?"
mois = gets.chomp.downcase

moment_de_lannee =
{
  "janvier"=>1,
  "fevrier"=>2,
  "mars" => 3,
  "avril"=>4,
  "mai"=>5,
  "juin"=>6,
  "juillet" =>7,
  "aout"=>8,
  "septembre"=>9,
  "octobre"=>10,
  "novembre"=>11,
  "decembre"=>12
}

numero_du_mois = moment_de_lannee[mois]
if numero_du_mois.class == Fixnum
  if numero_du_mois >= 6
    puts "#{pays_sud[rand(4)]} !"
  elsif numero_du_mois < 6
    puts " #{pays_nord[rand(4)]} !"
  end
else
  puts "Je n'ai pas compris"
end
