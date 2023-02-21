using riskmanagement as rm from '../db/schema';

 // Annotate Risk elements
 annotate rm.Risks with {
 ID     @title : 'Risco';
 title  @title : 'Título';
 owner  @title : 'Proprietário';
 prio   @title : 'Prioridade';
 descr  @title : 'Descrição';
 miti   @title : 'Mitigação';
 impact @title : 'Impacto';
 bp     @title : 'Parceiro de Negócios';
 criticality @title : 'Criticidade';
 } 

// Annotate Miti elements
 annotate rm.Mitigations with {
 ID @( 
      UI.Hidden,
      Common : {Text : descr}
 ); 
owner @title : 'Owner';
descr @title : 'Description';
 }

annotate rm.Risks with {
   miti @(Common : {
    //show text, not id for mitigation in the context of risks
    Text            : miti.descr,
    TextArrangement : #TextOnly,
    ValueList       : {
    Label          : 'Mitigations',
    CollectionPath : 'Mitigations',
    Parameters     : [
       {
       $Type : 'Common.ValueListParameterInOut',
       LocalDataProperty : miti_ID,
       ValueListProperty : 'ID'
       },
       {
       $Type : 'Common.ValueListParameterDisplayOnly',
       ValueListProperty : 'descr'
       }
    ]
    }
  });

  bp @(Common : {
   Text : bp.LastName,
   TextArrangement : #TextOnly,
   ValueList : {
      Label : 'Business Partners',
      CollectionPath : 'BusinessPartners',
      Parameters : [
         {
           $Type : 'Common.ValueListParameterInOut',
           LocalDataProperty : bp_BusinessPartner,
           ValueListProperty : 'BusinessPartner'
         },
         {
            $Type : 'Common.ValueListParameterDisplayOnly',
            ValueListProperty : 'LastName'
          },
          {
             $Type : 'Common.ValueListParameterDisplayOnly',
             ValueListProperty : 'FirstName'
          }
       ]
     }
   })

 }