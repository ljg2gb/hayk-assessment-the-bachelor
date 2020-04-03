require 'pry'

def get_first_name_of_season_winner(data, season)
  winner_data = data[season].find do |contestant_hash|
    contestant_hash["status"] == "Winner"
  end

  full_name = winner_data["name"]
  full_name.split(/ /)[0]
end

#helper method
def all_contestants (data)
  contestants = []
  a_of_a = data.values
  i = 0
  while  i < a_of_a.length do
    contestants.concat(a_of_a[i])
    i += 1
  end

  contestants
end


def get_contestant_name(data, occupation)
  contestants = all_contestants(data)
  correct_contestant = contestants.find do |contestant|
    contestant["occupation"] == occupation
  end

  correct_contestant["name"]
end


def count_contestants_by_hometown(data, hometown)
  contestants = all_contestants(data)
  contestants_w_same_hometown = contestants.find_all do |contestant|
    contestant["hometown"] == hometown
  end

  contestants_w_same_hometown.count
end


def get_occupation(data, hometown)
  contestants = all_contestants(data)
  correct_contestant = contestants.find do |contestant|
    contestant["hometown"] == hometown
  end

  correct_contestant["occupation"]
end


def get_average_age_for_season(data, season)
  ages = []
  i = 0
  while  i < data[season].length do
    ages << data[season][i]["age"]
    i += 1
  end

  float_ages = ages.map do |age|
    age.to_f
  end

  total_ages = float_ages.reduce(0) do |acc, age|
    acc + age
  end  

  avg_age = total_ages/float_ages.length
  avg_age.round
end
