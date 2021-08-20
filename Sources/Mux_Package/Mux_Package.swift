import UIKit
struct Mux_Package {
    var text = "Hello, World!"
    
    public init() {
        
    }
    
    public func start_Streaminng() -> String {
        return ""
    }
    
    public func stop_Streaminng() -> String {
        return ""
    }

    public func call_Streaminng() {
        let params = ["playback_policy":"public", "new_asset_settings":["playback_policy":"public",]] as Dictionary<String, AnyObject>
        
        let username = "3c942eb3-d47b-4e74-8680-83b9c24dac51"
        let password = "mxvVn2sFiu9nuvmMyxDntqQsFT3HaZP1a5+DRQeKqs/9idK5Jb80HXhQtgTgOcMwKGFD5P+g2fS"
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        var request = URLRequest(url: URL(string: "https://api.mux.com/video/v1/live-streams")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("['public']", forHTTPHeaderField: "playback_policy")
        request.addValue("['public']", forHTTPHeaderField: "new_asset_settings")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
            } catch {
                print("error")
            }
        })

        task.resume()

    }

}
