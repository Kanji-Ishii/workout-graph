User.create!(name: 'sample', email: 'sample@sample.com', password: 'foobar')

User.all.each do |user|
  user.exercises.create!(id: 0, name: 'dumbel press',      records_count: 15)
  user.exercises.create!(id: 1, name: 'dumbel fly',        records_count: 15)
  user.exercises.create!(id: 2, name: 'arm curl',          records_count: 15)
  user.exercises.create!(id: 3, name: 'triceps extension', records_count: 15)
end

require "csv"
CSV.foreach('db/seed_record.csv') do |row|
  Record.create(exercise_id: row[0],
                    name_id: row[1],
                     weight: row[2],
                 reps_count: row[3],
                       note: row[4],
                         RM: row[5],
                       date: row[6]
                )
end
