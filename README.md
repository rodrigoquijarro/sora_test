## sora_test

![GitHub repo](https://img.shields.io/github/repo-size/rodrigoquijarro/sora_test?style=plastic)

Project name is a `<rodrigoquijarro/sora_test>` that allows `<Soramitsu_evaluators>` to validate `<IaC/Task>`.

Additional line of information text about what the project does. Your introduction should be around 2 or 3 sentences. Don't go overboard, people won't read it.

## Prerequisites

Before you begin, ensure you have met the following requirements:
<!--- These are just example requirements. Add, duplicate or remove as required --->
* You have installed the latest version of `<coding_language/dependency/requirement_1>`
* You have a `<Windows/Linux/Mac>` machine. State which OS is supported/which is not.
* You have read `<guide/link/documentation_related_to_project>`.

## Architecture

![Screenshot from 2021-06-23 23-31-51](https://user-images.githubusercontent.com/53281151/123164791-13506080-d47c-11eb-8e99-c85c2213fe04.png)

## Installing sora_test

To install <sora_test>, follow these steps:

Application
```
npm install
npm start
```

Docker container
```
docker build . -t mailtech/appwebtime --no-cache
docker push mailtech/appwebtime
```

IaC to provision an instance: Terraform

t2.micro

```
<install_command>
```

Automate the bootstrapping of the application
```
<install_command>
```

Deployment pipelines
```
<install_command>
```

Monitoring
```
<install_command>
```

HA / Scaling
```
<install_command>
```

Backups
```
<install_command>
```

Logging/Metrics
```
<install_command>
```

OS Hardening
```
<install_command>
```



## Using <project_name>

To use <project_name>, follow these steps:

```
<usage_example>
```

Add run commands and examples you think users will find useful. Provide an options reference for bonus points!

## Contributing to <project_name>

1. Fork this repository.
2. Create a branch: `git checkout -b <branch_name>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Push to the original branch: `git push origin <project_name>/<location>`
5. Create the pull request.

## References

* ![Ansible AWS Dynamic Inventory](https://devopscube.com/setup-ansible-aws-dynamic-inventory/#Setup_Ansible_AWS_Dynamic_Inventory)

Author:
 
* [@rquijarro] - Telegram🐛

## Contact

Contact <rodrigoquijarro@gmail.com> 📖.


## Append

### A. Jenkins Console Output

```
Started by user rodry
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/apptest
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Checkout)
[Pipeline] git
The recommended git tool is: NONE
Warning: CredentialId "rodrigoquijarro" could not be found.
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/apptest/.git # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/rodrigoquijarro/sora_test.git # timeout=10
Fetching upstream changes from https://github.com/rodrigoquijarro/sora_test.git
 > git --version # timeout=10
 > git --version # 'git version 2.25.1'
 > git fetch --tags --force --progress -- https://github.com/rodrigoquijarro/sora_test.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
Checking out Revision 57a33b12d604f3ced4d3bf81bf87f65f25bb2386 (refs/remotes/origin/main)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 57a33b12d604f3ced4d3bf81bf87f65f25bb2386 # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git branch -D main # timeout=10
 > git checkout -b main 57a33b12d604f3ced4d3bf81bf87f65f25bb2386 # timeout=10
Commit message: "init"
 > git rev-list --no-walk f6e5ecfae9e400d6814be53f59d9e04c06464cb9 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Terraform)
