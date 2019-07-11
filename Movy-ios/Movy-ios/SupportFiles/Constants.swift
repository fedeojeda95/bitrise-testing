//
//  Constants.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/5/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import Foundation

struct Constants {
    static let movyLogoTitle = "Movy"

    struct Network {
        static let baseURL = "https://api.themoviedb.org/3"
        static let imageBaseURL = "https://image.tmdb.org/t/p/w500/"
        static let apiKey = "59f202da855a8a1a058b1483f47afbda"
    }

    struct LandingPage {
        static let loginButtonTitle = "Login"
        static let tryNowButtonTitle = "TRY NOW  >"
        static let headerText = "See what's next."
        static let subHeaderText = "WATCH ANYWHERE. CANCEL ANYTIME."
        static let priceSectionTitle = "Precio"
        static let cancelSectionTitle = "Cancelar"
        static let devicesSectionTitle = "Dispositivos"

        static let cancelDescriptionText = "Si piensas que Movy no es lo tuyo, no hay problema. Sin compromisos. Cancela online cuando quieras."
        static let freeMonthButton = "DISFRUTAR UN MES GRATIS"

        static let devicesDescriptionText = "Ve peliculas y programas de TV cuando y donde quieras, personalizados para ti."

        static let priceDescriptionText = "Elige un plan y ve lo que quieras."
        static let priceBasicTitle = "BASICO"
        static let priceStandarTitle = "ESTANDAR"
        static let pricePremiumTitle = "PREMIUM"
        static let priceHDAvailable = "HD Disponible"
        static let priceUHDAvailable = "Ultra HD Disponible"
        static let pricesScreenNumber = "Pantallas en las que puedes ver al mismo tiempo"
        static let pricesDevicesAvailables = "Ve en tu laptop, TV, telefono y tablet"
        static let pricesTVandSeriesUnlimited = "Peliculas y programas de TV ilimitados"
        static let pricesCancelWhenever = "Cancela cuando quieras"
        static let pricesFirstMonthFree = "El primer mes es gratis"

        static let devicesDeviceOneTitle = "Ve Movy en tu TV."
        static let devicesDeviceOneDescription = "Smart TV, PlayStation, Xbox, Roku, Apple TV, reproductores de Blu-Ray y mas."
        static let devicesDeviceTwoTitle = "Disfruta al instante o descarga videos para mas tarde."
        static let devicesDeviceTwoDescription = "Disponible en tu telefono o tables, vayas donde vayas."
        static let devicesDeviceThreeTitle = "Usa cualquier computadora."
        static let devicesDeviceThreeDescription = "Ve al instante en tu navegador."

        static let crossMark = "𐄂"
        static let checkMark = "✓"
    }

    struct Prices {
        static let basicPrice = 8.99
        static let standarPrice = 12.99
        static let premiumPrice = 15.99
    }

    struct Home {
        static let movyOriginalButton = "MOVY ORIGINAL"
        static let myList = "My List"
        static let playButton = "Play"
        static let infoButton = "Info"
        static let trendingNow = "Trending Now"
        static let recentlyAdded = "Recently Added"
    }

    struct Errors {
        static let apiCallErrorTitle = "Error on api call"
        static let apiLoadMoviesErrorDescription = "We couldn't load movies. Details: "
        static let apiSearchErrorDescription = "We couldn't perform the search. Details: "
    }

    struct FontNames {
        static let sfProDisplayBold = "SFProDisplay-Bold"
        static let sfProDisplayRegular = "SFProDisplay-Regular"
        static let sfProDisplayMedium = "SFProDisplay-Medium"
        static let exoSemiBold = "Exo-SemiBold"
    }

    struct Search {
        static let popularSearch = "Popular Searches"
        static let emptyResults = "No results yet! Try entering a new word"
    }

    struct Profile {
        static let profileTitle = "Profile"
        static let MembershipAndBilling = "Membership & Billing"
        static let MembershipAndBillingItems = [
            "Change account email",
            "Change password",
            "Change phone number",
            "Update payment info",
            "Billing details",
            "Redeem gift card or promo code"
        ]

        static let StandarItems = ["Billing details"]
        static let PlanDetails = "Plan Details"
        static let Standard = "Standard"
        static let CancelMember = "Cancel Membership"
        static let HdLabel = "HD"
    }

    static let genres: [Int: String] = [
        12: "Adventure",
        14: "Fantasy",
        16: "Animation",
        18: "Drama",
        27: "Horror",
        28: "Action",
        35: "Comedy",
        36: "History",
        37: "Western",
        53: "Thriller",
        80: "Crime",
        99: "Documentary",
        878: "Science Fiction",
        9648: "Mistery",
        10402: "Music",
        10749: "Romance",
        10751: "Family",
        10752: "War",
        10770: "TV Movie"
    ]
}
