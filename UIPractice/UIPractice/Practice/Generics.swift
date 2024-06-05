//
//  Generics.swift
//  UIPractice
//
//  Created by Nazmul Haque Nahin on 27/5/24.
//

import SwiftUI

// data model
struct StringModel{
    let info: String?
    
    func removeInfo() -> StringModel{
        return StringModel(info: nil)
    }
}

// data model
struct BoolModel{
    let info: Bool?
    
    func removeInfo() -> BoolModel{
        return BoolModel(info: nil)
    }
}


struct GenericModel<AnyType>{
    let info : AnyType?
    
    func removeInfo() -> GenericModel{
        return GenericModel(info: nil)
    }
}


//struct


class GenericsViewModel: ObservableObject{
    
    @Published var stringModel = GenericModel(info: "Hello world")
    @Published var boolModel = GenericModel(info: true)
   
    
    func removeData(){
        stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()
    }
    
    
    
}







struct Generics: View {
    // observable object theke observed korbeee tai ei 
    // type add korte hoise
    @ObservedObject var vm = GenericsViewModel()
    
    
    
    var body: some View {
        VStack{
            HStack{
                Text(vm.stringModel.info ?? "No Data")
                    .onTapGesture {
                        vm.removeData()
                       
                    }
                Text(vm.boolModel.info?.description ?? "false")
                    .onTapGesture {
                        vm.removeData()
                       
                    }
            }
            
           
        }
    }
}

#Preview {
    Generics()
}
