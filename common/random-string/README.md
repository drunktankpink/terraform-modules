# _Terraform Module: random-string_
_Terraform module for_ **_Random String_**

## General

_This module may be used to create_ **_Random String_** _resources_

_The resource **_random\_string_** generates a random permutation of alphanumeric characters and optionally special characters._

_This resource uses a cryptographic random number generator._

---

## _Prerequisites_

_This module needs_ **_Terraform 0.12.23** _or newer._
_You can download the latest Terraform version from_ [_here_](https://www.terraform.io/downloads.html).

---

## _Usage_

## _Using the module_

_To use this module, add the following call to your code:_


```tf
module "random_string" {
  source = "git::https://github.com/dy3us/terraform-modules/common/random-string.git?ref=main"

  length = 23
  special = false
  min_upper = 23  
}
```


```tf
module "random_string" {
  source = "git::https://github.com/dy3us/terraform-modules/common/random-string.git?ref=main"

  length = 16
  special = true
  override_special = "/@£$"  
}
```

---

## _Inputs_


_The variables that required in order for the module to be successfully called from the layers are the following:_

|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** | **_Default Value_** |
|:----|:----|-----:|:---:|:---:|
| **_length_** | _The length of the string desired_ | _string_ | **_Required_** |  |
| **_upper_** | _Include uppercase alphabet characters in random string_ | _boolean_ | **_Optional_** | **_true_** |
| **_min\_upper_** | _Minimum number of uppercase alphabet characters in random string_ | _number_ | **_Optional_** | **_0_** |
| **_lower_** | _Include lowercase alphabet characters in random string_ | _boolean_ | **_Optional_** | **_true_** |
| **_min\_lower_** | _Minimum number of lowercase alphabet characters in random string_ | _number_ | **_Optional_** | **_0_** |
| **_number_** | _An Action block_ | _boolean_ | **_Optional_** | **_true_** |
| **_min\_numeric_** | _Minimum number of numeric characters in random string_ | _number_ | **_Optional_** | **_0_** |
| **_special_** | _Include special characters in random string. These are **_!@#$%&*()-\_=+[]{}<>:?_**_ | _boolean_ | **_Optional_** | **_true_** |
| **_min\_special_** | _Minimum number of special characters in random string_ | _boolean_ | **_Optional_** | **_0_** |
| **_override\_special_** | _Supply your own list of special characters to use for string generation. This overrides the default character list in the special argument_ | _string_ | **_Optional_** | **_null_** |
| **_keepers_** | _Arbitrary map of values that, when changed, will trigger a new id to be generated.See [the main provider documentation](https://www.terraform.io/docs/providers/random/index.html) for more information_ | _map(string)_ | **_Optional_** | **_null_** |



## _Outputs_

_This module has the following outputs:_


* **_result_**


---