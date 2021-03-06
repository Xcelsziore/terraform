# Template for initial configuration bash script
data "template_file" "init" {
  template = "${file("init.tpl")}"
  vars = {
    consul_address = "${aws_instance.consul.private_ip}"
  }
}

# Create a web server sample test for testing purposes
resource "aws_instance" "web" {
  # ...

  user_data = "${data.template_file.init.rendered}"
}
