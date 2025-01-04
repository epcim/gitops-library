{
  prometheusAlerts+:: {
    groups+: [
      {
        name: 'gitlab-runner',
        rules: [
          {
            metrics:: {
              gitlab_runner_errors_total: {},
            },
            alert: 'GitlabRunnerErrors',
            expr: |||
              delta(gitlab_runner_errors_total{level!="warning"}[1h]) > 10
            ||| % $._config,
            'for': '15m',
            labels: {
              identifier: '{{$labels.kubernetes_namespace}}/{{$labels.kubernetes_pod_name}}',
              severity: 'major',
              group: 'Ves-Internal',
              service_name: 'gitlab-runner',
              tenant: 'ves-sre',
            },
            annotations: {
              display_name: 'Runner has increased error rate',
              description: 'Increased error rate in {{$labels.kubernetes_namespace}}/{{$labels.kubernetes_pod_name}}',
            },
          },

        ],
      },
    ],
  },
}
