resource "local_file" "robochef_web1" {
  filename = "/tmp/hello.txt"
  content = "Hello World"
}
