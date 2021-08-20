import UIKit
public struct Mux_Package {

    let authUserName: String = "3c942eb3-d47b-4e74-8680-83b9c24dac51"
    let authPassword: String = "mxvVn2sFiu9nuvmMyxDntqQsFT3HaZP1a5+DRQeKqs/9idK5Jb80HXhQtgTgOcMwKGFD5P+g2fS"

    public init() {
        
    }
    
    //MARK:- Start Live Streaming
    public func call_Start_Streaming(completion: @escaping (NSDictionary) -> Void) {
        let params = ["playback_policy":"public", "new_asset_settings":["playback_policy":"public",]] as Dictionary<String, AnyObject>
        
        let loginString = String(format: "%@:%@", authUserName, authPassword)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        var request = URLRequest(url: URL(string: "https://api.mux.com/video/v1/live-streams")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
                completion(json as NSDictionary)
            } catch {
                print("error")
            }
        })

        task.resume()
    }

    //MARK:- Restrive Live Streaming
    public func call_Retrive_Streaming(LIVE_STREAM_ID : String, completion: @escaping (NSDictionary) -> Void) {
        let params = [:] as Dictionary<String, AnyObject>
        
        let loginString = String(format: "%@:%@", authUserName, authPassword)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        var request = URLRequest(url: URL(string: "https://api.mux.com/video/v1/live-streams/\(LIVE_STREAM_ID)")!)
        request.httpMethod = "GET"
//        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
                completion(json as NSDictionary)
            } catch {
                print("error")
            }
        })
        task.resume()
    }
    
    //MARK:- Stop Live Streaming
    public func call_Disable_Streaming(LIVE_STREAM_ID : String, completion: @escaping (NSDictionary) -> Void) {
        let params = [:] as Dictionary<String, AnyObject>
        
        let loginString = String(format: "%@:%@", authUserName, authPassword)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        var request = URLRequest(url: URL(string: "https://api.mux.com/video/v1/live-streams/\(LIVE_STREAM_ID)/disable")!)
        request.httpMethod = "PUT"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
                completion(json as NSDictionary)
            } catch {
                print("error")
            }
        })
        task.resume()
    }

}
