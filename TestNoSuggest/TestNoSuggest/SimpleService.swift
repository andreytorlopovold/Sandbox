//
// Created by Andrey Torlopov on 8/24/18.
// Copyright (c) 2018 none. All rights reserved.
//

import Foundation

protocol SimpleServiceProtocol {
	func foo()
}

class SimpleService: SimpleServiceProtocol {
	func foo() {
		print("foo!")
	}
}