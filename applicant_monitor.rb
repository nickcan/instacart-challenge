require "active_record"
require "csv"
require "sqlite3"

CSV_FILE_NAME="monitor.csv".freeze
START_DATE_INPUT = ARGV.first
END_DATE_INPUT = ARGV.last

File.delete(CSV_FILE_NAME) if File.file?(CSV_FILE_NAME)


ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database  => "./applicants.sqlite3"
)

class Applicant < ActiveRecord::Base
  POSSIBLE_WORKFLOW_STATES = [
    :applied,
    :quiz_started,
    :quiz_completed,
    :onboarding_requested,
    :onboarding_completed,
    :hired
  ].freeze
end

class ApplicantMonitor
  attr_reader :start_date, :end_date

  DATE_FORMAT = "%Y-%m-%d"

  def initialize(start_range = "", end_range = "")
    @start_date = start_range.to_date.beginning_of_day.end_of_week(:tuesday)
    @end_date = end_range.to_date.end_of_day
  end

  def write_csv
    CSV.open(CSV_FILE_NAME, "a+") do |csv|
      csv << ["count", "week", "workflow_state"]

      num_of_weeks.times do |week_int|
        interval = one_week_interval(week_int)
        workflow_state_counts = default_aggregated_counts_by_workflow_state

        applicants_of_specific_interval(interval).each do |applicant|
          workflow_state_counts[applicant.workflow_state] += 1
        end

        workflow_state_counts.each do |key, val|
          csv << [val, interval.first, key]
        end
      end
    end
  end

  private

  def default_aggregated_counts_by_workflow_state
    Applicant::POSSIBLE_WORKFLOW_STATES.reduce({}) do |map, state|
      map[state.to_s] = 0
      map
    end
  end

  def one_week_interval(week_int)
    beginning_of_interval = start_date + week_int.week

    beginning_of_interval.strftime(DATE_FORMAT)..
    (beginning_of_interval + 1.week).strftime(DATE_FORMAT)
  end

  def num_of_weeks
    float_weeks = (end_date - start_date)/1.week
    float_weeks.floor
  end

  def applicants_of_specific_interval(interval)
    Applicant.where(created_at: interval)
  end
end

start = Time.now
puts "Monitoring Applicants..."

monitor = ApplicantMonitor.new(START_DATE_INPUT, END_DATE_INPUT)

monitor.write_csv

CSV.read(CSV_FILE_NAME).each { |row| p row.join(",") }

puts Time.now - start
