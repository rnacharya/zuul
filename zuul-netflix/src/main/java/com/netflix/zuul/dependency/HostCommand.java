package com.netflix.zuul.dependency;

import com.netflix.config.DynamicPropertyFactory;
import com.netflix.hystrix.HystrixCommand;
import com.netflix.hystrix.HystrixCommandGroupKey;
import com.netflix.hystrix.HystrixCommandKey;
import com.netflix.hystrix.HystrixCommandProperties;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;

import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: mcohen
 * Date: 2/6/12
 * Time: 4:30 PM
 * To change this template use File | Settings | File Templates.
 */
public class HostCommand extends HystrixCommand<HttpResponse> {

    HttpClient httpclient;
    HttpHost httpHost;
    HttpRequest httpRequest;

    public HostCommand(HttpClient httpclient, HttpHost httpHost, HttpRequest httpRequest) {
        this("defaul", httpclient, httpHost, httpRequest);
    }
        public HostCommand(String commandKey,HttpClient httpclient, HttpHost httpHost, HttpRequest httpRequest) {

        super(Setter
                .withGroupKey(HystrixCommandGroupKey.Factory.asKey(commandKey))
                .andCommandPropertiesDefaults(
                        // we want to default to semaphore-isolation since this wraps
                        // 2 others commands that are already thread isolated
                        HystrixCommandProperties.Setter()
                                .withExecutionIsolationStrategy(HystrixCommandProperties.ExecutionIsolationStrategy.SEMAPHORE)
                                .withExecutionIsolationSemaphoreMaxConcurrentRequests(DynamicPropertyFactory.getInstance().
                                        getIntProperty("zuul.httpClient." + commandKey + ".semaphore.maxSemaphores", 100).get())));

        this.httpclient = httpclient;
        this.httpHost = httpHost;
        this.httpRequest = httpRequest;
    }

    @Override
    protected HttpResponse run() throws Exception {
        try {
            return httpProxy();
        } catch (IOException e) {
            throw e;
        }
    }

    HttpResponse httpProxy() throws IOException {
        return httpclient.execute(httpHost, httpRequest);
    }


}