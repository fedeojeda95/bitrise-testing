//
//  ProfileViewController.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/6/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Profile.profileTitle
        label.textColor = UIColor.movyWhite
        label.font = UIFont.barTitle
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    private let membershipSectionLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Profile.MembershipAndBilling
        label.textColor = UIColor.movyWhite
        label.font = UIFont.profileSection
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.black
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    private let cancelMembershipButton: MovyButton = {
        let button = MovyButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.Profile.CancelMember, for: .normal)
        return button
    }()

    private let planDetailsSectionLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Profile.PlanDetails
        label.textColor = UIColor.movyWhite
        label.font = UIFont.profileSection
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let standardSecionLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Profile.Standard
        label.textColor = UIColor.movyWhite
        label.font = UIFont.profileSection
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let hdView: HdView = {
        let view = HdView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    private func setupView() {
        view.accessibilityIdentifier = AccessibilityConstants.Profile.profileView
        view.addSubview(titleLabel)
        view.addSubview(membershipSectionLabel)

        setupTableView()

        view.addSubview(tableView)
        view.addSubview(cancelMembershipButton)
        view.addSubview(planDetailsSectionLabel)
        view.addSubview(standardSecionLabel)
        view.addSubview(hdView)
    }

    private func setupTableView() {
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor.movyBlack
        tableView.bounces = false
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: ProfileConstants.TitleLabel.topMargin
            ),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: ProfileConstants.TitleLabel.heigth),

            tableView.topAnchor.constraint(
                equalTo: membershipSectionLabel.bottomAnchor,
                constant: ProfileConstants.TableView.topMargin
            ),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant:
                ProfileConstants.cellHeight * CGFloat(Constants.Profile.MembershipAndBillingItems.count)
            ),

            membershipSectionLabel.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: ProfileConstants.leftMargin
            ),
            membershipSectionLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: ProfileConstants.MembershipSectionLabel.topMargin
            ),

            cancelMembershipButton.topAnchor.constraint(
                equalTo: tableView.bottomAnchor,
                constant: ProfileConstants.CancelMembershipButton.topMargin
            ),
            cancelMembershipButton.heightAnchor.constraint(
                equalToConstant: ProfileConstants.CancelMembershipButton.height
            ),
            cancelMembershipButton.widthAnchor.constraint(
                equalToConstant: ProfileConstants.CancelMembershipButton.width
            ),
            cancelMembershipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            planDetailsSectionLabel.topAnchor.constraint(
                equalTo: cancelMembershipButton.bottomAnchor,
                constant: ProfileConstants.PlanDetailsSectionLabel.topMargin
            ),
            planDetailsSectionLabel.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: ProfileConstants.leftMargin
            ),

            standardSecionLabel.topAnchor.constraint(
                equalTo: planDetailsSectionLabel.bottomAnchor,
                constant: ProfileConstants.StandardLabel.topMargin
            ),
            standardSecionLabel.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: ProfileConstants.leftMargin
            ),

            hdView.leadingAnchor.constraint(
                equalTo: standardSecionLabel.trailingAnchor,
                constant: ProfileConstants.HdView.leftMargin
            ),

            hdView.heightAnchor.constraint(equalToConstant: ProfileConstants.HdView.height),
            hdView.widthAnchor.constraint(equalToConstant: ProfileConstants.HdView.width),
            hdView.topAnchor.constraint(
                equalTo: planDetailsSectionLabel.bottomAnchor,
                constant: ProfileConstants.HdView.topMargin
            )
        ])
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.Profile.MembershipAndBillingItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath)
        guard let profileCell = cell as? ProfileCell else { return cell }
        profileCell.cellText = Constants.Profile.MembershipAndBillingItems[indexPath.item]
        return profileCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ProfileConstants.cellHeight
    }
}

private struct ProfileConstants {
    static let leftMargin: CGFloat = 28
    static let rightMargin: CGFloat = -21
    static let cellHeight: CGFloat = 57

    struct TitleLabel {
        static let heigth: CGFloat = 20
        static let topMargin: CGFloat = 27
    }

    struct TableView {
        static let topMargin: CGFloat = 27
    }

    struct MembershipSectionLabel {
        static let topMargin: CGFloat = 37
    }

    struct CancelMembershipButton {
        static let topMargin: CGFloat = 6
        static let height: CGFloat = 47.2
        static let width: CGFloat = 332
    }

    struct PlanDetailsSectionLabel {
        static let topMargin: CGFloat = 31.8
    }

    struct StandardLabel {
        static let topMargin: CGFloat = 27
    }

    struct HdView {
        static let topMargin: CGFloat = 26
        static let leftMargin: CGFloat = 14
        static let height: CGFloat = 23.1
        static let width: CGFloat = 50
    }
}
