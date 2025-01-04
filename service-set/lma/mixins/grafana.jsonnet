local mixin = (import 'mixins/mixin.libsonnet') +
              (import 'mixins/config.libsonnet');

{
  [name]: mixin.grafanaDashboards[name]
  for name in std.objectFields(mixin.grafanaDashboards)
}