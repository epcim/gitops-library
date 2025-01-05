
## About

This is an GitOps base library for many common `selfhosted` services. Their Dockerfiles and deployment artefacts (configuration, gitops configurations and **best-practice configurations**).
The main purpose is to have an shared place for advanced configurations as well as re-usability on various projects.

Infact, this is an [Kluctl Library](https://kluctl.io/docs/kluctl/kluctl-libraries/) project, it is not intended to be only used with Kluctl.io.

Tools utilized:

- https://kluctl.io,
  An CLI first deployment tool with gitops and template controller.

- Kustomize,
  Not everything can be se through helm charts/libraries. Kustomize is used here to patch final manifests.

- Jinja2,
  Just for a record, it is the engine to render template syntax here (not the Helm templates).
  I tend to switch to go-templates if kluctl.io would supprot it, for now there was no a reason and Jinja2 fit in place much better.

- Cue-lang, jsonnet,
  Certainly "service deployment" is not just an running image. Configuration goes hand to hand.
  I am keeping an eye on these two projects: https://holos.run/docs/v1alpha5/api/core/ and jsonnet mixins from https://github.com/cznewt.
  For the purpose of standardization across microservices, prometheus alerts, metrics, labels all need to be systematically maintained.

## Structure

- service, individual services
- service-set, an collection of cross-configured serivces with best-practice configuration

## Usage

This repository can be used as remote resource using Kustomize or as [Kluctl Library](https://kluctl.io/docs/kluctl/kluctl-libraries/) directly refered from [Kluctl Deployment](https://kluctl.io/docs/kluctl/deployments/deployment-yml/#git-includes).

I personally use it for my infrastructures and Kubernetes clusters. An example deployment can be found here: https://github.com/epcim/gitops-infra-public

