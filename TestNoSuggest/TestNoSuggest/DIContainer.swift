import Foundation

protocol DIServiceProtocol {
	func resolve<T>(type: T.Type) -> T?
}

class DIContainer {
	
	private func makeKey<T>(type: T.Type) -> String {
		return String(describing: type)
	}
	
	private var services: [AnyHashable: DIServiceProtocol] = [:]
	
	func register<T>(_ type: T.Type, asSingleTone: Bool = false, factory: @escaping () -> T) {
		let service = DIService(singleton: asSingleTone, factory: factory)
		services[makeKey(type: type)] = service
	}
	
	func resolve<T>(_ type: T.Type) -> T? {
		let key = makeKey(type: type)
		guard let service = services[key] else {
			fatalError("\(key) not registered in DI")
//			print("\(key) not registered in DI")
//			return nil
		}
		return service.resolve(type: type)
	}
}

private class DIService: DIServiceProtocol {
	private var isSingleton: Bool
	private var isFactoryPerformed: Bool = false
	private var singletone: Any?
	private var factory: () -> Any?
	
	func resolve<T>(type: T.Type) -> T? {
		if !isSingleton {
			return factory() as? T
		}
		if !isFactoryPerformed {
			singletone = factory()
			isFactoryPerformed = true
		}
		return singletone as? T
	}
	
	init(singleton: Bool = false, factory: @escaping () -> Any?) {
		self.isSingleton = singleton
		self.factory = factory
	}
}
