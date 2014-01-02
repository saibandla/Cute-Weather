import bb.cascades 1.0
import bb.system 1.0
import "component"
NavigationPane {
    id:navigationPane
    peekEnabled: false
    backButtonsVisible: false  
    property variant data_list;

Page {
    
    id: mainPage
    Container {
        onCreationCompleted: {
            showloader()
           
                
                if(app.getValues("location","")=="")
                {
                    hideloader()
                    toast.body="No GPS Connection! Unable to get Data for your current location. Please use the search bar above."    
                    toast.show() 
                }
                else {
                    app.isNetworkAvailOnAppLaunch();
                    app.networkis.connect(loadtemp)
                    app.nonetwork.connect(nonet)
                    
                    
                    //                else 
                    //                {
                    //                    toast.body="No GPS Connection! No internet Connectivity. Please check your settings."    
                    //                    toast.show()
                    //                }
                }
            
        
        }
       layout: AbsoluteLayout {
           
       }
       Container {
           preferredHeight: 1280
           preferredWidth: 768
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 0
               positionY: 0
           }
           ImageView {
               imageSource:"asset:///drawable/lake.jpg"
               preferredHeight: maxHeight
               preferredWidth: maxWidth
           }
       }
       Container {
           preferredHeight: 400
           preferredWidth: 740
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 14
               positionY: -150
           }
           ImageView {
               imageSource:"asset:///drawable/results_background.9.png"
               preferredHeight: maxHeight
               preferredWidth: maxWidth
               opacity: 0.5
           }
       }
       Container {
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 50
               positionY: 10
           }
           TextField {
               preferredWidth: 400
               id: location
               text: app.getValues("location","")==""?"":app.getValues("location","")
               hintText: "Enter Location"
               backgroundVisible: false 
               focusAutoShow: FocusAutoShow.Default
               textStyle.color: Color.White
               textStyle.fontSize: FontSize.PointValue
               textStyle.fontSizeValue: 12
               textStyle.fontWeight: FontWeight.W500
           }
       }
       Container {
           preferredHeight: 2.3
           preferredWidth: 400
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 50
               positionY: 85
           }
           background: Color.White
       }
       Container {
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 660
               positionY: 10
           }
           ImageButton {
               preferredHeight: 80
               preferredWidth: 80
               defaultImageSource: "asset:///drawable/search_night.png"
               pressedImageSource: "asset:///drawable/search_pressed.png"
               onClicked: {
                   if(location.text!="")
                   {
                       showloader()
                       app.isNetworkAvailOnAppLaunch();
                       app.networkis.connect(loadtemp)
                       app.nonetwork.connect(nonet)
                   }
                   else {
                       toast.body="Location Not Found, Please Refine your Search!"
                       toast.show()
                       location.text=app.getValues("location","")
                   }
               }
           }
       }
       Container {
           preferredWidth: 715
           preferredHeight: 2
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 25
               positionY: 105
           }
           background: Color.Black
       }
       Container {
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 50
               positionY: 110
           }
           Label {
               id: temp_minmax
               text: ""
               textStyle.color: Color.White
               textStyle.fontSize: FontSize.PointValue
               textStyle.fontSizeValue: 11
               textStyle.fontWeight: FontWeight.W500
           }
       }
       Container {
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 680
               positionY: 120
           }
           ImageButton {
               preferredHeight: 60
               preferredWidth: 60
               defaultImageSource: "asset:///drawable/settings_night.png"
               pressedImageSource: "asset:///drawable/settings_pressed.png"
               onClicked: {
                   
                   var settingObj=settingsPage.createObject()
                   navigationPane.push(settingObj)
                   navigationPane.backButtonsVisible=true 
               }
           }
       }
       Container {
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 50
               positionY: 190
           }
           ImageView {
               preferredWidth: 35
               preferredHeight: 35
               imageSource: "asset:///drawable/drops_night.png"
               
           }
          
       }
       Container {
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 90
               positionY: 180
           }
           
           Label {
               id: rainfall
               text: ""
               textStyle.color: Color.White
               textStyle.fontSize: FontSize.PointValue
               textStyle.fontSizeValue: 8
           }
       }
       Container {
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 270
               positionY: 190
           }
           ImageView {
               preferredWidth: 35
               preferredHeight: 35
               imageSource: "asset:///drawable/cloud_night.png"
           
           }
       
       }
       Container {
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 310
               positionY: 180
           }
           
           Label {
               id: coluds
               text: ""
               textStyle.color: Color.White
               textStyle.fontSize: FontSize.PointValue
               textStyle.fontSizeValue: 8
           }
       }
       Container {
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 400
               positionY: 190
           }
           ImageView {
               preferredWidth: 35
               preferredHeight: 35
               imageSource: "asset:///drawable/pressure_night.png"
           
           }
       
       }
       Container {
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 440
               positionY: 180
           }
           
           Label {
               id:pressure
               text: ""
               textStyle.color: Color.White
               textStyle.fontSize: FontSize.PointValue
               textStyle.fontSizeValue: 8
           }
       }
       
       Container {
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 130
               positionY: 400
           }
           ImageView {
               id: forecast_img
               imageSource: "asset:///drawable/nodatan.gif"
               preferredHeight: 500
               preferredWidth: 500
               
           }
       }
       Container {
           id: loadscreen
           visible: false  
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 0
               positionY: 350
           }
           Loader {
           
           }
       }
       Container {
           layoutProperties: AbsoluteLayoutProperties {
               positionX: 0
               positionY: 950
           }
           ScrollView {
               scrollViewProperties.scrollMode: ScrollMode.Horizontal
               Container {
                   id: scroll_cntr
                   
                   layout: StackLayout {
                       orientation: LayoutOrientation.LeftToRight
                   }
               }
           }
       }
       
    }
    attachedObjects: [
        ComponentDefinition {
            id: sevendays_comp
            DayComponent {
            
            }
        },
        ComponentDefinition {
            id: settingsPage
            source: "asset:///Settings.qml"
        },
        SystemToast {
            id: toast  
        },
        ComponentDefinition {
            id:empty_cntr
            Container {
                preferredHeight: 350
                preferredWidth: 5
                background: Color.White
            }
        }
    ]
    
}
function hideloader()
{
    loadscreen.visible=false 
}
function showloader()
{
    loadscreen.visible=true 
}
function nonet()
{
    hideloader()
    app.nonetwork.disconnect(nonet);
    toast.body="No GPS Connection! No internet Connectivity. Please check your settings."    
    toast.show() 
}
function loadtemp()
{
    var locatio=location.text
    var http = new XMLHttpRequest()
    var url1 = "http://api.openweathermap.org/data/2.5/forecast/daily?q="+ locatio+"&mode=json&units=metric&cnt=6";
    console.log(url1);
    http.open("GET", url1, true);
    http.setRequestHeader("Content-Type", "application/json");
    http.onreadystatechange = function() { // Call a function when the state changes.
    if (http.readyState == 4) {
        console.log(http.statusText)
        console.log("status"+http.status)
        if (http.status == 200) {
            var response = JSON.parse(http.responseText);
            var data=response
            if(data.cod+""=="undefined"||data.cod!="404")
            {
                app.saveValues("location",location.text)
                 data_list=data.list
                var day=data_list[0].temp
                var weather=data_list[0].weather[0]
                console.log("wheather"+weather.main)
                switch (weather.main)
                {
                    case "Clear": forecast_img.imageSource="asset:///drawable/moon.gif"
                        break ;
                    case "Clouds": if(data_list[0].clouds<="50".valueOf()){forecast_img.imageSource="asset:///drawable/moonclody.gif"}else{forecast_img.imageSource="asset:///drawable/cloudy.gif"}
                        break ;
                    case "Rain": if(data_list[0].rain<="5".valueOf()){forecast_img.imageSource="asset:///drawable/moonrainy.gif"}else {forecast_img.imageSource="asset:///drawable/rain.gif"}
                        break;
                    case "Snow": if(data_list[0].snow<="5".valueOf()){forecast_img.imageSource="asset:///drawable/moonsnow.gif"}else{forecast_img.imageSource="asset:///drawable/snow.gif"}
                        break ;
                }
                var df=day.day
                if(app.getValues("faurenheat","")=="false")
                {
                    var day=data_list[0].temp
                    temp_minmax.text=day.max.toFixed(2)+"°C / "+day.min.toFixed(2)+"°C" 
                }
                else 
                {
                    var day=data_list[0].temp
                    temp_minmax.text=((day.max*1.8)+32).toFixed(2)+"°F / "+((day.min*1.8)+32).toFixed(2)+"°F"
                
                }
                if(data_list[0].rain+""=="undefined")
                {
                    rainfall.text="0.0mm"
                }
                else 
                {
                    if(app.getValues("inches","")=="false")
                    {
                        rainfall.text=data_list[0].rain+"mm"
                    }
                    else 
                    {
                        var rain=(data_list[0].rain*0.04).toFixed(1);
                        rainfall.text=rain+"in"
                    }
                }
                coluds.text=data_list[0].clouds+"%"
                pressure.text=data_list[0].pressure+"hpa"
                var empt=empty_cntr.createObject()
                scroll_cntr.removeAll()
                for(var i=0;i<data_list.length;i++)
                {
                    var empt=empty_cntr.createObject()
                    var cntr=sevendays_comp.createObject()
                    cntr.date_lable=app.dateFormat(data_list[i].dt)
                    //app.dateFormat(data_list[i].dt);
                    var weather=data_list[i].weather[0]
                    console.log("wheather"+weather.main)
                    if(i==0)
                    {
                    switch (weather.main)
                    {
                        case "Clear": cntr.forecasting_img="asset:///drawable/moon.gif"
                            break ;
                        case "Clouds": if(data_list[i].clouds<="50".valueOf()){cntr.forecasting_img="asset:///drawable/moonclody.gif"}else{cntr.forecasting_img="asset:///drawable/cloudy.gif"}
                            break ;
                        case "Rain": if(data_list[i].rain<="5".valueOf()){cntr.forecasting_img="asset:///drawable/moonrainy.gif"}else {cntr.forecasting_img="asset:///drawable/rain.gif"}
                            break;
                        case "Snow": if(data_list[i].snow<="5".valueOf()){cntr.forecasting_img="asset:///drawable/moonsnow.gif"}else{cntr.forecasting_img="asset:///drawable/snow.gif"}
                            break ;
                    }
                }
                    else 
                    {
                        switch (weather.main)
                        {
                            case "Clear": cntr.forecasting_img="asset:///drawable/sun.gif"
                                break ;
                            case "Clouds": if(data_list[i].clouds<="50".valueOf()){cntr.forecasting_img="asset:///drawable/sunnyandcloudy.gif"}else{cntr.forecasting_img="asset:///drawable/cloudy.gif"}
                                break ;
                            case "Rain": if(data_list[i].rain<="5".valueOf()){cntr.forecasting_img="asset:///drawable/sunnyrain.gif"}else {cntr.forecasting_img="asset:///drawable/rain.gif"}
                                break;
                            case "Snow": if(data_list[i].snow<="5".valueOf()){cntr.forecasting_img="asset:///drawable/sunsnow.gif"}else{cntr.forecasting_img="asset:///drawable/snow.gif"}
                                break ;
                        }
                    }
                     if(app.getValues("faurenheat","")=="false")
                {
                var day=data_list[i].temp
                cntr.temp_label=day.max.toFixed(2)+"°C / "+day.min.toFixed(2)+"°C" 
                }
                else 
                {
                    var day=data_list[i].temp
                   cntr.temp_label=((day.max*1.8)+32).toFixed(2)+"°F / "+((day.min*1.8)+32).toFixed(2)+"°F"
                      
                }
                   // cntr.temp_label=data_list[i].temp.max+"°C    "+data_list[i].temp.min+"°C"
                   
                    scroll_cntr.add(cntr)
                    scroll_cntr.add(empt)
                }
                hideloader()
                app.networkis.disconnect(loadtemp);
            }
            else {
                hideloader()
                app.networkis.disconnect(loadtemp);
                toast.body="Location Not Found, Please Refine your Search!"
                toast.show()
                location.text=app.getValues("location","")
            
            }
        }
    }
    }
    http.send();
}
function inches(data)
{
    if(data)
    {
        app.saveValues("inches","true")
        var weather=data_list[0].weather[0]
        if(data_list[0].rain+""=="undefined")
        {
            rainfall.text="0.0in"
        }
        else 
        {
            var rain=(data_list[0].rain*0.04).toFixed(1);
            rainfall.text=rain+"in"
        }
    }   
    else 
    {
        var weather=data_list[0].weather[0]
        
        app.saveValues("inches","false")
        if(data_list[0].rain+""=="undefined")
        {
            rainfall.text="0.0mm"
        }
        else 
        {
            rainfall.text=data_list[0].rain+"mm"
        }
    }
}
function  faurenheat(data)
{
    if(data)
    {
        app.saveValues("faurenheat","true")
        var day=data_list[0].temp
        temp_minmax.text=((day.max*1.8)+32).toFixed(2)+"°F / "+((day.min*1.8)+32).toFixed(2)+"°F"
    }
    else {
        app.saveValues("faurenheat","false")
        var day=data_list[0].temp
        temp_minmax.text=day.max.toFixed(2)+"°C / "+day.min.toFixed(2)+"°C"
    }
    scroll_cntr.removeAll()
                for(var i=0;i<data_list.length;i++)
                {
                    var empt=empty_cntr.createObject()
                    var cntr=sevendays_comp.createObject()
                    cntr.date_lable=app.dateFormat(data_list[i].dt)
                    //app.dateFormat(data_list[i].dt);
                    var weather=data_list[i].weather[0]
                    console.log("wheather"+weather.main)
                    if(i==0)
                    {
                    switch (weather.main)
                    {
                        case "Clear": cntr.forecasting_img="asset:///drawable/moon.gif"
                            break ;
                        case "Clouds": if(data_list[i].clouds<="50".valueOf()){cntr.forecasting_img="asset:///drawable/moonclody.gif"}else{cntr.forecasting_img="asset:///drawable/cloudy.gif"}
                            break ;
                        case "Rain": if(data_list[i].rain<="5".valueOf()){cntr.forecasting_img="asset:///drawable/moonrainy.gif"}else {cntr.forecasting_img="asset:///drawable/rain.gif"}
                            break;
                        case "Snow": if(data_list[i].snow<="5".valueOf()){cntr.forecasting_img="asset:///drawable/moonsnow.gif"}else{cntr.forecasting_img="asset:///drawable/snow.gif"}
                            break ;
                    }
                }
                    else 
                    {
                        switch (weather.main)
                        {
                            case "Clear": cntr.forecasting_img="asset:///drawable/sun.gif"
                                break ;
                            case "Clouds": if(data_list[i].clouds<="50".valueOf()){cntr.forecasting_img="asset:///drawable/sunnyandcloudy.gif"}else{cntr.forecasting_img="asset:///drawable/cloudy.gif"}
                                break ;
                            case "Rain": if(data_list[i].rain<="5".valueOf()){cntr.forecasting_img="asset:///drawable/sunnyrain.gif"}else {cntr.forecasting_img="asset:///drawable/rain.gif"}
                                break;
                            case "Snow": if(data_list[i].snow<="5".valueOf()){cntr.forecasting_img="asset:///drawable/sunsnow.gif"}else{cntr.forecasting_img="asset:///drawable/snow.gif"}
                                break ;
                        }
                    }
                     if(app.getValues("faurenheat","")=="false")
                {
                var day=data_list[i].temp
                cntr.temp_label=day.max.toFixed(2)+"°C / "+day.min.toFixed(2)+"°C" 
                }
                else 
                {
                    var day=data_list[i].temp
                   cntr.temp_label=((day.max*1.8)+32).toFixed(2)+"°F / "+((day.min*1.8)+32).toFixed(2)+"°F"
                      
                }
                   // cntr.temp_label=data_list[i].temp.max+"°C    "+data_list[i].temp.min+"°C"
                   
                    scroll_cntr.add(cntr)
                    scroll_cntr.add(empt)
                }
                
}
}