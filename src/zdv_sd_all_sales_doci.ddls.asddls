@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'All Sales Doc Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDV_SD_ALL_SALES_DOCI
  as select from I_SalesOrderItem
{
  key SalesOrder,
  key SalesOrderItem,
      Plant,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      OrderQuantity,
      OrderQuantityUnit,
      TransactionCurrency,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetPriceAmount

}

union all select from I_CustomerReturnItem
{
  key CustomerReturn     as SalesOrder,
  key CustomerReturnItem as SalesOrderItem,
      Plant,
      OrderQuantity,
      OrderQuantityUnit,
      TransactionCurrency,
      NetPriceAmount

}

union all select from I_CreditMemoRequestItem

{
  key CreditMemoRequest     as SalesOrder,
  key CreditMemoRequestItem as SalesOrderItem,
      Plant,
      TargetQuantity        as OrderQuantity,
      TargetQuantityUnit    as OrderQuantityUnit,
      TransactionCurrency,
      NetPriceAmount
}

union all select from I_DebitMemoRequestItem

{
  key DebitMemoRequest     as SalesOrder,
  key DebitMemoRequestItem as SalesOrderItem,
      Plant,
      TargetQuantity       as OrderQuantity,
      TargetQuantityUnit   as OrderQuantityUnit,
      TransactionCurrency,
      NetPriceAmount
}
