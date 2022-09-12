defmodule Bonfire.Website.HomeGuestLive do
  use Bonfire.UI.Common.Web,
      {:live_view, [layout: {Bonfire.Website.LayoutView, "live.html"}]}

  alias Bonfire.Me.Fake
  alias Bonfire.UI.Me.LivePlugs
  alias Bonfire.Me.Users
  alias Bonfire.UI.Me.CreateUserLive

  alias Bonfire.Website.HeaderLive
  alias Bonfire.Website.AppsPreviewLive
  alias Bonfire.Website.FooterLive
  alias Bonfire.Website.FaqLive
  alias Bonfire.Website.HeroLive
  alias Bonfire.Website.PreviewLive
  alias Bonfire.Website.DevicePreviewLive
  alias Bonfire.Website.BlogPreviewLive

  def mount(params, session, socket) do
    live_plug(params, session, socket, [
      LivePlugs.LoadCurrentAccount,
      LivePlugs.LoadCurrentUser,
      Bonfire.UI.Common.LivePlugs.StaticChanged,
      Bonfire.UI.Common.LivePlugs.Csrf,
      Bonfire.UI.Common.LivePlugs.Locale,
      &mounted/3
    ])
  end

  defp mounted(params, session, socket) do
    {:ok,
     assign(socket,
       page_title: "Bonfire home page"
     )}
  end
end
