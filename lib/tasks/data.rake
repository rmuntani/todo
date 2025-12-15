namespace :data do
  task queries: :environment do
    provider = Provider.first
    client = Client.first

    # Retrieve all clients of a provider
    result = provider.clients
    puts "Provider clients:"
    puts result.pluck(:name, :email, :id)

    # Retrieve all providers of a client
    result = client.providers
    puts "Client providers:"
    puts result.pluck(:name, :email, :id)

    # Retrieve all journal entries of a client ordered by posted date
    result = JournalEntry.for_client(client)
    puts "Client entries:"
    puts result.pluck(:entry, :id)

    # Retrieve all journal entries of all the clients of a particular provider ordered by posted date
    result = JournalEntry.for_provider(provider)
    puts "Provider clients' entries:"
    puts result.pluck(:entry, :id)
  end
end
