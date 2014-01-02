import bb.cascades 1.0
Container {
id: loadContainer    
preferredWidth: 768
preferredHeight: 500
background: Color.Black
Container {
    topPadding: 30
    leftPadding: 20
    Label {
        text: "Connecting to Server"
        textStyle.fontSize: FontSize.PointValue
        textStyle.fontSizeValue: 11
        textStyle.color: Color.White
    }
    
}
Container {
    
topPadding: 30
Container {
   
background: Color.White
Divider {
    preferredHeight: 10
}
}}
Container {
    topPadding: 70
    leftPadding: 20
    layout: StackLayout {
        orientation: LayoutOrientation.LeftToRight
    }
    ImageView {
        imageSource:"asset:///drawable/spin.gif"
        preferredHeight: 100
        preferredWidth: 100 
    }
    Label {
        multiline: true
        text: "This process can take a few seconds, depending on your connection speed"
        textStyle.fontSize: FontSize.PointValue
        textStyle.fontSizeValue: 8
        textStyle.color: Color.White
    }
}
Container {
    
topPadding: 50
Container {
    preferredHeight: 150
    preferredWidth: 768
    
    background: Color.White
    layout: AbsoluteLayout {
        
    }
    Container {
        layoutProperties: AbsoluteLayoutProperties {
            positionX: 200
            positionY: 30
        }
    
    Button {
        text: "Cancel"
        onClicked: {
            mainPage.hideloader()
        }
    }}
}
  }  
}

