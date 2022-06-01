class WeatherForecast {
  dynamic queryCost;
  dynamic latitude;
  dynamic longitude;
  String? resolvedAddress;
  String? address;
  String? timezone;
  dynamic tzoffset;
  List<Days>? days;
  Stations? stations;

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    queryCost = json['queryCost'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    resolvedAddress = json['resolvedAddress'];
    address = json['address'];
    timezone = json['timezone'];
    tzoffset = json['tzoffset'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(Days.fromJson(v));
      });
    }
    stations =
        json['stations'] != null ? Stations.fromJson(json['stations']) : null;
  }
}

class Days {
  String? datetime;
  dynamic datetimeEpoch;
  dynamic tempmax;
  dynamic tempmin;
  dynamic temp;
  dynamic feelslikemax;
  dynamic feelslikemin;
  dynamic feelslike;
  dynamic dew;
  dynamic humidity;
  dynamic precip;
  dynamic precipprob;
  dynamic precipcover;
  List<String>? preciptype;
  dynamic snow;
  dynamic snowdepth;
  dynamic windgust;
  dynamic windspeed;
  dynamic winddir;
  dynamic pressure;
  dynamic cloudcover;
  dynamic visibility;
  dynamic solarradiation;
  dynamic solarenergy;
  dynamic uvindex;
  dynamic severerisk;
  String? sunrise;
  dynamic sunriseEpoch;
  String? sunset;
  dynamic sunsetEpoch;
  dynamic moonphase;
  String? conditions;
  String? description;
  String? icon;
  List<String>? stations;
  String? source;
  List<Hours>? hours;

  Days.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    tempmax = json['tempmax'];
    tempmin = json['tempmin'];
    temp = json['temp'];
    feelslikemax = json['feelslikemax'];
    feelslikemin = json['feelslikemin'];
    feelslike = json['feelslike'];
    dew = json['dew'];
    humidity = json['humidity'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    precipcover = json['precipcover'];
    preciptype =
        json['preciptype'] != null ? json['preciptype'].cast<String>() : null;
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    cloudcover = json['cloudcover'];
    visibility = json['visibility'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    severerisk = json['severerisk'];
    sunrise = json['sunrise'];
    sunriseEpoch = json['sunriseEpoch'];
    sunset = json['sunset'];
    sunsetEpoch = json['sunsetEpoch'];
    moonphase = json['moonphase'];
    conditions = json['conditions'];
    description = json['description'];
    icon = json['icon'];
    stations =
        json['stations'] != null ? json['stations'].cast<String>() : null;
    source = json['source'];
    if (json['hours'] != null) {
      hours = <Hours>[];
      json['hours'].forEach((v) {
        hours!.add(Hours.fromJson(v));
      });
    }
  }
}

class Hours {
  String? datetime;
  dynamic datetimeEpoch;
  dynamic temp;
  dynamic feelslike;
  dynamic humidity;
  dynamic dew;
  dynamic precip;
  dynamic precipprob;
  dynamic snow;
  dynamic snowdepth;
  List<String>? preciptype;
  dynamic windgust;
  dynamic windspeed;
  dynamic winddir;
  dynamic pressure;
  dynamic visibility;
  dynamic cloudcover;
  dynamic solarradiation;
  dynamic solarenergy;
  dynamic uvindex;
  dynamic severerisk;
  String? conditions;
  String? icon;
  List<String>? stations;
  String? source;

  Hours.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    temp = json['temp'];
    feelslike = json['feelslike'];
    humidity = json['humidity'];
    dew = json['dew'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    preciptype =
        json['preciptype'] != null ? json['preciptype'].cast<String>() : null;
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    visibility = json['visibility'];
    cloudcover = json['cloudcover'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    severerisk = json['severerisk'];
    conditions = json['conditions'];
    icon = json['icon'];
    stations =
        json['stations'] != null ? json['stations'].cast<String>() : null;
    source = json['source'];
  }
}

class Stations {
  KHWO? kHWO;
  KFLL? kFLL;
  KFLL? kMIA;
  KFLL? kOPF;
  KFLL? kTMB;
  KFLL? kHST;

  Stations.fromJson(Map<String, dynamic> json) {
    kHWO = json['KHWO'] != null ? KHWO.fromJson(json['KHWO']) : null;
    kFLL = json['KFLL'] != null ? KFLL.fromJson(json['KFLL']) : null;
    kMIA = json['KMIA'] != null ? KFLL.fromJson(json['KMIA']) : null;
    kOPF = json['KOPF'] != null ? KFLL.fromJson(json['KOPF']) : null;
    kTMB = json['KTMB'] != null ? KFLL.fromJson(json['KTMB']) : null;
    kHST = json['KHST'] != null ? KFLL.fromJson(json['KHST']) : null;
  }
}

class KHWO {
  dynamic distance;
  dynamic latitude;
  dynamic longitude;
  dynamic useCount;
  String? id;
  String? name;
  dynamic quality;
  dynamic contribution;

  KHWO.fromJson(Map<String, dynamic> json) {
    distance = json['distance'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    useCount = json['useCount'];
    id = json['id'];
    name = json['name'];
    quality = json['quality'];
    contribution = json['contribution'];
  }
}

class KFLL {
  dynamic distance;
  dynamic latitude;
  dynamic longitude;
  dynamic useCount;
  String? id;
  String? name;
  dynamic quality;
  dynamic contribution;

  KFLL.fromJson(Map<String, dynamic> json) {
    distance = json['distance'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    useCount = json['useCount'];
    id = json['id'];
    name = json['name'];
    quality = json['quality'];
    contribution = json['contribution'];
  }
}
