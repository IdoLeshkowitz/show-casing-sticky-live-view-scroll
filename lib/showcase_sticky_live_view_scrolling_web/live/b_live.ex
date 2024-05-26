defmodule ShowcaseStickyLiveViewScrollingWeb.BLive do
  use ShowcaseStickyLiveViewScrollingWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>
      Live View B <br />
      <.link navigate={~p"/a"}>
        to a
      </.link>
    </div>
    """
  end

  def mount(_, _, socket) do
    {:ok, socket}
  end
end
