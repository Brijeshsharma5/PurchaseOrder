namespace home.po.sap;

entity PurchaseOrderT {
    key PurchaseOrder          : String(15);
        SupplierName        : String(255);
        Supplier               : String(128);
        GrossAmountInTransacCurrency : Decimal;
        Status : String(50)

}


