require 'faker'

providers = 20.times.map do
  Provider.create(email: Faker::Internet.email,
                  name: Faker::Name.name)
end

clients = 20.times.map do
  Client.create(email: Faker::Internet.email,
                name: Faker::Name.name)
end

plans = clients.flat_map.with_index do |client, idx|
  3.times.map do |delta|
    Plan.create(client: client,
      tier: ['premium', 'basic'].sample,
      provider: providers[(idx + delta) % providers.length]
    )
  end
end

clients.each do |client|
  3.times do
    JournalEntry.create(client: client, entry: Faker::Lorem.paragraph)
  end
end
