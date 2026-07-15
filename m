Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7701B437467;
	Wed, 15 Jul 2026 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121705; cv=fail; b=UymyyyTa413zt0P5SjmZyDEXqiKRiqGOhKobgLXiLfe/DxHk418KO5A7riSfUSl7Cul6QH6PAlr4uxjiS+L15QVwNUUFrL8ZUcK1Bp2KLoSjR7Lj1MpeEeSe48JgOz5f/6XWTI5yZ8i4gzO1S2W4ePoby9EUQrT9YJxvN3XVgrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121705; c=relaxed/simple;
	bh=P3d2O3IM3TLgNAxJA/dSH5mLQll43Ks1x50UgqgApWQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LP5sG+rZLOA/OyWXWniampwXGcS8tGb9WqrijyLGS6rVb3lPvduUirvZ5HOzQVahb+fQy5UXSij0shQ66u26cAt0R7xwWehdW65SdAFmZp5YBCA6Dsr9kiGWKvRI5Ky2cUNiN8oQm9k5pTlnr6AAtifilOBy+je36pfbh+0cuT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jctTTMMK; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jctTTMMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784121702; x=1815657702;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=P3d2O3IM3TLgNAxJA/dSH5mLQll43Ks1x50UgqgApWQ=;
  b=jctTTMMK6qOs2mBZrH4JK/otgWlsbd7Qw/R+QLS7kHRd62LDM1Nju9vT
   N6Tv1v9HdAf9MMAplal2YaV0mW1GmO9XDZ/OfU2I1oAcV2s3yTrk2PQiM
   MkYMb+HcZSt9Yxcr3mN/3I/B7CPQgseo02uGhajrc+YVKYAyk+XnVTRHI
   pRQkiXY9M9/4+3islEW1W5dCZbRt3FvuJfZzsZcu6oVaQM1/XvV6q3cnC
   48MLkwDDB1p9bBbNjDSx/CuYTRbfYZN6JpT9BRQwvPM19I8lDAe4MNVe8
   6w4qgNF5JYIXc2We76/koCu4sTAgSl+UKhMPSjk+c3GeAAnQvfVJHlaJS
   A==;
X-CSE-ConnectionGUID: vjmPm9KARiC3UmzsK8Y5BQ==
X-CSE-MsgGUID: z6CL0EmlSK+g4pexEni9wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84848690"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84848690"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 06:21:40 -0700
X-CSE-ConnectionGUID: Ps0QM/d9Tqyhn0VOQCirMQ==
X-CSE-MsgGUID: mS5X2ZxGTZqZMEUVoJBkKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="259998352"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 06:21:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 06:21:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 06:21:40 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.25)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 06:21:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOGe+N6MhZBDra28EKm62/OSPGrDmU/ut1d0CY51KjUqtGGRJ0zoh2Otkk27lbEtq7Pcf7b32YKwryvCa/IJ5hCzYSBtRxwiPnglZjCY3Kw0bEg/HUeaIZzSgm2Pk1y3MmF8dvRuoV7WxATRnONxOUeuJkXpua5PiSAoWC7FAJbcCpnb3DNzLCe0KZ2A0Q/2iFDwhqWIX+xNYiDgCPIJyIWjho6V9dPXmPXLbHVHuH87YuEwBVvGxVPGWIzzv6Mck+IQwLdqHG0q5VvRYDIoKs6o2tBjRuzQEkWV3lyZx5pqj4Jq8fFtfz99TuQiTkMnEXy4FbpKYBKNLZmGsdqWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3d2O3IM3TLgNAxJA/dSH5mLQll43Ks1x50UgqgApWQ=;
 b=xKGytdAYH4OH1bhrSBVLu8Vm86Ak0hQBhIm9cFsLmkq8JQiUid5R4RfEd/zlcTGsVpuH9poBEVP/LzeAm+FVoA3PVwqbzRynk9DhhQaT+ngoT0fvf73LRw2cRAhA9uHTEY4w3TR9JL9SvS5BGVJ4Vjh/euyJvb22+A4Bg1qheK+ZvqD3btzIecKPjNOzyIYqseBy1clZ6YykHhTuKwRYw2oJNBe05OFmCbh1vLIeEL/R0h9GBZSQ4m2L13SHArMYGJDkNwdFK28jt5snIUg3cihVb0+cvGkJuMakvk36KuzqT3O/JziI7woYtpjbNNXEbp1udmCVI5tnufKHC8HPdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by CH3PR11MB8465.namprd11.prod.outlook.com (2603:10b6:610:1bc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Wed, 15 Jul
 2026 13:21:28 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%5]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 13:21:27 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] scripts/kernel-doc: Suggest possible names for excess
 descriptions
