resource "google_monitoring_dashboard" "my_dashboard" {
  dashboard_json = jsonencode({
    displayName = "My Application Dashboard"
    gridLayout = {
      columns = 2
      widgets = [
        {
          title = "CPU Usage"
          xyChart = {
            dataSets = [
              {
                timeSeriesQuery = {
                  prometheusQueryLanguageQuery = {
                    prometheusQuery = "sum(rate(container_cpu_usage_seconds_total{container_name=\"my-container\"}[5m])) by (container_name)"
                  }
                }
              }
            ]
            yAxis = {
              label = "CPU Usage"
              scale = "LINEAR"
            }
          }
        },
        {
          title = "Memory Usage"
          xyChart = {
            dataSets = [
              {
                timeSeriesQuery = {
                  prometheusQueryLanguageQuery = {
                    prometheusQuery = "sum(container_memory_usage_bytes{container_name=\"my-container\"}) by (container_name)"
                  }
                }
              }
            ]
            yAxis = {
              label = "Memory Usage"
              scale = "LINEAR"
            }
          }
        }
      ]
    }
  })
}

resource "google_monitoring_alert_policy" "high_cpu_alert" {
  display_name = "High CPU Usage Alert"
  combiner     = "OR"
  conditions {
    display_name = "VM Instance - CPU usage"
    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\""
      comparison      = "COMPARISON_GT"
      threshold_value = 0.8
      duration        = "60s"
      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_RATE"
        cross_series_reducer = "REDUCE_MEAN"
      }
    }
  }
  notification_channels = ["projects/your-project-id/notificationChannels/your-notification-channel-id"]
}
