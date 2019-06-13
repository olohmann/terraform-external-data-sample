data "external" "aad_oliver" {
  program = ["bash", "query_aad.sh"]
  query = {
    userid = "oliverlo@microsoft.com"
  }
}

output "oliver_object_id" {
 value = "${data.external.aad_oliver.result.objectId}"
}
