Fabricator(:inspection) do
  score { (1..100).to_a.sample }
  date { Time.now.strftime("%F") }
  description { Forgery(:basic).text }
  inspection_type { [0,1,2].sample }
end
