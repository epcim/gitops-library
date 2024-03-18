{
  _config+:: {
    gitlabRunnerSelector: 'name="gitlab-runner"',

    prometheusAlerts+: {
      'gitlab-runner': {},
    },

  },
}
