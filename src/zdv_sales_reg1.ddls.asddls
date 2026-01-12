@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Register View 1'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDV_SALES_REG1
  as select from    I_BillingDocument              as billh
    left outer join I_BillingDocument              as billch         on(
              billh.BillingDocument = billch.CancelledBillingDocument
            )
    left outer join I_BillingDocumentTypeText_2    as billtyptxt     on(
          billh.BillingDocumentType = billtyptxt.BillingDocumentType
          and billtyptxt.Language   = $session.system_language
        )
    left outer join I_BillingDocumentItem          as billi          on(
               billh.BillingDocument = billi.BillingDocument
             )
    left outer join I_Customer                     as sldp           on(
                billh.SoldToParty = sldp.Customer
              )
    left outer join I_RegionText                   as sldp1          on(
               sldp1.Country      = sldp.Country
               and sldp1.Region   = sldp.Region
               and sldp1.Language = $session.system_language
             )
  // left outer join I_BUSINESSPARTNERCUSTOMERDEx as sldpbp on ( billh.SoldToParty = sldpbp.BusinessPartner ) I_RegionText
  //left outer join I_CUSTOMERACCOUNTGROUPTEXT as sldpac on ( sldpbp.CustomerAccountGroup = sldpac.CustomerAccountGroup and sldpac.Language = $session.system_language )
    left outer join I_SalesDocument                as saleh          on(
               billi.SalesDocument                = saleh.SalesDocument
               and(
                 billi.SalesSDDocumentCategory    = 'C'
                 or billi.SalesSDDocumentCategory = 'H'
                 or billi.SalesSDDocumentCategory = 'L'
                 or billi.SalesSDDocumentCategory = 'K'
                 or billi.SalesSDDocumentCategory = 'I'
               )
             )
    left outer join I_SDDocumentReasonText         as salehreasontxt on(
      saleh.SDDocumentReason      = salehreasontxt.SDDocumentReason
      and salehreasontxt.Language = $session.system_language
    )
    left outer join I_SalesDocumentItem            as salei          on(
               saleh.SalesDocument                = salei.SalesDocument
               and billi.SalesDocumentItem        = salei.SalesDocumentItem
               and(
                 billi.SalesSDDocumentCategory    = 'C'
                 or billi.SalesSDDocumentCategory = 'H'
                 or billi.SalesSDDocumentCategory = 'L'
                 or billi.SalesSDDocumentCategory = 'K'
                 or billi.SalesSDDocumentCategory = 'I'
               )
             )
    left outer join I_ProductDescription           as mat            on(
                 billi.Material   = mat.Product
                 and mat.Language = $session.system_language
               )
    left outer join I_ProductPlantBasic            as mat1           on(
                billi.Material = mat1.Product
                and mat1.Plant = billi.Plant
              )
    left outer join I_DistributionChannelText      as dist           on(
                billi.DistributionChannel = dist.DistributionChannel
                and dist.Language         = $session.system_language
              )
    left outer join I_DeliveryDocument             as delh           on(
                billi.ReferenceSDDocument             = delh.DeliveryDocument
                and billi.ReferenceSDDocumentCategory = 'J'
              )
    left outer join I_DeliveryDocumentItem         as deli           on(
                billi.ReferenceSDDocument = deli.DeliveryDocument
                and billi.ReferenceSDDocumentItem = deli.DeliveryDocumentItem
                and deli.DeliveryDocumentItemCategory = 'CB99'
    )
    left outer join I_BillingDocumentItemPrcgElmnt as billpzp00      on(
           billi.BillingDocument         = billpzp00.BillingDocument
           and billi.BillingDocumentItem = billpzp00.BillingDocumentItem
           and billpzp00.ConditionType   = 'ZPR0'
         )
    left outer join I_BillingDocumentItemPrcgElmnt as billpTXT1      on(
           billi.BillingDocument         = billpTXT1.BillingDocument
           and billi.BillingDocumentItem = billpTXT1.BillingDocumentItem
           and billpTXT1.ConditionType   = 'TXT1'
         )
    left outer join I_BillingDocumentItemPrcgElmnt as billpJTC1      on(
           billi.BillingDocument         = billpJTC1.BillingDocument
           and billi.BillingDocumentItem = billpJTC1.BillingDocumentItem
           and(
             billpJTC1.ConditionType     = 'JTC1'
             or billpJTC1.ConditionType  = 'JTC2'
           )
         )
    left outer join I_BillingDocumentItemPrcgElmnt as billpfrt       on(
            billi.BillingDocument         = billpfrt.BillingDocument
            and billi.BillingDocumentItem = billpfrt.BillingDocumentItem
            and billpfrt.ConditionAmount  > 0
            and(
              billpfrt.ConditionType      = 'JFPT'
              or billpfrt.ConditionType   = 'ZFVT'
              or billpfrt.ConditionType   = 'ZFPE'
              or billpfrt.ConditionType   = 'ZFVE'
            )
          )
    left outer join I_BillingDocumentItemPrcgElmnt as billpTXT12     on(
          billi.BillingDocument         = billpTXT12.BillingDocument
          and billi.BillingDocumentItem = billpTXT12.BillingDocumentItem
//          and billpzp00.ConditionType   = 'ZPBH'
          and billpTXT12.ConditionAmount  > 0
          and billpTXT12.ConditionType   = 'ZPBH'
        )
    left outer join I_BillingDocumentItemPrcgElmnt as billpJocg      on(
           billi.BillingDocument         = billpJocg.BillingDocument
           and billi.BillingDocumentItem = billpJocg.BillingDocumentItem
           and billpJocg.ConditionType   = 'JOCG'
           and billpJocg.ConditionAmount > 0
         )
    left outer join I_BillingDocumentItemPrcgElmnt as billpJosg      on(
           billi.BillingDocument         = billpJosg.BillingDocument
           and billi.BillingDocumentItem = billpJosg.BillingDocumentItem
           and billpJosg.ConditionType   = 'JOSG'
           and billpJosg.ConditionAmount > 0
         )
    left outer join I_BillingDocumentItemPrcgElmnt as billpJoug      on(
           billi.BillingDocument         = billpJoug.BillingDocument
           and billi.BillingDocumentItem = billpJoug.BillingDocumentItem
           and billpJoug.ConditionType   = 'JOUG'
           and billpJoug.ConditionAmount > 0
         )
    left outer join I_BillingDocumentItemPrcgElmnt as billpJoig      on(
           billi.BillingDocument         = billpJoig.BillingDocument
           and billi.BillingDocumentItem = billpJoig.BillingDocumentItem
           and billpJoig.ConditionType   = 'JOIG'
           and billpJoig.ConditionAmount > 0
         )
    left outer join I_BillingDocumentItemPrcgElmnt as billpdrd1      on(
           billi.BillingDocument         = billpdrd1.BillingDocument
           and billi.BillingDocumentItem = billpdrd1.BillingDocumentItem
           and billpdrd1.ConditionType   = 'DRD1'
           and billpdrd1.ConditionAmount > 0
         )
    left outer join I_BillingDocumentItemPrcgElmnt as billd100       on(
            billi.BillingDocument         = billd100.BillingDocument
            and billi.BillingDocumentItem = billd100.BillingDocumentItem
            and billd100.ConditionType    = 'ZCM1'
//            and billd100.ConditionAmount  > 0
          )
