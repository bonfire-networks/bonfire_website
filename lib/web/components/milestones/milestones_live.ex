defmodule Bonfire.Website.MilestonesLive do
  use Bonfire.Web, :live_component


  def update(assigns, socket) do

   milestones = with token <- Bonfire.Common.Config.get!(:github_token),
   {:ok, %{body: body}} <- Neuron.query("""
    query {
      repository(name:"bonfire-app", owner:"bonfire-ecosystem") {
        id
        milestones(first:50) {
          edges {
            node {
              id
              title
              description
              issues(first:100) {
                edges {
                  node {
                    id
                    title
                    bodyHTML
                  }
                }
              }
            }
          }
        }
      }
    }
    """,
    nil,
    url: "https://api.github.com/graphql",
    headers: [authorization: "Bearer #{token}"]) do
      body["data"]["repository"]["milestones"]["edges"]
      # |> IO.inspect
    else _e ->
      []
    end

    {:ok, assign(socket,
      milestones: milestones,
      )
    }

  end

end
