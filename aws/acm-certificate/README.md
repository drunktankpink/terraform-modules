#ACM Certificate

This module is used to create an SSL certificate in AWS Certificate Manager.
The following resources will be created in AWS:
ACM certificate resource
ACM validation resource
Route53 record resource (required for validation)

```
module "acm-certificate" {
    source          = "../../terraform-modules/acm-certificate"
    domain_name     = var.domain_name
    zone_name       = var.zone_name
    private_zone    = var.private_zone
    environment     = var.environment
}
```

##Input values:
The following input values can be used with this module:

```
domain_name     = test.domain.com   # the domain issed for the certificate
zone_name       = domain.com        # the zone name, used to retrieve the zone in the data lookup
private_zone    = true              # Boolean to confirm if the zone is private
environment     = development       # The environment used for the resources
```

##Module Outputs
The following outputs are created as part of this module:
acm_certificate_arn
This is addressable in the service terraform files as:
`module.acm-certificate.acm_certificate_arn`