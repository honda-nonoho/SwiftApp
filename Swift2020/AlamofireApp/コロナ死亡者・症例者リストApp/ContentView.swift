//
//  ContentView.swift
//  AlamoApp
//
//  Created by nonoho.honda on 2020/06/14.
//  Copyright © 2020 nonoho.honda. All rights reserved.
//
import SwiftUI
import Alamofire
import SwiftyJSON

struct ContentView: View {
    @ObservedObject var obs = observer()
    
    var body: some View {
        
        VStack {
            Text("新型コロナ都道府県別死者・症例数")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            VStack {
                
                VStack{
                    List(obs.datas){
                        i in
                        HStack{
                            Text(i.name_ja).frame(width: 70, alignment: .leading)
                            Text("死者: \(i.deaths)人").frame(width: 120, alignment:.trailing)
                            Text("症例: \(i.cases)人").frame(width: 150, alignment: .trailing)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct datatype: Identifiable{
    var id : String
    var name_ja: String
    var deaths: Int
    var cases: Int
}

class observer : ObservableObject{
    @Published var datas = [datatype]()
    init(){
        AF.request("https://covid19-japan-web-api.now.sh/api//v1/prefectures")
            .responseJSON { response in
                switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    for(key,subJson):(String, JSON) in json{
                        debugPrint("============================")
                        debugPrint(subJson["name_ja"])
                        debugPrint("============================")
                        debugPrint("key: \(key) subJson: \(subJson)")
                        self.datas.append(datatype(
                            id: key,
                            name_ja:subJson["name_ja"].stringValue,
                            deaths:subJson["deaths"].intValue,
                            cases:subJson["cases"].intValue))
                    }
                case .failure(let error):
                    debugPrint(error)
                }
        }
    }
}

