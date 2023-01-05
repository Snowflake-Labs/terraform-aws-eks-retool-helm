# _Retool Terraform Module_

This module allows us to setup Retool from scratch. It uses the [helm chart](https://github.com/tryretool/retool-helm) provided by the Retool team.

## Pre-reqs

1. Hosted-Zone Sub-domain or Delegated Sub-Domain is required by the module. The k8s annotations use this DNS name and the External-DNS service which is also a pre-requisite for this module will create an A record in the specific hosted zone.
2. An EKS Cluster with ALB Controller and External DNS with IRSA needs to be created. We have a Terraform [module](https://github.com/Snowflake-Labs/terraform-aws-eks-alb-controller) (yet to be open-sourced) that simplifies this process. This module takes a hosted zone ID as input.
3. RDS Cluster with a database endpoint and a database named `retool` created. Also, the secrets ARN for the database is required with the DATABASE_USERNAME and DATABASE_PASSWORD key-value pairs.

## Post Install

### Okta Integration

Retool supports SAML with SCIM and OpenID Connect with generic OpenID providers. We recommend OpenID Connect as it allows endpoints to sit behind a firewall/VPN and still have the advantage of Sync'ing okta groups.

Steps to integrate with Okta OpenID Connect are [here](https://docs.retool.com/docs/sso-generic-openid-provider#example-walk-though-okta).

One piece that the document doesn't cover which is needed is that after the OpenID connect Retool Integration is created, we need to do the following:

1. Click on to `Sign On` tab on the Retool App
2. Find the section `OpenID Connect ID Token`, and `Edit`
3. Set `Groups claim type` to `Filter` from the drop-down list
4. Set `Groups claim filter` to `groups` select `Matches regex` from adjacent drop-down list and set regex to `retool-.*`
5. It would be best to use the same filter [here](https://docs.retool.com/docs/sso-generic-openid-provider#guide-on-how-to-use-this-with-okta-group-claims) in point 7. but instead of `Starts With` we can use `Matches regex` and set the regex to `retool-.*` 

This is based on this okta [doc](https://support.okta.com/help/s/article/Okta-Groups-or-Attribute-Missing-from-Id-Token?language=en_US).

**NOTE: This TF module was created by Prasanth Kommini.**
