//
//  HomeItem.swift
//  TossClone
//
//  Created by 리아 on 2022/07/12.
//

import Foundation

struct HomeItem: Hashable {

    enum ButtonType {
        case remit
        case history
        case newHistory
        case empty
    }

    let id = UUID()
    let image: String
    let description: String
    let main: String
    let buttonType: ButtonType

    func buttonName() -> String {
        switch buttonType {
        case .remit:
            return "송금"
        case .history:
            return "내역"
        case .newHistory:
            return "새 내역 2건"
        case .empty:
            return ""
        }
    }
}

struct HomeItemMock {

    static let item1 = HomeItem(image: ImageLiteral.bankIcon, description: "고객을 위한 혁신", main: "오늘부터, 매일 이자 받으세요", buttonType: .empty)
    static let item2 = HomeItem(image: ImageLiteral.wooriBank, description: "위비모바일통장", main: "934,340 원", buttonType: .remit)
    static let item3 = HomeItem(image: ImageLiteral.kakaoBank, description: "입출금통장", main: "201,348 원", buttonType: .remit)
    static let item4 = HomeItem(image: ImageLiteral.shinhanBank, description: "쏠편한 입출금통장 (저축예금)", main: "6,130,316 원", buttonType: .remit)
    static let item5 = HomeItem(image: ImageLiteral.kwangjuBank, description: "저축예금", main: "0원", buttonType: .remit)
    static let item6 = HomeItem(image: ImageLiteral.consumptionIcon, description: "이번 달 쓴 금액", main: "1,234,567 원", buttonType: .history)
    static let item7 = HomeItem(image: ImageLiteral.wooriCardIcon, description: "실적, 혜택도 알려드려요", main: "우리카드 쓴 금액 보기", buttonType: .empty)
    static let item8 = HomeItem(image: ImageLiteral.cashBackIcon, description: "쓰던 카드로", main: "캐시백 받기", buttonType: .empty)
    static let item9 = HomeItem(image: ImageLiteral.moneyTipIcon, description: "요즘 인기", main: "오늘의 머니 팁", buttonType: .empty)
    static let item10 = HomeItem(image: ImageLiteral.cardBenefitIcon, description: "최근", main: "카드 혜택 받기", buttonType: .empty)

    static let bankItemList = [Self.item1]
    static let assetItemList = [Self.item2, Self.item3, Self.item4, Self.item5]
    static let consumtionItemList = [Self.item6, Self.item7]
    static let etcItemList = [Self.item8, Self.item9, Self.item10]

}
