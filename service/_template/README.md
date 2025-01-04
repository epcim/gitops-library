

Directory structure:

```
- top level
  |
  | # kluctl (all rendered by kluctl)
  |- deployment.yml
  |- helm-*.yml
  |- vars.yml
  |- vars-[prod|test].yml     # conditionally loaded variables, per env type
  |- vars-[args.feature].yml  # conditionally loaded variables, per feature enabled by kluctl args

- config/
  |- configuration files, config maps, secrets

- deploy/
  |- gitops files (flux, argo, kluctl, ...)

- overlays/
  |- additional resources to load by kustomie
  |- set of examples or alternative setups
```
