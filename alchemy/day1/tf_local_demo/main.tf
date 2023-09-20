resource "local_file" "robochef_web" {
  filename = "/tmp/hello.txt"
  content = "Hello World"
}