//    left outer join I_SalesDocumentItemPartner     as billd1001      on(
//           billd1001.SalesDocument         = billi.SalesDocument
//           and billd1001.SalesDocumentItem = billi.SalesDocumentItem
//           and billd1001.PartnerFunction   = 'VE'
//         )
    left outer join I_SalesDocumentPartner     as billd1001      on(
           billd1001.SalesDocument         = billi.SalesDocument
           and billd1001.PartnerFunction   = 'VE'
         )
    left outer join I_SalesDocumentItemPartner     as billd1001ZD    on(
         billd1001ZD.SalesDocument         = billi.SalesDocument
         and billd1001ZD.SalesDocumentItem = billi.SalesDocumentItem
         and billd1001ZD.PartnerFunction   = 'ZD'
       )
    left outer join I_BillingDocumentItemPrcgElmnt as billpTXT12ZDDI on(
      billi.BillingDocument         = billpTXT12ZDDI.BillingDocument
      and billi.BillingDocumentItem = billpTXT12ZDDI.BillingDocumentItem
      and billpTXT12ZDDI.ConditionType   = 'ZDDI'
    )
    left outer join I_SalesDocumentItemPartner     as billd1001sup   on(
        billd1001sup.SalesDocument         = billi.SalesDocument
        and billd1001sup.SalesDocumentItem = billi.SalesDocumentItem
        and billd1001sup.PartnerFunction   = 'ZS'
      )
    left outer join I_BillingDocumentItemPrcgElmnt as billpTXT12ZBDI on(
      billi.BillingDocument         = billpTXT12ZBDI.BillingDocument
      and billi.BillingDocumentItem = billpTXT12ZBDI.BillingDocumentItem
      and billpTXT12ZDDI.ConditionType   = 'ZBDI'
    )

