import Foundation
import RxSwift

public extension Solana {
    func getTokenAccountsByOwner(pubkey: String, mint: String? = nil, programId: String? = nil, configs: RequestConfiguration? = nil) -> Single<[TokenAccount<AccountInfo>]> {
        Single.create { emitter in
            self.getTokenAccountsByOwner(pubkey: pubkey, mint: mint, programId: programId,  configs: configs) {
                switch $0 {
                case .success(let balance):
                    emitter(.success(balance))
                case .failure(let error):
                    emitter(.failure(error))
                }
            }
            return Disposables.create()
        }
    }
}