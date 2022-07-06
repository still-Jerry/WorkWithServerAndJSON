//
//  WorkWithJSON.swift
//  TryForServer
//
//  Created by Anatolich Mixaill on 06.07.2022.
//



import Foundation
struct JsonUnfo: Codable, Identifiable {
    var id: String
    var str: String
}
struct WorkWithJSONE{
//    читаем  Jsone  файл
    let FilePath = (Bundle.main.resourcePath! as NSString).appendingPathComponent("info11.json")
    func ReadJsoneFile(){
        let path=URL(fileURLWithPath: FilePath)
        var text=try! String(contentsOf: path)
//        text+="\"new\": 2"
//        guard let datatext=text.data(using: .utf8) else {
//            fatalError("Didn't convert \(text).")
////            print("Fuu")
//        }
        var str = convertToDictionary(text: text)
//        str["3"] = "efg"
        str = [
            "Yes-50AC-40FC-9BF0-3F46BB6A92F5": "New!",
            "Again-4785-4D8E-AB98-5FA4E00B6A66": "Value"
        ] as [String : String]
        print(str)
        if let theJSONData = try? JSONSerialization.data(withJSONObject: str,options: []) {
            
            let theJSONText = String(data: theJSONData, encoding: .ascii)
//            let FilePath = (Bundle.main.resourcePath! as NSString).appendingPathComponent("info11.json")
            let FileURL = NSURL.fileURL(withPath: FilePath)
//            let filename = getDocumentsDirectory().appendingPathComponent("NewOutput.json")
//
            do {
                try theJSONText!.write(to: FileURL, atomically: true, encoding: String.Encoding.utf8)
                print("ok")
            } catch {
                print("fail")
            }
        }
       
    }
//  записываем jsonefile
    func WriteJsoneFile(){
//        let menu = Bundle.main.decode([JsonUnfo].self, from: FilePath)
//        let file = FilePath
       
//        let menu = JSONDecoder();
//        var str = [String: String]()
//
//        for (section) in menu{
//            print(section.id, section.str)
//            str[section.id]=section.str
//
//        }

        let str = [
            "STRING-50AC-40FC-9BF0-3F46BB6A92F5": "Friday!",
            "SOMEBODY-4785-4D8E-AB98-5FA4E00B6A66": "FreeLife"
        ] as [String : String]
        
        
        if let theJSONData = try? JSONSerialization.data(withJSONObject: str,options: []) {
            
            let theJSONText = String(data: theJSONData, encoding: .ascii)
//            let FilePath = (Bundle.main.resourcePath! as NSString).appendingPathComponent("info11.json")
            let FileURL = NSURL.fileURL(withPath: FilePath)
//            let filename = getDocumentsDirectory().appendingPathComponent("NewOutput.json")
//
            do {
                try theJSONText!.write(to: FileURL, atomically: true, encoding: String.Encoding.utf8)
                print("ok")
            } catch {
                print("fail")
            }
        }
        ReadJsoneFile()
//        let decoder = JSONDecoder()
//        guard let data = try? Data(contentsOf: NSURL.fileURL(withPath: FilePath)) else {
//            fatalError("Failed to load \("info11.json") from bundle.")
//        }
//
//
//        guard let loaded = try? decoder.decode(Data.self, from: data) else {
//            fatalError("Failed to decode \("info11.json") from bundle.")
//        }

//        Ошибка тут говорит что нет значения связанного с ключём
//        декодирую для дальшнейшей обработки в  str
//        инфа читается дно не декоджируется ПОЧЕМУ ТО
//        let product = try! decoder.decode(JsonUnfo.self, from: datatext)

        
        
    }
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
//    Получаем путь к jsone файлу
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
////расширение с обработками ошибок
extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}


