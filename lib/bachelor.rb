require "pry"

def get_first_name_of_season_winner(data, season)
  winner = ""

  data[season].each do |item|
      winner = item["name"] if item["status"] == "Winner"
  end

  winner.split(" ").first
end

def get_contestant_name(data, occupation)
  person = ""

  data.each do |key, value|
     value.each {|item| person = item["name"] if item["occupation"] == occupation}
  end

  person
end

def count_contestants_by_hometown(data, hometown)
  count = 0

  data.each do |key, value|
    value.each {|item| count += 1 if item["hometown"] == hometown}
  end

  count
end

def get_occupation(data, hometown)
  job = ""

    data.each do |key, value|
      value.each do |item|
        if job.length == 0 && item["hometown"] == hometown
          job = item["occupation"]
        end
      end
    end

    job
end

def get_average_age_for_season(data, season)
  age_array = []

  data[season].each {|item| age_array << item["age"].to_i}

  (age_array.inject(&:+).to_f / age_array.length).round

end
