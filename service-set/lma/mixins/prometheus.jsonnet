local mixin = (import 'mixins/mixin.libsonnet') +
              (import 'mixins/config.libsonnet');

{
  'alert_rules.json': mixin.prometheusAlerts,
  'recording_rules.json': mixin.prometheusRules,
}
