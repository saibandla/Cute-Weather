import bb.cascades 1.2


Page {
    
    
    
    
    Container {
        preferredHeight:1280
        preferredWidth: 768
        layout: AbsoluteLayout {
        
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 0
                positionY: 0
            }
            ImageView {
                preferredHeight: 1280
                preferredWidth: 768
                imageSource:"asset:///drawable/n5.jpg" 
            }
        }
        Container {
            background: Color.Black
            
            preferredHeight: 70
            preferredWidth: 768
            Label {
                text: "show values"
                textStyle.fontSize: FontSize.PointValue
                textStyle.fontSizeValue: 9
                textStyle.color: Color.White
                textStyle.fontWeight: FontWeight.W500
            }    
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 50
                positionY: 150
            }
            opacity: 1.0
            Label {
                text: "InChes"
                textStyle.fontSize: FontSize.PointValue
                textStyle.fontSizeValue: 12
                textStyle.color: Color.create("#FFFFFF")
                textStyle.fontWeight: FontWeight.W500
            }
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 600
                positionY: 160
            }
            CheckBox {
                id: inche
                checked:app.getValues("inches","")=="true"?true:false 
                onCheckedChanged: {
                    navigationPane.inches(checked)
                }
            }
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 0
                positionY: 230
            }
            preferredHeight: 5
            preferredWidth: 768
            background: Color.White
        } 
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 50
                positionY: 260
            }
            opacity: 1.0
            Label {
                text: "Fahrenheit"
                textStyle.fontSize: FontSize.PointValue
                textStyle.fontSizeValue: 12
                textStyle.color: Color.create("#FFFFFF")
                
                textStyle.fontWeight: FontWeight.W500
            }
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 600
                positionY: 270
            }
            CheckBox {
                id: fouren
                checked: app.getValues("faurenheat","")=="true"?true:false 
                onCheckedChanged: {
                    navigationPane.faurenheat(checked)
                }
            }
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 0
                positionY: 350
            }
            preferredHeight: 5
            preferredWidth: 768
            background: Color.White
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 50
                positionY: 380
            }
            opacity: 1.0
            Label {
                text: "Miles per hour"
                textStyle.fontSize: FontSize.PointValue
                textStyle.fontSizeValue: 12
                textStyle.color: Color.create("#FFFFFF")
                
                textStyle.fontWeight: FontWeight.W500
            }
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 600
                positionY: 390
            }
            CheckBox {
                id: mph
                checked: app.getValues("mph","")=="true"?true:false 
                onCheckedChanged: {
                if(checked)
                {
                    app.saveValues("mph","true");
                }
                else 
                {
                    app.saveValues("mph","false");
                }
                }
            }
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 0
                positionY: 470
            }
            preferredHeight: 5
            preferredWidth: 768
            background: Color.White
        }   
    
    
    }
    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            onTriggered: {
                
                navigationPane.pop()
                navigationPane.backButtonsVisible=false 
            }
        }
    
    }
}