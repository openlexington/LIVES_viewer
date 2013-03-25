Fabricator(:inspection) do
  business
  score { (1..100).to_a.sample }
  date { Time.now.strftime("%F") }
  description { Forgery(:basic).text }
  type { [0,1,2].sample }
end
