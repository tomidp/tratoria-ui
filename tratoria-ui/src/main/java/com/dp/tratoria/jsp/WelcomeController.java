/*
 * Copyright 2012-2014 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.dp.tratoria.jsp;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.squareup.okhttp.HttpUrl;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import okio.BufferedSink;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Controller
public class WelcomeController {

    private static final Logger log = LoggerFactory.getLogger(WelcomeController.class);

	@Value("${application.message:Hello World}")
	private String message = "Hello World";

	@RequestMapping("/")
	public String welcome(Map<String, Object> model) {
		return "welcome";
	}
	
    @RequestMapping(value = "/findAll", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public List<Customer> findAll() throws Exception {
       OkHttpClient client = new OkHttpClient();
       HttpUrl route = HttpUrl.parse("http://localhost:8080/api/tratoria/customers");
       Request request = new Request.Builder().url(route).build();
       Response response = client.newCall(request).execute();
       
       ObjectMapper mapper = new ObjectMapper();
       List<Customer> obj = new ArrayList<Customer>();
       log.info("Find All UI");
       log.info(response.body().toString());
       obj = mapper.readValue(response.body().string(), List.class);
       
       return obj;
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public Customer submit(@RequestBody Customer customer) throws Exception {
        OkHttpClient client = new OkHttpClient();
        HttpUrl route = HttpUrl.parse("http://localhost:8080/api/tratoria/customers");
        com.squareup.okhttp.MediaType mediaType = com.squareup.okhttp.MediaType.parse("application/json; charset=utf-8");

        ObjectMapper mapper = new ObjectMapper();
        com.squareup.okhttp.RequestBody body = com.squareup.okhttp.RequestBody.create(mediaType, mapper.writeValueAsString(customer));
        Request request = new Request.Builder().url(route).post(body).build();
        Response response = client.newCall(request).execute();

        Customer result = new Customer();
        ObjectMapper mapper2 = new ObjectMapper();
        result = mapper2.readValue(response.body().string(), Customer.class);
        return result;
    }
}
