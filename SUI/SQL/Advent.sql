USE [Advent] 
GO

SET NOCOUNT ON
GO

IF OBJECT_ID(N'apiClaimSave', N'P') IS NOT NULL DROP PROCEDURE [apiClaimSave]
IF OBJECT_ID(N'apiClaimStatus', N'P') IS NOT NULL DROP PROCEDURE [apiClaimStatus]
IF OBJECT_ID(N'apiClaimBinder', N'P') IS NOT NULL DROP PROCEDURE [apiClaimBinder]
IF OBJECT_ID(N'apiClaim', N'P') IS NOT NULL DROP PROCEDURE [apiClaim]
IF OBJECT_ID(N'apiClaims', N'P') IS NOT NULL DROP PROCEDURE [apiClaims]
IF OBJECT_ID(N'ClaimWith', N'U') IS NOT NULL DROP TABLE [ClaimWith]
IF OBJECT_ID(N'ClaimWithEnum', N'U') IS NOT NULL DROP TABLE [ClaimWithEnum]
IF OBJECT_ID(N'vwClaimStatusCurrent', N'V') IS NOT NULL DROP VIEW [vwClaimStatusCurrent]
IF OBJECT_ID(N'ClaimStatus', N'U') IS NOT NULL DROP TABLE [ClaimStatus]
IF OBJECT_ID(N'Claim', N'U') IS NOT NULL DROP TABLE [Claim]
IF OBJECT_ID(N'apiClaimant', N'P') IS NOT NULL DROP PROCEDURE [apiClaimant]
IF OBJECT_ID(N'apiClaimants', N'P') IS NOT NULL DROP PROCEDURE [apiClaimants]
IF OBJECT_ID(N'apiIncidentSave', N'P') IS NOT NULL DROP PROCEDURE [apiIncidentSave]
IF OBJECT_ID(N'apiIncidentDateTPANotifiedSLA', N'P') IS NOT NULL DROP PROCEDURE [apiIncidentDateTPANotifiedSLA]
IF OBJECT_ID(N'apiIncidentDateBrokerAdvisedSLA', N'P') IS NOT NULL DROP PROCEDURE [apiIncidentDateBrokerAdvisedSLA]
IF OBJECT_ID(N'apiIncidentCoverholder', N'P') IS NOT NULL DROP PROCEDURE [apiIncidentCoverholder]
IF OBJECT_ID(N'apiIncidentTPA', N'P') IS NOT NULL DROP PROCEDURE [apiIncidentTPA]
IF OBJECT_ID(N'apiIncidentBroker', N'P') IS NOT NULL DROP PROCEDURE [apiIncidentBroker]
IF OBJECT_ID(N'apiIncident', N'P') IS NOT NULL DROP PROCEDURE [apiIncident]
IF OBJECT_ID(N'apiIncidents', N'P') IS NOT NULL DROP PROCEDURE [apiIncidents]
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE [name] = N'FK_Incident_Claimant_PolicyholderId') ALTER TABLE [Incident] DROP CONSTRAINT [FK_Incident_Claimant_PolicyholderId]
IF OBJECT_ID(N'apiClaimantSave', N'P') IS NOT NULL DROP PROCEDURE [apiClaimantSave]
IF OBJECT_ID(N'Claimant', N'U') IS NOT NULL DROP TABLE [Claimant]
IF OBJECT_ID(N'vwIncidentStatusCurrent', N'V') IS NOT NULL DROP VIEW [vwIncidentStatusCurrent]
IF OBJECT_ID(N'IncidentStatus', N'U') IS NOT NULL DROP TABLE [IncidentStatus]
IF OBJECT_ID(N'Incident', N'U') IS NOT NULL DROP TABLE [Incident]
IF OBJECT_ID(N'apiGenders', N'P') IS NOT NULL DROP PROCEDURE [apiGenders]
IF OBJECT_ID(N'GenderEnum', N'U') IS NOT NULL DROP TABLE [GenderEnum]
IF OBJECT_ID(N'apiBinderPDF', N'P') IS NOT NULL DROP PROCEDURE [apiBinderPDF]
IF OBJECT_ID(N'apiBinders', N'P') IS NOT NULL DROP PROCEDURE [apiBinders]
IF OBJECT_ID(N'apiBinderSectionSave', N'P') IS NOT NULL DROP PROCEDURE [apiBinderSectionSave]
IF OBJECT_ID(N'BinderSectionLossFund', N'U') IS NOT NULL DROP TABLE [BinderSectionLossFund]
IF OBJECT_ID(N'apiLossFundSave', N'P') IS NOT NULL DROP PROCEDURE [apiLossFundSave]
IF OBJECT_ID(N'apiLossFundTPA', N'P') IS NOT NULL DROP PROCEDURE [apiLossFundTPA]
IF OBJECT_ID(N'apiLossFund', N'P') IS NOT NULL DROP PROCEDURE [apiLossFund]
IF OBJECT_ID(N'apiLossFunds', N'P') IS NOT NULL DROP PROCEDURE [apiLossFunds]
IF OBJECT_ID(N'LossFund', N'U') IS NOT NULL DROP TABLE [LossFund]
IF OBJECT_ID(N'apiCurrencies', N'P') IS NOT NULL DROP PROCEDURE [apiCurrencies]
IF OBJECT_ID(N'Currency', N'U') IS NOT NULL DROP TABLE [Currency]
IF OBJECT_ID(N'apiBinderSectionLossFund', N'P') IS NOT NULL DROP PROCEDURE [apiBinderSectionLossFund]
IF OBJECT_ID(N'apiBinderSectionCarrier', N'P') IS NOT NULL DROP PROCEDURE [apiBinderSectionCarrier]
IF OBJECT_ID(N'apiBinderSectionExpert', N'P') IS NOT NULL DROP PROCEDURE [apiBinderSectionExpert]
IF OBJECT_ID(N'apiBinderSectionTPA', N'P') IS NOT NULL DROP PROCEDURE [apiBinderSectionTPA]
IF OBJECT_ID(N'apiBinderSection', N'P') IS NOT NULL DROP PROCEDURE [apiBinderSection]
IF OBJECT_ID(N'apiBinderSections', N'P') IS NOT NULL DROP PROCEDURE [apiBinderSections]
IF OBJECT_ID(N'BinderSectionCarrier', N'U') IS NOT NULL DROP TABLE [BinderSectionCarrier]
IF OBJECT_ID(N'apiExpertType', N'P') IS NOT NULL DROP PROCEDURE [apiExpertType]
IF OBJECT_ID(N'BinderSectionExpert', N'U') IS NOT NULL DROP TABLE [BinderSectionExpert]
IF OBJECT_ID(N'BinderSection', N'U') IS NOT NULL DROP TABLE [BinderSection]
IF OBJECT_ID(N'apiClassOfBusiness', N'P') IS NOT NULL DROP PROCEDURE [apiClassOfBusiness]
IF OBJECT_ID(N'ClassOfBusiness', N'U') IS NOT NULL DROP TABLE [ClassOfBusiness]
IF OBJECT_ID(N'apiBinderDomiciled', N'P') IS NOT NULL DROP PROCEDURE [apiBinderDomiciled]
IF OBJECT_ID(N'apiBinderBroker', N'P') IS NOT NULL DROP PROCEDURE [apiBinderBroker]
IF OBJECT_ID(N'apiBinderCoverholder', N'P') IS NOT NULL DROP PROCEDURE [apiBinderCoverholder]
IF OBJECT_ID(N'apiBinderSave', N'P') IS NOT NULL DROP PROCEDURE [apiBinderSave]
IF OBJECT_ID(N'apiBinder', N'P') IS NOT NULL DROP PROCEDURE [apiBinder]
IF OBJECT_ID(N'Binder', N'U') IS NOT NULL DROP TABLE [Binder]
IF OBJECT_ID(N'apiCompanySave', N'P') IS NOT NULL DROP PROCEDURE [apiCompanySave]
IF OBJECT_ID(N'apiCompanyRoles', N'P') IS NOT NULL DROP PROCEDURE [apiCompanyRoles]
IF OBJECT_ID(N'apiCompany', N'P') IS NOT NULL DROP PROCEDURE [apiCompany]
IF OBJECT_ID(N'apiCompanies', N'P') IS NOT NULL DROP PROCEDURE [apiCompanies]
IF OBJECT_ID(N'CompanyRole', N'U') IS NOT NULL DROP TABLE [CompanyRole]
IF OBJECT_ID(N'CompanyType', N'U') IS NOT NULL DROP TABLE [CompanyType]
IF OBJECT_ID(N'Company', N'U') IS NOT NULL DROP TABLE [Company]
IF OBJECT_ID(N'apiTerritories', N'P') IS NOT NULL DROP PROCEDURE [apiTerritories]
IF OBJECT_ID(N'vwTerritoryCountries', N'V') IS NOT NULL DROP VIEW [vwTerritoryCountries]
IF OBJECT_ID(N'TerritoryCountry', N'U') IS NOT NULL DROP TABLE [TerritoryCountry]
IF OBJECT_ID(N'Territory', N'U') IS NOT NULL DROP TABLE [Territory]
IF OBJECT_ID(N'apiCountries', N'P') IS NOT NULL DROP PROCEDURE [apiCountries]
IF OBJECT_ID(N'Country', N'U') IS NOT NULL DROP TABLE [Country]
GO

CREATE TABLE [Country] (
  [Id] NCHAR(2) NOT NULL,
		[Name] NVARCHAR(255) NOT NULL,
		CONSTRAINT [PK_Country] PRIMARY KEY NONCLUSTERED ([Id]),
		CONSTRAINT [UQ_Country_Name] UNIQUE CLUSTERED ([Name])
	)
GO

