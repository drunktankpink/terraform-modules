package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestExampleSimpleEndpoint(t *testing.T) {

	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/complete",
		Upgrade: true,
		Vars: map[string]interface{}{
			"region": "eu-west-2",
			"environment": "poc",
			"business_unit": "lch",
			"application_name": "sno",
			"allocation_id": "APP_12345",
			"cost_centre": "cc12345",
			"project_code": "12345-1234"			
		}
	}
}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
	out := terraform.OutputList(t, terraformOptions, "interface_vpc_endpoints")
	t.Log(out)