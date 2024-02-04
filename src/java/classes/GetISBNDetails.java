/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author KAMAKSHI
 */
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;
public class GetISBNDetails {
	public final static String URL = "https://www.googleapis.com/books/v1/volumes";
	private final static String USER_AGENT = "Chrome";

	public static String verify(String ISBN) throws IOException {
            System.out.println(ISBN);
            String url=URL;
		if (ISBN == null || "".equals(ISBN)) {
			return "";
		}
		try{
                //url+=ISBN;
		URL obj = new URL(url+"?q=isbn:"+ISBN);
		HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
                System.out.println("connection opened for GoogleBooksAPI");
		// add request header
                con.setRequestMethod("GET");
		//con.setRequestProperty("User-Agent", USER_AGENT);
		//con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

		String getParams = "q=isbn:"+ISBN ;

		// Send post request
		/*con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(postParams);
		wr.flush();
		wr.close();*/
		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'GET' request to URL : " + url);
		System.out.println("parameters : " + getParams);
		System.out.println("Response Code : " + responseCode);
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
                System.out.println("Response in string:-");
		// print result
		System.out.println(response.toString());
		//parse JSON response and return 'success' value
		/*JsonReader jsonReader = Json.createReader(new StringReader(response.toString()));
		JsonObject jsonObject = jsonReader.readObject();
		jsonReader.close();
		System.out.println(jsonObject.getJsonArray("items"));
                JsonArray ar=jsonObject.getJsonArray("items");
                Object[] arr=ar.toArray();
                for(int i=0;i<arr.length;i++)
                {
                    System.out.println("array object"+arr[i]);
                }*/
		return response.toString();
		}catch(Exception e){
                    System.out.println("exception aa gayi GetISBNDetails.java mein");
                        System.out.println(e);
			return "";
		}
	}
}