-- ##TESTDATA
INSERT INTO [Country] ([Name], [Id])
VALUES
 (N'Afghanistan', N'AF'),
 (N'�land Islands', N'AX'),
 (N'Albania', N'AL'),
 (N'Algeria', N'DZ'),
 (N'American Samoa', N'AS'),
 (N'Andorra', N'AD'),
 (N'Angola', N'AO'),
 (N'Anguilla', N'AI'),
 (N'Antarctica', N'AQ'),
 (N'Antigua and Barbuda', N'AG'),
 (N'Argentina', N'AR'),
 (N'Armenia', N'AM'),
 (N'Aruba', N'AW'),
 (N'Australia', N'AU'),
 (N'Austria', N'AT'),
 (N'Azerbaijan', N'AZ'),
 (N'Bahamas', N'BS'),
 (N'Bahrain', N'BH'),
 (N'Bangladesh', N'BD'),
 (N'Barbados', N'BB'),
 (N'Belarus', N'BY'),
 (N'Belgium', N'BE'),
 (N'Belize', N'BZ'),
 (N'Benin', N'BJ'),
 (N'Bermuda', N'BM'),
 (N'Bhutan', N'BT'),
 (N'Bolivia, Plurinational State of', N'BO'),
 (N'Bonaire, Sint Eustatius and Saba', N'BQ'),
 (N'Bosnia and Herzegovina', N'BA'),
 (N'Botswana', N'BW'),
 (N'Bouvet Island', N'BV'),
 (N'Brazil', N'BR'),
 (N'British Indian Ocean Territory', N'IO'),
 (N'Brunei Darussalam', N'BN'),
 (N'Bulgaria', N'BG'),
 (N'Burkina Faso', N'BF'),
 (N'Burundi', N'BI'),
 (N'Cambodia', N'KH'),
 (N'Cameroon', N'CM'),
 (N'Canada', N'CA'),
 (N'Cape Verde', N'CV'),
 (N'Cayman Islands', N'KY'),
 (N'Central African Republic', N'CF'),
 (N'Chad', N'TD'),
 (N'Chile', N'CL'),
 (N'China', N'CN'),
 (N'Christmas Island', N'CX'),
 (N'Cocos (Keeling) Islands', N'CC'),
 (N'Colombia', N'CO'),
 (N'Comoros', N'KM'),
 (N'Congo', N'CG'),
 (N'Congo, the Democratic Republic of the', N'CD'),
 (N'Cook Islands', N'CK'),
 (N'Costa Rica', N'CR'),
 (N'Cote d''Ivoire', N'CI'),
 (N'Croatia', N'HR'),
 (N'Cuba', N'CU'),
 (N'Curaçao', N'CW'),
 (N'Cyprus', N'CY'),
 (N'Czech Republic', N'CZ'),
 (N'Denmark', N'DK'),
 (N'Djibouti', N'DJ'),
 (N'Dominica', N'DM'),
 (N'Dominican Republic', N'DO'),
 (N'Ecuador', N'EC'),
 (N'Egypt', N'EG'),
 (N'El Salvador', N'SV'),
 (N'Equatorial Guinea', N'GQ'),
 (N'Eritrea', N'ER'),
 (N'Estonia', N'EE'),
 (N'Ethiopia', N'ET'),
 (N'Falkland Islands (Malvinas)', N'FK'),
 (N'Faroe Islands', N'FO'),
 (N'Fiji', N'FJ'),
 (N'Finland', N'FI'),
 (N'France', N'FR'),
 (N'French Guiana', N'GF'),
 (N'French Polynesia', N'PF'),
 (N'French Southern Territories', N'TF'),
 (N'Gabon', N'GA'),
 (N'Gambia', N'GM'),
 (N'Georgia', N'GE'),
 (N'Germany', N'DE'),
 (N'Ghana', N'GH'),
 (N'Gibraltar', N'GI'),
 (N'Greece', N'GR'),
 (N'Greenland', N'GL'),
 (N'Grenada', N'GD'),
 (N'Guadeloupe', N'GP'),
 (N'Guam', N'GU'),
 (N'Guatemala', N'GT'),
 (N'Guernsey', N'GG'),
 (N'Guinea', N'GN'),
 (N'Guinea-Bissau', N'GW'),
 (N'Guyana', N'GY'),
 (N'Haiti', N'HT'),
 (N'Heard Island and McDonald Mcdonald Islands', N'HM'),
 (N'Holy See (Vatican City State)', N'VA'),
 (N'Honduras', N'HN'),
 (N'Hong Kong', N'HK'),
 (N'Hungary', N'HU'),
 (N'Iceland', N'IS'),
 (N'India', N'IN'),
 (N'Indonesia', N'ID'),
 (N'Iran, Islamic Republic of', N'IR'),
 (N'Iraq', N'IQ'),
 (N'Ireland', N'IE'),
 (N'Isle of Man', N'IM'),
 (N'Israel', N'IL'),
 (N'Italy', N'IT'),
 (N'Jamaica', N'JM'),
 (N'Japan', N'JP'),
 (N'Jersey', N'JE'),
 (N'Jordan', N'JO'),
 (N'Kazakhstan', N'KZ'),
 (N'Kenya', N'KE'),
 (N'Kiribati', N'KI'),
 (N'Korea, Democratic People''s Republic of', N'KP'),
 (N'Korea, Republic of', N'KR'),
 (N'Kuwait', N'KW'),
 (N'Kyrgyzstan', N'KG'),
 (N'Lao People''s Democratic Republic', N'LA'),
 (N'Latvia', N'LV'),
 (N'Lebanon', N'LB'),
 (N'Lesotho', N'LS'),
 (N'Liberia', N'LR'),
 (N'Libya', N'LY'),
 (N'Liechtenstein', N'LI'),
 (N'Lithuania', N'LT'),
 (N'Luxembourg', N'LU'),
 (N'Macao', N'MO'),
 (N'Macedonia, the Former Yugoslav Republic of', N'MK'),
 (N'Madagascar', N'MG'),
 (N'Malawi', N'MW'),
 (N'Malaysia', N'MY'),
 (N'Maldives', N'MV'),
 (N'Mali', N'ML'),
 (N'Malta', N'MT'),
 (N'Marshall Islands', N'MH'),
 (N'Martinique', N'MQ'),
 (N'Mauritania', N'MR'),
 (N'Mauritius', N'MU'),
 (N'Mayotte', N'YT'),
 (N'Mexico', N'MX'),
 (N'Micronesia, Federated States of', N'FM'),
 (N'Moldova, Republic of', N'MD'),
 (N'Monaco', N'MC'),
 (N'Mongolia', N'MN'),
 (N'Montenegro', N'ME'),
 (N'Montserrat', N'MS'),
 (N'Morocco', N'MA'),
 (N'Mozambique', N'MZ'),
 (N'Myanmar', N'MM'),
 (N'Namibia', N'NA'),
 (N'Nauru', N'NR'),
 (N'Nepal', N'NP'),
 (N'Netherlands', N'NL'),
 (N'New Caledonia', N'NC'),
 (N'New Zealand', N'NZ'),
 (N'Nicaragua', N'NI'),
 (N'Niger', N'NE'),
 (N'Nigeria', N'NG'),
 (N'Niue', N'NU'),
 (N'Norfolk Island', N'NF'),
 (N'Northern Mariana Islands', N'MP'),
 (N'Norway', N'NO'),
 (N'Oman', N'OM'),
 (N'Pakistan', N'PK'),
 (N'Palau', N'PW'),
 (N'Palestine, State of', N'PS'),
 (N'Panama', N'PA'),
 (N'Papua New Guinea', N'PG'),
 (N'Paraguay', N'PY'),
 (N'Peru', N'PE'),
 (N'Philippines', N'PH'),
 (N'Pitcairn', N'PN'),
 (N'Poland', N'PL'),
 (N'Portugal', N'PT'),
 (N'Puerto Rico', N'PR'),
 (N'Qatar', N'QA'),
 (N'Reunion', N'RE'),
 (N'Romania', N'RO'),
 (N'Russian Federation', N'RU'),
 (N'Rwanda', N'RW'),
 (N'Saint Barthélemy', N'BL'),
 (N'Saint Helena, Ascension and Tristan da Cunha', N'SH'),
 (N'Saint Kitts and Nevis', N'KN'),
 (N'Saint Lucia', N'LC'),
 (N'Saint Martin (French part)', N'MF'),
 (N'Saint Pierre and Miquelon', N'PM'),
 (N'Saint Vincent and the Grenadines', N'VC'),
 (N'Samoa', N'WS'),
 (N'San Marino', N'SM'),
 (N'Sao Tome and Principe', N'ST'),
 (N'Saudi Arabia', N'SA'),
 (N'Senegal', N'SN'),
 (N'Serbia', N'RS'),
 (N'Seychelles', N'SC'),
 (N'Sierra Leone', N'SL'),
 (N'Singapore', N'SG'),
 (N'Sint Maarten (Dutch part)', N'SX'),
 (N'Slovakia', N'SK'),
 (N'Slovenia', N'SI'),
 (N'Solomon Islands', N'SB'),
 (N'Somalia', N'SO'),
 (N'South Africa', N'ZA'),
 (N'South Georgia and the South Sandwich Islands', N'GS'),
 (N'South Sudan', N'SS'),
 (N'Spain', N'ES'),
 (N'Sri Lanka', N'LK'),
 (N'Sudan', N'SD'),
 (N'Suriname', N'SR'),
 (N'Svalbard and Jan Mayen', N'SJ'),
 (N'Swaziland', N'SZ'),
 (N'Sweden', N'SE'),
 (N'Switzerland', N'CH'),
 (N'Syrian Arab Republic', N'SY'),
 (N'Taiwan, Province of China', N'TW'),
 (N'Tajikistan', N'TJ'),
 (N'Tanzania, United Republic of', N'TZ'),
 (N'Thailand', N'TH'),
 (N'Timor-Leste', N'TL'),
 (N'Togo', N'TG'),
 (N'Tokelau', N'TK'),
 (N'Tonga', N'TO'),
 (N'Trinidad and Tobago', N'TT'),
 (N'Tunisia', N'TN'),
 (N'Turkey', N'TR'),
 (N'Turkmenistan', N'TM'),
 (N'Turks and Caicos Islands', N'TC'),
 (N'Tuvalu', N'TV'),
 (N'Uganda', N'UG'),
 (N'Ukraine', N'UA'),
 (N'United Arab Emirates', N'AE'),
 (N'United Kingdom', N'GB'),
 (N'United States', N'US'),
 (N'United States Minor Outlying Islands', N'UM'),
 (N'Uruguay', N'UY'),
 (N'Uzbekistan', N'UZ'),
 (N'Vanuatu', N'VU'),
 (N'Venezuela, Bolivarian Republic of', N'VE'),
 (N'Viet Nam', N'VN'),
 (N'Virgin Islands, British', N'VG'),
 (N'Virgin Islands, U.S.', N'VI'),
 (N'Wallis and Futuna', N'WF'),
 (N'Western Sahara', N'EH'),
 (N'Yemen', N'YE'),
 (N'Zambia', N'ZM'),
 (N'Zimbabwe', N'ZW')
GO

