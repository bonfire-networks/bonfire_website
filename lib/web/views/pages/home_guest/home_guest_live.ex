defmodule Bonfire.Website.HomeGuestLive do
  use Bonfire.Web, {:live_view, [layout: {Bonfire.Website.LayoutView, "live.html"}]}
  alias Bonfire.Me.Fake
  alias Bonfire.Web.LivePlugs
  alias Bonfire.Me.Users
  alias Bonfire.Me.Web.CreateUserLive
  alias Bonfire.Website.{HeaderLive, AppsPreviewLive,  FooterLive, FaqLive, HeroLive, PreviewLive, DevicePreviewLive, BlogPreviewLive}


  def mount(params, session, socket) do
    LivePlugs.live_plug params, session, socket, [
      LivePlugs.LoadCurrentAccount,
      LivePlugs.LoadCurrentUser,
      LivePlugs.StaticChanged,
      LivePlugs.Csrf, LivePlugs.Locale,
      &mounted/3,
    ]
  end

  defp mounted(params, session, socket) do
    {:ok, socket
    |> assign(page_title: "Bonfire home page",
    )}
  end

end
