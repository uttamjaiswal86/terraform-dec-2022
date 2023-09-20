resource "local_file" "filenew" {
  count = "5"
  filename="/tmp/hello-file-uk_${count.index}.txt"
  content="Hello Data"
}
