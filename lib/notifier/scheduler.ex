defmodule Notifier.Scheduler do
  use GenServer
  require Logger

  # @full_day 3600 * 24 * 1000
  # @admin_green_rate 5

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: Notifier)
  end

  def init(state) do
    # schedule_daily()
    schedule_after_every_5_seconds()
    {:ok, state}
  end

  # def handle_info(:daily, state) do
  #   if Date.day_of_week(DateTime.utc_now()) == 1 do
  #     award_green_to_all()
  #   else
  #     award_green_to_members()
  #   end

  #   schedule_daily()
  #   {:noreply, state}
  # end

  # defp schedule_daily() do
  #   {:ok, midnight} = Time.new(0, 0, 0)
  #   ms_past_midnight = abs(Time.diff(midnight, Time.utc_now(), :millisecond))
  #   ms_until_midnight = @full_day - ms_past_midnight
  #   Process.send_after(self(), :daily, ms_until_midnight)
  # end

  # defp award_green_to_all do
  # end

  # defp award_green_to_members do
  # end

  def handle_info(:afterFiveSec, state) do
    DateTime.utc_now()
    |> DateTime.truncate(:second)
    |> to_string()
    |> Logger.info()

    schedule_after_every_5_seconds()
    {:noreply, state}
  end

  def schedule_after_every_5_seconds do
    Process.send_after(self(), :afterFiveSec, 5_000)
  end
end
