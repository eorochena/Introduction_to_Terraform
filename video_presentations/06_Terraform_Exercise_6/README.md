# Exercise 6

For this exercise we will delve deeper into count, for_each and for loops, in addition we will briefly cover concepts like tolist, toset, chomp and auto-approve

## Count

The count object is used to create multiple resources, one limitation of count is that it depends on the list ordering[^1].

## for_each

The for_each meta-argument is also used to create multiple resource but it relies on sets to retrieve each value[^2].

## for loops

The for loop expression is used to itinerate over a sequence of objects like lists or maps[^3].

## tolist

Converts to a list[^4].

## toset

Converts to a set[^5].

## chomp

Removes trailing newline characters[^6].

## auto-approve

Skips or bypasses interactive approval process[^7].

### Additional material 

- Count and for_each medium article by Jacek Kikiewicz -> https://medium.com/@business_99069/terraform-count-vs-for-each-b7ada2c0b186
- Terraform for loop, for_each loop and count by Rahul Wagh -> https://www.youtube.com/watch?v=4qO7WK6D3cA&t=316s



Command           |  Effect                                          | Status
------------------|--------------------------------------------------|------------
terraform init    | Initializes workplace                            | Available
terraform fmt     | Rewrite configuration files                      | Available
terraform plan    | Creates execution plan                           | Available
terraform show    | Human readable format for plan or state file     | Available
terraform graph   | Generates graphical represetation of plan file   | Available
terraform apply   | Deploys execution plan                           | Available
terraform refresh | Reads current state of remote instances          | Deprecated

[^1]: https://www.terraform.io/language/meta-arguments/count
[^2]: https://www.terraform.io/language/meta-arguments/for_each
[^3]: https://www.terraform.io/language/expressions/for
[^4]: https://www.terraform.io/language/functions/tolist
[^5]: https://www.terraform.io/language/functions/toset
[^6]: https://www.terraform.io/language/functions/chomp
[^7]: https://www.terraform.io/cli/commands/apply#auto-approve
