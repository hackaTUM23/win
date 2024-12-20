//
//  MockActivities.swift
//  engage-client
//
//  Created by Sandesh Sharma on 23.11.24.
//

import Foundation
import CoreLocation

struct MockActivities {
    static let activities: [Activity] = [
        Activity(
            id: 1,
            activityDesc: "Volleyball",
            time: Date(),
            locationDesc: "Städt. Sporthalle an der Auenstraße",
            locationLatLong: CLLocationCoordinate2D(latitude: 48.1170, longitude: 11.5777),
            registeredPeopleCount: 5
        ),
        Activity(
            id: 2,
            activityDesc: "Hiking",
            time: Date(),
            locationDesc: "Lenggrieß",
            locationLatLong: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437),
            registeredPeopleCount: 8
        ),
        Activity(
            id: 3,
            activityDesc: "Fitness Classic",
            time: Date(),
            locationDesc: "Städt. Stadion ad Dantestraße",
            locationLatLong: CLLocationCoordinate2D(latitude: 48.16817724948904,longitude: 11.52890163981124),
            registeredPeopleCount: 4
        ),
        Activity(
            id: 4,
            activityDesc: "Giesing Game Night",
            time: Date(),
            locationDesc: "Pfarrkirche Heilig-Kreuz",
            locationLatLong: CLLocationCoordinate2D(latitude: 48.1170, longitude: 11.5777),
            registeredPeopleCount: 6
        )
    ]
}

let mainMockActivity = MockActivities.activities.first!
