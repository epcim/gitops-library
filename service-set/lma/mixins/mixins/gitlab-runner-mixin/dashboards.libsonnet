local board = (import 'dashboards/gitlab-runner.json');

{
  grafanaDashboards+:: {
    'gitlab-runner.json': board,
  },
}
