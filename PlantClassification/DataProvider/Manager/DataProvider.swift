//
//  DataProvider.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 14.03.2024.
//

#if DEBUG
let apiDataProvider = APIDataProvider(interceptor: APIRequestInterceptor.shared,
                                      eventMonitors: [APILogger.shared])
#else
let apiDataProvider = APIDataProvider(interceptor: APIRequestInterceptor.shared,
                                      eventMonitors: [])
#endif