{

  billh.CompanyCode,
  billh.SalesOrganization,
  billh.DocumentReferenceID,
  billh.SoldToParty,
  sldp.CustomerName,
  //sldpac.AccountGroupName,
  case billi.SalesSDDocumentCategory when 'C' then billi.SalesDocument
                                     when 'H' then billi.SalesDocument
                                     when 'L' then billi.SalesDocument
                                     when 'K' then billi.SalesDocument
                                     when 'I' then billi.SalesDocument

  else '' end                                                                                      as SalesDocument,
  saleh.CreationDate,
  salei.Plant,
  saleh.PurchaseOrderByCustomer,
  salei.SalesDocumentItem                                                                          as SalesOrderItem,
  saleh.SDDocumentReason,
  salehreasontxt.SDDocumentReasonText,
  billi.Product,
  mat.ProductDescription,
  billi.DistributionChannel,
  dist.DistributionChannelName,
  @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
  salei.OrderQuantity,
  salei.OrderQuantityUnit,
  salei.TransactionCurrency,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  //    salei.NetPriceAmount,
  case when billh.BillingDocumentType = 'S1' or billh.BillingDocumentType = 'S2'
  then (-1 * salei.NetPriceAmount )
   else  salei.NetPriceAmount end                                                                  as NetPriceAmount,
  case billi.ReferenceSDDocumentCategory when 'J' then billi.ReferenceSDDocument else '' end       as ReferenceSDDocument,
  case billi.ReferenceSDDocumentCategory when 'J' then billi.ReferenceSDDocumentItem else null end as ReferenceSDDocumentItem,
  delh.ActualGoodsMovementDate,
  billh.BillingDocument,
  //    billh.BillingDocumentIsCancelled,
  case when ( billh.BillingDocumentType = 'F5' or  billh.BillingDocumentType = 'F8' )
         and billh.AccountingTransferStatus = 'E'
  then 'X'
  else billh.BillingDocumentIsCancelled end                                                        as BillingDocumentIsCancelled,
  billch.BillingDocument                                                                           as CancelledBillingDocumnet,
  billi.BillingDocumentItem,
  billh.BillingDocumentDate,
  billh.BillingDocumentType,
  billtyptxt.BillingDocumentTypeName,
  billi.BillingQuantityUnit,
  @Semantics.quantity.unitOfMeasure: 'BillingQuantityUnit'
  billi.BillingQuantity,
  //    billpzp00.ConditionRateValue as unit_price,
  deli.DeliveryQuantityUnit,
  @Semantics.quantity.unitOfMeasure: 'DeliveryQuantityUnit'
  deli.ActualDeliveryQuantity,
  case when billh.BillingDocumentType = 'S1' or billh.BillingDocumentType = 'S2'
  then (-1 * billpzp00.ConditionRateValue )
   else  billpzp00.ConditionRateValue end                                                          as unit_price,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  case when billh.BillingDocumentType = 'S1' or billh.BillingDocumentType = 'S2'
  then (-1 * billd100.ConditionRateValue )
   else  billd100.ConditionRateValue end                                                          as discount_rate,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  //    billpzp00.ConditionAmount    as total_price,
  case when billh.BillingDocumentType = 'S1' or billh.BillingDocumentType = 'S2'
  then (-1 * billi.NetAmount )
   else  billi.NetAmount end                                                                      as total_price,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  //    billpTXT1.ConditionAmount    as vat_price,
  case when billh.BillingDocumentType = 'S1' or billh.BillingDocumentType = 'S2'
  then (-1 * billpTXT1.ConditionAmount )
  else  billpTXT1.ConditionAmount end                                                              as vat_price,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  //    billpJTC1.ConditionAmount    as tcs_price,
  case when billh.BillingDocumentType = 'S1' or billh.BillingDocumentType = 'S2'
  then (-1 * billpJTC1.ConditionAmount)
  else  billpJTC1.ConditionAmount end                                                              as tcs_price,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  //    billpfrt.ConditionAmount     as freight_price,
  case when billh.BillingDocumentType = 'S1' or billh.BillingDocumentType = 'S2'
  then (-1 * billpfrt.ConditionAmount)
  else  billpfrt.ConditionAmount end                                                               as freight_price,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  //    billpJocg.ConditionAmount     as cgst_price,
  case when billh.BillingDocumentType = 'S1' or billh.BillingDocumentType = 'S2'
  then (-1 * billpJocg.ConditionAmount )
  else  billpJocg.ConditionAmount  end                                                             as cgst_price,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  //    billpJosg.ConditionAmount     as sgst_price,
  case when billh.BillingDocumentType = 'S1' or billh.BillingDocumentType = 'S2'
  then (-1 * billpJosg.ConditionAmount )
  else  billpJosg.ConditionAmount  end                                                             as sgst_price,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  //    billpJoug.ConditionAmount     as ugst_price,
  case when billh.BillingDocumentType = 'S1' or billh.BillingDocumentType = 'S2'
  then (-1 * billpJoug.ConditionAmount )
  else  billpJoug.ConditionAmount  end                                                             as ugst_price,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  //    billpJoig.ConditionAmount     as igst_price,
  case when billh.BillingDocumentType = 'S1' or billh.BillingDocumentType = 'S2'
  then (-1 * billpJoig.ConditionAmount )
  else  billpJoig.ConditionAmount   end                                                            as igst_price,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  //    billpdrd1.ConditionAmount     as round_off,
  case when billh.BillingDocumentType = 'S1' or billh.BillingDocumentType = 'S2'
  then (-1 * billpdrd1.ConditionAmount  )
  else  billpdrd1.ConditionAmount   end                                                            as round_off,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  //    billd100.ConditionAmount      as discount,
  case when billh.BillingDocumentType = 'S1' or billh.BillingDocumentType = 'S2'
  then (-1 * billd100.ConditionAmount   )
  else  billd100.ConditionAmount    end                                                            as discount,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  //    billi.NetAmount + billi.TaxAmount as total
  case when billh.BillingDocumentType = 'S1' or billh.BillingDocumentType = 'S2'
  then (-1 * ( billi.NetAmount + billi.TaxAmount )   )
  else  ( billi.NetAmount + billi.TaxAmount )    end                                               as total,
  sldp.TaxNumber3                                                                                  as Party_PAN,
  mat1.ConsumptionTaxCtrlCode                                                                      as hsn,
  billi.Batch,
  billi.Division,
  sldp.CityName,
  sldp1.RegionName                                                                                 as state,
  billd1001.FullName                                                                               as salespersonname,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  billpTXT12.ConditionAmount                                                                       as freightprice,
//  delh.YY1_TransporterName1_DLH                                                                    as transportername,
  delh.YY1_Transportername_DLH                                                                     as transportername,
  billd1001ZD.FullName                                                                             as dealername,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  billpTXT12ZDDI.ConditionAmount                                                                   as dealerprice,
  billd1001sup.FullName                                                                            as supervisorname,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  billpTXT12ZBDI.ConditionAmount                                                                   as supervisorprice,
  salei.PricingReferenceMaterial                                                                   as pricingreferencematerial,
  billi.ItemWeightUnit,
  @Semantics.quantity.unitOfMeasure: 'ItemWeightUnit'
  billi.ItemGrossWeight                                                                            as itemgrossweight,
  @Semantics.quantity.unitOfMeasure: 'ItemWeightUnit'
  deli.ItemGrossWeight                                                                             as itemgrossbatchweight,
  billi.SalesGroup                                                                                 as salesgroup,
  billi.SalesOffice                                                                                as salesoffice,
  delh.YY1_VehicleNumber_DLH                                                                       as vehicleno,
  billh.AccountingDocument,
  case when billi.Plant = '1005'
  then '1811'
  else '1810'
  end                                                                                              as businessplace


}
//
//where billh.BillingDocumentType <> 'S1' and
//      billh.BillingDocumentType <> 'S2'
