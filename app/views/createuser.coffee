# The MainView holds the wrapper template and is used to control rendering
# between the different child views.
template = require "./templates/create_user"
User = require "../models/user"
TagCollection = require "../collections/tag"


class CreateUserView extends Backbone.View

  events:
    "click .saveButton": "saveUser"
    "keydown #inputSpecialities": "showAdd"
    "click #addTag" : "addTag"
    "click #addDesiredCountry" : "addDesiredCountry"
    "click #addPreviousCountry" : "addPreviousCountry"
    
    
  addPreviousCountry : (e) =>
    country = $("#inputInternationnalExperience").val()
    @previsousCountries.push country
    $("#previousContainer").append "<span class='label label-success'>#{country}</span>"
    $("#addPreviousCountry").hide()
    $("#inputInternationnalExperience").val ""
  addDesiredCountry : (e) =>
    country = $("#inputDesiredCountry").val()
    @desiredCountries.push country
    $("#desiredContainer").append "<span class='label label-success'>#{country}</span>"
    $("#addDesiredCountry").hide()
    $("#inputDesiredCountry").val ""


  showAdd : (e) =>
    element = $(e.currentTarget)
    text = element.val()
    if text != ""
      $("#addTag").show()
    else
      $("#addTag").hide()


  addTag : (e) =>

    tag = $("#inputSpecialities").val()
    @currentTags.push tag
    $("#tagContainer").append "<span class='label label-success'>#{tag}</span>"
    $("#inputSpecialities").val ""
    $("#addTag").hide()
    @tags = _.without @tags , tag





  initialize: ->
    @currentTags = []
    @desiredCountries = []
    @previsousCountries = []
    @countries = {"AF":"Afghanistan","ZA":"Afrique du Sud","AL":"Albanie","DZ":"Alg\u00e9rie","DE":"Allemagne","AD":"Andorre","AO":"Angola","AI":"Anguilla","AQ":"Antarctique","AG":"Antigua-et-Barbuda","AN":"Antilles n\u00e9erlandaises","SA":"Arabie saoudite","AR":"Argentine","AM":"Arm\u00e9nie","AW":"Aruba","AU":"Australie","AT":"Autriche","AZ":"Azerba\u00efdjan","BS":"Bahamas","BH":"Bahre\u00efn","BD":"Bangladesh","BB":"Barbade","BE":"Belgique","BZ":"Belize","BM":"Bermudes","BT":"Bhoutan","BO":"Bolivie","BA":"Bosnie-Herz\u00e9govine","BW":"Botswana","BN":"Brun\u00e9i Darussalam","BR":"Br\u00e9sil","BG":"Bulgarie","BF":"Burkina Faso","BI":"Burundi","BY":"B\u00e9larus","BJ":"B\u00e9nin","KH":"Cambodge","CM":"Cameroun","CA":"Canada","CV":"Cap-Vert","CL":"Chili","CN":"Chine","CY":"Chypre","CO":"Colombie","KM":"Comores","CG":"Congo","KP":"Cor\u00e9e du Nord","KR":"Cor\u00e9e du Sud","CR":"Costa Rica","HR":"Croatie","CU":"Cuba","CI":"C\u00f4te d\u2019Ivoire","DK":"Danemark","DJ":"Djibouti","DM":"Dominique","SV":"El Salvador","ES":"Espagne","EE":"Estonie","FJ":"Fidji","FI":"Finlande","FR":"France","GA":"Gabon","GM":"Gambie","GH":"Ghana","GI":"Gibraltar","GD":"Grenade","GL":"Groenland","GR":"Gr\u00e8ce","GP":"Guadeloupe","GU":"Guam","GT":"Guatemala","GG":"Guernesey","GN":"Guin\u00e9e","GQ":"Guin\u00e9e \u00e9quatoriale","GW":"Guin\u00e9e-Bissau","GY":"Guyana","GF":"Guyane fran\u00e7aise","GE":"G\u00e9orgie","GS":"G\u00e9orgie du Sud et les \u00eeles Sandwich du Sud","HT":"Ha\u00efti","HN":"Honduras","HU":"Hongrie","IN":"Inde","ID":"Indon\u00e9sie","IQ":"Irak","IR":"Iran","IE":"Irlande","IS":"Islande","IL":"Isra\u00ebl","IT":"Italie","JM":"Jama\u00efque","JP":"Japon","JE":"Jersey","JO":"Jordanie","KZ":"Kazakhstan","KE":"Kenya","KG":"Kirghizistan","KI":"Kiribati","KW":"Kowe\u00eft","LA":"Laos","LS":"Lesotho","LV":"Lettonie","LB":"Liban","LY":"Libye","LR":"Lib\u00e9ria","LI":"Liechtenstein","LT":"Lituanie","LU":"Luxembourg","MK":"Mac\u00e9doine","MG":"Madagascar","MY":"Malaisie","MW":"Malawi","MV":"Maldives","ML":"Mali","MT":"Malte","MA":"Maroc","MQ":"Martinique","MU":"Maurice","MR":"Mauritanie","YT":"Mayotte","MX":"Mexique","MD":"Moldavie","MC":"Monaco","MN":"Mongolie","MS":"Montserrat","ME":"Mont\u00e9n\u00e9gro","MZ":"Mozambique","MM":"Myanmar","NA":"Namibie","NR":"Nauru","NI":"Nicaragua","NE":"Niger","NG":"Nig\u00e9ria","NU":"Niue","NO":"Norv\u00e8ge","NC":"Nouvelle-Cal\u00e9donie","NZ":"Nouvelle-Z\u00e9lande","NP":"N\u00e9pal","OM":"Oman","UG":"Ouganda","UZ":"Ouzb\u00e9kistan","PK":"Pakistan","PW":"Palaos","PA":"Panama","PG":"Papouasie-Nouvelle-Guin\u00e9e","PY":"Paraguay","NL":"Pays-Bas","PH":"Philippines","PN":"Pitcairn","PL":"Pologne","PF":"Polyn\u00e9sie fran\u00e7aise","PR":"Porto Rico","PT":"Portugal","PE":"P\u00e9rou","QA":"Qatar","HK":"R.A.S. chinoise de Hong Kong","MO":"R.A.S. chinoise de Macao","RO":"Roumanie","GB":"Royaume-Uni","RU":"Russie","RW":"Rwanda","CF":"R\u00e9publique centrafricaine","DO":"R\u00e9publique dominicaine","CD":"R\u00e9publique d\u00e9mocratique du Congo","CZ":"R\u00e9publique tch\u00e8que","RE":"R\u00e9union","EH":"Sahara occidental","BL":"Saint-Barth\u00e9l\u00e9my","KN":"Saint-Kitts-et-Nevis","SM":"Saint-Marin","MF":"Saint-Martin","PM":"Saint-Pierre-et-Miquelon","VC":"Saint-Vincent-et-les Grenadines","SH":"Sainte-H\u00e9l\u00e8ne","LC":"Sainte-Lucie","WS":"Samoa","AS":"Samoa am\u00e9ricaines","ST":"Sao Tom\u00e9-et-Principe","RS":"Serbie","CS":"Serbie-et-Mont\u00e9n\u00e9gro","SC":"Seychelles","SL":"Sierra Leone","SG":"Singapour","SK":"Slovaquie","SI":"Slov\u00e9nie","SO":"Somalie","SD":"Soudan","LK":"Sri Lanka","CH":"Suisse","SR":"Suriname","SE":"Su\u00e8de","SJ":"Svalbard et \u00cele Jan Mayen","SZ":"Swaziland","SY":"Syrie","SN":"S\u00e9n\u00e9gal","TJ":"Tadjikistan","TZ":"Tanzanie","TW":"Ta\u00efwan","TD":"Tchad","TF":"Terres australes fran\u00e7aises","IO":"Territoire britannique de l'oc\u00e9an Indien","PS":"Territoire palestinien","TH":"Tha\u00eflande","TL":"Timor oriental","TG":"Togo","TK":"Tokelau","TO":"Tonga","TT":"Trinit\u00e9-et-Tobago","TN":"Tunisie","TM":"Turkm\u00e9nistan","TR":"Turquie","TV":"Tuvalu","UA":"Ukraine","UY":"Uruguay","VU":"Vanuatu","VE":"Venezuela","VN":"Vi\u00eat Nam","WF":"Wallis-et-Futuna","YE":"Y\u00e9men","ZM":"Zambie","ZW":"Zimbabwe","ZZ":"r\u00e9gion ind\u00e9termin\u00e9e","EG":"\u00c9gypte","AE":"\u00c9mirats arabes unis","EC":"\u00c9quateur","ER":"\u00c9rythr\u00e9e","VA":"\u00c9tat de la Cit\u00e9 du Vatican","FM":"\u00c9tats f\u00e9d\u00e9r\u00e9s de Micron\u00e9sie","US":"\u00c9tats-Unis","ET":"\u00c9thiopie","BV":"\u00cele Bouvet","CX":"\u00cele Christmas","NF":"\u00cele Norfolk","IM":"\u00cele de Man","KY":"\u00celes Ca\u00efmans","CC":"\u00celes Cocos - Keeling","CK":"\u00celes Cook","FO":"\u00celes F\u00e9ro\u00e9","HM":"\u00celes Heard et MacDonald","FK":"\u00celes Malouines","MP":"\u00celes Mariannes du Nord","MH":"\u00celes Marshall","UM":"\u00celes Mineures \u00c9loign\u00e9es des \u00c9tats-Unis","SB":"\u00celes Salomon","TC":"\u00celes Turks et Ca\u00efques","VG":"\u00celes Vierges britanniques","VI":"\u00celes Vierges des \u00c9tats-Unis","AX":"\u00celes \u00c5land"}
    @countrylist = []
    for key of @countries
      @countrylist.push @countries[key]
    console.log @countrylist

  

  initAutocomplete :(name,source,element, onselecttec) =>
    substringMatcher = (strs) ->
      findMatches = (q, cb) ->
        matches = undefined
        substringRegex = undefined
        
        
        matches = []
        
        substrRegex = new RegExp(q, "i")
        
        $.each strs, (i, str) ->
          
          matches.push value: str  if substrRegex.test(str)
          return
        cb matches
        return
    element.typeahead(
      hint: true
      highlight: true
      minLength: 1
    ,
      name: name
      displayKey: "value"
      source: substringMatcher(source)).on "typeahead:selected", onselecttec

  render : =>
    @$el.html(template())
  
  
    $("#addDesiredCountry")
  
  countryDesiredSelected : =>
    if $("#inputDesiredCountry").val() != ""
      $("#addDesiredCountry").show()
    else
      $("#addDesiredCountry").hide()

  previousCountrySelected : =>
    if $("#inputInternationnalExperience").val() != ""
      $("#addPreviousCountry").show()
    else
      $("#addPreviousCountry").hide()

  display : ()=>
    @initAutocomplete "countries", @countrylist, $("#inputCountry"), null
    @initAutocomplete "countries-desired", @countrylist, $("#inputDesiredCountry"), @countryDesiredSelected
    @initAutocomplete "countries", @countrylist, $("#inputInternationnalExperience"), @previousCountrySelected
    @tagCollection = new TagCollection()
    @tagCollection.fetch
      success: ()=> 
        @tags = @tagCollection.models.map (model) =>
          model.get "name"
        @initAutocomplete "tags", @tags, $("#inputSpecialities") , null

      error : ()=>
        console.log "errror"
     

  validateForm : =>
    isValid = true
    if $('#inputFirstName').val() == ""
      $('#inputFirstName').parent().parent().addClass "has-error"
      isValid = false
    if $('#inputLastName').val() == ""
      isValid = false
      $('#inputLastName').parent().parent().addClass "has-error"
    if $('#inputBirthDate') == ""
      isValid = false
      $('#inputBirthDate').parent().parent().addClass "has-error"
    if $('#inputEmail').val == ""
      isValid = false
      $('#inputEmail').parent().parent().addClass "has-error"
    if $('#inputPhone').val() == ""
      isValid = false
      $('#inputPhone').parent().parent().addClass "has-error"
    if $('#inputPassword').val() == ""
      isValid = false
      $('#inputPassword').parent().parent().addClass "has-error"
    if $('#inputCountry').val() == ""
      isValid = false
      $('#inputCountry').parent().parent().addClass "has-error"
    if $('#inputNickname').val() == ""
      isValid = false
      $('#inputNickname').parent().parent().addClass "has-error"

    isValid

  saveUser : =>
    if !@validateForm()
      setTimeout (()=> $(".has-error").removeClass "has-error"), 2000
      return
    @user = new User()
    
    firstName = $('#inputFirstName').val()
    lastName = $('#inputLastName').val()
    birthDate = $('#inputBirthDate').val()
    email = $('#inputEmail').val()
    phone = $('#inputPhone').val()
    password = $('#inputPassword').val()
    country = $('#inputCountry').val()
    city = $('#inputCity').val()
    # specialities = $('#inputSpecialities').val()
    desiredCountry = $('#inputDesiredCountry').val()
    previousExperience = $('#inputInternationnalExperience').val()
    openForOpportunities = $('#inputOnpenForOpportunities').val()
    nickName = $('#inputNickname').val()
    
    city = $('#inputCity').val()


    @user.set "firstname", firstName
    @user.set "nickname", nickName
    
    @user.set "lastname", lastName
    @user.set "birthDate", birthDate
    @user.set "email", email
    @user.set "phone", phone
    @user.set "password", password
    @user.set "country", country
    @user.set "specialities", @currentTags
    @user.set "currentLocation", 
      country : country
      city : city
    @user.set "desiredCountries", @desiredCountries
    @user.set "pastCountries", @previsousCountries
    @user.set "openToOpportunities", openForOpportunities
    @user.save null,
        success: =>
          console.log "poupy"
        error:(model, fail, xhr)=>
          console.log "fail.responseText", fail.responseText
          if fail.responseText == "Email alreay taken"
            $('#inputEmail').parent().parent().addClass "has-error"
          else if fail.responseText == "Nickname alreay taken"
            $('#inputNickname').parent().parent().addClass "has-error"
          setTimeout (()=> $(".has-error").removeClass "has-error"), 2000


 
  
module.exports = CreateUserView
