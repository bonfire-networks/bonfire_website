defmodule Bonfire.Website.Page.MilestonesLive do
  use Bonfire.UI.Common.Web,
      {:live_view, [layout: {Bonfire.Website.LayoutView, "live.html"}]}

  alias Bonfire.Me.Fake

  alias Bonfire.Me.Users
  alias Bonfire.UI.Me.CreateUserLive

  alias Bonfire.Website.MilestonesLive
  alias Bonfire.Website.HeaderLive
  alias Bonfire.Website.AppsPreviewLive
  alias Bonfire.Website.FooterLive
  alias Bonfire.Website.FaqLive
  alias Bonfire.Website.HeroLive
  alias Bonfire.Website.PreviewLive
  alias Bonfire.Website.DevicePreviewLive
  alias Bonfire.Website.BlogPreviewLive

  on_mount {LivePlugs, [Bonfire.UI.Me.LivePlugs.LoadCurrentUser]}

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       page_title: "Bonfire home page"
     )}
  end
end
