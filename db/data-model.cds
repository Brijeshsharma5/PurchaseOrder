using {
  managed,
  cuid
} from '@sap/cds/common';

namespace home.po.sap;

entity PurchaseOrderT : cuid, managed {
  key PurchaseOrder                : String(15);
      SupplierName                 : String(255);
      Supplier                     : String(128);
      GrossAmountInTransacCurrency : Decimal;
      Status                       : String(50);
      Items                        : Composition of many PurchaseItemsT
                                       on Items.parentKey = $self

}

entity PurchaseItemsT : cuid, managed {
  key parentKey   : Association to PurchaseOrderT;
      ItemNumber  : String(15);
      productName : String(128);
      ProductDesc : String(128);
      UnitPrice   : Decimal;
      Quantity    : Decimal;
      UOM         : String;
      TotalAmount : Decimal;
      Plant       : String;
      StorageUnit : String;
}
