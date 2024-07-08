
# Monitoring Dashboard
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
        },
        {
          title = "Disk I/O"
          xyChart = {
            dataSets = [
              {
                timeSeriesQuery = {
                  prometheusQueryLanguageQuery = {
                    prometheusQuery = "rate(container_fs_io_time_seconds_total{container_name=\"my-container\"}[5m])"
                  }
                }
              }
            ]
            yAxis = {
              label = "Disk I/O"
              scale = "LINEAR"
            }
          }
        },
        {
          title = "Network Traffic"
          xyChart = {
            dataSets = [
              {
                timeSeriesQuery = {
                  prometheusQueryLanguageQuery = {
                    prometheusQuery = "sum(rate(container_network_receive_bytes_total{container_name=\"my-container\"}[5m])) by (container_name)"
                  }
                }
              },
              {
                timeSeriesQuery = {
                  prometheusQueryLanguageQuery = {
                    prometheusQuery = "sum(rate(container_network_transmit_bytes_total{container_name=\"my-container\"}[5m])) by (container_name)"
                  }
                }
              }
            ]
            yAxis = {
              label = "Network Traffic"
              scale = "LINEAR"
            }
          }
        },
        {
          title = "Error Rate"
          xyChart = {
            dataSets = [
              {
                timeSeriesQuery = {
                  prometheusQueryLanguageQuery = {
                    prometheusQuery = "sum(rate(container_errors_total{container_name=\"my-container\"}[5m])) by (container_name)"
                  }
                }
              }
            ]
            yAxis = {
              label = "Error Rate"
              scale = "LINEAR"
            }
          }
        }
      ]
    }
  })
}

# Alert Policy for High CPU Usage
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
  notification_channels = ["projects/${var.project_id}/notificationChannels/${var.notification_channel_id}"]
}
