package DevOpsDemo;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class GithubRateLimitDemo {
    public static void main(String[] args) {
            // Your GitHub personal access token
            String accessToken = "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";

            // The GitHub organization or user where you want to create repositories
            String organization = "riyapulusuganti"; // Replace with your organization or username

            // Base URL for the GitHub API
            String baseUrl = "https://api.github.com/user/repos";

            // Number of repositories to create
            int numRepositories = 50000;

            int rateLimitRemaining = 5000;
            long rateLimitReset = 0;
            int counter = 0;
            boolean isLastResponse403 = false;

            for (int i = 40000; i <= numRepositories; i++) {
                counter++;
                if(counter > 5){
                    counter = 0;
                    try {
                            Thread.sleep(30000);
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                }


                if (rateLimitRemaining <= 0 || isLastResponse403) {
                	System.out.println("Rate Limit occurred: There is no remaining requests to hit.");
                    if (rateLimitReset > System.currentTimeMillis()) {
                        long sleepTime = rateLimitReset - System.currentTimeMillis();
                        System.out.println(i + " : Going to wait for Riya: "+ sleepTime);
                        try {
                            Thread.sleep(sleepTime);
                            isLastResponse403 = false;
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                }

                String repoName = "TestRepo" + i; // Change the naming convention as needed
               // String repoUrl = baseUrl + "/orgs/" + organization + "/repos";
                String jsonInputString = "{\"name\": \"" + repoName + "\", \"auto_init\": true}";

                try {
                    URL url = new URL(baseUrl);
                    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                    connection.setRequestMethod("POST");
                    connection.setRequestProperty("Authorization", "token " + accessToken);
                    connection.setRequestProperty("Content-Type", "application/json");
                    connection.setRequestProperty("Accept", "application/vnd.github.v3+json");
                    connection.setDoOutput(true);

                    try (OutputStream os = connection.getOutputStream()) {
                        byte[] input = jsonInputString.getBytes("utf-8");
                        os.write(input, 0, input.length);
                    }

                    int responseCode = connection.getResponseCode();
                    if(responseCode == 403) {
                    	isLastResponse403 = true;
                    }
                    System.out.println("Headers: "+ connection.getHeaderFields().toString());
                    rateLimitRemaining = Integer.parseInt(connection.getHeaderField("X-RateLimit-Remaining"));
                    System.out.println("Remaining number of request to hit: "+ rateLimitRemaining);
                    
                    rateLimitReset = Long.parseLong(connection.getHeaderField("X-RateLimit-Reset") + "000");
                    System.out.println("Current Timestamp: "+ System.currentTimeMillis());
                    System.out.println("Rate limit reset time: "+ rateLimitReset);

                    if (responseCode == 201) {
                        System.out.println("Repository \"" + repoName + "\" created successfully.");
                    } else {
                        System.out.println("Failed to create repository \"" + repoName + "\". Status Code: " + responseCode);
                    }

//                    if (i % 100 == 0) {
//                        System.out.println("Created " + i + " repositories.");
//                    }

                    connection.disconnect();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            System.out.println("Finished creating repositories.");
        }
    }