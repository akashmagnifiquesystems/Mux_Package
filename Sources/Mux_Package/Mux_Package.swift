import UIKit

public struct Mux_Package {
    
    let apiCallHelper = API_Call_Helper()
    
    public init() {
        
    }
    
    //MARK:- Create Live Streaming
    public func createLiveStreamingCall(completion: @escaping (NSDictionary) -> Void) {
        apiCallHelper.call_Create_Live_Streaming { response in
            completion(response)
        }
    }
    
    //MARK:- List of Live Streaming
    public func getLiveStreamingListCall(Live_Stream_ID : String, completion: @escaping (NSDictionary) -> Void) {
        apiCallHelper.call_List_Live_Streaming(Live_Stream_ID: Live_Stream_ID) { response in
            completion(response)
        }
    }
    
    //MARK:- Retrive Live Streaming
    public func getRetriveStreamingCall(Live_Stream_ID : String, completion: @escaping (NSDictionary) -> Void) {
        apiCallHelper.call_Retrive_Streaming(Live_Stream_ID: Live_Stream_ID) { response in
            completion(response)
        }
    }
    
    //MARK:- Complete Live Streaming
    public func completeStreamingCall(Live_Stream_ID : String, completion: @escaping (NSDictionary) -> Void) {
        apiCallHelper.call_Complete_Streaming(Live_Stream_ID: Live_Stream_ID) { response in
            completion(response)
        }
    }
    
    //MARK:- Reconnect Live Streaming
    public func restartStreamingCall(Live_Stream_ID : String, completion: @escaping (NSDictionary) -> Void) {
        apiCallHelper.call_Restart_Streaming(Live_Stream_ID: Live_Stream_ID) { response in
            completion(response)
        }
    }
    
    //MARK:- Stop Live Streaming
    public func disableStreamingCall(Live_Stream_ID : String, completion: @escaping (NSDictionary) -> Void) {
        apiCallHelper.call_Disable_Streaming(Live_Stream_ID: Live_Stream_ID) { response in
            completion(response)
        }
    }
}