[Pipeline] script
[Pipeline] {
[Pipeline] sh
+ whoami
jenkins
[Pipeline] sh
+ terraform -chdir=terraform/static-site init

[0m[1mInitializing the backend...[0m

[0m[1mInitializing provider plugins...[0m
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v3.46.0

[0m[1m[32mTerraform has been successfully initialized![0m[32m[0m
[0m[32m
You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.[0m
[Pipeline] sh
+ terraform -chdir=terraform/static-site apply -var group=web -var profile=DevOpsUser --auto-approve

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  [32m+[0m create
[0m
Terraform will perform the following actions:

[1m  # aws_autoscaling_group.timeisweb[0m will be created[0m[0m
[0m  [32m+[0m[0m resource "aws_autoscaling_group" "timeisweb" {
      [32m+[0m [0m[1m[0marn[0m[0m                       = (known after apply)
      [32m+[0m [0m[1m[0mavailability_zones[0m[0m        = [
          [32m+[0m [0m"eu-west-2a",
        ]
      [32m+[0m [0m[1m[0mdefault_cooldown[0m[0m          = (known after apply)
      [32m+[0m [0m[1m[0mdesired_capacity[0m[0m          = (known after apply)
      [32m+[0m [0m[1m[0mforce_delete[0m[0m              = false
      [32m+[0m [0m[1m[0mforce_delete_warm_pool[0m[0m    = false
      [32m+[0m [0m[1m[0mhealth_check_grace_period[0m[0m = 600
      [32m+[0m [0m[1m[0mhealth_check_type[0m[0m         = "ELB"
      [32m+[0m [0m[1m[0mid[0m[0m                        = (known after apply)
      [32m+[0m [0m[1m[0mlaunch_configuration[0m[0m      = (known after apply)
      [32m+[0m [0m[1m[0mload_balancers[0m[0m            = [
          [32m+[0m [0m"app-timeisweb",
        ]
      [32m+[0m [0m[1m[0mmax_size[0m[0m                  = 4
      [32m+[0m [0m[1m[0mmetrics_granularity[0m[0m       = "1Minute"
      [32m+[0m [0m[1m[0mmin_size[0m[0m                  = 2
      [32m+[0m [0m[1m[0mname[0m[0m                      = (known after apply)
      [32m+[0m [0m[1m[0mname_prefix[0m[0m               = (known after apply)
      [32m+[0m [0m[1m[0mprotect_from_scale_in[0m[0m     = false
      [32m+[0m [0m[1m[0mservice_linked_role_arn[0m[0m   = (known after apply)
      [32m+[0m [0m[1m[0mvpc_zone_identifier[0m[0m       = (known after apply)
      [32m+[0m [0m[1m[0mwait_for_capacity_timeout[0m[0m = "10m"

      [32m+[0m [0mtag {
          [32m+[0m [0m[1m[0mkey[0m[0m                 = "Name"
          [32m+[0m [0m[1m[0mpropagate_at_launch[0m[0m = true
          [32m+[0m [0m[1m[0mvalue[0m[0m               = "app-timeisweb"
        }
    }

[1m  # aws_elb.timeisweb[0m will be created[0m[0m
[0m  [32m+[0m[0m resource "aws_elb" "timeisweb" {
      [32m+[0m [0m[1m[0marn[0m[0m                         = (known after apply)
      [32m+[0m [0m[1m[0mavailability_zones[0m[0m          = [
          [32m+[0m [0m"eu-west-2a",
        ]
      [32m+[0m [0m[1m[0mconnection_draining[0m[0m         = false
      [32m+[0m [0m[1m[0mconnection_draining_timeout[0m[0m = 300
      [32m+[0m [0m[1m[0mcross_zone_load_balancing[0m[0m   = true
      [32m+[0m [0m[1m[0mdns_name[0m[0m                    = (known after apply)
      [32m+[0m [0m[1m[0mid[0m[0m                          = (known after apply)
      [32m+[0m [0m[1m[0midle_timeout[0m[0m                = 60
      [32m+[0m [0m[1m[0minstances[0m[0m                   = (known after apply)
      [32m+[0m [0m[1m[0minternal[0m[0m                    = (known after apply)
      [32m+[0m [0m[1m[0mname[0m[0m                        = "app-timeisweb"
      [32m+[0m [0m[1m[0msecurity_groups[0m[0m             = (known after apply)
      [32m+[0m [0m[1m[0msource_security_group[0m[0m       = (known after apply)
      [32m+[0m [0m[1m[0msource_security_group_id[0m[0m    = (known after apply)
      [32m+[0m [0m[1m[0msubnets[0m[0m                     = (known after apply)
      [32m+[0m [0m[1m[0mtags_all[0m[0m                    = (known after apply)
      [32m+[0m [0m[1m[0mzone_id[0m[0m                     = (known after apply)

      [32m+[0m [0mhealth_check {
          [32m+[0m [0m[1m[0mhealthy_threshold[0m[0m   = 2
          [32m+[0m [0m[1m[0minterval[0m[0m            = 30
          [32m+[0m [0m[1m[0mtarget[0m[0m              = "HTTP:443/"
          [32m+[0m [0m[1m[0mtimeout[0m[0m             = 3
          [32m+[0m [0m[1m[0munhealthy_threshold[0m[0m = 2
        }

      [32m+[0m [0mlistener {
          [32m+[0m [0m[1m[0minstance_port[0m[0m     = 443
          [32m+[0m [0m[1m[0minstance_protocol[0m[0m = "https"
          [32m+[0m [0m[1m[0mlb_port[0m[0m           = 443
          [32m+[0m [0m[1m[0mlb_protocol[0m[0m       = "http"
        }
    }

[1m  # aws_instance.web[0][0m will be created[0m[0m
[0m  [32m+[0m[0m resource "aws_instance" "web" {
      [32m+[0m [0m[1m[0mami[0m[0m                                  = "ami-0194c3e07668a7e36"
      [32m+[0m [0m[1m[0marn[0m[0m                                  = (known after apply)
      [32m+[0m [0m[1m[0massociate_public_ip_address[0m[0m          = (known after apply)
      [32m+[0m [0m[1m[0mavailability_zone[0m[0m                    = (known after apply)
      [32m+[0m [0m[1m[0mcpu_core_count[0m[0m                       = (known after apply)
      [32m+[0m [0m[1m[0mcpu_threads_per_core[0m[0m                 = (known after apply)
      [32m+[0m [0m[1m[0mget_password_data[0m[0m                    = false
      [32m+[0m [0m[1m[0mhost_id[0m[0m                              = (known after apply)
      [32m+[0m [0m[1m[0mid[0m[0m                                   = (known after apply)
      [32m+[0m [0m[1m[0minstance_initiated_shutdown_behavior[0m[0m = (known after apply)
      [32m+[0m [0m[1m[0minstance_state[0m[0m                       = (known after apply)
      [32m+[0m [0m[1m[0minstance_type[0m[0m                        = "t2.micro"
      [32m+[0m [0m[1m[0mipv6_address_count[0m[0m                   = (known after apply)
      [32m+[0m [0m[1m[0mipv6_addresses[0m[0m                       = (known after apply)
      [32m+[0m [0m[1m[0mkey_name[0m[0m                             = "apptest"
      [32m+[0m [0m[1m[0moutpost_arn[0m[0m                          = (known after apply)
      [32m+[0m [0m[1m[0mpassword_data[0m[0m                        = (known after apply)
      [32m+[0m [0m[1m[0mplacement_group[0m[0m                      = (known after apply)
      [32m+[0m [0m[1m[0mprimary_network_interface_id[0m[0m         = (known after apply)
      [32m+[0m [0m[1m[0mprivate_dns[0m[0m                          = (known after apply)
      [32m+[0m [0m[1m[0mprivate_ip[0m[0m                           = (known after apply)
      [32m+[0m [0m[1m[0mpublic_dns[0m[0m                           = (known after apply)
      [32m+[0m [0m[1m[0mpublic_ip[0m[0m                            = (known after apply)
      [32m+[0m [0m[1m[0msecondary_private_ips[0m[0m                = (known after apply)
      [32m+[0m [0m[1m[0msecurity_groups[0m[0m                      = (known after apply)
      [32m+[0m [0m[1m[0msource_dest_check[0m[0m                    = false
      [32m+[0m [0m[1m[0msubnet_id[0m[0m                            = (known after apply)
      [32m+[0m [0m[1m[0mtags[0m[0m                                 = {
          [32m+[0m [0m"Name"  = "web-001"
          [32m+[0m [0m"group" = "web"
        }
      [32m+[0m [0m[1m[0mtags_all[0m[0m                             = {
          [32m+[0m [0m"Name"  = "web-001"
          [32m+[0m [0m"group" = "web"
        }
      [32m+[0m [0m[1m[0mtenancy[0m[0m                              = (known after apply)
      [32m+[0m [0m[1m[0mvpc_security_group_ids[0m[0m               = (known after apply)

      [32m+[0m [0mcapacity_reservation_specification {
          [32m+[0m [0m[1m[0mcapacity_reservation_preference[0m[0m = (known after apply)

          [32m+[0m [0mcapacity_reservation_target {
              [32m+[0m [0m[1m[0mcapacity_reservation_id[0m[0m = (known after apply)
            }
        }

      [32m+[0m [0mebs_block_device {
          [32m+[0m [0m[1m[0mdelete_on_termination[0m[0m = (known after apply)
          [32m+[0m [0m[1m[0mdevice_name[0m[0m           = (known after apply)
          [32m+[0m [0m[1m[0mencrypted[0m[0m             = (known after apply)
          [32m+[0m [0m[1m[0miops[0m[0m                  = (known after apply)
          [32m+[0m [0m[1m[0mkms_key_id[0m[0m            = (known after apply)
          [32m+[0m [0m[1m[0msnapshot_id[0m[0m           = (known after apply)
          [32m+[0m [0m[1m[0mtags[0m[0m                  = (known after apply)
          [32m+[0m [0m[1m[0mthroughput[0m[0m            = (known after apply)
          [32m+[0m [0m[1m[0mvolume_id[0m[0m             = (known after apply)
          [32m+[0m [0m[1m[0mvolume_size[0m[0m           = (known after apply)
          [32m+[0m [0m[1m[0mvolume_type[0m[0m           = (known after apply)
        }

      [32m+[0m [0menclave_options {
          [32m+[0m [0m[1m[0menabled[0m[0m = (known after apply)
        }

      [32m+[0m [0mephemeral_block_device {
          [32m+[0m [0m[1m[0mdevice_name[0m[0m  = (known after apply)
          [32m+[0m [0m[1m[0mno_device[0m[0m    = (known after apply)
          [32m+[0m [0m[1m[0mvirtual_name[0m[0m = (known after apply)
        }

      [32m+[0m [0mmetadata_options {
          [32m+[0m [0m[1m[0mhttp_endpoint[0m[0m               = (known after apply)
          [32m+[0m [0m[1m[0mhttp_put_response_hop_limit[0m[0m = (known after apply)
          [32m+[0m [0m[1m[0mhttp_tokens[0m[0m                 = (known after apply)
        }

      [32m+[0m [0mnetwork_interface {
          [32m+[0m [0m[1m[0mdelete_on_termination[0m[0m = (known after apply)
          [32m+[0m [0m[1m[0mdevice_index[0m[0m          = (known after apply)
          [32m+[0m [0m[1m[0mnetwork_interface_id[0m[0m  = (known after apply)
        }

      [32m+[0m [0mroot_block_device {
          [32m+[0m [0m[1m[0mdelete_on_termination[0m[0m = (known after apply)
          [32m+[0m [0m[1m[0mdevice_name[0m[0m           = (known after apply)
          [32m+[0m [0m[1m[0mencrypted[0m[0m             = (known after apply)
          [32m+[0m [0m[1m[0miops[0m[0m                  = (known after apply)
          [32m+[0m [0m[1m[0mkms_key_id[0m[0m            = (known after apply)
          [32m+[0m [0m[1m[0mtags[0m[0m                  = (known after apply)
          [32m+[0m [0m[1m[0mthroughput[0m[0m            = (known after apply)
          [32m+[0m [0m[1m[0mvolume_id[0m[0m             = (known after apply)
          [32m+[0m [0m[1m[0mvolume_size[0m[0m           = (known after apply)
          [32m+[0m [0m[1m[0mvolume_type[0m[0m           = (known after apply)
        }
    }

[1m  # aws_launch_configuration.timeisweb[0m will be created[0m[0m
[0m  [32m+[0m[0m resource "aws_launch_configuration" "timeisweb" {
      [32m+[0m [0m[1m[0marn[0m[0m                         = (known after apply)
      [32m+[0m [0m[1m[0massociate_public_ip_address[0m[0m = false
      [32m+[0m [0m[1m[0mebs_optimized[0m[0m               = (known after apply)
      [32m+[0m [0m[1m[0menable_monitoring[0m[0m           = true
      [32m+[0m [0m[1m[0mid[0m[0m                          = (known after apply)
      [32m+[0m [0m[1m[0mimage_id[0m[0m                    = "ami-0194c3e07668a7e36"
      [32m+[0m [0m[1m[0minstance_type[0m[0m               = "t2.micro"
      [32m+[0m [0m[1m[0mkey_name[0m[0m                    = "apptest"
      [32m+[0m [0m[1m[0mname[0m[0m                        = (known after apply)
      [32m+[0m [0m[1m[0mname_prefix[0m[0m                 = (known after apply)
      [32m+[0m [0m[1m[0msecurity_groups[0m[0m             = (known after apply)

      [32m+[0m [0mebs_block_device {
          [32m+[0m [0m[1m[0mdelete_on_termination[0m[0m = (known after apply)
          [32m+[0m [0m[1m[0mdevice_name[0m[0m           = (known after apply)
          [32m+[0m [0m[1m[0mencrypted[0m[0m             = (known after apply)
          [32m+[0m [0m[1m[0miops[0m[0m                  = (known after apply)
          [32m+[0m [0m[1m[0mno_device[0m[0m             = (known after apply)
          [32m+[0m [0m[1m[0msnapshot_id[0m[0m           = (known after apply)
          [32m+[0m [0m[1m[0mthroughput[0m[0m            = (known after apply)
          [32m+[0m [0m[1m[0mvolume_size[0m[0m           = (known after apply)
          [32m+[0m [0m[1m[0mvolume_type[0m[0m           = (known after apply)
        }

      [32m+[0m [0mmetadata_options {
          [32m+[0m [0m[1m[0mhttp_endpoint[0m[0m               = (known after apply)
          [32m+[0m [0m[1m[0mhttp_put_response_hop_limit[0m[0m = (known after apply)
          [32m+[0m [0m[1m[0mhttp_tokens[0m[0m                 = (known after apply)
        }

      [32m+[0m [0mroot_block_device {
          [32m+[0m [0m[1m[0mdelete_on_termination[0m[0m = (known after apply)
          [32m+[0m [0m[1m[0mencrypted[0m[0m             = (known after apply)
          [32m+[0m [0m[1m[0miops[0m[0m                  = (known after apply)
          [32m+[0m [0m[1m[0mthroughput[0m[0m            = (known after apply)
          [32m+[0m [0m[1m[0mvolume_size[0m[0m           = (known after apply)
          [32m+[0m [0m[1m[0mvolume_type[0m[0m           = (known after apply)
        }
    }

[1m  # aws_security_group.elb[0m will be created[0m[0m
[0m  [32m+[0m[0m resource "aws_security_group" "elb" {
      [32m+[0m [0m[1m[0marn[0m[0m                    = (known after apply)
      [32m+[0m [0m[1m[0mdescription[0m[0m            = "Managed by Terraform"
      [32m+[0m [0m[1m[0megress[0m[0m                 = [
          [32m+[0m [0m{
              [32m+[0m [0mcidr_blocks      = [
                  [32m+[0m [0m"0.0.0.0/0",
                ]
              [32m+[0m [0mdescription      = ""
              [32m+[0m [0mfrom_port        = 0
              [32m+[0m [0mipv6_cidr_blocks = []
              [32m+[0m [0mprefix_list_ids  = []
              [32m+[0m [0mprotocol         = "-1"
              [32m+[0m [0msecurity_groups  = []
              [32m+[0m [0mself             = false
              [32m+[0m [0mto_port          = 0
            },
        ]
      [32m+[0m [0m[1m[0mid[0m[0m                     = (known after apply)
      [32m+[0m [0m[1m[0mingress[0m[0m                = [
          [32m+[0m [0m{
              [32m+[0m [0mcidr_blocks      = [
                  [32m+[0m [0m"0.0.0.0/0",
                ]
              [32m+[0m [0mdescription      = ""
              [32m+[0m [0mfrom_port        = 443
              [32m+[0m [0mipv6_cidr_blocks = []
              [32m+[0m [0mprefix_list_ids  = []
              [32m+[0m [0mprotocol         = "tcp"
              [32m+[0m [0msecurity_groups  = []
              [32m+[0m [0mself             = false
              [32m+[0m [0mto_port          = 443
            },
        ]
      [32m+[0m [0m[1m[0mname[0m[0m                   = "terraform-timeisweb-elb"
      [32m+[0m [0m[1m[0mname_prefix[0m[0m            = (known after apply)
      [32m+[0m [0m[1m[0mowner_id[0m[0m               = (known after apply)
      [32m+[0m [0m[1m[0mrevoke_rules_on_delete[0m[0m = false
      [32m+[0m [0m[1m[0mtags_all[0m[0m               = (known after apply)
      [32m+[0m [0m[1m[0mvpc_id[0m[0m                 = (known after apply)
    }

[1m  # aws_security_group.instance[0m will be created[0m[0m
[0m  [32m+[0m[0m resource "aws_security_group" "instance" {
      [32m+[0m [0m[1m[0marn[0m[0m                    = (known after apply)
      [32m+[0m [0m[1m[0mdescription[0m[0m            = "Managed by Terraform"
      [32m+[0m [0m[1m[0megress[0m[0m                 = [
          [32m+[0m [0m{
              [32m+[0m [0mcidr_blocks      = [
                  [32m+[0m [0m"0.0.0.0/0",
                ]
              [32m+[0m [0mdescription      = ""
              [32m+[0m [0mfrom_port        = 0
              [32m+[0m [0mipv6_cidr_blocks = [
                  [32m+[0m [0m"::/0",
                ]
              [32m+[0m [0mprefix_list_ids  = []
              [32m+[0m [0mprotocol         = "-1"
              [32m+[0m [0msecurity_groups  = []
              [32m+[0m [0mself             = false
              [32m+[0m [0mto_port          = 0
            },
        ]
      [32m+[0m [0m[1m[0mid[0m[0m                     = (known after apply)
      [32m+[0m [0m[1m[0mingress[0m[0m                = [
          [32m+[0m [0m{
              [32m+[0m [0mcidr_blocks      = [
                  [32m+[0m [0m"0.0.0.0/0",
                ]
              [32m+[0m [0mdescription      = "HTTP from VPC"
              [32m+[0m [0mfrom_port        = 80
              [32m+[0m [0mipv6_cidr_blocks = []
              [32m+[0m [0mprefix_list_ids  = []
              [32m+[0m [0mprotocol         = "tcp"
              [32m+[0m [0msecurity_groups  = []
              [32m+[0m [0mself             = false
              [32m+[0m [0mto_port          = 80
            },
          [32m+[0m [0m{
              [32m+[0m [0mcidr_blocks      = [
                  [32m+[0m [0m"0.0.0.0/0",
                ]
              [32m+[0m [0mdescription      = "HTTPS from VPC"
              [32m+[0m [0mfrom_port        = 443
              [32m+[0m [0mipv6_cidr_blocks = []
              [32m+[0m [0mprefix_list_ids  = []
              [32m+[0m [0mprotocol         = "tcp"
              [32m+[0m [0msecurity_groups  = []
              [32m+[0m [0mself             = false
              [32m+[0m [0mto_port          = 443
            },
          [32m+[0m [0m{
              [32m+[0m [0mcidr_blocks      = [
                  [32m+[0m [0m"0.0.0.0/0",
                ]
              [32m+[0m [0mdescription      = "Shell from VPC"
              [32m+[0m [0mfrom_port        = 22
              [32m+[0m [0mipv6_cidr_blocks = []
              [32m+[0m [0mprefix_list_ids  = []
              [32m+[0m [0mprotocol         = "tcp"
              [32m+[0m [0msecurity_groups  = []
              [32m+[0m [0mself             = false
              [32m+[0m [0mto_port          = 22
            },
        ]
      [32m+[0m [0m[1m[0mname[0m[0m                   = "terraform-instance"
      [32m+[0m [0m[1m[0mname_prefix[0m[0m            = (known after apply)
      [32m+[0m [0m[1m[0mowner_id[0m[0m               = (known after apply)
      [32m+[0m [0m[1m[0mrevoke_rules_on_delete[0m[0m = false
      [32m+[0m [0m[1m[0mtags_all[0m[0m               = (known after apply)
      [32m+[0m [0m[1m[0mvpc_id[0m[0m                 = (known after apply)
    }

[0m[1mPlan:[0m 6 to add, 0 to change, 0 to destroy.
[0m[0m
[1mChanges to Outputs:[0m[0m
  [32m+[0m [0m[1m[0melb_dns_name[0m[0m = (known after apply)
  [32m+[0m [0m[1m[0minstance_ids[0m[0m = [
      [32m+[0m [0m[
          [32m+[0m [0m(known after apply),
        ],
    ]
[0m[1maws_security_group.elb: Creating...[0m[0m
[0m[1maws_security_group.instance: Creating...[0m[0m
[0m[1maws_security_group.instance: Creation complete after 4s [id=sg-0e22631798872aff8][0m
[0m[1maws_security_group.elb: Creation complete after 5s [id=sg-0d9f0927d4419b8ea][0m
[0m[1maws_elb.timeisweb: Creating...[0m[0m
[0m[1maws_instance.web[0]: Creating...[0m[0m
[0m[1maws_launch_configuration.timeisweb: Creating...[0m[0m
[0m[1maws_launch_configuration.timeisweb: Creation complete after 2s [id=terraform-20210623142616805800000001][0m
[0m[1maws_elb.timeisweb: Creation complete after 7s [id=app-timeisweb][0m
[0m[1maws_autoscaling_group.timeisweb: Creating...[0m[0m
[0m[1maws_instance.web[0]: Still creating... [10s elapsed][0m[0m
[0m[1maws_autoscaling_group.timeisweb: Still creating... [10s elapsed][0m[0m
[0m[1maws_instance.web[0]: Still creating... [20s elapsed][0m[0m
[0m[1maws_instance.web[0]: Creation complete after 27s [id=i-0d9aa067e02d1a1e1][0m
[0m[1maws_autoscaling_group.timeisweb: Still creating... [20s elapsed][0m[0m
[0m[1maws_autoscaling_group.timeisweb: Still creating... [30s elapsed][0m[0m
[0m[1maws_autoscaling_group.timeisweb: Still creating... [40s elapsed][0m[0m
[0m[1maws_autoscaling_group.timeisweb: Creation complete after 44s [id=terraform-20210623142624650600000002][0m
[0m[1m[32m
Apply complete! Resources: 6 added, 0 changed, 0 destroyed.
[0m[0m[1m[32m
Outputs:

[0melb_dns_name = "app-timeisweb-453032960.eu-west-2.elb.amazonaws.com"
instance_ids = [
  [
    "18.169.105.172",
  ],
]
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Ansible)
[Pipeline] retry
[Pipeline] {
[Pipeline] sh
+ ansible-playbook ansible/static-site/site.yaml -u ubuntu

PLAY [Provision Web Servers] ***************************************************

TASK [Gathering Facts] *********************************************************
ok: [ec2-35-176-63-34.eu-west-2.compute.amazonaws.com]
ok: [ec2-35-176-3-9.eu-west-2.compute.amazonaws.com]
ok: [ec2-18-169-105-172.eu-west-2.compute.amazonaws.com]

TASK [Install pip3] ************************************************************
changed: [ec2-35-176-3-9.eu-west-2.compute.amazonaws.com]
changed: [ec2-35-176-63-34.eu-west-2.compute.amazonaws.com]
changed: [ec2-18-169-105-172.eu-west-2.compute.amazonaws.com]

TASK [Install python docker sdk] ***********************************************
changed: [ec2-35-176-3-9.eu-west-2.compute.amazonaws.com]
changed: [ec2-18-169-105-172.eu-west-2.compute.amazonaws.com]
changed: [ec2-35-176-63-34.eu-west-2.compute.amazonaws.com]

TASK [Install docker] **********************************************************
changed: [ec2-35-176-63-34.eu-west-2.compute.amazonaws.com]
changed: [ec2-35-176-3-9.eu-west-2.compute.amazonaws.com]
changed: [ec2-18-169-105-172.eu-west-2.compute.amazonaws.com]

TASK [Start Docker] ************************************************************
changed: [ec2-35-176-63-34.eu-west-2.compute.amazonaws.com]
changed: [ec2-18-169-105-172.eu-west-2.compute.amazonaws.com]
changed: [ec2-35-176-3-9.eu-west-2.compute.amazonaws.com]

TASK [Run image] ***************************************************************
changed: [ec2-35-176-3-9.eu-west-2.compute.amazonaws.com]
changed: [ec2-35-176-63-34.eu-west-2.compute.amazonaws.com]
changed: [ec2-18-169-105-172.eu-west-2.compute.amazonaws.com]

PLAY RECAP *********************************************************************
ec2-18-169-105-172.eu-west-2.compute.amazonaws.com : ok=6    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ec2-35-176-3-9.eu-west-2.compute.amazonaws.com : ok=6    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ec2-35-176-63-34.eu-west-2.compute.amazonaws.com : ok=6    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

[Pipeline] }
[Pipeline] // retry
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```