@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view for Dealer Price'
define view entity ZCDS_DEALER_PRICE
  as select distinct from I_BillingDocumentItemPrcgElmnt
{
    key BillingDocument,
    key BillingDocumentItem,
    TransactionCurrency,
    ConditionType,
    @Semantics.amount.currencyCode: 'TransactionCurrency'
    ConditionAmount
} where ConditionType = 'ZDDI'
