import RxSwift
import Hyperdrive
import Representor

extension Hyperdrive {
  public func enter(uri:String) -> Observable<Representor<HTTPTransition>> {
    return AnonymousObservable { observer in
      self.enter(uri) { result in
        switch result {
        case .Success(let representor):
          observer.on(.Next(representor))
          observer.on(.Completed)
        case .Failure(let error):
          observer.on(.Error(error))
        }
      }

      return AnonymousDisposable {}
    }
  }

  public func request(transition:HTTPTransition, parameters:[String:AnyObject]? = nil, attributes:[String:AnyObject]? = nil) -> Observable<Representor<HTTPTransition>> {
    return AnonymousObservable { observer in
      self.request(transition, parameters: parameters, attributes: attributes) { result in
        switch result {
        case .Success(let representor):
          observer.on(.Next(representor))
          observer.on(.Completed)
        case .Failure(let error):
          observer.on(.Error(error))
        }
      }

      return AnonymousDisposable {}
    }
  }

  public func request(transition:HTTPTransition?, parameters:[String:AnyObject]? = nil, attributes:[String:AnyObject]? = nil) -> Observable<Representor<HTTPTransition>> {
    if let transition = transition {
      return request(transition, parameters: parameters, attributes: attributes)
    }

    return AnonymousObservable { observer in
      let error = NSError(domain: Hyperdrive.errorDomain, code: 0, userInfo: [NSLocalizedFailureReasonErrorKey: "Given transition was nil."])
      observer.on(.Error(error))
      return AnonymousDisposable {}
    }
  }
}
