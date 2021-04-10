defmodule Bonfire.Website.MilestonesLive do
  use Bonfire.Web, :live_component


  def update(assigns, socket) do

   milestones = with token <- Bonfire.Common.Config.get!(:github_token),
   {:ok, %{body: body}} <- Neuron.query("""
    query {
      repository(name:"bonfire-app", owner:"bonfire-networks") {
        id
        milestones(first:50) {
          edges {
            node {
              id
              title
              description
              progressPercentage
              dueOn
              issues(first:100) {
                totalCount
                edges {
                  node {
                    id
                    url
                    title
                    closed
                    labels(first:10) {
                      edges {
                        node {
                          id
                          name
                        }
                      }
                    }
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

  def task_in_progress?(%{"labels"=> %{"edges"=> labels}}) do
    Enum.find(labels, fn(element) ->
      match?(%{"node"=> %{"name"=> "In Progress"}}, element)
    end)
  end

  def milestone_in_progress(%{"issues"=> %{"edges"=> issues}}) do
    total = Enum.count(issues)
    in_progress = Enum.map(issues, &task_in_progress?(&1["node"])) |> Enum.filter(& &1) |> Enum.count
    if in_progress > 0, do: (total / in_progress)
  end


end
