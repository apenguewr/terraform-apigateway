resource "aws_api_gateway_rest_api" "apengue2-api" {
  name        = "apengue2-api-gateway"
  description = "Proxy to handle requests to our API"
}
resource "aws_api_gateway_resource" "apengue2-resource" {
  rest_api_id = "${aws_api_gateway_rest_api.apengue2-api.id}"
  parent_id   = "${aws_api_gateway_rest_api.apengue2-api.root_resource_id}"
  path_part   = "apengue2-resource"

}
resource "aws_api_gateway_method" "apengue2-method" {
  rest_api_id   = "${aws_api_gateway_rest_api.apengue2-api.id}"
  resource_id   = "${aws_api_gateway_resource.apengue2-resource.id}"
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "apengue2-integration" {
  rest_api_id = "${aws_api_gateway_rest_api.apengue2-api.id}"
  resource_id = "${aws_api_gateway_resource.apengue2-resource.id}"
  http_method = "${aws_api_gateway_method.apengue2-method.http_method}"
  type                    = "HTTP"
  uri                     = "http://www.google.com"
  integration_http_method = "GET"
  }

resource "aws_api_gateway_integration_response" "apengue2-integration-response" {
  rest_api_id = "${aws_api_gateway_rest_api.apengue2-api.id}"
  resource_id = "${aws_api_gateway_resource.apengue2-resource.id}"
  http_method = "${aws_api_gateway_method.apengue2-method.http_method}"
  status_code = "200"  
  response_templates = {
    "application/json" = ""
  }
}
