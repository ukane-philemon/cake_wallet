import 'package:mobx/mobx.dart';
import 'package:cw_core/transaction_info.dart';
import 'package:cw_core/transaction_history.dart';

class DecredTransactionHistory extends TransactionHistoryBase<TransactionInfo> {
  DecredTransactionHistory() {
    transactions = ObservableMap<String, TransactionInfo>();
  }

  Future<void> init() async {}

  @override
  void addOne(TransactionInfo transaction) =>
      transactions[txMapKey(transaction)] = transaction;

  @override
  void addMany(Map<String, TransactionInfo> transactions) =>
      transactions.forEach((_, tx) {
       this.transactions[txMapKey(tx)] = tx;
      });

  @override
  Future<void> save() async {}

  Future<void> changePassword(String password) async {}

  // update returns true if a known transaction that is not pending was found.
  bool update(Map<String, TransactionInfo> txs) {
    var foundOldTx = false;
    txs.forEach((id, tx) {
      if (!this.transactions.containsKey(id) ||
          this.transactions[id]!.isPending) {
        this.transactions[id] = tx;
      } else {
        foundOldTx = true;
      }
    });
    return foundOldTx;
  }
}

// txMapKey uses the tx id and vout to create a unique value for map keys. This
// is because outputs in the same tx will have the same tx id and overwrite
// other outputs when stored in a map where the key is the tx id.
String txMapKey(TransactionInfo tx) {
  return tx.id + ":" + tx.vout.toString();
}
