defmodule Notifier.QuantumScheduler do
  use Quantum.Scheduler,
    otp_app: :notifier

  require Logger

  def log_time(frequency) do
    DateTime.utc_now()
    |> DateTime.truncate(frequency)
    |> to_string()
    |> Logger.info()
  end
end