CREATE PROCEDURE [apiCountries](@UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT [Id], [Name] FROM [Country] ORDER BY [Name]
	RETURN
END
GO

CREATE TABLE [Territory] (
  [Id] INT NOT NULL IDENTITY (1, 1),
		[Name] NVARCHAR(255) NOT NULL,
		[Type] BIT NULL,
		CONSTRAINT [PK_Territory] PRIMARY KEY NONCLUSTERED ([Id]),
		CONSTRAINT [UQ_Territory_Name] UNIQUE ([Name]),
		CONSTRAINT [UQ_Territory_Type] UNIQUE ([Id], [Type]),
	)
GO

CREATE TABLE [TerritoryCountry] (
  [TerritoryId] INT NOT NULL,
		[Type] BIT NOT NULL,
		[CountryId] NCHAR(2) NOT NULL,
		CONSTRAINT [PK_TerritoryCountry] PRIMARY KEY CLUSTERED ([TerritoryId], [CountryId]),
		CONSTRAINT [FK_TerritoryCountry_Territory] FOREIGN KEY ([TerritoryId], [Type]) REFERENCES [Territory] ([Id], [Type]) ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT [FK_TerritoryCountry_Country] FOREIGN KEY ([CountryId]) REFERENCES [Country] ([Id]) ON DELETE CASCADE
	)
GO

-- ##TESTDATA
SET IDENTITY_INSERT [Territory] ON
INSERT INTO [Territory] ([Id], [Name], [Type])
VALUES
 (0, N'All Countries', NULL),
	(1, N'UK Only', 1),
	(2, N'US Only', 1),
	(3, N'Outside UK', 0),
	(4, N'Outside US', 0),
	(5, N'USA excluding US Virgin Islands, including Canada & Bermuda', 1)
SET IDENTITY_INSERT [Territory] OFF
GO

-- ##TESTDATA
INSERT INTO [TerritoryCountry] ([TerritoryId], [Type], [CountryId])
VALUES
 (1, 1, N'GB'),
	(2, 1, N'US'),
	(3, 0, N'GB'),
	(4, 0, N'US'),
 (5, 1, N'US'),
	(5, 1, N'CA'),
	(5, 1, N'BM')
GO

CREATE VIEW [vwTerritoryCountries]
AS
SELECT
 [TerritoryId] = t.[Id],
	[Territory] = t.[Name],
	[CountryId] = c.[Id],
	[Country] = c.[Name]
FROM [Territory] t CROSS JOIN [Country] c
 LEFT JOIN [TerritoryCountry] tc ON t.[Id] = tc.[TerritoryId] AND c.[Id] = tc.[CountryId]
WHERE (
   t.[Type] IS NULL
			OR (t.[Type] = 1 AND tc.[CountryId] IS NOT NULL)
			OR (t.[Type] = 0 AND tc.[CountryId] IS NULL)
  )
GO

CREATE PROCEDURE [apiTerritories](@CountryId NCHAR(2) = NULL, @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	IF @CountryId IS NULL
	 SELECT [TerritoryId] = [Id], [Territory] = [Name]
		FROM [Territory]
		ORDER BY [Name]
	ELSE
	 SELECT [TerritoryId], [Territory]
		FROM [vwTerritoryCountries]
		WHERE [CountryId] = @CountryId
		ORDER BY [Territory]
	RETURN
END
GO

CREATE TABLE [Company] (
  [Id] INT NOT NULL IDENTITY (1, 1),
		[Name] NVARCHAR(255) NOT NULL,
		[DisplayName] AS [Name] + N' (' + [CountryId] + N')' PERSISTED,
		[Address] NVARCHAR(255) NULL,
		[Postcode] NVARCHAR(25) NULL,
		[CountryId] NCHAR(2) NOT NULL,
		[LBR] BIT NOT NULL CONSTRAINT [DF_Company_LBR] DEFAULT (0), -- Lloyd's Broker
		[COV] BIT NOT NULL CONSTRAINT [DF_Company_COV] DEFAULT (0), -- Coverholder
		[CAR] BIT NOT NULL CONSTRAINT [DF_Company_CAR] DEFAULT (0), -- Carrier
		[TPA] BIT NOT NULL CONSTRAINT [DF_Company_TPA] DEFAULT (0), -- Third-Party Administrator
		[RBR] BIT NOT NULL CONSTRAINT [DF_Company_RBR] DEFAULT (0), -- Retail Broker
		[CreatedDTO] DATETIMEOFFSET NOT NULL CONSTRAINT [DF_Company_CreatedDTO] DEFAULT (GETUTCDATE()),
		[CreatedById] INT NOT NULL,
		[UpdatedDTO] DATETIMEOFFSET NOT NULL CONSTRAINT [DF_Company_UpdatedDTO] DEFAULT (GETUTCDATE()),
		[UpdatedById] INT NOT NULL,
		[Active] BIT NOT NULL CONSTRAINT [DF_Company_Active] DEFAULT (1),
		CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED ([Id]),
		CONSTRAINT [UQ_Company_Name] UNIQUE ([CountryId], [Name]),
		CONSTRAINT [FK_Company_Country] FOREIGN KEY ([CountryId]) REFERENCES [Country] ([Id]),
		CONSTRAINT [FK_Company_User_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [User] ([Id]),
		CONSTRAINT [FK_Company_User_UpdatedById] FOREIGN KEY ([UpdatedById]) REFERENCES [User] ([Id]),
		CONSTRAINT [CK_Company_UpdatedDTO] CHECK ([UpdatedDTO] >= [CreatedDTO])
	)
GO

/*
-- ##TESTDATA
INSERT INTO [Company] ([Name], [CountryId], [LBR], [COV], [CAR], [TPA], [RBR], [CreatedById], [UpdatedById])
SELECT [Name], [CountryId], [LBR], [COV], [CAR], [TPA], [RBR], 1, 1
FROM (VALUES
   ('A Plus Lawn Care'),
   ('A+ Investments'),
   ('Aaronson Furniture'),
   ('Accord Investments'),
   ('Acuserv'),
   ('Adapt'),
   ('Alexander''s'),
   ('Allied Radio'),
   ('Anderson-Little'),
   ('Angel''s'),
   ('Asian Answers'),
   ('Asian Junction'),
   ('Asian Plan'),
   ('Atlas Architectural Designs'),
   ('Atlas Realty'),
   ('Audio Visions'),
   ('Avant Garde Appraisal Group'),
   ('Avant Garde Interior Designs'),
   ('Balanced Fortune'),
   ('Baltimore Markets'),
   ('Bay Furniture'),
   ('Best Products'),
   ('Big A Auto Parts'),
   ('Big D Supermarkets'),
   ('Big Star Markets'),
   ('Blockbuster Music'),
   ('Body Toning'),
   ('Bold Ideas'),
   ('Bonanza Produce Stores'),
   ('Briazz'),
   ('Brilliant Home Designs'),
   ('Britling Cafeterias'),
   ('Brooks Fashions'),
   ('Buehler Foods'),
   ('Buena Vista Garden Maintenance'),
   ('Builders Emporium'),
   ('Burger Chef'),
   ('Carl Durfees'),
   ('Carter''s Foods'),
   ('Castro Convertibles'),
   ('Central Hardware'),
   ('Channel Home Centers'),
   ('Chargepal'),
   ('Cherry & Webb'),
   ('Chess King'),
   ('Chi-Chi''s'),
   ('Children''s Palace'),
   ('Circuit Design'),
   ('Club Wholesale'),
   ('Coast to Coast Hardware'),
   ('Coconut''s'),
   ('Colonial Stores'),
   ('Compact Disc Center'),
   ('CompuAdd'),
   ('Consumers and Consumers Express'),
   ('Cougar Investment'),
   ('Country Club Markets'),
   ('Crafts Canada'),
   ('Crazy Eddie'),
   ('Crown Books'),
   ('Cut Above'),
   ('Dave Cooks'),
   ('De Pinna'),
   ('Delchamps'),
   ('Destiny Planners'),
   ('Destiny Realty'),
   ('Dick Fischers'),
   ('Disc Jockey'),
   ('Dream Home Improvements'),
   ('Druther''s'),
   ('Earl Abel''s'),
   ('Earthworks Garden Kare'),
   ('Earthworks Yard Maintenance'),
   ('Eden Lawn Service'),
   ('Edge Yard Service'),
   ('Eisner Food Stores'),
   ('Electric Avenue'),
   ('Electronic Geek'),
   ('Electronics Source'),
   ('Ellman''s Catalog Showrooms'),
   ('Elm Farm'),
   ('Endicott Johnson'),
   ('Endicott Shoes'),
   ('Envirotecture Design Service'),
   ('Erb Lumber'),
   ('Erol''s'),
   ('Exact Solutions'),
   ('EXPO Design Center'),
   ('Express Merchant Service'),
   ('E-zhe Source'),
   ('Farmer Jack'),
   ('Fayva'),
   ('Fedco'),
   ('First Choice Yard Help'),
   ('First Rate Choice'),
   ('Flipside Records'),
   ('FlowerTime'),
   ('Food Fair'),
   ('Food Mart'),
   ('Foreman & Clark'),
   ('Forest City'),
   ('Formula Gray'),
   ('Foxmoor'),
   ('Franklin Simon'),
   ('Frank''s Nursery & Crafts'),
   ('Fresh Start'),
   ('Future Bright'),
   ('Future Plan'),
   ('G.I. Joe''s'),
   ('Galaxy Man'),
   ('Gallenkamp'),
   ('Galyan''s'),
   ('Gamma Grays'),
   ('Gantos'),
   ('Garden Guru'),
   ('Garden Master'),
   ('Gas Depot'),
   ('Geri''s Hamburgers'),
   ('Giant'),
   ('Gino''s Hamburgers'),
   ('Gold Leaf Garden Management'),
   ('Gold Touch'),
   ('Golden''s Distributors'),
   ('Golf Augusta Pro Shops'),
   ('Good Guys'),
   ('Grade A Investment'),
   ('Grand Union'),
   ('Great American Music'),
   ('Great Clothes'),
   ('Grossman''s'),
   ('Handy Andy'),
   ('Hanover Shoe'),
   ('Hastings'),
   ('Heilig-Meyers'),
   ('Helios Air'),
   ('Helping Hand'),
   ('Henry''s'),
   ('Herman''s World of Sporting Goods'),
   ('Highland Appliance'),
   ('Hills Supermarkets'),
   ('Holly Tree Inn'),
   ('Home Centers'),
   ('Home Quarters Warehouse'),
   ('HomeBase'),
   ('Honest Air Group'),
   ('House Of Denmark'),
   ('House Works'),
   ('Hoyden'),
   ('Hudson''s MensWear'),
   ('Hugh M. Woods'),
   ('Hughes & Hatcher'),
   ('Hughes Markets'),
   ('Ideal Garden Management'),
   ('Incredible Universe'),
   ('Integra Design'),
   ('Integra Wealth'),
   ('Intelacard'),
   ('Intelli Wealth Group'),
   ('Irving''s Sporting Goods'),
   ('J. K. Gill Company'),
   ('Jack Lang'),
   ('Janeville'),
   ('Jitney Jungle'),
   ('Judy''s'),
   ('Just For Feet'),
   ('K&G Distributors'),
   ('Karl''s Shoes'),
   ('Keeney''s'),
   ('Kelly and Cohen'),
   ('Kelsey''s Neighbourhood Bar & Grill'),
   ('Kids Mart'),
   ('Kinney Shoes'),
   ('Knockout Kickboxing'),
   ('Kohl''s Food Stores'),
   ('Kragen Auto Parts'),
   ('Krauses Sofa Factory'),
   ('L'' Fish'),
   ('Landskip Yard Care'),
   ('Larry''s Markets'),
   ('Laughner''s Cafeteria'),
   ('Laura Ashley Mother & Child'),
   ('Laura Ashley'),
   ('Lechters Housewares'),
   ('Leonard Krower & Sons'),
   ('Liberal'),
   ('Liberty Wealth Planner'),
   ('Licorice Pizza'),
   ('Life Map Planners'),
   ('Life Map'),
   ('Listenin'' Booth'),
   ('Little Folk Shops'),
   ('Littler''s'),
   ('Lone Wolf Wealth Planning'),
   ('Luria''s'),
   ('MacMarr Stores'),
   ('Macroserve'),
   ('Madcats Music & Books'),
   ('Mages'),
   ('Magik Gray'),
   ('Magik Grey'),
   ('Magna Architectural Design'),
   ('Magna Solution'),
   ('Magna Wealth'),
   ('Manu Connection'),
   ('Marianne'),
   ('Market Basket'),
   ('Matrix Design'),
   ('Matrix Interior Design'),
   ('Maurice The Pants Man'),
   ('Maxiserve '),
   ('Maxi-Tech'),
   ('Megatronic'),
   ('Merry-Go-Round'),
   ('Metro'),
   ('Mighty Casey''s'),
   ('Mikro Designs'),
   ('Mikrotechnic'),
   ('Mission Realty'),
   ('Mission You'),
   ('Modern Architecture Design'),
   ('Modern Realty'),
   ('Monit'),
   ('Monk Home Funding Services'),
   ('Monk Home Improvements'),
   ('Monk Home Loans'),
   ('Monk Real Estate Service'),
   ('Monsource'),
   ('Morrie Mages'),
   ('Movie Gallery'),
   ('Multicerv'),
   ('Muscle Factory'),
   ('Music Den'),
   ('Musicland'),
   ('MVP Sports'),
   ('Nan Duskin'),
   ('National Tea'),
   ('Nedick''s'),
   ('Netcore'),
   ('Netobill'),
   ('Newhair'),
   ('Newmark & Lewis'),
   ('Northern Reflections'),
   ('Northern Star'),
   ('Nutri G'),
   ('O.K. Fairbanks'),
   ('Office Warehouse'),
   ('Official All Star Caf�'),
   ('Olympic Sports'),
   ('Omni Architectural Designs'),
   ('Omni Superstore'),
   ('Omni Tech Solutions'),
   ('On Cue'),
   ('One-Up Realtors'),
   ('One-Up Realty'),
   ('Opticomp'),
   ('Oranges Records & Tapes'),
   ('Orion'),
   ('Pace Membership Warehouse'),
   ('Pak and Save'),
   ('Pantry Pride'),
   ('Parts America'),
   ('Patterson-Fletcher'),
   ('Paul''s Food Mart'),
   ('Paul''s Record Hut'),
   ('Pay ''N Pak'),
   ('Payless Cashways'),
   ('Pay''N Takeit'),
   ('Pender''s Food Stores'),
   ('Piccolo Mondo'),
   ('Piece Goods Fabric'),
   ('Plan Future'),
   ('Plan Smart Partner'),
   ('Plan Smart'),
   ('Planet Pizza'),
   ('Planetbiz'),
   ('Platinum Interior Design'),
   ('Play Town'),
   ('Pleasures and Pasttimes'),
   ('Pointers'),
   ('Poore Simon''s'),
   ('Practi-Plan Mapping'),
   ('Practi-Plan'),
   ('Prahject Planner'),
   ('Price Club'),
   ('PriceRite Warehouse Club'),
   ('Pro Property Maintenance'),
   ('Pro Star Garden Management'),
   ('Pro-Care Garden Maintenance'),
   ('Protean'),
   ('Quality Event Planner'),
   ('Quality Merchant Services'),
   ('Quest Technology Service'),
   ('Rack N Sack'),
   ('Rainbow Life'),
   ('Red Baron Electronics'),
   ('Red Food'),
   ('Rhodes Furniture'),
   ('Rickel'),
   ('Roadhouse Grill'),
   ('Roberd''s'),
   ('Robinson Furniture'),
   ('Romp'),
   ('Rossi Auto Parts'),
   ('Rustler Steak House'),
   ('S&W Cafeteria'),
   ('Sam Goody'),
   ('Sammy''s Record Shack'),
   ('Sandy''s'),
   ('Sanitary Grocery Stores'),
   ('Schaak Electronics'),
   ('Scott Ties'),
   ('Scotty''s Builders Supply'),
   ('Seamans Furniture'),
   ('Sears Homelife'),
   ('Second Time Around'),
   ('Sew-Fro Fabrics'),
   ('Shoe Kicks'),
   ('Shoe Pavilion'),
   ('Shoe Town'),
   ('Signa Air'),
   ('Smitty''s Marketplace'),
   ('Soft Warehouse'),
   ('Solution Bridge'),
   ('Soul Sounds Unlimited'),
   ('Sound Advice'),
   ('Sound Warehouse'),
   ('Sounds of Soul Records & Tapes'),
   ('Source Club'),
   ('Sportmart'),
   ('Star Merchant Services'),
   ('Starship Tapes & Records'),
   ('Steinberg''s'),
   ('Steve''s Ice Cream'),
   ('Stop and Shop'),
   ('Stop N Shop'),
   ('Stratabiz'),
   ('Strategic Profit'),
   ('Strategy Consulting'),
   ('Strategy Planner'),
   ('Strength Gurus'),
   ('Success Is Yours'),
   ('Sun Television and Appliances'),
   ('Sunflower Market'),
   ('Sunny Real Estate Investments'),
   ('Super Shops'),
   ('Susie''s Casuals'),
   ('System Star'),
   ('Tape World'),
   ('Team Electronics'),
   ('Tee Town'),
   ('Terra Nova Garden Services'),
   ('Thalhimers'),
   ('The Goose and Duck'),
   ('The Great Train Stores'),
   ('The Independent Planners'),
   ('The Lawn Guru'),
   ('The Network Chef'),
   ('The Pink Pig Tavern'),
   ('The Polka Dot Bear Tavern'),
   ('The Wall'),
   ('The White Swan'),
   ('Thom McAn Store'),
   ('Thriftway Food Mart'),
   ('Total Sources'),
   ('Total Yard Maintenance'),
   ('Tower Records'),
   ('Twin Food Stores'),
   ('Ukrop''s Super Market'),
   ('Unity Stationers'),
   ('Universo Realtors'),
   ('Value Giant'),
   ('Vibrant Man'),
   ('Virgin Megastores'),
   ('VitaGrey'),
   ('Vitamax Health Food Center'),
   ('Waccamaw''s Homeplace'),
   ('Wag''s'),
   ('Walt''s IGA'),
   ('Warner Brothers Studio Store'),
   ('Warshal''s'),
   ('Waves Music'),
   ('Wealth Zone Group'),
   ('Western Auto'),
   ('Wetson''s'),
   ('Whitlocks Auto Supply'),
   ('Widdmann'),
   ('William Wanamaker & Sons'),
   ('Wise Solutions'),
   ('Woolf Brothers'),
   ('World of Fun'),
   ('Yardbirds Home Center'),
   ('York Steak House'),
   ('You Are Successful'),
   ('Zephyr Investments')
  ) cmp ([Name])
	CROSS APPLY (SELECT TOP 1 [Id] FROM [Country] WHERE [Id] IN (N'GB', N'IE', N'US') AND cmp.[Name] IS NOT NULL ORDER BY NEWID()) co ([CountryId])
	CROSS APPLY (SELECT TOP 1 [Bit] FROM (VALUES (0), (1)) b ([Bit]) WHERE cmp.[Name] IS NOT NULL ORDER BY NEWID()) lbr ([LBR])
	CROSS APPLY (SELECT TOP 1 [Bit] FROM (VALUES (0), (1)) b ([Bit]) WHERE cmp.[Name] IS NOT NULL ORDER BY NEWID()) cov ([COV])
	CROSS APPLY (SELECT TOP 1 [Bit] FROM (VALUES (0), (1)) b ([Bit]) WHERE cmp.[Name] IS NOT NULL ORDER BY NEWID()) car ([CAR])
	CROSS APPLY (SELECT TOP 1 [Bit] FROM (VALUES (0), (1)) b ([Bit]) WHERE cmp.[Name] IS NOT NULL ORDER BY NEWID()) tpa ([TPA])
	CROSS APPLY (SELECT TOP 1 [Bit] FROM (VALUES (0), (1)) b ([Bit]) WHERE cmp.[Name] IS NOT NULL ORDER BY NEWID()) rbr ([RBR])
GO
*/

CREATE TABLE [CompanyRole] (
  [Id] NCHAR(3) NOT NULL,
		[Description] NVARCHAR(25) NOT NULL,
		[Sort] TINYINT NOT NULL,
		CONSTRAINT [PK_CompanyRole] PRIMARY KEY NONCLUSTERED ([Id]),
		CONSTRAINT [UQ_CompanyRole_Description] UNIQUE ([Description]),
		CONSTRAINT [UQ_CompanyRole_Sort] UNIQUE CLUSTERED ([Sort])
	)
GO

INSERT INTO [CompanyRole] ([Id], [Description], [Sort])
VALUES
 (N'LBR', N'Lloyd''s Broker', 1),
	(N'COV', N'Coverholder', 2),
	(N'CAR', N'Carrier', 3),
	(N'TPA', N'Third-Party Administrator', 4),
	(N'RBR', N'Retail Broker', 5)
GO

CREATE TABLE [CompanyType] (
	[Id] SMALLINT IDENTITY(1,1) NOT NULL,
	[Description] NVARCHAR(50) NOT NULL CONSTRAINT [UQ_CompanyType_Name] UNIQUE,
	CONSTRAINT [PK_CompanyType] PRIMARY KEY NONCLUSTERED ([Id] ASC)
)
GO 

INSERT INTO [CompanyType] ([Description])
VALUES(N'Broker'),
	(N'TPA'),
	(N'Carrier'),
	(N'MGA'),
	(N'Solicitor'),
	(N'Accountant'),
	(N'Engineer'),
	(N'Loss Adjuster'),
	(N'Doctor'),
	(N'Coverholder')
GO

CREATE PROCEDURE [apiCompanies](@UserId INT, @RoleId NCHAR(3) = NULL)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
	 [CompanyId] = cmp.[Id],
		[Name] = cmp.[Name],
		[CountryId] = cmp.[CountryId],
		[Country] = co.[Name]
	FROM [Company] cmp
	 JOIN [Country] co ON cmp.[CountryId] = co.[Id]
	ORDER BY cmp.[Name], co.[Name]
	RETURN
END
GO

CREATE PROCEDURE [apiCompany](@UserId INT, @CompanyId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
 SELECT
	 [CompanyId] = cmp.[Id],
		[Name] = cmp.[Name],
		[Address] = cmp.[Address],
		[Postcode] = cmp.[Postcode],
		[CountryId] = cmp.[CountryId],
		[LBR] = cmp.[LBR],
		[COV] = cmp.[COV],
		[CAR] = cmp.[CAR],
		[TPA] = cmp.[TPA],
		[RBR] = cmp.[RBR],
		[UpdatedDTO] = cmp.[UpdatedDTO]
	FROM [Company] cmp
	WHERE cmp.[Id] = @CompanyId
	RETURN
END
GO

CREATE PROCEDURE [apiCompanyRoles](@UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT [Id], [Description] FROM [CompanyRole] ORDER BY [Sort]
	RETURN
END
GO

CREATE PROCEDURE [apiCompanySave](
  @CompanyId INT = NULL,
		@Name NVARCHAR(255) = NULL,
		@Address NVARCHAR(255) = NULL,
		@Postcode NVARCHAR(25) = NULL,
		@CountryId NCHAR(2) = NULL,
		@LBR BIT = NULL,
		@COV BIT = NULL,
		@CAR BIT = NULL,
		@TPA BIT = NULL,
		@RBR BIT = NULL,
		@Active BIT = NULL,
		@UserId INT
 )
AS
BEGIN

 IF @CompanyId IS NULL BEGIN

	 INSERT INTO [Company] (
		  [Name],
				[Address],
				[PostCode],
				[CountryId],
				[LBR],
				[COV],
				[CAR],
				[TPA],
				[RBR],
				[CreatedDTO],
				[CreatedById],
				[UpdatedDTO],
				[UpdatedById],
				[Active]
			)
		VALUES (
		  @Name,
				@Address,
				@Postcode,
				ISNULL(@CountryId, N'GB'),
				ISNULL(@LBR, 0),
				ISNULL(@COV, 0),
				ISNULL(@CAR, 0),
				ISNULL(@TPA, 0),
				ISNULL(@RBR, 0),
				GETUTCDATE(),
				@UserId,
				GETUTCDATE(),
				@UserId,
				ISNULL(@Active, 1)
			)
		SET @CompanyId = SCOPE_IDENTITY()

	END ELSE BEGIN

	 UPDATE [Company]
		SET
		 [Name] = ISNULL(@Name, [Name]),
			[Address] = ISNULL(@Address, [Address]),
			[Postcode] = ISNULL(@Postcode, [Postcode]),
			[CountryId] = ISNULL(@CountryId, [CountryId]),
			[LBR] = ISNULL(@LBR, [LBR]),
			[COV] = ISNULL(@COV, [LBR]),
			[CAR] = ISNULL(@CAR, [CAR]),
			[TPA] = ISNULL(@TPA, [TPA]),
			[RBR] = ISNULL(@RBR, [RBR]),
			[UpdatedDTO] = GETUTCDATE(),
			[UpdatedById] = @UserId,
			[Active] = ISNULL(@Active, [Active])
		WHERE [Id] = @CompanyId

	END

	SELECT [CompanyId] = @CompanyId

	RETURN
END
GO

CREATE TABLE [Binder] (
  [Id] INT NOT NULL IDENTITY (1, 1),
		[UMR] NVARCHAR(50) NOT NULL,
		[Reference] NVARCHAR(50) NULL,
		[BrokerId] INT NOT NULL,
		[CoverholderId] INT NOT NULL,
		[InceptionDate] DATE NOT NULL,
		[ExpiryDate] DATE NOT NULL,
		[RisksTerritoryId] INT NOT NULL,
		[DomiciledTerritoryId] INT NOT NULL,
		[LimitsTerritoryId] INT NOT NULL,
		[CreatedDTO] DATETIMEOFFSET NOT NULL CONSTRAINT [DF_Binder_CreatedDTO] DEFAULT (GETUTCDATE()),
		[CreatedById] INT NOT NULL,
		[UpdatedDTO] DATETIMEOFFSET NOT NULL CONSTRAINT [DF_Binder_UpdatedDTO] DEFAULT (GETUTCDATE()),
		[UpdatedById] INT NOT NULL,
		CONSTRAINT [PK_Binder] PRIMARY KEY CLUSTERED ([Id]),
		CONSTRAINT [UQ_Binder_UMR] UNIQUE ([UMR]),
		CONSTRAINT [FK_Binder_Company_BrokerId] FOREIGN KEY ([BrokerId]) REFERENCES [Company] ([Id]),
		CONSTRAINT [FK_Binder_Company_CoverholderId] FOREIGN KEY ([CoverholderId]) REFERENCES [Company] ([Id]),
		CONSTRAINT [FK_Binder_Territory_RisksTerritoryId] FOREIGN KEY ([RisksTerritoryId]) REFERENCES [Territory] ([Id]),
		CONSTRAINT [FK_Binder_Territory_DomiciledTerritoryId] FOREIGN KEY ([DomiciledTerritoryId]) REFERENCES [Territory] ([Id]),
		CONSTRAINT [FK_Binder_Territory_LimitsTerritoryId] FOREIGN KEY ([LimitsTerritoryId]) REFERENCES [Territory] ([Id]),
		CONSTRAINT [FK_Binder_User_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [User] ([Id]),
		CONSTRAINT [FK_Binder_User_UpdatedById] FOREIGN KEY ([UpdatedById]) REFERENCES [User] ([Id]),
		CONSTRAINT [CK_Binder_ExpiryDate] CHECK ([ExpiryDate] >= [InceptionDate]),
		CONSTRAINT [CK_Binder_UpdatedDTO] CHECK ([UpdatedDTO] >= [CreatedDTO])
	)
GO

/*
-- ##TESTDATA
INSERT INTO [Binder] ([UMR], [Reference], [BrokerId], [CoverholderId], [InceptionDate], [ExpiryDate], [RisksTerritoryId], [DomiciledTerritoryId], [LimitsTerritoryId], [CreatedById], [UpdatedById])
SELECT
 [UMR] = N'UMR' + RIGHT(N'000000' + CONVERT(NVARCHAR(10), v.[number]), 6),
	[Reference] = N'REF' + RIGHT(N'000000' + CONVERT(NVARCHAR(10), v.[number] * (2 + v.[number])), 6),
	[BrokerId] = lbr.[Id],
	[CoverholderId] = cov.[Id],
	[InceptionDate] = dte.[InceptionDate],
	[ExpiryDate] = DATEADD(day, -1, DATEADD(year, 1, dte.[InceptionDate])),
	[RisksTerritoryId] = (SELECT TOP 1 [Id] FROM [Territory] WHERE v.[number] IS NOT NULL ORDER BY NEWID()),
	[DomiciledTerritoryId] = (SELECT TOP 1 [TerritoryId] FROM [vwTerritoryCountries] tc WHERE cov.[CountryId] = tc.[CountryId] ORDER BY NEWID()),
	[LmitsTerritoryId] = (SELECT TOP 1 [Id] FROM [Territory] WHERE v.[number] IS NOT NULL ORDER BY NEWID()),
	[CreatedById] = 1,
	[UpdatedById] = 1
FROM [master]..[spt_values] v
 CROSS APPLY (SELECT TOP 1 * FROM [Company] WHERE [LBR] = 1 AND v.[number] IS NOT NULL ORDER BY NEWID()) lbr
	CROSS APPLY (SELECT TOP 1 * FROM [Company] WHERE [COV] = 1 AND v.[number] IS NOT NULL ORDER BY NEWID()) cov
	CROSS APPLY (SELECT DATEADD(month, v.[number] / 2, N'1995-01-01')) dte ([InceptionDate])
WHERE v.[type] = N'P'
 AND v.[number] BETWEEN 1 AND 500
GO
*/

CREATE PROCEDURE [apiBinder](@UserId INT, @BinderId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
	 [BinderId] = b.[Id],
		[UMR] = b.[UMR], 
		[Reference] = b.[Reference],
		[BrokerId] = b.[BrokerId],
		[CoverholderId] = b.[CoverholderId],
		[InceptionDate] = b.[InceptionDate],
		[ExpiryDate] = b.[ExpiryDate],
		[RisksTerritoryId] = b.[RisksTerritoryId],
		[DomiciledTerritoryId] = b.[DomiciledTerritoryId],
		[LimitsTerritoryId] = b.[LimitsTerritoryId]
	FROM [Binder] b
	WHERE b.[Id] = @BinderId
	RETURN
END
GO

CREATE PROCEDURE [apiBinderSave](
  @BinderId INT = NULL,
  @UMR NVARCHAR(50) = NULL,
		@Reference NVARCHAR(50) = NULL,
		@BrokerId INT = NULL,
		@CoverholderId INT = NULL,
		@InceptionDate DATE = NULL,
		@ExpiryDate DATE = NULL,
		@RisksTerritoryId INT = NULL,
		@DomiciledTerritoryId INT = NULL,
		@LimitsTerritoryId INT = NULL,
  @UserId INT
	)
AS
BEGIN
 IF @BinderId IS NULL BEGIN

		INSERT INTO [Binder] (
				[UMR],
				[Reference],
				[BrokerId],
				[CoverholderId],
				[InceptionDate],
				[ExpiryDate],
				[RisksTerritoryId],
				[DomiciledTerritoryId],
				[LimitsTerritoryId],
				[CreatedDTO],
				[CreatedById],
				[UpdatedDTO],
				[UpdatedById]
			)
		SELECT
			[UMR] = @UMR,
			[Reference] = @Reference,
			[BrokerId] = @BrokerId,
			[CoverholderId] = @CoverholderId,
			[InceptionDate] = @InceptionDate,
			[ExpiryDate] = @ExpiryDate,
			[RisksTerritoryId] = @RisksTerritoryId,
			[DomiciledTerritoryId] = @DomiciledTerritoryId,
			[LimitsTerritoryId] = @LimitsTerritoryId,
			[CreatedDTO] = GETUTCDATE(),
			[CreatedById] = @UserId,
			[UpdatedDTO] = GETUTCDATE(),
			[UpdatedById] = @UserId
		SET @BinderId = SCOPE_IDENTITY()

	END ELSE BEGIN

		UPDATE [Binder]
		SET
			[UMR] = ISNULL(@UMR, [UMR]),
			[Reference] = ISNULL(@Reference, [Reference]),
			[BrokerId] = ISNULL(@BrokerId, [BrokerId]),
			[CoverholderId] = ISNULL(@CoverholderId, [CoverholderId]),
			[InceptionDate] = ISNULL(@InceptionDate, [InceptionDate]),
			[ExpiryDate] = ISNULL(@ExpiryDate, [ExpiryDate]),
			[RisksTerritoryId] = ISNULL(@RisksTerritoryId, [RisksTerritoryId]),
			[DomiciledTerritoryId] = ISNULL(@DomiciledTerritoryId, [DomiciledTerritoryId]),
			[LimitsTerritoryId] = ISNULL(@LimitsTerritoryId, [LimitsTerritoryId]),
			[UpdatedDTO] = GETUTCDATE(),
			[UpdatedById] = @UserId
		WHERE [Id] = @BinderId

	END

	SELECT [BinderId] = @BinderId

END
GO

CREATE PROCEDURE [apiBinderCoverholder](@UserId INT, @BinderId INT = NULL)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
 SELECT
	 [CoverholderId] = c.[Id],
		[Coverholder] = c.[DisplayName]
	FROM [Company] c
	 LEFT JOIN [Binder] b ON @BinderId = b.[Id] AND c.[Id] = b.[CoverholderId]
	WHERE c.[COV] & c.[Active] = 1
	 OR b.[Id] IS NOT NULL
	ORDER BY c.[DisplayName]
	RETURN
END
GO

CREATE PROCEDURE [apiBinderBroker](@UserId INT, @BinderId INT = NULL)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
 SELECT
	 [BrokerId] = c.[Id],
		[Broker] = c.[DisplayName]
	FROM [Company] c
	 LEFT JOIN [Binder] b ON @BinderId = b.[Id] AND c.[Id] = b.[BrokerId]
	WHERE c.[LBR] & c.[Active] = 1
	 OR b.[Id] IS NOT NULL
	ORDER BY c.[DisplayName]
END
GO

CREATE PROCEDURE [apiBinderDomiciled](@UserId INT, @CoverholderId INT, @DomiciledTerritoryId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT [Valid] = CONVERT(BIT, CASE WHEN EXISTS (
	  SELECT 1
			FROM [Company] cmp
			 JOIN [vwTerritoryCountries] tc ON cmp.[CountryId] = tc.[CountryId]
			WHERE cmp.[Id] = @CoverholderId
			 AND tc.[TerritoryId] = @DomiciledTerritoryId
		) THEN 1 END)
	RETURN
END
GO

CREATE TABLE [ClassOfBusiness] (
  [Id] NVARCHAR(5) NOT NULL,
		[Description] NVARCHAR(255) NOT NULL,
		CONSTRAINT [PK_ClassOfBusiness] PRIMARY KEY NONCLUSTERED ([Id]),
		CONSTRAINT [UQ_ClassOfBusiness_Description] UNIQUE CLUSTERED ([Description])
	)
GO

INSERT INTO [ClassOfBusiness] ([Id], [Description])
VALUES
 (N'MOTOR', N'Motor'),
	(N'PROP', N'Property'),
	(N'BI', N'Business Interruption'),
	(N'PROD', N'Product Liability'),
	(N'PUB', N'Public Liability'),
	(N'EMP', N'Employers Liability'),
	(N'MARIN', N'Marine'),
	(N'CRIME', N'Crime')
GO

CREATE PROCEDURE [apiClassOfBusiness](@UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT [Id], [Description] FROM [ClassOfBusiness] ORDER BY [Description]
	RETURN
END
GO

CREATE TABLE [BinderSection] (
  [Id] INT NOT NULL IDENTITY (1, 1),
  [BinderId] INT NOT NULL,
		[ClassId] NVARCHAR(5) NOT NULL,
		[Title] NVARCHAR(255) NOT NULL,
		[TPAId] INT NOT NULL,
		[LossFundId] INT NULL, -- ##TODO
		[CreatedDTO] DATETIMEOFFSET NOT NULL CONSTRAINT [DF_BinderSection_CreatedDTO] DEFAULT (GETUTCDATE()),
		[CreatedById] INT NOT NULL,
		[UpdatedDTO] DATETIMEOFFSET NOT NULL CONSTRAINT [DF_BinderSection_UpdatedDTO] DEFAULT (GETUTCDATE()),
		[UpdatedById] INT NOT NULL,
		CONSTRAINT [PK_BinderSection] PRIMARY KEY NONCLUSTERED ([Id]),
		CONSTRAINT [PK_BinderSection_TPAId] UNIQUE ([Id], [TPAId]),
		CONSTRAINT [UQ_BinderSection_Title] UNIQUE CLUSTERED ([BinderId], [Title]),
		CONSTRAINT [FK_BinderSection_Binder] FOREIGN KEY ([BinderId]) REFERENCES [Binder] ([Id]) ON DELETE CASCADE,
		CONSTRAINT [FK_BinderSection_ClassOfBusiness] FOREIGN KEY ([ClassId]) REFERENCES [ClassOfBusiness] ([Id]) ON UPDATE CASCADE,
		CONSTRAINT [FK_BinderSection_Company_TPAId] FOREIGN KEY ([TPAId]) REFERENCES [Company] ([Id]),
		CONSTRAINT [FK_BinderSection_User_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [User] ([Id]),
		CONSTRAINT [FK_BinderSection_User_UpdatedById] FOREIGN KEY ([UpdatedById]) REFERENCES [User] ([Id]),
		CONSTRAINT [CK_BinderSection_UpdatedDTO] CHECK ([UpdatedDTO] >= [CreatedDTO])
	)
GO

/*
-- ##TESTDATA
INSERT INTO [BinderSection] ([BinderId], [ClassId], [Title], [TPAId], [CreatedById], [UpdatedById])
SELECT
 [BinderId] = b.[Id],
	[ClassId] = cob.[Id],
	[Title] = cob.[Description],
	[TPAId] = (SELECT TOP 1 [Id] FROM [Company] WHERE [TPA] = 1 AND ISNULL(b.[Id], cob.[Id]) IS NOT NULL ORDER BY NEWID()),
	[CreatedById] = 1,
	[UpdatedById] = 1
FROM [Binder] b
 CROSS APPLY (SELECT COUNT(*) FROM [ClassOfBusiness]) cobc ([Count])
	CROSS APPLY (SELECT [Id], [Description], [Row] = ROW_NUMBER() OVER (ORDER BY NEWID()) FROM [ClassOfBusiness]) cob
 CROSS APPLY (SELECT TOP 1 [number] FROM [master]..[spt_values] WHERE [type] = N'P' AND [number] BETWEEN 1 AND cobc.[Count] AND ISNULL(b.[Id], cob.[Id]) IS NOT NULL ORDER BY NEWID()) s ([Count])
WHERE cob.[Row] <= s.[Count]
GO
*/

CREATE TABLE [BinderSectionCarrier] (
  [SectionId] INT NOT NULL,
		[CarrierId] INT NOT NULL,
		[Index] TINYINT NOT NULL,
		[Percentage] DECIMAL(5, 4) NOT NULL,
		CONSTRAINT [PK_BinderSectionCarrier] PRIMARY KEY NONCLUSTERED ([SectionId], [CarrierId]),
		CONSTRAINT [UQ_BinderSectionCarrier_Index] UNIQUE CLUSTERED ([SectionId], [Index]),
		CONSTRAINT [FK_BinderSectionCarrier_BinderSection] FOREIGN KEY ([SectionId]) REFERENCES [BinderSection] ([Id]) ON DELETE CASCADE,
		CONSTRAINT [FK_BinderSectionCarrier_Company_CarrierId] FOREIGN KEY ([CarrierId]) REFERENCES [Company] ([Id]),
		CONSTRAINT [CK_BinderSectionCarrier_Percentage] CHECK ([Percentage] BETWEEN 0 AND 1)
	)
GO

/*
-- ##TESTDATA
INSERT INTO [BinderSectionCarrier] ([SectionId], [CarrierId], [Index], [Percentage])
SELECT
 [SectionId] = [Id],
	[CarrierId] = (SELECT TOP 1 [Id] FROM [Company] WHERE [CAR] = 1 AND bs.[Id] IS NOT NULL ORDER BY NEWID()),
	[Index] = 1,
	[Percentage] = 1
FROM [BinderSection] bs
GO
*/


CREATE TABLE [Currency] (
  [Id] NCHAR(3) NOT NULL,
		[Name] NVARCHAR(255) NOT NULL,
		CONSTRAINT [PK_Currency] PRIMARY KEY NONCLUSTERED ([Id]),
		CONSTRAINT [UQ_Currency_Name] UNIQUE CLUSTERED ([Name])
	)
GO

INSERT INTO [Currency] ([Id], [Name])
VALUES
 (N'GBP', N'British Pounds'),
	(N'EUR', N'Euros'),
	(N'USD', N'US Dollars')
GO

CREATE PROCEDURE [apiCurrencies](@UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT [CurrencyId] = [Id], [Currency] = [Name] FROM [Currency] ORDER BY 2
	RETURN
END
GO

CREATE TABLE [LossFund] (
		[TPAId] INT NOT NULL,
  [Id] INT NOT NULL IDENTITY (1, 1),
		[Name] NVARCHAR(255) NOT NULL,
		[BankCode] NVARCHAR(50) NOT NULL,
		[AccountNum] NVARCHAR(50) NOT NULL,
		[CurrencyId] NCHAR(3) NOT NULL,
		[Active] BIT NOT NULL CONSTRAINT [DF_LossFund_Active] DEFAULT (1),
		[CreatedDTO] DATETIMEOFFSET NOT NULL,
		[CreatedById] INT NOT NULL,
		[UpdatedDTO] DATETIMEOFFSET NOT NULL,
		[UpdatedById] INT NOT NULL,
		CONSTRAINT [PK_LossFund] PRIMARY KEY CLUSTERED ([TPAId], [Id]),
		CONSTRAINT [UQ_LossFund_Id] UNIQUE ([Id]),
		CONSTRAINT [UQ_LossFund_BinderSectionLossFund] UNIQUE ([Id], [TPAId], [CurrencyId], [Active]),
		CONSTRAINT [UQ_LossFund_Name] UNIQUE ([TPAId], [Name]),
		CONSTRAINT [UQ_LossFund_Account] UNIQUE ([TPAId], [BankCode], [AccountNum], [CurrencyId]),
		CONSTRAINT [FK_LossFund_Company] FOREIGN KEY ([TPAId]) REFERENCES [Company] ([Id]),
		CONSTRAINT [FK_LossFund_Currency] FOREIGN KEY ([CurrencyId]) REFERENCES [Currency] ([Id]),
		CONSTRAINT [CK_LossFund_UpdatedDTO] CHECK ([UpdatedDTO] >= [CreatedDTO])
	)
GO

CREATE PROCEDURE [apiLossFunds](@UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
	 [LossFundId] = lf.[Id],
		[TPA] = tpa.[Name],
		[Name] = lf.[Name],
		[AccountNum] = ISNULL(REPLICATE(N'*', LEN(lf.[AccountNum]) - 4), N'') + RIGHT(lf.[AccountNum], 4),
		[Currency] = cu.[Id],
		[Active] = lf.[Active]
	FROM [LossFund] lf
	 JOIN [Company] tpa ON lf.[TPAId] = tpa.[Id]
	 JOIN [Currency] cu ON lf.[CurrencyId] = cu.[Id]
	ORDER BY tpa.[Name], lf.[Name]
	RETURN
END
GO

CREATE PROCEDURE [apiLossFund](@LossFundId INT, @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
	 [LossFundId] = [Id],
		[TPAId],
		[Name],
		[BankCode],
		[AccountNum],
		[CurrencyId],
		[Active]
	FROM [LossFund]
	WHERE [Id] = @LossFundId
	RETURN
END
GO

CREATE PROCEDURE [apiLossFundTPA](@LossFundId INT = NULL, @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
 SELECT
	 [TPAId] = c.[Id],
		[TPA] = c.[DisplayName]
	FROM [Company] c
	 LEFT JOIN [LossFund] lf ON @LossFundId = lf.[Id] AND c.[Id] = lf.[TPAId]
	WHERE c.[TPA] & c.[Active] = 1
	 OR lf.[Id] IS NOT NULL
	ORDER BY c.[DisplayName]
	RETURN
END
GO

CREATE PROCEDURE [apiLossFundSave](
  @LossFundId INT = NULL,
  @TPAId INT,
		@Name NVARCHAR(255),
		@BankCode NVARCHAR(255),
		@AccountNum NVARCHAR(255),
		@CurrencyId NCHAR(3),
		@Active BIT,
		@UserId INT
 )
AS
BEGIN
 SET NOCOUNT ON
	IF @LossFundId IS NULL BEGIN
	 INSERT INTO [LossFund] (
		  [TPAId],
				[Name],
				[BankCode],
				[AccountNum],
				[CurrencyId],
				[Active],
				[CreatedDTO],
				[CreatedById],
				[UpdatedDTO],
				[UpdatedById]
			)
		SELECT
		 [TPAId] = @TPAId,
			[Name] = @Name,
			[BankCode] = @BankCode,
			[AccountNum] = @AccountNum,
			[CurrencyId] = @CurrencyId,
			[Active] = @Active,
			[CreatedDTO] = GETUTCDATE(),
			[CreatedById] = @UserId,
			[UpdatedDTO] = GETUTCDATE(),
			[UpdatedById] = @UserId
		SET @LossFundId = SCOPE_IDENTITY()
	END ELSE BEGIN
	 UPDATE [LossFund]
		SET
		 [TPAId] = @TPAId,
			[Name] = @Name,
			[BankCode] = @BankCode,
			[AccountNum] = @AccountNum,
			[CurrencyId] = @CurrencyId,
			[Active] = @Active,
			[UpdatedDTO] = GETUTCDATE(),
			[UpdatedById] = @UserId
		WHERE [Id] = @LossFundId
	END
	SELECT [LossFundId] = @LossFundId
	RETURN
	END
GO

CREATE TABLE [BinderSectionLossFund](
  [SectionId] INT NOT NULL,
		[TPAId] INT NOT NULL,
		[LossFundId] INT NOT NULL,
		[CurrencyId] NCHAR(3) NOT NULL,
		[ActiveLossFund] BIT NOT NULL,
		[ActiveForSection] BIT NOT NULL,
		[Active] AS [ActiveLossFund] & [ActiveForSection] PERSISTED,
		CONSTRAINT [PK_BinderSectionLossFund] PRIMARY KEY CLUSTERED ([SectionId], [LossFundId]),
		CONSTRAINT [UQ_BinderSectionLossFund_CurrencyId] UNIQUE ([SectionId], [CurrencyId]),
		CONSTRAINT [FK_BinderSectionLossFund_BinderSection] FOREIGN KEY ([SectionId], [TPAId]) REFERENCES [BinderSection] ([Id], [TPAId]) ON UPDATE CASCADE,
		CONSTRAINT [FK_BinderSectionLossFund_LossFund] FOREIGN KEY ([LossFundId], [TPAId], [CurrencyId], [ActiveLossFund]) REFERENCES [LossFund] ([Id], [TPAId], [CurrencyId], [Active]) ON UPDATE CASCADE
	)
GO


CREATE TABLE [BinderSectionExpert] (
  [SectionId] INT NOT NULL,
		[ExpertId] INT NOT NULL,
		[ExpertTypeId] SMALLINT NOT NULL,
		[Description] NVARCHAR(200) NULL,
		CONSTRAINT [PK_BinderSectionExpert] PRIMARY KEY NONCLUSTERED ([SectionId], [ExpertId], [ExpertTypeId]),
		CONSTRAINT [FK_BinderSectionExpert_BinderSection] FOREIGN KEY ([SectionId]) REFERENCES [BinderSection] ([Id]) ON DELETE CASCADE,
		CONSTRAINT [FK_BinderSectionExpert_Company_ExpertId] FOREIGN KEY ([ExpertId]) REFERENCES [Company] ([Id]),
		CONSTRAINT [FK_BinderSectionExpert_CompanyType_ExpertTypeId] FOREIGN KEY ([ExpertTypeId]) REFERENCES [CompanyType] ([Id])
	)
GO


CREATE PROCEDURE [apiBinderSections] (@UserId INT, @BinderId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
	 [SectionId] = bs.[Id],
		[Title] = bs.[Title],
		[Class] = cob.[Description],
		[Lead] = lc.[Lead],
		[TPA] = tpa.[DisplayName]
	FROM [Binder] b
	 JOIN [BinderSection] bs ON b.[Id] = bs.[BinderId]
		JOIN [ClassOfBusiness] cob ON bs.[ClassId] = cob.[Id]
		OUTER APPLY (
		  SELECT TOP 1 [Lead] = cmp.[DisplayName]
				FROM [BinderSectionCarrier] bsc
				 JOIN [Company] cmp ON bsc.[CarrierId] = cmp.[Id]
				WHERE bs.[Id] = bsc.[SectionId]
				ORDER BY bsc.[Index]
		 ) lc
		LEFT JOIN [Company] tpa ON bs.[TPAId] = tpa.[Id]
	WHERE b.[Id] = @BinderId
	ORDER BY bs.[Title]
	RETURN
END
GO

CREATE PROCEDURE [apiBinderSection](@UserId INT, @SectionId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	;WITH XMLNAMESPACES (N'http://james.newtonking.com/projects/json' AS [json])
	SELECT
	 [SectionId] = bs.[Id],
		[BinderId] = bs.[BinderId],
		[ClassId] = bs.[ClassId],
		[Title] = bs.[Title],
		[TPAId] = bs.[TPAId],
		[LossFundId] = bs.[LossFundId],
		(
		  SELECT
				 [@json:Array] = N'true',
					[CarrierId] = bsc.[CarrierId],
					[Percentage] = bsc.[Percentage]
				FROM [BinderSectionCarrier] bsc
				WHERE bs.[Id] = bsc.[SectionId]
				ORDER BY bsc.[Index]
				FOR XML PATH (N'Carriers'), TYPE
		 ),
		(
		  SELECT
				 [@json:Array] = N'true',
					[LossFundId],
					[ActiveLossFund],
					[ActiveForSection]
				FROM [BinderSectionLossFund]
				WHERE [SectionId] = bs.[Id]
				FOR XML PATH (N'LossFunds'), TYPE
			),
		(
		  SELECT
				 [@json:Array] = N'true',
					[ExpertId] = bse.[ExpertId],
					[ExpertTypeId] = bse.[ExpertTypeId],
					[Description] = bse.[Description]
				FROM [BinderSectionExpert] bse
				WHERE bs.[Id] = bse.[SectionId]				
				FOR XML PATH (N'Experts'), TYPE
		 )
	FROM [BinderSection] bs
	WHERE bs.[Id] = @SectionId
	FOR XML PATH (N'Section')
	RETURN
END
GO

CREATE PROCEDURE [apiBinderSectionTPA](@UserId INT, @SectionId INT = NULL)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
 SELECT
	 [TPAId] = CONVERT(NVARCHAR(10), c.[Id]),
		[TPA] = c.[DisplayName]
	FROM [Company] c
	 LEFT JOIN [BinderSection] bs ON @SectionId = bs.[Id] AND c.[Id] = bs.[TPAId]
	WHERE c.[TPA] & c.[Active] = 1
	 OR bs.[Id] IS NOT NULL
	ORDER BY c.[DisplayName]
	RETURN
END
GO

CREATE PROCEDURE [apiBinderSectionCarrier](@UserId INT, @BinderId INT = NULL)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
		[CarrierId] = CONVERT(NVARCHAR(10), [Id]),
		[Carrier] = [DisplayName] 
	FROM [Company]
	WHERE [CAR] = 1
		OR [Id] IN (
				SELECT DISTINCT bsc.[CarrierId]
				FROM [BinderSection] bs
					JOIN [BinderSectionCarrier] bsc ON bs.[Id] = bsc.[SectionId]
				WHERE bs.[BinderId] = @BinderId
			)
	ORDER BY [DisplayName]
 RETURN
END
GO

-- ##TODO
CREATE PROCEDURE [apiBinderSectionLossFund](@TPAId INT, @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT [LossFundId] = CONVERT(NVARCHAR(10), [Id]), [LossFund] = [Name] FROM [LossFund] WHERE [TPAId] = @TPAId ORDER BY [Name]
	RETURN
END
GO

CREATE PROCEDURE [apiBinderSectionExpert](@UserId INT, @SectionId INT = NULL)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
		[ExpertId] = CONVERT(NVARCHAR(10), c.[Id]),
		[Expert] = c.[DisplayName] 
	FROM [Company] c
	ORDER BY c.[DisplayName]
 RETURN
END
GO

CREATE PROCEDURE [apiExpertType](@UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
		[ExpertTypeId] = CONVERT(NVARCHAR(10), c.[Id]),
		[ExpertType] = c.[Description] 
	FROM [CompanyType] c
	ORDER BY c.[Description] 
 RETURN
END
GO

CREATE PROCEDURE [apiBinderSectionSave](
  @SectionId INT = NULL,
		@BinderId INT = NULL,
		@ClassId NVARCHAR(5) = NULL,
		@Title NVARCHAR(255) = NULL,
  @TPAId INT = NULL,
		@LossFundId INT = NULL,
		@Carriers XML = NULL,
		@Experts XML = NULL,
  @UserId INT
 )
AS
BEGIN
 SET NOCOUNT ON

	IF @SectionId IS NULL BEGIN
	 INSERT INTO [BinderSection] ([BinderId], [ClassId], [Title], [TPAId], [LossFundId], [CreatedDTO], [CreatedById], [UpdatedDTO], [UpdatedById])
		VALUES (@BinderId, @ClassId, @Title, @TPAId, @LossFundId, GETUTCDATE(), @UserId, GETUTCDATE(), @UserId)
		SET @SectionId = SCOPE_IDENTITY()
	END ELSE BEGIN
	 UPDATE [BinderSection]
		SET
		 [BinderId] = @BinderId,
			[ClassId] = @ClassId,
			[Title] = @Title,
			[TPAId] = @TPAId,
			[LossFundId] = @LossFundId,
			[UpdatedDTO] = GETUTCDATE(),
			[UpdatedById] = @UserId
		WHERE [Id] = @SectionId
	END

 ;WITH [Data] AS (
	  SELECT
			 [SectionId] = @SectionId,
			 [CarrierId] = c.value(N'CarrierId[1]', N'INT'),
				[Index] = ROW_NUMBER() OVER (ORDER BY c.value(N'Index[1]', N'TINYINT')),
				[Percentage] = c.value(N'Percentage[1]', N'DECIMAL(5, 4)')
			FROM @Carriers.nodes(N'/object[1]/data') car (c)
	 )
	MERGE
	INTO [BinderSectionCarrier] AS t
	USING [Data] AS s
	ON t.[SectionId] = s.[SectionId] AND t.[CarrierId] = s.[CarrierId]
	WHEN MATCHED THEN UPDATE SET [Percentage] = s.[Percentage], [Index] = s.[Index]
	WHEN NOT MATCHED BY TARGET THEN
	 INSERT ([SectionId], [CarrierId], [Index], [Percentage])
		VALUES ([SectionId], [CarrierId], [Index], [Percentage])
	WHEN NOT MATCHED BY SOURCE AND t.[SectionId] = @SectionId THEN DELETE;

;WITH [Data] AS (
	  SELECT
			 [SectionId] = @SectionId,
			 [ExpertId] = c.value(N'ExpertId[1]', N'INT'),
				[ExpertTypeId] = c.value(N'ExpertTypeId[1]', N'INT'),
				[Description] = c.value(N'Description[1]', N'NVARCHAR(200)')
			FROM @Experts.nodes(N'/Object[1]/Data') car (c)
	 )
	MERGE
	INTO [BinderSectionExpert] AS t
	USING [Data] AS s
	ON t.[SectionId] = s.[SectionId] AND t.[ExpertId] = s.[ExpertId] AND t.[ExpertTypeId] = s.[ExpertTypeId]
	WHEN MATCHED THEN UPDATE SET [Description] = s.[Description]
	WHEN NOT MATCHED BY TARGET THEN
	 INSERT ([SectionId], [ExpertId], [ExpertTypeId], [Description])
		VALUES ([SectionId], [ExpertId], [ExpertTypeId], [Description])
	WHEN NOT MATCHED BY SOURCE AND t.[SectionId] = @SectionId THEN DELETE;

	SELECT [BinderId] = @BinderId, [SectionId] = @SectionId
	RETURN
END
GO

CREATE PROCEDURE [apiBinders](@UserId INT, @CoverholderId INT = NULL, @CarrierId INT = NULL, @ClassId NVARCHAR(5) = NULL, @Date DATE = NULL)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
	 [BinderId] = b.[Id],
		[UMR] = b.[UMR],
		[Reference] = b.[Reference],
		[Broker] = lbr.[Name],
		[Coverholder] = cov.[Name],
		[InceptionDate] = b.[InceptionDate],
		[ExpiryDate] = b.[ExpiryDate]
	FROM [Binder] b
	 JOIN [Company] lbr ON b.[BrokerId] = lbr.[Id]
		JOIN [Company] cov ON b.[CoverholderId] = cov.[Id]
	WHERE (@CoverholderId IS NULL OR b.[CoverholderId] = @CoverholderId) 
	 AND (@Date IS NULL OR @Date BETWEEN b.[InceptionDate] AND b.[ExpiryDate])
		AND (@ClassId IS NULL OR EXISTS (
		  SELECT 1
				FROM [BinderSection]
				WHERE [BinderId] = b.[Id]
				 AND [ClassId] = @ClassId
		 ))
		AND (@CarrierId IS NULL OR EXISTS (
		  SELECT 1
				FROM [BinderSection] bs
				 JOIN [BinderSectionCarrier] bsc ON bs.[Id] = bsc.[SectionId]
				WHERE bs.[BinderId] = b.[Id]
				 AND bsc.[CarrierId] = @CarrierId
		 ))
	ORDER BY cov.[Name], b.[ExpiryDate] DESC, b.[UMR]
	RETURN
END
GO


CREATE PROCEDURE [apiBinderPDF](@UserId INT, @BinderId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	;WITH XMLNAMESPACES ('http://james.newtonking.com/projects/json' AS [json])
	SELECT
	 [Reference] = b.[Reference],
		[UMR] = b.[UMR],
		[Coverholder] = cov.[DisplayName],
		[Broker] = lbr.[DisplayName],
		[InceptionDate] = b.[InceptionDate],
		[ExpiryDate] = b.[ExpiryDate],
		[RisksTerritory] = rty.[Name],
		[DomiciledTerritory] = dty.[Name],
		[LimitsTerritory] = lty.[Name],
		(
		  SELECT
				 [@json:Array] = N'true',
					[Title] = bs.[Title],
					[Class] = cob.[Description],
					[TPA] = tpa.[DisplayName],
					(
					  SELECT
							 [@json:Array] = N'true',
								[Index] = bsc.[Index],
								[Carrier] = car.[DisplayName],
								[Percentage] = bsc.[Percentage]
							FROM [BinderSectionCarrier] bsc
							 JOIN [Company] car ON bsc.[CarrierId] = car.[Id]
							WHERE bsc.[SectionId] = bs.[Id]
							ORDER BY bsc.[Index]
							FOR XML PATH (N'Carriers'), ELEMENTS XSINIL, TYPE
					 ),
					(
					  SELECT
							 [@json:Array] = N'true',
								[Expert] = car.[DisplayName],
								[ExpertType] = cart.[Description],
								[Description] = bse.[Description]
							FROM [BinderSectionExpert] bse
							 JOIN [Company] car ON bse.[ExpertId] = car.[Id]
							 JOIN [CompanyType] cart ON cart.[Id] = bse.[ExpertTypeId]
							WHERE bse.[SectionId] = bs.[Id]
							ORDER BY car.[DisplayName]
							FOR XML PATH (N'Experts'), ELEMENTS XSINIL, TYPE
					 )
				FROM [BinderSection] bs
				 JOIN [ClassOfBusiness] cob ON bs.[ClassId] = cob.[Id]
					JOIN [Company] tpa ON bs.[TPAId] = tpa.[Id]
				WHERE bs.[BinderId] = b.[Id]
				ORDER BY bs.[Title]
				FOR XML PATH (N'Sections'), ELEMENTS XSINIL, TYPE
		 )
	FROM [Binder] b
	 JOIN [Company] cov ON b.[CoverholderId] = cov.[Id]
		JOIN [Company] lbr ON b.[BrokerId] = lbr.[Id]
		JOIN [Territory] rty ON b.[RisksTerritoryId] = rty.[Id]
		JOIN [Territory] dty ON b.[DomiciledTerritoryId] = dty.[Id]
		JOIN [Territory] lty ON b.[LimitsTerritoryId] = lty.[Id]
	WHERE b.[Id] = @BinderId
	FOR XML PATH (N'Binder'), ELEMENTS XSINIL
	RETURN
END
GO

CREATE TABLE [GenderEnum] (
  [Gender] NCHAR(1) NOT NULL,
		[Description] NVARCHAR(6) NOT NULL,
		CONSTRAINT [PK_GenderEnum] PRIMARY KEY CLUSTERED ([Gender]),
		CONSTRAINT [UQ_GenderEnum_Description] UNIQUE ([Description])
	)
GO

INSERT INTO [GenderEnum] ([Gender], [Description])
VALUES
 (N'M', N'Male'),
	(N'F', N'Female')
GO

CREATE PROCEDURE [apiGenders](@UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT [Gender], [Description] FROM [GenderEnum] ORDER BY [Gender]
	RETURN
END
GO

CREATE TABLE [Incident] (
  [Id] INT NOT NULL IDENTITY (1, 1),
		[SysNum] AS RIGHT(REPLICATE(N'0', 8) + CONVERT(NVARCHAR(10), [Id]), 8),
		[BrokerId] INT NOT NULL,
		[DateBrokerAdvised] DATE NOT NULL,
		[BrokerContact] NVARCHAR(255) NULL,
		[BrokerPhone] NVARCHAR(25) NULL,
  [TPAId] INT NOT NULL,
		[DateTPANotified] DATE NOT NULL,
		[DateIncident] DATE NOT NULL,
		[TimeIncident] TIME NULL,
		[Description] NVARCHAR(max) NOT NULL,
		[CountryId] NCHAR(2) NOT NULL,
		[PolicyholderId] INT NULL,
		[CoverholderId] INT NULL,
		[PolicyReference] NVARCHAR(255) NULL,
		[PolicyInceptionDate] DATE NULL,
		[PolicyExpiryDate] DATE NULL,
		[CreatedDTO] DATETIMEOFFSET NOT NULL,
		[CreatedById] INT NOT NULL,
		[UpdatedDTO] DATETIMEOFFSET NOT NULL,
		[UpdatedById] INT NOT NULL,
		CONSTRAINT [PK_Incident] PRIMARY KEY NONCLUSTERED ([Id]),
		CONSTRAINT [UQ_Incident_SysNum] UNIQUE ([SysNum]),
		CONSTRAINT [FK_Incident_Company_BrokerId] FOREIGN KEY ([BrokerId]) REFERENCES [Company] ([Id]),
		CONSTRAINT [FK_Incident_Company_TPAId] FOREIGN KEY ([TPAId]) REFERENCES [Company] ([Id]),
		CONSTRAINT [FK_Incident_Country] FOREIGN KEY ([CountryId]) REFERENCES [Country] ([Id]),
		CONSTRAINT [CK_Incident_Id] CHECK ([Id] BETWEEN 1 AND 99999999),
		CONSTRAINT [CK_Incident_DateBrokerAdvised] CHECK ([DateBrokerAdvised] >= [DateIncident]),
		CONSTRAINT [CK_Incident_DateTPANotified] CHECK ([DateTPANotified] >= [DateBrokerAdvised]),
		CONSTRAINT [CK_Incident_PolicyExpiryDate] CHECK ([PolicyExpiryDate] >= [PolicyInceptionDate]),
		CONSTRAINT [CK_Incident_UpdatedDTO] CHECK ([UpdatedDTO] >= [CreatedDTO])
	)
GO

CREATE TABLE [Claimant] (
  [IncidentId] INT NOT NULL,
		[Id] INT NOT NULL IDENTITY (1, 1),
		[Forename] NVARCHAR(127) NOT NULL,
		[Surname] NVARCHAR(127) NOT NULL,
		[Name] AS [Forename] + N' ' + [Surname] PERSISTED,
		[Gender] NCHAR(1) NULL,
		[DateOfBirth] DATE NULL,
		[Address] NVARCHAR(255) NULL,
		[Postcode] NVARCHAR(25) NULL,
		[CountryId] NCHAR(2) NOT NULL,
		[Phone] NVARCHAR(25) NULL,
		[Mobile] NVARCHAR(25) NULL,
		[Email] NVARCHAR(255) NULL,
		[CreatedDTO] DATETIMEOFFSET NOT NULL,
		[CreatedById] INT NOT NULL,
		[UpdatedDTO] DATETIMEOFFSET NOT NULL,
		[UpdatedById] INT NOT NULL,
		CONSTRAINT [PK_Claimant] PRIMARY KEY CLUSTERED ([IncidentId], [Id]),
		CONSTRAINT [UQ_Claimant_Id] UNIQUE ([Id]),
		CONSTRAINT [UQ_Claimant_Name] UNIQUE ([IncidentId], [Name]),
		CONSTRAINT [FK_Claimant_Incident] FOREIGN KEY ([IncidentId]) REFERENCES [Incident] ([Id]),
		CONSTRAINT [FK_Claimant_Gender] FOREIGN KEY ([Gender]) REFERENCES [GenderEnum] ([Gender]),
		CONSTRAINT [FK_Claimant_Country] FOREIGN KEY ([CountryId]) REFERENCES [Country] ([Id]),
		CONSTRAINT [CK_Claimant_UpdatedDTO] CHECK ([UpdatedDTO] >= [CreatedDTO])
	)
GO

ALTER TABLE [Incident] ADD CONSTRAINT [FK_Incident_Claimant_PolicyholderId] FOREIGN KEY ([Id], [PolicyholderId]) REFERENCES [Claimant] ([IncidentId], [Id])
GO

CREATE PROCEDURE [apiClaimantSave](
  @IncidentId INT = NULL,
  @ClaimantId INT = NULL,
		@Forename NVARCHAR(127) = NULL,
		@Surname NVARCHAR(127) = NULL,
		@Gender NCHAR(1) = NULL,
		@DateOfBirth DATE = NULL,
		@Address NVARCHAR(255) = NULL,
		@Postcode NVARCHAR(25) = NULL,
		@CountryId NCHAR(2) = NULL,
		@Phone NVARCHAR(25) = NULL,
		@Mobile NVARCHAR(25) = NULL,
		@Email NVARCHAR(255) = NULL,
		@UserId INT
 )
AS
BEGIN
 SET NOCOUNT ON
	IF @ClaimantId IS NULL BEGIN
	 INSERT INTO [Claimant] (
		  [IncidentId],
				[Forename],
				[Surname],
				[Gender],
				[DateOfBirth],
				[Address],
				[Postcode],
				[CountryId],
				[Phone],
				[Mobile],
				[Email],
				[CreatedDTO],
				[CreatedById],
				[UpdatedDTO],
				[UpdatedById]
		 )
		SELECT
		 [IncidentId] = @IncidentId,
			[Forename] = @Forename,
			[Surname] = @Surname,
			[Gender] = @Gender,
			[DateOfBirth] = @DateOfBirth,
			[Address] = @Address,
			[Postcode] = @Postcode,
			[CountryId] = @CountryId,
			[Phone] = @Phone,
			[Mobile] = @Mobile,
			[Email] = @Email,
			[CreatedDTO] = GETUTCDATE(),
			[CreatedById] = @UserId,
			[UpdatedDTO] = GETUTCDATE(),
			[UpdatedById] = @UserId
		SET @ClaimantId = SCOPE_IDENTITY()
	END ELSE BEGIN
	 UPDATE [Claimant]
		SET
		 [IncidentId] = @IncidentId,
			[Forename] = @Forename,
			[Surname] = @Surname,
			[Gender] = @Gender,
			[DateOfBirth] = @DateOfBirth,
			[Address] = @Address,
			[Postcode] = @Postcode,
			[CountryId] = @CountryId,
			[Phone] = @Phone,
			[Mobile] = @Mobile,
			[Email] = @Email,
			[UpdatedDTO] = GETUTCDATE(),
			[UpdatedById] = @UserId
		WHERE [Id] = @ClaimantId
	END
	SELECT [ClaimantId] = @ClaimantId
	RETURN @ClaimantId
END
GO


CREATE PROCEDURE [apiIncident](@IncidentId INT, @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
		[IncidentId] = i.[Id],
		[SysNum] = i.[SysNum],
		[BrokerId] = i.[BrokerId],
		[DateBrokerAdvised] = i.[DateBrokerAdvised],
		[BrokerContact] = i.[BrokerContact],
		[BrokerPhone] = i.[BrokerPhone],
		[TPAId] = i.[TPAId],
		[DateTPANotified] = i.[DateTPANotified],
		[DateIncident] = i.[DateIncident],
		[TimeIncident] = i.[TimeIncident],
		[Description] = i.[Description],
		[CountryId] = i.[CountryId],
		( -- Policyholder Details
		  SELECT
		   [PolicyholderId] = i.[PolicyholderId],
					[Forename] = cmt.[Forename],
					[Surname] = cmt.[Surname],
					[Name] = cmt.[Name],
					[Gender] = cmt.[Gender],
					[DateOfBirth] = cmt.[DateOfBirth],
					[Address] = cmt.[Address],
					[Postcode] = cmt.[Postcode],
					[CountryId] = cmt.[CountryId],
					[Phone] = cmt.[Phone],
					[Mobile] = cmt.[Mobile],
					[Email] = cmt.[Email]
				FROM [Claimant] cmt
				WHERE cmt.[Id] = i.[PolicyholderId]
				FOR XML PATH (N'Policyholder'), TYPE
			),
		-- Policy Details
		[CoverholderId] = i.[CoverholderId],
		[PolicyReference] = i.[PolicyReference],
		[PolicyInceptionDate] = i.[PolicyInceptionDate],
		[PolicyExpiryDate] = i.[PolicyExpiryDate],
		-- Tracking
		[CreatedDTO] = i.[CreatedDTO],
		[CreatedById] = i.[CreatedById],
		[UpdatedDTO] = i.[UpdatedDTO],
		[UpdatedById] = i.[UpdatedById]
	FROM [Incident] i
	WHERE i.[Id] = @IncidentId
	FOR XML PATH (N'Incident')
	RETURN
END
GO

CREATE PROCEDURE [apiIncidentBroker](@IncidentId INT = NULL, @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
 SELECT
	 [BrokerId] = CONVERT(NVARCHAR(10), c.[Id]),
		[Broker] = c.[DisplayName]
	FROM [Company] c
	 LEFT JOIN [Incident] i ON @IncidentId = i.[Id] AND c.[Id] = i.[BrokerId]
	WHERE c.[RBR] & c.[Active] = 1
	 OR i.[Id] IS NOT NULL
	ORDER BY c.[DisplayName]
	RETURN
END
GO

CREATE PROCEDURE [apiIncidentTPA](@IncidentId INT = NULL, @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
 SELECT
	 [TPAId] = CONVERT(NVARCHAR(10), c.[Id]),
		[TPA] = c.[DisplayName]
	FROM [Company] c
	 LEFT JOIN [Incident] i ON @IncidentId = i.[Id] AND c.[Id] = i.[TPAId]
	WHERE c.[TPA] & c.[Active] = 1
	 OR i.[Id] IS NOT NULL
	ORDER BY c.[DisplayName]
	RETURN
END
GO

CREATE PROCEDURE [apiIncidentCoverholder](@IncidentId INT = NULL, @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
 SELECT
	 [CoverholderId] = CONVERT(NVARCHAR(10), c.[Id]),
		[Coverholder] = c.[DisplayName]
	FROM [Company] c
	 LEFT JOIN [Incident] i ON @IncidentId = i.[Id] AND c.[Id] = i.[CoverholderId]
	WHERE c.[COV] & c.[Active] = 1
	 OR i.[Id] IS NOT NULL
	ORDER BY c.[DisplayName]
	RETURN
END
GO

CREATE PROCEDURE [apiIncidentDateBrokerAdvisedSLA](@DateIncident DATE, @DateBrokerAdvised DATE, @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	DECLARE @Days INT
	SET @Days = DATEDIFF(day, @DateIncident, @DateBrokerAdvised)
	SELECT [Class] = CASE
	 WHEN @Days < 0 THEN NULL
	 WHEN @Days <= 1 THEN N'text-success'
		WHEN @Days BETWEEN 2 AND 3 THEN N'text-warning'
		WHEN @Days > 3 THEN N'text-danger'
	END
	RETURN
END
GO

CREATE PROCEDURE [apiIncidentDateTPANotifiedSLA](@DateBrokerAdvised DATE, @DateTPANotified DATE, @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	DECLARE @Days INT
	SET @Days = DATEDIFF(day, @DateBrokerAdvised, @DateTPANotified)
	SELECT [Class] = CASE
	 WHEN @Days < 0 THEN NULL
	 WHEN @Days <= 1 THEN N'text-success'
		WHEN @Days BETWEEN 2 AND 3 THEN N'text-warning'
		WHEN @Days > 3 THEN N'text-danger'
	END
	RETURN
END
GO

CREATE PROCEDURE [apiIncidentSave](
  @IncidentId INT = NULL,
		@BrokerId INT = NULL,
		@DateBrokerAdvised DATE = NULL,
		@BrokerContact NVARCHAR(255) = NULL,
		@BrokerPhone NVARCHAR(25) = NULL,
		@TPAId INT = NULL,
		@DateTPANotified DATE = NULL,
		@DateIncident DATE = NULL,
		@TimeIncident TIME = NULL,
		@Description NVARCHAR(max) = NULL,
		@CountryId NCHAR(2) = NULL,
		-- Policyholder Details
		@PolicyholderForename NVARCHAR(127) = NULL,
		@PolicyholderSurname NVARCHAR(127) = NULL,
		@PolicyholderGender NCHAR(1) = NULL,
		@PolicyholderDateOfBirth DATE = NULL,
		@PolicyholderAddress NVARCHAR(255) = NULL,
		@PolicyholderPostcode NVARCHAR(25) = NULL,
		@PolicyholderCountryId NCHAR(2) = NULL,
		@PolicyholderPhone NVARCHAR(25) = NULL,
		@PolicyholderMobile NVARCHAR(255) = NULL,
		@PolicyholderEmail NVARCHAR(255) = NULL,
		-- Policy Details
		@CoverholderId INT = NULL,
		@PolicyReference NVARCHAR(255) = NULL,
		@PolicyInceptionDate DATE = NULL,
		@PolicyExpiryDate DATE = NULL,
		-- Status
		@Status BIT = NULL,
		@UserId INT
 )
AS
BEGIN
 SET NOCOUNT ON

	IF @IncidentId IS NULL BEGIN
	 -- New Incident
		INSERT INTO [Incident] (
		  [BrokerId],
				[DateBrokerAdvised],
				[BrokerContact],
				[BrokerPhone],
				[TPAId],
				[DateTPANotified],
				[DateIncident],
				[TimeIncident],
				[Description],
				[CountryId],
				[CoverholderId],
				[PolicyReference],
				[PolicyInceptionDate],
				[PolicyExpiryDate],
				[CreatedDTO],
				[CreatedById],
				[UpdatedDTO],
				[UpdatedById]
			)
		SELECT
		 [BrokerId] = @BrokerId,
			[DateBrokerAdvised] = @DateBrokerAdvised,
			[BrokerContact] = @BrokerContact,
			[BrokerPhone] = @BrokerPhone,
			[TPAId] = @TPAId,
			[DateTPANotified] = @DateTPANotified,
			[DateIncident] = @DateIncident,
			[TimeIncident] = @TimeIncident,
			[Description] = @Description,
			[CountryId] = @CountryId,
			[CoverholderId] = @CoverholderId,
			[PolicyReference] = @PolicyReference,
			[PolicyInceptionDate] = @PolicyInceptionDate,
			[PolicyExpiryDate] = @PolicyExpiryDate,
			[CreatedDTO] = GETUTCDATE(),
			[CreatedById] = @UserId,
			[UpdatedDTO] = GETUTCDATE(),
			[UpdatedById] = @UserId
		SET @IncidentId = SCOPE_IDENTITY()
	END ELSE BEGIN
	 UPDATE [Incident]
		SET
			[BrokerId] = @BrokerId,
			[DateBrokerAdvised] = @DateBrokerAdvised,
			[BrokerContact] = @BrokerContact,
			[BrokerPhone] = @BrokerPhone,
			[TPAId] = @TPAId,
			[DateTPANotified] = @DateTPANotified,
			[DateIncident] = @DateIncident,
			[TimeIncident] = @TimeIncident,
			[Description] = @Description,
			[CountryId] = @CountryId,
			[CoverholderId] = @CoverholderId,
			[PolicyReference] = @PolicyReference,
			[PolicyInceptionDate] = @PolicyInceptionDate,
			[PolicyExpiryDate] = @PolicyExpiryDate,
			[UpdatedDTO] = GETUTCDATE(),
			[UpdatedById] = @UserId
		WHERE [Id] = @IncidentId
	END

	-- Policyholder Details
	DECLARE @ClaimantId INT
	SELECT @ClaimantId = [PolicyholderId], @PolicyholderCountryId = ISNULL(@PolicyholderCountryId, [CountryId]) FROM [Incident] WHERE [Id] = @IncidentId
	DECLARE @Policyholder TABLE ([ClaimantId] INT NULL UNIQUE CLUSTERED)
	INSERT INTO @Policyholder ([ClaimantId])
	EXEC @ClaimantId = [apiClaimantSave]
	 @IncidentId = @IncidentId,
		@ClaimantId = @ClaimantId,
		@Forename = @PolicyholderForename,
		@Surname = @PolicyholderSurname,
		@Gender = @PolicyholderGender,
		@DateOfBirth = @PolicyholderDateOfBirth,
		@Address = @PolicyholderAddress,
		@Postcode = @PolicyholderPostcode,
		@CountryId = @PolicyholderCountryId,
		@Phone = @PolicyholderPhone,
		@Mobile = @PolicyholderMobile,
		@Email = @PolicyholderEmail,
		@UserId = @UserId
	UPDATE [Incident] SET [PolicyholderId] = @ClaimantId WHERE [Id] = @IncidentId

	SELECT [IncidentId] = @IncidentId

	RETURN @IncidentId
END
GO

CREATE PROCEDURE [apiClaimants](@IncidentId INT, @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
	 [ClaimantId] = cmt.[Id],
		[Name] = cmt.[Name] + CASE WHEN i.[Id] IS NOT NULL THEN N' (Policyholder)' ELSE N'' END,
		[Gender] = gen.[Description],
		[DateOfBirth] = cmt.[DateOfBirth],
		[Country] = c.[Name]
	FROM [Claimant] cmt
	 LEFT JOIN [GenderEnum] gen ON cmt.[Gender] = gen.[Gender]
		JOIN [Country] c ON cmt.[CountryId] = c.[Id]
	 LEFT JOIN [Incident] i ON cmt.[IncidentId] = i.[Id] AND cmt.[Id] = i.[PolicyholderId]
	WHERE cmt.[IncidentId] = @IncidentId
	ORDER BY CASE WHEN i.[Id] IS NOT NULL THEN 0 ELSE 1 END, cmt.[Name]
	RETURN
END
GO

CREATE PROCEDURE [apiClaimant](@IncidentId INT, @ClaimantId INT, @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
	 [SysNum] = i.[SysNum],
		[ClaimantId] = cmt.[Id],
		[Forename] = cmt.[Forename],
		[Surname] = cmt.[Surname],
		[Name] = cmt.[Name],
		[Gender] = cmt.[Gender],
		[DateOfBirth] = cmt.[DateOfBirth],
		[Address] = cmt.[Address],
		[Postcode] = cmt.[Postcode],
		[CountryId] = cmt.[CountryId],
		[Phone] = cmt.[Phone],
		[Mobile] = cmt.[Mobile],
		[Email] = cmt.[Email]
	FROM [Claimant] cmt
	 JOIN [Incident] i ON cmt.[IncidentId] = i.[Id]
	WHERE cmt.[IncidentId] = @IncidentId
	 AND cmt.[Id] = @ClaimantId
	FOR XML PATH (N'Claimant'), TYPE
	RETURN
END
GO

CREATE TABLE [Claim] (
  [IncidentId] INT NOT NULL,
		[ClaimantId] INT NOT NULL,
		[Id] INT NOT NULL IDENTITY (1, 1),
		[Title] NVARCHAR(255) NOT NULL,
		[ClassId] NVARCHAR(5) NOT NULL,
		[BinderId] INT NULL,
		[CreatedDTO] DATETIMEOFFSET NOT NULL,
		[CreatedById] INT NOT NULL,
		[UpdatedDTO] DATETIMEOFFSET NOT NULL,
		[UpdatedById] INT NOT NULL,
		CONSTRAINT [PK_Claim] PRIMARY KEY NONCLUSTERED ([IncidentId], [ClaimantId], [Id]),
		CONSTRAINT [UQ_Claim_Id] UNIQUE ([Id]),
		CONSTRAINT [UQ_Claim_Title] UNIQUE CLUSTERED ([IncidentId], [ClaimantId], [Title]),
		CONSTRAINT [FK_Claim_Claimant] FOREIGN KEY ([IncidentId], [ClaimantId]) REFERENCES [Claimant] ([IncidentId], [Id]),
		CONSTRAINT [FK_Claim_ClassOfBusiness] FOREIGN KEY ([ClassId]) REFERENCES [ClassOfBusiness] ([Id]),
		CONSTRAINT [CK_Claim_UpdatedDTO] CHECK ([UpdatedDTO] >= [CreatedDTO])
	)
GO

CREATE TABLE [ClaimStatus] (
  [ClaimId] INT NOT NULL,
		[Index] INT NOT NULL,
		[UpdatedDTO] DATETIMEOFFSET NOT NULL,
		[UpdatedById] INT NOT NULL,
		[Status] BIT NOT NULL,
		[StatusDesc] AS CASE WHEN [Status] = 0 THEN N'Closed' WHEN [Index] = 0 THEN N'Open' ELSE N'Reopened' END PERSISTED,
		[PreviousIndex] AS [Index] - 1 PERSISTED,
		[PreviousUpdateDTO] DATETIMEOFFSET NULL,
		[PreviousStatus] AS ~[Status] PERSISTED,
		CONSTRAINT [PK_ClaimStatus] PRIMARY KEY CLUSTERED ([ClaimId], [Index] DESC, [UpdatedDTO] DESC, [Status]),
		CONSTRAINT [UQ_ClaimStatus_Index] UNIQUE ([ClaimId], [Index] DESC),
		CONSTRAINT [FK_ClaimStatus_Claim] FOREIGN KEY ([ClaimId]) REFERENCES [Claim] ([Id]),
		CONSTRAINT [FK_ClaimStatus_ClaimStatus] FOREIGN KEY ([ClaimId], [PreviousIndex], [PreviousUpdateDTO], [PreviousStatus]) REFERENCES [ClaimStatus] ([ClaimId], [Index], [UpdatedDTO], [Status]),
		CONSTRAINT [CK_ClaimStatus_Index] CHECK ([Index] >= 0),
		CONSTRAINT [CK_ClaimStatus_Status] CHECK ([Index] > 0 OR [Status] = 1),
		CONSTRAINT [CK_ClaimStatus_PreviousIndex] CHECK ([PreviousIndex] = -1 OR [PreviousUpdateDTO] IS NOT NULL),
		CONSTRAINT [CK_ClaimStatus_PreviousUpdateDTO] CHECK ([PreviousUpdateDTO] <= [UpdatedDTO])
	)
GO

CREATE VIEW [vwClaimStatusCurrent]
AS
WITH cte AS (
  SELECT
		 [ClaimId],
			[Index],
			[UpdatedDTO],
			[UpdatedById],
			[Status],
			[StatusDesc],
			[Row] = ROW_NUMBER() OVER (PARTITION BY [ClaimId] ORDER BY [Index] DESC)
		FROM [ClaimStatus]
	)
SELECT
 [ClaimId] = cte.[ClaimId],
	[Index] = cte.[Index],
	[UpdatedDTO] = cte.[UpdatedDTO],
	[UpdatedById] = cte.[UpdatedById],
	[UpdatedBy] = u.[Name],
	[Status] = cte.[Status],
	[StatusDesc] = cte.[StatusDesc]
FROM cte
 JOIN [User] u ON cte.[UpdatedById] = u.[Id]
WHERE cte.[Row] = 1
GO

CREATE TABLE [ClaimWithEnum] (
  [With] NVARCHAR(25) NOT NULL,
		[SortOrder] TINYINT NOT NULL,
		CONSTRAINT [PK_ClaimWithEnum] PRIMARY KEY NONCLUSTERED ([With]),
		CONSTRAINT [UQ_ClaimWithEnum_SortOrder] UNIQUE ([SortOrder])
	)
GO

INSERT INTO [ClaimWithEnum] ([With], [SortOrder])
VALUES
 (N'Broker', 1),
	(N'Bureau Leader', 2),
	(N'Further Agreement Party', 3),
	(N'XCS', 4)
GO

CREATE TABLE [ClaimWith] (
  [ClaimId] INT NOT NULL,
		[Index] INT NOT NULL,
		[UpdatedDTO] DATETIMEOFFSET NOT NULL,
		[UpdatedById] INT NOT NULL,
		[With] NVARCHAR(25) NOT NULL,
		[PreviousIndex] AS [Index] - 1 PERSISTED,
		[PreviousUpdateDTO] DATETIMEOFFSET NULL,
		[PreviousWith] NVARCHAR(25) NULL,
		CONSTRAINT [PK_ClaimWith] PRIMARY KEY CLUSTERED ([ClaimId], [Index] DESC, [UpdatedDTO] DESC),
		CONSTRAINT [UQ_ClaimWith_Index] UNIQUE ([ClaimId], [Index] DESC),
		CONSTRAINT [CK_ClaimWith_Index] CHECK ([Index] >= 0),
		CONSTRAINT [CK_ClaimWith_PreviousUpdateDTO] CHECK ([Index] = 0 OR [PreviousUpdateDTO] IS NOT NULL),
		CONSTRAINT [CK_ClaimWith_PreviousWith] CHECK ([Index] = 0 OR [PreviousWith] IS NOT NULL)
	)
GO

CREATE PROCEDURE [apiClaims](@IncidentId INT, @ClaimantId INT, @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
	 [ClaimId] = clm.[Id],
		[Title] = clm.[Title],
		[Class] = cob.[Description],
		[UMR] = bin.[UMR],
		[Incurred] = CONVERT(MONEY, 0),
		[Status] = csc.[StatusDesc]
	FROM [Claim] clm
	 JOIN [Claimant] cmt ON clm.[IncidentId] = cmt.[IncidentId] AND clm.[ClaimantId] = cmt.[Id]
		JOIN [Incident] i ON cmt.[IncidentId] = i.[Id]
		JOIN [ClassOfBusiness] cob ON clm.[ClassId] = cob.[Id]
		LEFT JOIN [Binder] bin ON clm.[BinderId] = bin.[Id]
		JOIN [vwClaimStatusCurrent] csc ON clm.[Id] = csc.[ClaimId]
	WHERE clm.[IncidentId] = @IncidentId
	 AND clm.[ClaimantId] = @ClaimantId
	ORDER BY [Title]
	RETURN
END
GO

CREATE PROCEDURE [apiClaim](@IncidentId INT, @ClaimantId INT, @ClaimId INT = NULL, @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
	 [ClaimId] = clm.[Id],
	 [SysNum] = i.[SysNum],
		[Claimant] = cmt.[Name],
		[Title] = clm.[Title],
		[ClassId] = clm.[ClassId],
		[IncidentCountry] = ico.[Name],
		[Coverholder] = cov.[DisplayName],
		[PolicyholderCountry] = ISNULL(pco.[Name], ico.[Name]),
		[PolicyReference] = i.[PolicyReference],
		[PolicyInceptionDate] = i.[PolicyInceptionDate],
		[PolicyExpiryDate] = i.[PolicyExpiryDate],
		[BinderId] = clm.[BinderId],
		( -- Status
		  SELECT
					[Status] = csc.[Status],
					[UpdatedDTO] = csc.[UpdatedDTO],
					[UpdatedBy] = csc.[UpdatedBy],
					[DateFirstClosed] = MIN(CASE WHEN [Status] = 0 THEN [UpdatedDTO] END),
					[ReopenCount] = COUNT(CASE WHEN [Index] > 0 AND [Status] = 1 THEN 1 END)
				FROM [ClaimStatus]
				WHERE [ClaimId] = clm.[Id]
				GROUP BY [ClaimId]
				FOR XML PATH (N'Status'), TYPE
			)
	FROM [Incident] i
	 JOIN [Claimant] cmt ON i.[Id] = cmt.[IncidentId]
		JOIN [Company] cov ON i.[CoverholderId] = cov.[Id]
		JOIN [Country] ico ON i.[CountryId] = ico.[Id]
		LEFT JOIN [Claimant] ph
		  JOIN [Country] pco ON ph.[CountryId] = pco.[Id]
		 ON i.[Id] = ph.[IncidentId] AND i.[PolicyholderId] = ph.[Id]
		LEFT JOIN [Claim] clm ON cmt.[IncidentId] = clm.[IncidentId] AND cmt.[Id] = clm.[ClaimantId] AND @ClaimId = clm.[Id]
	 LEFT JOIN [vwClaimStatusCurrent] csc ON clm.[Id] = csc.[ClaimId]
	WHERE i.[Id] = @IncidentId
	 AND cmt.[Id] = @ClaimantId
	FOR XML PATH (N'Claim')
	RETURN
END
GO

CREATE PROCEDURE [apiClaimBinder](@IncidentId INT, @ClassId NVARCHAR(5), @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT DISTINCT
	 [BinderId] = CONVERT(NVARCHAR(10), b.[Id]),
		[Binder] = b.[UMR] + N': ' + CONVERT(NVARCHAR(10), b.[InceptionDate], 103) + N' to ' + CONVERT(NVARCHAR(10), b.[ExpiryDate], 103)
	FROM [Incident] i
	 LEFT JOIN [Claimant] ph ON i.[Id] = ph.[IncidentId] AND i.[PolicyholderId] = ph.[Id]
		JOIN [Binder] b ON i.[CoverholderId] = b.[CoverholderId]
		JOIN [vwTerritoryCountries] rty ON b.[RisksTerritoryId] = rty.[TerritoryId] AND i.[CountryId] = rty.[CountryId]
		JOIN [vwTerritoryCountries] dty ON b.[DomiciledTerritoryId] = dty.[TerritoryId] AND ISNULL(ph.[CountryId], i.[CountryId]) = dty.[CountryId]
		JOIN [vwTerritoryCountries] lty ON b.[LimitsTerritoryId] = lty.[TerritoryId] AND i.[CountryId] = lty.[CountryId]
		JOIN [BinderSection] bs ON b.[Id] = bs.[BinderId] AND @ClassId = bs.[ClassId]
	WHERE i.[PolicyInceptionDate] BETWEEN b.[InceptionDate] AND b.[ExpiryDate]
	ORDER BY 2
	RETURN
END
GO

CREATE PROCEDURE [apiClaimStatus](@ClaimId INT = NULL, @UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	DECLARE @Index INT, @Status BIT
	SELECT @Index = [Index], @Status = [Status] FROM [vwClaimStatusCurrent] WHERE [ClaimId] = @ClaimId
	SELECT [Status] = N'0', [StatusDesc] = N'Closed' UNION ALL
	SELECT N'1', CASE WHEN ISNULL(@Index, 0) = 0 THEN N'Open' ELSE N'Reopened' END
	ORDER BY 1 DESC
	RETURN
END
GO

CREATE PROCEDURE [apiClaimSave](
  @IncidentId INT,
		@ClaimantId INT,
		@ClaimId INT = NULL,
		@Title NVARCHAR(255) = NULL,
		@ClassId NVARCHAR(5) = NULL,
		@BinderId INT = NULL,
		@Status BIT = NULL,
		@UserId INT
 )
AS
BEGIN
 SET NOCOUNT ON
	IF @ClaimId IS NULL BEGIN
	 INSERT INTO [Claim] (
		  [IncidentId],
				[ClaimantId],
				[Title],
				[ClassId],
				[BinderId],
				[CreatedDTO],
				[CreatedById],
				[UpdatedDTO],
				[UpdatedById]
		 )
		SELECT
		 [IncidentId] = @IncidentId,
			[ClaimantId] = @ClaimantId,
			[Title] = @Title,
			[ClassId] = @ClassId,
			[BinderId] = @BinderId,
			[CreatedDTO] = GETUTCDATE(),
			[CreatedById] = @UserId,
			[UpdatedDTO] = GETUTCDATE(),
			[UpdatedById] = @UserId
		SET @ClaimId = SCOPE_IDENTITY()
		-- Set initial status to "Open"
		INSERT INTO [ClaimStatus] ([ClaimId], [Index], [UpdatedDTO], [UpdatedById], [Status])
		VALUES (@ClaimId, 0, GETUTCDATE(), @UserId, 1)
	END ELSE BEGIN
  UPDATE [Claim]
		SET
		 [IncidentId] = @IncidentId,
			[ClaimantId] = @ClaimantId,
			[Title] = @Title,
			[ClassId] = @ClassId,
			[BinderId] = @BinderId,
			[CreatedDTO] = GETUTCDATE(),
			[CreatedById] = @UserId,
			[UpdatedDTO] = GETUTCDATE(),
			[UpdatedById] = @UserId
		WHERE [Id] = @ClaimId
		-- Update incident status
		INSERT INTO [ClaimStatus] ([ClaimId], [Index], [UpdatedDTO], [UpdatedById], [Status], [PreviousUpdateDTO])
		SELECT
		 [ClaimId],
			[Index] = [Index] + 1,
			[UpdatedDTO] = GETUTCDATE(),
			[UpdatedById] = @UserId,
			[Status] = @Status,
			[PreviousUpdateDTO] = [UpdatedDTO]
		FROM [vwClaimStatusCurrent]
		WHERE [ClaimId] = @ClaimId
		 AND [Status] <> ISNULL(@Status, [Status])
	END
	SELECT [ClaimId] = @ClaimId
	RETURN @ClaimId
END
GO

CREATE PROCEDURE [apiIncidents](@UserId INT)
AS
BEGIN
 SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT
	 [IncidentId] = i.[Id],
		[SysNum] = i.[SysNum],
		[TPA] = tpa.[DisplayName],
		[Coverholder] = cov.[DisplayName],
		[Policyholder] = cmt.[Name],
		[DateIncident] = i.[DateIncident],
		[Status] = CASE c.[Status] WHEN 1 THEN N'Open' WHEN 0 THEN N'Closed' ELSE N'Incident Only' END
	FROM [Incident] i
		JOIN [Company] tpa ON i.[TPAId] = tpa.[Id]
		LEFT JOIN [Company] cov ON i.[CoverholderId] = cov.[Id]
	 LEFT JOIN [Claimant] cmt ON i.[Id] = cmt.[IncidentId] AND i.[PolicyholderId] = cmt.[Id]
		LEFT JOIN (
		  SELECT
				 [IncidentId] = clm.[IncidentId],
					[Status] = CONVERT(BIT, MAX(CONVERT(INT, cst.[Status])))
				FROM [Claim] clm
				 JOIN [vwClaimStatusCurrent] cst ON clm.[Id] = cst.[ClaimId]
				GROUP BY clm.[IncidentId]
		 ) c ON i.[Id] = c.[IncidentId]
	ORDER BY i.[DateIncident] DESC
	RETURN
END
GO