Thread-Topic: [PATCH v2] scripts/kernel-doc: Suggest possible names for excess
 descriptions
Thread-Index: AQHdFFd58x7972K+d0SSg9RPKAYqBbZukP4A
Date: Wed, 15 Jul 2026 13:21:27 +0000
Message-ID: <80ccd6405e31b1200a391b2755780b7676597c74.camel@intel.com>
References: <20260714111208.323108-1-ryszard.knop@intel.com>
		<20260715111726.394565-1-ryszard.knop@intel.com>
	 <20260715144243.60686000@localhost>
In-Reply-To: <20260715144243.60686000@localhost>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|CH3PR11MB8465:EE_
x-ms-office365-filtering-correlation-id: 1d27520a-bbb7-48ee-3ef0-08dee273fa14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|11063799006|4143699003|10067099003|56012099006|38070700021|6133799003;
x-microsoft-antispam-message-info: Lg2nYfKNro1HxrMzNRkuRyK0gNO93vfcZdUDs88gYdXfiuybjlYGT26bDxNuRjWA/UASbgiFZRIEASLzJL3TYBeVbbsyHulXwEY6EieUWjW7b31oNY6IgqXB/qk4LllM13213UiNfDTnPwgDDKy4d9+A7m1WZQAXvKc96gCyPRYTIlXct12lavEYlTiStLFY2iMA5KkTcPO52t+qpD5tT2vY+Z1OmamdS6/r8QEo9/R0j5NAR2Acf6muMwNT/6Ynn2h6wsCA5Btph9j3j10jo2kEnaSQOvQdD00wVhULi7miEXnPhV0lJ37eB8V93Y5GB5RgcFxJU3J7ayUW65v9VHFUB7RmfrgJ7YnxUiUQM67QDzR8QE2io8FL/wLlnQ8VsUApZ6zvPsOE9WbZSCJ3ZFKrDKnTw3IQMtLY5O0Xj5tB3z5bUo5uZ/so3/QZOM/av6fYKL2ZGqjA8j/7YEjON0FUclbu0lRF9MPFUOdzVbuGvRyDkAoB+bQhsQpvgn4ibk8+i1Z4x+PLDuB8Kwsf09Ns8WZm6bz/hDCzrCTAGX8lcQFQXKj4QcgwwVqhGHF6huWLYcJMPNmBCZYDpjPv2C0D+fgn3M4YsTLIRubGaQYWCT3wHMadsaAHko8W84UxgHH/WwoqcqJSVzxgq/NTVytRK4urQte+ZiM7kHb48D0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5663.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(10067099003)(56012099006)(38070700021)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXhVWkN1a1hvMVJrOGc2cjJOMnNsaDdMS29GQWJEbkVsbTdHajA1UTViYjg2?=
 =?utf-8?B?dUQ2RkptWXhqQkxaUjRFaDcvSnpERmh0YkFGUXVtTVpIR3RPVDNoOXZodm1O?=
 =?utf-8?B?YlNwa1A4NUtWbVBpaUwyQWVyRm5JQzRUY1pET0sra2xxQlUrYUNEcHpKSGhG?=
 =?utf-8?B?L3pFL0drRFlkOEZNVC9iWS9ETVdzTzBSOWE4Yllkd01wNWVWbTNZN0ZZbkor?=
 =?utf-8?B?OHk2eFJUeXEwZmMxSU5hSmFFNURxVXFpQWp6dGVGOWs0cGxzbnNIRm1nazVD?=
 =?utf-8?B?WmFQWnh2dlp4UXlYQ2U3RDN6VzZ1TjRvSE1yeDJJeU52Ui8zajQwLzI3Q05U?=
 =?utf-8?B?b0U2bFBveDh2eDZseE1pa3FURFlydm1sM1JuekJtbnZLNWdtRlFId2lxK05k?=
 =?utf-8?B?WmVBaDFaN0Jsb0Vwb2JjMU8zSEVrQS92V1hPdmdiZGxqOURaN1YvUVV5WUpN?=
 =?utf-8?B?YmtYR0lFQWRJVW9XTkxtSk0rZDlXMGZmVnF2MElGZXlnYVM1b1lQSG41QW4w?=
 =?utf-8?B?MXdOS1BFaUlPNHlDcUVXZ3lWS0ZoTVM4OE42d1YxcXM3NUdCZ0RsTDIzTWla?=
 =?utf-8?B?dHhITjNXRDhoMDNOc1B3c0JWZzlOeXh4V2RxaTRRdStMcTg4WnNxYzdrQ0xm?=
 =?utf-8?B?UTh0T2ppVUlJQk82WGd0K21LZ2NkM0lUdHZCTkVrNUdnVmtTWlRrR1craGQ4?=
 =?utf-8?B?NWFTQnk5WWY4VndTZmNLZ3JZM0Y1ZDJRUFVseFNWams1dmM2MWl2clVWQXd2?=
 =?utf-8?B?d3VyV2w2V1g0RzRITWNJcVpXbldBSWJwNVdFSGNTOUF5VlhXRytlenRvMk00?=
 =?utf-8?B?bHNzV2Q1dnZYbCtieFNiUmFRQTVWM0JNQktrcnBpWTIvVk5OQUl6RXpzQzJx?=
 =?utf-8?B?cTNlSXF5NXRDbldyd1BMWDRtSVk2QldPVDk4cDR2MExVemtaU050ZFNkbi8z?=
 =?utf-8?B?MnkwQlJreklvNzFOZ1pMc3N0cjcxQytlNHhNWXlwT1VKQmRpNmtDbExQd2do?=
 =?utf-8?B?bUdTYTBJRmRlMU9GSUJ6S0FXUFdmN25jYm5ueTk4UVkwRXNjUnlMSUF2Y2FO?=
 =?utf-8?B?eE5sMWw3K3A3b0ZPSjk5K2RwaDh5eFpOVmVLTG1PRmRNdEMyTEEwLzkxVXRZ?=
 =?utf-8?B?TnlRU3RCSlNQYlZJelRYQjVxTFlhSGorRTZZOUpIQ3lWYzhDZjBScHkzTjhP?=
 =?utf-8?B?ZXJlUzMwc2RtdDNabzBURW5qNzVMRWtvRXNnOFpuZ2d0b2g1eVEzcEQ4UUwr?=
 =?utf-8?B?UGdaYnVxUFhUdE9pVzRLT3hDc0l3OW1BVS9ZWDFJNkpVb1NXdXo4RjZTcHF5?=
 =?utf-8?B?SHBOU1dhQmNGM3ZSRjlCRUswTnJqWGU4WHYySHQyVVFSY0o0QUVXUHp1bWhw?=
 =?utf-8?B?cnN1ZDFFM0tMZkdPWTZueHJQcE94UjIzRUVZZUR5Z3dLQUJuNzhLSm5oWkhD?=
 =?utf-8?B?cUFGWENKM0RzMndtYVlYUlJEQ1Y2MHlveGdQVitaQkcyZjh5djZrUldTeFNM?=
 =?utf-8?B?RzF1dEd6V0VYNDBlK09OTHA4cnVndmVvaEpIeVZ3RStjV0d6TzVZcnlrVkxt?=
 =?utf-8?B?cEFWY0hBNWJXbUE1VGdPNW5lUmEwQit5b3l2YThFQmJEVGVDM1ZBOTJhQWNa?=
 =?utf-8?B?MHFPdjdnTFNjUm5rLzRmKzBrczdRVmVKUTVwemtrSng5MUxwdFJ2MEVJOXo2?=
 =?utf-8?B?UDZONGlSWitON1NQRjBBN3JPMk1sQ0plSVpUK1RGQlNRT2xqTDdZcHNYV3pX?=
 =?utf-8?B?K0pDYjUwanZhci9FRXBtc2x0MnZPT010VkFHM2JCcUZMemJDSm41YVV1M3hE?=
 =?utf-8?B?d2RkcldGc0FCbXRSZDJQV0lTWVBaNzZXLzZvUmhFVjdacmhUZWNRRDB0dEtS?=
 =?utf-8?B?dXJKSGJnSktwOW9sZTVEeUdRdFZZYVJIVndVTm1ranJrNUlRSjZYVjBJTnQy?=
 =?utf-8?B?MVM4a1NidTFha2JraTEvRWRFT1FoUkc1dkFnbVE1RHBweXdUSnJXamNVVjdn?=
 =?utf-8?B?NnN0anZOaklZNkVCZnRnUkpXNXBndUFzbVFaemJmeDluK0RmSEthRU9hUUto?=
 =?utf-8?B?UzBFZWszS1ljRVVsVklWbWtuUm5YSmdhb1IzNms5Z0d1dVhzNEZQV1Q0NFdP?=
 =?utf-8?B?UFRzQjNJN0tvMlB3ZnN3RUdKWkx3V1dERmh2N09TSVM1RGQ0eGlLWm9iYWxr?=
 =?utf-8?B?dVViM0MxZjRTRm5kMTk0eE84K0ZGTUJPTjJtSGpFMHR5ZDJRNW9rcFR5dzZy?=
 =?utf-8?B?aWFjRmQ3ZHhSNHVsdldMby9rS05POVhtRkxXcmVLcitzYTJyank1RDV6NWJ0?=
 =?utf-8?B?MTFMa29jQmFnL0hTY1NQQ0NSM2VkZlZHZktWYTdJekNPSUVwa2llYU01OStB?=
 =?utf-8?Q?T8gzMnlkdQbXb0UI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFDE84DA442751449F9D635D25CD0FDA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: J/WR7fivDybR6VAspAynBb6k1NIPT7FDSgegRtMENMdYAAI4ksPfHX53U0zcls2JovMeAH7Q46UEhaOBpvnCT7ZOeRU1+XeqR40OQc7Vb8lBAqWl4pggEHqjzEUL+PzwwvUHl2GVQFLz5avUXF1XaoSt2RlFIEWpXQUkNPuTtTneGXS00T2cH2kNSYV1MUxkGlfezUoOzOzCNW09tMECAHXBh2WoWDYKlKS6+gX6rIdtBWeyG87+I5xiCEbGmJQHoVySSN5TMxBW+hU/O73+x3nrPwg+fNoQ55FnwCrxB0pOyRHY4CyXs7rPGXYGYbZxmOPo9hAj2x43bCMmT/jE2Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d27520a-bbb7-48ee-3ef0-08dee273fa14
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2026 13:21:27.7709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dwc1ydIMZbgOPVG35m+7IVqGE7oFj4SrbPn+kIKdwYPR3E3DWYe/q2vhBjZCd5IdlCXnGYJ4vgLLXTdVpUdIyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8465
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTA3LTE1IGF0IDE0OjQyICswMjAwLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIg
d3JvdGU6DQo+IE9uIFdlZCwgMTUgSnVsIDIwMjYgMTM6MTc6MjYgKzAyMDANCj4gUnlzemFyZCBL
bm9wIDxyeXN6YXJkLmtub3BAaW50ZWwuY29tPiB3cm90ZToNCj4gDQo+ID4gU2luY2UgY2hlY2tf
c2VjdGlvbnMoKSBub3cgd2FybnMgaWYgYSBkb2N1bWVudGF0aW9uIHRhZyBtZW1iZXIgbmFtZSBp
cw0KPiA+IHRoZSBzYW1lIGFzIGRlZmluZWQgaW4gdGhlIHN0cnVjdCwgd2UgY2FuIHN1Z2dlc3Qg
bmFtZXMgdGhlIGNoZWNrZXINCj4gPiBrbm93cywgc28gdGhhdCBpdCdzIG1vcmUgb2J2aW91cyBo
b3cgdG8gZGVhbCB3aXRoIHRoZSB3YXJuaW5nLg0KPiA+IA0KPiA+IHYyIChyZHVubGFwKToNCj4g
PiAtIFN0cmlwIHdoaXRlc3BhY2UgZnJvbSB3YXJuaW5ncywgbmljZXIgd2hlbiB0aGUgaGludCBp
cyBlbXB0eQ0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFJ5c3phcmQgS25vcCA8cnlzemFyZC5r
bm9wQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgdG9vbHMvbGliL3B5dGhvbi9rZG9jL2tkb2Nf
cGFyc2VyLnB5IHwgMTMgKysrKysrKysrKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
bGliL3B5dGhvbi9rZG9jL2tkb2NfcGFyc2VyLnB5IGIvdG9vbHMvbGliL3B5dGhvbi9rZG9jL2tk
b2NfcGFyc2VyLnB5DQo+ID4gaW5kZXggMmRlZGRhMjE1YzIyLi5hMjJjM2UzMTgyZjAgMTAwNjQ0
DQo+ID4gLS0tIGEvdG9vbHMvbGliL3B5dGhvbi9rZG9jL2tkb2NfcGFyc2VyLnB5DQo+ID4gKysr
IGIvdG9vbHMvbGliL3B5dGhvbi9rZG9jL2tkb2NfcGFyc2VyLnB5DQo+ID4gQEAgLTU1OCw2ICs1
NTgsMTMgQEAgY2xhc3MgS2VybmVsRG9jOg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBz
ZWxmLnB1c2hfcGFyYW1ldGVyKGxuLCBkZWNsX3R5cGUsIHBhcmFtLCBkdHlwZSwNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhcmcsIGRlY2xhcmF0aW9u
X25hbWUpDQo+ID4gIA0KPiA+ICsgICAgZGVmIGdldF9zdWdnZXN0aW9uc19oaW50KHNlbGYsIGRl
Y2xfbmFtZSwgcG9zc2libGVfbmFtZXMpOg0KPiA+ICsgICAgICAgIHN1Z2dlc3Rpb25zID0gc2V0
KG5hbWUgZm9yIG5hbWUgaW4gcG9zc2libGVfbmFtZXMgaWYgZGVjbF9uYW1lIGluIG5hbWUpDQo+
ID4gKyAgICAgICAgaWYgbm90IHN1Z2dlc3Rpb25zOg0KPiA+ICsgICAgICAgICAgICByZXR1cm4g
IiINCj4gPiArDQo+ID4gKyAgICAgICAgcmV0dXJuIGYiKGRpZCB5b3UgbWVhbiBvbmUgb2Y6ICd7
IicsICciLmpvaW4oc3VnZ2VzdGlvbnMpfScpIg0KPiA+ICsNCj4gDQo+IFRoZXJlIGlzIGEgYmV0
dGVyIHdheSB0byBwcm9wb3NlIHN1Z2dlc3Rpb25zLiBTZWU6DQo+IAlEb2N1bWVudGF0aW9uL3Nw
aGlueC9rZXJuZWxfaW5jbHVkZS5weQ0KPiANCj4gRS5nLiB1c2Ugc29tZXRoaW5nIGxpa2U6DQo+
IA0KPiAJZnJvbSBkaWZmbGliIGltcG9ydCBnZXRfY2xvc2VfbWF0Y2hlcw0KPiANCj4gCW1hdGNo
ZXMgPSBnZXRfY2xvc2VfbWF0Y2hlcyhkZWNsX25hbWUsIHBvc3NpYmxlX25hbWVzKQ0KPiANCj4g
U2VlOiBodHRwczovL2RvY3MucHl0aG9uLm9yZy8zL2xpYnJhcnkvZGlmZmxpYi5odG1sI2RpZmZs
aWIuZ2V0X2Nsb3NlX21hdGNoZXMNCj4gDQo+IElmIHRoZSBwcm9ibGVtIGlzIGR1ZSB0byBhIHR5
cG8sIHRoaXMgd2lsbCBsaWtlbHkgcmV0dXJuIHRoZQ0KPiByaWdodCBuYW1lLg0KDQpUaGUgY2hl
Y2tzIGhlcmUgc3BlY2lmaWNhbGx5IHdlcmUgYWRkZWQgdG8gZGVhbCB3aXRoIHNpdHVhdGlvbnMg
bGlrZQ0KWzFdIHdoaWNoIGJvaWxzIGRvd24gdG86DQoNCnN0cnVjdCB7DQogICAgLyoqIEBmbGFn
czogZ29vZCBkZXNjcmlwdGlvbiAqLw0KICAgIGludCBmbGFnczsNCg0KICAgIC8qKiBAc3Vic3Ry
dWN0OiBhbHNvIGdvb2QgKi8NCiAgICBzdHJ1Y3Qgew0KICAgICAgICAvKiogQG1vZGU6IGJhZCwg
d3JvbmcsIG5vIGdvb2QgKi8NCiAgICAgICAgaW50IG1vZGU7DQogICAgfSBzdWJzdHJ1Y3Q7DQp9
IGJpZ19ibG9ja19vX2RhdGE7DQoNClRoZSBkb2NzIHNob3VsZCBzYXkgIkBzdWJzdHJ1Y3QubW9k
ZSIgaW5zdGVhZCBvZiBqdXN0ICJAbW9kZSIsIHNvIHRoaXMNCmlzIGRpc3RhbnQgZW5vdWdoIGZy
b20gdGhlIGFjdHVhbCBpbnB1dCB0aGF0IGRpZmZsaWIgd291bGQgbm90IHN1Z2dlc3QNCml0LiBJ
IGNvdWxkIG1lcmdlIHN1Z2dlc3Rpb25zIGZyb20gYm90aCBkaWZmbGliIGFuZCB0aGUgcGxhaW4g
c3Vic3RyaW5nDQpjb21wYXJpc29uIGlmIHlvdSdkIGxpa2UgbWUgdG8/DQoNClsxXSBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNzM0MzA3Lz9zZXJpZXM9MTY4OTA1JnJl
dj0xDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IE1hdXJvDQoNClRoYW5rcywgUnlzemFyZA0K
