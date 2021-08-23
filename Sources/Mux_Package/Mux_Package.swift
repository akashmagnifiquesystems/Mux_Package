import UIKit

public struct Mux_Package {

    let authUserName: String = "3c942eb3-d47b-4e74-8680-83b9c24dac51"
    let authPassword: String = "mxvVn2sFiu9nuvmMyxDntqQsFT3HaZP1a5+DRQeKqs/9idK5Jb80HXhQtgTgOcMwKGFD5P+g2fS"
    let baseURL: String = "https://api.mux.com/video/v1/live-streams"
    let apiCallHelper = API_Call_Helper()
    public init() {
        
    }
    
    //MARK:- Create Live Streaming
    public func call_Create_Live_Streaming(completion: @escaping (NSDictionary) -> Void) {
        apiCallHelper.call_Create_Live_Streaming { response in
            completion(response)
        }
    }

    //MARK:- List Live Streaming
    public func call_List_Live_Streaming(Live_Stream_ID : String, completion: @escaping (NSDictionary) -> Void) {
        
        let loginString = String(format: "%@:%@", authUserName, authPassword)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        var request = URLRequest(url: URL(string: "\(self.baseURL)")!)
        request.httpMethod = "GET"
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
    
    //MARK:- Retrive Live Streaming
    public func call_Retrive_Streaming(Live_Stream_ID : String, completion: @escaping (NSDictionary) -> Void) {
        
        let loginString = String(format: "%@:%@", authUserName, authPassword)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        var request = URLRequest(url: URL(string: "\(self.baseURL)/\(Live_Stream_ID)")!)
        request.httpMethod = "GET"
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
    
    //MARK:- Complete Live Streaming
    public func call_Complete_Streaming(Live_Stream_ID : String, completion: @escaping (NSDictionary) -> Void) {
        let params = [:] as Dictionary<String, AnyObject>
        
        let loginString = String(format: "%@:%@", authUserName, authPassword)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        var request = URLRequest(url: URL(string: "\(self.baseURL)/\(Live_Stream_ID)/complete")!)
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
    
    //MARK:- Restart Live Streaming
    public func call_Restart_Streaming(Live_Stream_ID : String, completion: @escaping (NSDictionary) -> Void) {
        let params = [:] as Dictionary<String, AnyObject>
        
        let loginString = String(format: "%@:%@", authUserName, authPassword)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        var request = URLRequest(url: URL(string: "\(self.baseURL)/\(Live_Stream_ID)/enable")!)
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
    //MARK:- Stop Live Streaming
    public func call_Disable_Streaming(Live_Stream_ID : String, completion: @escaping (NSDictionary) -> Void) {
        let params = [:] as Dictionary<String, AnyObject>
        
        let loginString = String(format: "%@:%@", authUserName, authPassword)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        var request = URLRequest(url: URL(string: "\(self.baseURL)/\(Live_Stream_ID)/disable")!)
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
