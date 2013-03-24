Fabricator(:inspection) do
  business
  score (1..100).sample
  date Time.now.strftime("%F")
  description Forgery(:basic).text
  type [0,1,2].sample
end
