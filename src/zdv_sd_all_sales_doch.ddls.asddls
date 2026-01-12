@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'All Sales Doc Header'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDV_SD_ALL_SALES_DOCH
  as select from I_SalesOrder
{

  key SalesOrder,
      SDDocumentReason,
      PurchaseOrderByCustomer,
      CreationDate

}

union all

select from I_CustomerReturn
{
  key CustomerReturn as SalesOrder,
      SDDocumentReason,
      PurchaseOrderByCustomer,
      CreationDate
}

union all

select from I_CreditMemoRequest
{
  key CreditMemoRequest as SalesOrder,
      SDDocumentReason,
      PurchaseOrderByCustomer,
      CreationDate
}

union all

select from I_DebitMemoRequest
{
  key DebitMemoRequest as SalesOrder,
      SDDocumentReason,
      PurchaseOrderByCustomer,
      CreationDate

}
