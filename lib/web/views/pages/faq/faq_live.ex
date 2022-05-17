defmodule Bonfire.Website.Page.FaqLive do
  use Bonfire.UI.Common.Web, {:live_view, [layout: {Bonfire.Website.LayoutView, "live.html"}]}
  alias Bonfire.Me.Fake
  alias Bonfire.UI.Me.LivePlugs
  alias Bonfire.Me.Users
  alias Bonfire.UI.Me.CreateUserLive
  alias Bonfire.Website.{HeaderLive, AppsPreviewLive,  FooterLive, FaqLive, HeroLive, PreviewLive, DevicePreviewLive, BlogPreviewLive}


  def mount(params, session, socket) do
    live_plug params, session, socket, [
      LivePlugs.LoadCurrentAccount,
      LivePlugs.LoadCurrentUser,
      Bonfire.UI.Common.LivePlugs.StaticChanged,
      Bonfire.UI.Common.LivePlugs.Csrf,
      Bonfire.UI.Common.LivePlugs.Locale,
      &mounted/3,
    ]
  end

  defp mounted(params, session, socket) do
    {:ok, socket
    |> assign(page_title: "Bonfire FAQs",
    )}
  end

end
