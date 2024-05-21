//
//  AspectVGrid.swift
//  MemoryGame
//
//  Created by Nazmul Haque Nahin on 19/5/24.
//

import SwiftUI
                                // itemView behaves like view
struct AspectVGrid<Item,ItemView> : View where ItemView:View , Item:Identifiable{
    
    var items : [Item]
    var aspectRatio : CGFloat
    var content : (Item) -> ItemView
    
    
    var body: some View{
        
       GeometryReader{ geometry in
           VStack{
               let width : CGFloat = widthThatFits(
                   itemCount: items.count,
                   in: geometry.size,
                   itemAspectRatio: aspectRatio
               )
               LazyVGrid(
                   columns: [adaptiveGridItem(width: width)],spacing: 0){
                       ForEach(items){ item in
                           content(item).aspectRatio(aspectRatio,contentMode: .fit)
                       }
                   }
               Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
           }
        }
    }
    
    
    // adaptive item
    private func adaptiveGridItem(width:CGFloat) -> GridItem{
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    
    
    // make card fit and responsive to screen
    private func widthThatFits(
        itemCount:Int,
        in size: CGSize,
        itemAspectRatio : CGFloat) -> CGFloat{
            
            var columnCount = 1
            var rowCount = itemCount
            //-----------------------
          
            // do while loop
            repeat{
                let itemWidth = size.width / CGFloat(columnCount)
                let itemHeight = itemWidth / itemAspectRatio
                
                print(columnCount)
                if CGFloat(rowCount) * itemHeight < size.height{
                    // BREAK | do nothing
                    //print(columnCount)
                    break
                }
                columnCount += 1
                rowCount = (itemCount + (columnCount+1)) / columnCount
            }while columnCount < itemCount
            
            
            if columnCount > itemCount {
                columnCount = itemCount
                print(columnCount)
            }
            
            return floor(size.width/CGFloat(columnCount))
            
        }
    
    
    
    
    
    
    
    
    
    
    
    
}

