defmodule Bonfire.Website.Web.Routes do
  defmacro __using__(_) do

    quote do

      pipeline :website do
        plug :put_root_layout, {Bonfire.Website.LayoutView, :root}
      end

      # bonfire_website extension - anyone can view
      scope "/", Bonfire.Website do
        pipe_through :browser
        pipe_through :website

        live "/", HomeGuestLive
        live "/faq", Page.FaqLive
        live "/milestones", Page.MilestonesLive
      end

    end
  end
end
