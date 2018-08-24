//
//  ViewController.swift
//  TestNoSuggest
//
//  Created by Andrey Torlopov on 8/24/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
	let service = DI.providers.resolve(SimpleServiceProtocol.self)!

	override func viewDidLoad() {
		super.viewDidLoad()
		service.foo() //NO sussestions
	}
}
