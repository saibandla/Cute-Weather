import bb.cascades 1.0

Container {
    id:dayC
    preferredHeight: 350
    preferredWidth: 410
    property string date_lable;
    property string temp_label;
    property string forecasting_img
    
    
    layout: AbsoluteLayout {
        
    }
    Container {
        layoutProperties: AbsoluteLayoutProperties {
            positionX: 0
            positionY: 0
        }
        ImageView {
            imageSource: "asset:///drawable/results_background.9.png"
            preferredHeight: 350
            preferredWidth: 410
        }
    }
    Container {
        layoutProperties: AbsoluteLayoutProperties {
            positionX: 120
            positionY: 50
        }
        horizontalAlignment: HorizontalAlignment.Center
        Label {
            id: day_month
            textStyle.fontSize: FontSize.PointValue
            textStyle.color: Color.White
            text: date_lable//"27.12 Tues"
            textStyle.fontSizeValue: 9
            textStyle.fontWeight: FontWeight.W500
        }
        
            
           
       
    
    }
    Container {
        layoutProperties: AbsoluteLayoutProperties {
            positionX: 170
            positionY: 150
        } 
            
        ImageView {
            
            
            imageSource: forecasting_img
            preferredWidth: 100
            preferredHeight: 100
        }
    }
    Container {
        layoutProperties: AbsoluteLayoutProperties {
            positionX: 15
            positionY: 250
        }
        Label {
            text: temp_label//"20°C    30°C"
            textStyle.color: Color.White
            textStyle.fontSize: FontSize.PointValue
            textStyle.fontSizeValue: 10
            textStyle.fontWeight: FontWeight.W500
        }
    }
    
}