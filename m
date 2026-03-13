Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9B031DDBB;
	Fri, 13 Mar 2026 11:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399946; cv=fail; b=tUa0qNwaEioNs8gvqbhe7YGrzs/FSSqVJt3eMjmV3vOPvRIlb5JBhbqWuW020SqVd+6nzjecCLjOj/q24ciHA6AL7jJb66pqBtuJP7NM41jsE6KU64/mpesjSko9KQI+zaqCSWdGapderguzIrA0uYeEEaN4BITMCDvzMPRC1+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399946; c=relaxed/simple;
	bh=3nxGDPWJbSNh0ESbvh9W3vYSYDccJDZqIuV3TyO8uaw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SvvHgnB/heKuj2eSWBCwyWPOPBz5DcJxoVatZB03+DGO1t8zTCFSLhXUTld19kEY5XdOh9HwVk9THAED/WTz7qY/2KEMCa6OYPF3oR93/unY6dgN0sbzuCZ0W9crfx2OVn/8KEE4/rPcCJs+lx16cP0JOpAZHw/JNh4WDXj6vnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIsvSjxg; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIsvSjxg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773399945; x=1804935945;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3nxGDPWJbSNh0ESbvh9W3vYSYDccJDZqIuV3TyO8uaw=;
  b=gIsvSjxgMB00IGQ+1E3uMr1JRoH3LMrGTvTzRnYtleK7HPVONr7VUi/o
   cTM4HOAvpcTtdxPkOzzn7OAZV/R2oFXR+7z/vrMafvfjjH6AlLS7cDV1Y
   olSW0jSgdSXScuBumwsIugwbJ7GHfcdyBfY+r6QZ4GIysSMwznG8xuonE
   8nLGIZ1gE8nwO+qE68CmuQzrMA9/ErMmktmHUpIl6BAV53J8s5ArOF3jN
   d4SZz8Jwx694lkN8ertqEjSgP26ht1D5BtTj23jXYV8VeYVC7Gi7RBfJd
   UhbqusG2c/9v9fv89bPNd4WWXf9DmYave/xA5MOybLcjMqF3cyqnJwgmw
   w==;
X-CSE-ConnectionGUID: 9M/iB21+RU2nuN0BgmY2ng==
X-CSE-MsgGUID: Wor8KhZeTZOUgFdvdiSpiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="99966904"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="99966904"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 04:05:44 -0700
X-CSE-ConnectionGUID: dY7Wqe/LRdGJC2LLUrKwsA==
X-CSE-MsgGUID: zHiSABG5TyGWhUgiTj78FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="217148601"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 04:05:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 04:05:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 13 Mar 2026 04:05:43 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 04:05:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+frnQCuLp9X6CXrXcG+aQ0YAdwud5+9RIuIcBF7INpEyUoHXKRXQbM6H7u1vxlHG0lcizIESxph397IJcfhmp8p2ax+qXncloqmlRnXagOTHz4CJfa+savnTu0iQVplOmkTu5aZGYLSbM2J/7uf5V4qQNupRBRn/yQJwqCenApi4Bptr5QFZIMFr3rOlzsmRrHpzeQb17nMlxBAsJor/rp6xGHC5sB6fKKnb8/fcrWMrrzTQQbR9Xw7OXW1f1mwS53fRWs3efGgF8TmNREKTm14XWT9m+4dyaZ+wd4rhJXzSUSkVz9q9etjjda5cLJa5QaKCH2TRs1RO20K/LTkIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nxGDPWJbSNh0ESbvh9W3vYSYDccJDZqIuV3TyO8uaw=;
 b=JY1GhmOaFsvWRnz5Xjm18QfIF6dhFLLV4bPACA77F/ce0JgVluCdVDA5Qk9wl3x81xpLMWzxT0PW5qzqFPOFqdlhgjirO1lXwHyu4KFqHOSnGgOSkerKuXcLPYWJWI1hU3LUy/WwPaWxhq0SjMNee8I+2ktZ6hJWezSEW9jKtrcf3M62TxVwIqGHhBRqTnCJhHpcIsn3ZffqxwriNndxlR469UiULc8/2TArHY5ddzFQErfseK9+rrejhWQhbSf3avKwdwJ7cPoWOQCf5U3MsYYxlYiTu0rOOOT164/n/fATietvqIYAcCzgdmPCVqMwqK1/MHY5D676FueVxolNfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Fri, 13 Mar
 2026 11:05:38 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 11:05:38 +0000
From: "Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: RE: [PATCH v2 29/28] docs: kdoc: ensure that comments are dropped
 before calling split_struct_proto()
Thread-Topic: [PATCH v2 29/28] docs: kdoc: ensure that comments are dropped
 before calling split_struct_proto()
Thread-Index: AQHcssRG4oAipUOq0UCnpGQ1qODxzbWsTQtQ
Date: Fri, 13 Mar 2026 11:05:38 +0000
Message-ID: <IA3PR11MB898638F49605BC47E94E40FAE545A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <cover.1773326442.git.mchehab+huawei@kernel.org>
 <d112804ace83e0ad8496f687977596bb7f091560.1773390831.git.mchehab+huawei@kernel.org>
In-Reply-To: <d112804ace83e0ad8496f687977596bb7f091560.1773390831.git.mchehab+huawei@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|MN2PR11MB4758:EE_
x-ms-office365-filtering-correlation-id: 5ffb1100-44d9-4888-1eaa-08de80f07583
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: u3D/NJ/jMjsnqoTJiAMCyEQoE60s++3ILVTlHe0yxwa7K4OlJKk7gPRkgD+pebc5uP0aaCtTdVS0b2R/8W4z59tC/Jl0IDzcgA0evzmwwun9OX7c6Iwmchvt9qu5zswLKDEGrPJelfqjc3aT7FVw98NsgDIQs17Hpl21iosHt/KKIkmzWkSU8WbGIdo5p+Sm9GupPSlJ/uT3+fZk/zWFbvEBvd7YSVB5NXs7GjhVa7ZgWxFYiJnHHbhphTHQvTxcvM0vc30UtXAnDleTw3Ox96B0y3NwdtVjss1Q4YJA+szXd9nLdVhuOqXrzO9cKRA3nkNbRDSVBhWmedqb70CRJYX9BViXNe8drsJq9VZvV0rIYbGHC8gJMOjOMzNhS23h/JWoYtumN9fORQ6FcXBUcZs+UgMrWMd2qPc14VBbqNLzVDZqZQJ3vhQrjv4f6YrH4SG/mlqUIpekbCldvGMZvL3q/iPgQymRuW9IrsfSWGvS1CPoNy1W2FmJkBYw5GG8U6vBLDR0sk0guW7cvdKMLI2Tatfi50J8e8o9riH25BdyqWnl8ujWQPe5ps3G8EJdLZsP89ROYwLwewG+SGgXCdk2H/hH5pwwU7o8OPXWiz0Y/AA7DWavN0Sk7SFEyZ/zVbHZDLrDSQTGmxpDgc2x3Sl7m8HufL0fSnE2yhngN8o2YWOJsd1AnARZMM3MDi+wkSd0NSmW/WHaVEerEJqIPvGWMc3SaTnCCaPM35Q1iVAqNqJ6U2GzXbRCg67aJv1riz1fwVPyUzeYEOUjWxD3eDoI8C8mOKuxIXlAPIUPnQM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzZWbXIvbUwyUFhnU3ZmQzd4STRUeWk5NkNyZ2xyMThwSU9uOS9FUlB0ZHRx?=
 =?utf-8?B?Y3NhUUN4WFBMSDZYekF3MDNQeW9WVERpaThuQzYyMVhkVjkzRi9uL1QvOE1z?=
 =?utf-8?B?M0RzM0VCdmMrcEd4T3R1NytKUXJGdjJMd2hFUzlXQUpMVHAwYXNpNUx1cXhj?=
 =?utf-8?B?ZDQ0SjYvdTh6OGRtU09PVmdJVzNtK1M5b2dRQWpXTVFkWHY3L1V4MGJuVlNu?=
 =?utf-8?B?bE1VUXk4VENLbEZCN1NPREZ4L0VZWEZvM29XczNlK0lVVmVmZzFQcnNMUmFX?=
 =?utf-8?B?ZHUwQ05RZi9DL3lodXVsYzM4endMZ0d1bkVvYy9TdnpaTE9RTjQ1VVFIbHZ1?=
 =?utf-8?B?RzFUM2MxNERMUVRkaVByMVVKbERVSG03OU16K1JSNDlhbExWYnNUR1R5Skda?=
 =?utf-8?B?Q0tZcnRNTTVDcXVtWkdVbWIzMEVqc3lXbjlJWDE5RE5HYS9JSWwzbjc4RFRL?=
 =?utf-8?B?YURjWFlBWE0zK2Z4ODJkempDWWl6Wk1CVWJPQ3JFNEt4ZmZ6eTJtVjhaNXEx?=
 =?utf-8?B?U0Mwd3c5UEQrbUZqY1JzQ0RDS05YNHI1eXdTaXRMQ1BuZ1JvT2pOQ1lraU5W?=
 =?utf-8?B?WStNREF0bUdhb2h5QnkzalNoUk1KbUFGMTJlZjc1a3U2S2U5WjMvY1BtSXNk?=
 =?utf-8?B?alZLeUlkZkVwZEdUTlpGVktRL3BQZ3lDN2h2cWtycWgrdW1Scm9BOWRSc0RU?=
 =?utf-8?B?dUhpcWc0NHluL0tMMDhOcE5DS0s4bkc2NG5xWWNTZXhWeWdCejNhWGZjbGsr?=
 =?utf-8?B?MnA1Z2s3Y0VIckZGdWdlUDZINUV0QUJMMjdybGp3bDJBaTRQS3NJTWV4OEht?=
 =?utf-8?B?NnNsVWhKTEowT2greUk3MEN6dUlLaG9EeFNFZ000Zlc5K0tLSjk3Rm82RGg2?=
 =?utf-8?B?VDBVaXVpV0VhOXlzR3BwRTFJWkh1NHZaQlo5U29tMURETmZDKzJObEszcDM0?=
 =?utf-8?B?SVBrdk80YU0zeS90cG4xYjBwWHFlcmF3S1B1aGZzZGtrelVhRVY4VUZ2eHUw?=
 =?utf-8?B?dUY5REVyUHdwYmI4YzFIbTZTTmpLdHBjRWtTamNTMThOeEFEUVNwTmR4ZmpB?=
 =?utf-8?B?MEYyOTNEMGRScCt6T1duL0VQN1VTYmI1cDY4Tm5rWEUvMHdOQXh0YnFTUXRV?=
 =?utf-8?B?elJEVHNRTDdMUktTTDAyUUhEMTJ1ZWY0YUlkQUh3UUFaQ2o0WFhBYjg0ZXo0?=
 =?utf-8?B?OW12TTVXbjMrQTc5cHo3WEpheElXNlJzOTdWRFk1bm0xMGZ4QittUDNidFJG?=
 =?utf-8?B?aStRaERVbFBPaE5YWGxQME11bEdsaEltWHQrOVc0aFEwWEV4VEdsblFNSlA2?=
 =?utf-8?B?Tmp2TE10bEIwajh4TERBellFejFQazExZmRQb0pxZTRyUUs4b3ZmSEdJMHZ0?=
 =?utf-8?B?WTRWMCtMeGRya0ZtMEg3dS9JQVVHYmNFdTdhWmNDc1M4dzZyakpRYWNub05y?=
 =?utf-8?B?TFRjSGh6ekhBTWtueTUvVlVac0FLeUNkMjRneDNVQ1grMm01cmFlY2szUlhm?=
 =?utf-8?B?bkd2N05EVGtXKzIxMDNvRzF6OTl5dGdCM3BtWExSejdqVXpIWHZ5cmcxOU90?=
 =?utf-8?B?NHhwS2Z2allkU04wRlMvY1UyRWpRQ0dXLzlqdHZya2prVXVzRWFZZXcxVGpS?=
 =?utf-8?B?ZTM0YWc5MHJyRTNuL3lXd1NmWjZabURHS3plK1dFVEQ3ZWVyQm03WnczRjR3?=
 =?utf-8?B?cWdkYThZZ3dqODk0VTlMWVFYMnFBMlR0MUdrVjZ1djJsaU41MXpYR0kwb2la?=
 =?utf-8?B?ZTRwZGJjaEJTZFd6WjBBZUE2TWlXMGdNckRuajdsTXlRMzA2M3Y2Nm5NSy8z?=
 =?utf-8?B?bCtFU2hiajcyY3NxTlU4NDQ0b2p0QlNQdWNPSk0vY2FGNERoTGRmbjhOWFcw?=
 =?utf-8?B?RWtBWmxXd3hYOXA0NXQ3ZkhKU2J1aTRyaVpKOEZocHhTMTBSUk9wcElJOVBZ?=
 =?utf-8?B?Z05qUlVKZlp6QXFJY09CNkVpeml3ZUUxV1RRRHZzY2diOVhvZERuQUlJblc4?=
 =?utf-8?B?VE5RYTk0azJIcmlqc2E3b1FKWUErVFpZdm5seGlQMWVFcTJaR1BydVFFRWdy?=
 =?utf-8?B?OUVGdHZlNE5xVGpaMXJkenRzYThkY01VRE9yZmlVM1ZWWXlOUzIxRlFVYUZD?=
 =?utf-8?B?YXNkOEdaalpScDhoY29HdmQxTzN4eDJvanBQcWJXM1JpOEJaUENJK2ZuTUNH?=
 =?utf-8?B?bXZuVDZ4aW1XKytoaTg0a2dnZ2tFK0V0NnlQT1FGcTNVZ01HazJYS3locEtB?=
 =?utf-8?B?K25GTlRpUHdZeG9mOGdXMENMemZWWnk2aGJ3TGFucEZUZFBqVG1BRGlPdE9z?=
 =?utf-8?B?UURyTzhPQmlOLzJtbk1OR29oNFFHejUvYnl0Uk45bnpUcTlHM2lrT3FJZExH?=
 =?utf-8?Q?V4LYM33LjSQ4z2Sw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LXOjXsYoiIO+HafViKXBppASMmg0//EB9u1n0EEmf7cYnuk2IUx6aDlTCq6pu7qHCstflXNAvy164++DTfrT7CondjezEZqkWuvcnWHJUbir+Vw7WTcsQsi756O+bS4seCHaIAEYRM3liUvbZYgBXkGIzdnZZq/qVTpNJvULm1mCtvIp2161vj0OJLu5xTZoF/BUKuvyqSi66b9EzrOZSe2qgEJqyhquYG164ug5+urlGOzU2DlhvCarYCZaeXKjY7lLdP3Uf1DIBqYDp9ce2srxtHdME4mViLMwV43PdJ2iVgev0n2vHvbQAW+jCaIWNdsxfztvEytUHH7QKz0WPQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffb1100-44d9-4888-1eaa-08de80f07583
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 11:05:38.4998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U19rbm+FmjVEzeeZtqVvK5446OfAYN6zoElNvSFm5f+knLqq5NyqIOOEqEz95KQWI0f2um0NMtbrj4FYwwNELLBOAg/L2P3+vTDBDPMdTeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIDxtY2hlaGFiK2h1YXdlaUBrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIE1hcmNo
IDEzLCAyMDI2IDk6MzQgQU0NCj4gVG86IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+
OyBMaW51eCBEb2MgTWFpbGluZyBMaXN0IDxsaW51eC0NCj4gZG9jQHZnZXIua2VybmVsLm9yZz4N
Cj4gQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitodWF3ZWlAa2VybmVsLm9yZz47
IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBMb2t0aW9ub3YsIEFsZWtzYW5kcg0K
PiA8YWxla3NhbmRyLmxva3Rpb25vdkBpbnRlbC5jb20+OyBNYXVybyBDYXJ2YWxobyBDaGVoYWIN
Cj4gPG1jaGVoYWJAa2VybmVsLm9yZz47IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQu
b3JnPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMjkvMjhdIGRvY3M6IGtkb2M6IGVuc3VyZSB0aGF0
IGNvbW1lbnRzIGFyZSBkcm9wcGVkDQo+IGJlZm9yZSBjYWxsaW5nIHNwbGl0X3N0cnVjdF9wcm90
bygpDQo+IA0KPiBDaGFuZ2VzZXQgMmI5NTdkZWNkYjZjICgiZG9jczoga2RvYzogZG9uJ3QgYWRk
IGJyb2tlbiBjb21tZW50cyBpbnNpZGUNCj4gcHJvdG90eXBlcyIpIHJldmVhbGVkIGEgaGlkZGVu
IGJ1ZyBhdCBzcGxpdF9zdHJ1Y3RfcHJvdG8oKTogc29tZQ0KPiBjb21tZW50cyB0aGVyZSBtYXkg
YnJlYWsgaXRzIGNhcGFiaWxpdHkgb2YgcHJvcGVybHkgaWRlbnRpZnlpbmcgYQ0KPiBzdHJ1Y3Qu
DQo+IA0KPiBGaXhpbmcgaXQgaXMgYXMgc2ltcGxlIGFzIHN0cmlwcGluZyBjb21tZW50cyBiZWZv
cmUgY2FsbGluZyBpdC4NCj4gDQo+IEZpeGVzOiAyYjk1N2RlY2RiNmMgKCJkb2NzOiBrZG9jOiBk
b24ndCBhZGQgYnJva2VuIGNvbW1lbnRzIGluc2lkZQ0KPiBwcm90b3R5cGVzIikNCj4gU2lnbmVk
LW9mZi1ieTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK2h1YXdlaUBrZXJuZWwub3Jn
Pg0KPiAtLS0NCj4gIHRvb2xzL2xpYi9weXRob24va2RvYy9rZG9jX3BhcnNlci5weSB8IDYgKysr
Ky0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYi9weXRob24va2RvYy9rZG9jX3BhcnNlci5weQ0K
PiBiL3Rvb2xzL2xpYi9weXRob24va2RvYy9rZG9jX3BhcnNlci5weQ0KPiBpbmRleCAzZmYxN2Iw
N2MxYzkuLmVkMzc4ZWRiMWUwNSAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvbGliL3B5dGhvbi9rZG9j
L2tkb2NfcGFyc2VyLnB5DQo+ICsrKyBiL3Rvb2xzL2xpYi9weXRob24va2RvYy9rZG9jX3BhcnNl
ci5weQ0KPiBAQCAtNzI0LDYgKzcyNCw3IEBAIGNsYXNzIEtlcm5lbERvYzoNCj4gICAgICAgICAg
Iw0KPiAgICAgICAgICAjIERvIHRoZSBiYXNpYyBwYXJzZSB0byBnZXQgdGhlIHBpZWNlcyBvZiB0
aGUgZGVjbGFyYXRpb24uDQo+ICAgICAgICAgICMNCj4gKyAgICAgICAgcHJvdG8gPSB0cmltX3By
aXZhdGVfbWVtYmVycyhwcm90bykNCj4gICAgICAgICAgc3RydWN0X3BhcnRzID0gc2VsZi5zcGxp
dF9zdHJ1Y3RfcHJvdG8ocHJvdG8pDQo+ICAgICAgICAgIGlmIG5vdCBzdHJ1Y3RfcGFydHM6DQo+
ICAgICAgICAgICAgICBzZWxmLmVtaXRfbXNnKGxuLCBmIntwcm90b30gZXJyb3I6IENhbm5vdCBw
YXJzZSBzdHJ1Y3Qgb3INCj4gdW5pb24hIikgQEAgLTc2NCw2ICs3NjUsNyBAQCBjbGFzcyBLZXJu
ZWxEb2M6DQo+ICAgICAgICAgICMgU3RyaXAgcHJlcHJvY2Vzc29yIGRpcmVjdGl2ZXMuICBOb3Rl
IHRoYXQgdGhpcyBkZXBlbmRzIG9uDQo+IHRoZQ0KPiAgICAgICAgICAjIHRyYWlsaW5nIHNlbWlj
b2xvbiB3ZSBhZGRlZCBpbiBwcm9jZXNzX3Byb3RvX3R5cGUoKS4NCj4gICAgICAgICAgIw0KPiAr
ICAgICAgICBwcm90byA9IHRyaW1fcHJpdmF0ZV9tZW1iZXJzKHByb3RvKQ0KPiAgICAgICAgICBw
cm90byA9IEtlcm5SZShyJyNccyooKGRlZmluZXxpZmRlZnxpZilccyt8ZW5kaWYpW147XSo7JywN
Cj4gZmxhZ3M9cmUuUykuc3ViKCcnLCBwcm90bykNCj4gICAgICAgICAgIw0KPiAgICAgICAgICAj
IFBhcnNlIG91dCB0aGUgbmFtZSBhbmQgbWVtYmVycyBvZiB0aGUgZW51bS4gIFR5cGVkZWYgZm9y
bQ0KPiBmaXJzdC4NCj4gQEAgLTc3MSw3ICs3NzMsNyBAQCBjbGFzcyBLZXJuZWxEb2M6DQo+ICAg
ICAgICAgIHIgPSBLZXJuUmUocid0eXBlZGVmXHMrZW51bVxzKlx7KC4qKVx9XHMqKFx3Kilccyo7
JykNCj4gICAgICAgICAgaWYgci5zZWFyY2gocHJvdG8pOg0KPiAgICAgICAgICAgICAgZGVjbGFy
YXRpb25fbmFtZSA9IHIuZ3JvdXAoMikNCj4gLSAgICAgICAgICAgIG1lbWJlcnMgPSB0cmltX3By
aXZhdGVfbWVtYmVycyhyLmdyb3VwKDEpKQ0KPiArICAgICAgICAgICAgbWVtYmVycyA9IHIuZ3Jv
dXAoMSkNCj4gICAgICAgICAgIw0KPiAgICAgICAgICAjIEZhaWxpbmcgdGhhdCwgbG9vayBmb3Ig
YSBzdHJhaWdodCBlbnVtDQo+ICAgICAgICAgICMNCj4gQEAgLTc3OSw3ICs3ODEsNyBAQCBjbGFz
cyBLZXJuZWxEb2M6DQo+ICAgICAgICAgICAgICByID0gS2VyblJlKHInZW51bVxzKyhcdyopXHMq
XHsoLiopXH0nKQ0KPiAgICAgICAgICAgICAgaWYgci5tYXRjaChwcm90byk6DQo+ICAgICAgICAg
ICAgICAgICAgZGVjbGFyYXRpb25fbmFtZSA9IHIuZ3JvdXAoMSkNCj4gLSAgICAgICAgICAgICAg
ICBtZW1iZXJzID0gdHJpbV9wcml2YXRlX21lbWJlcnMoci5ncm91cCgyKSkNCj4gKyAgICAgICAg
ICAgICAgICBtZW1iZXJzID0gci5ncm91cCgyKQ0KPiAgICAgICAgICAjDQo+ICAgICAgICAgICMg
T0ssIHRoaXMgaXNuJ3QgZ29pbmcgdG8gd29yay4NCj4gICAgICAgICAgIw0KPiAtLQ0KPiAyLjUz
LjANCg0KUmV2aWV3ZWQtYnk6IEFsZWtzYW5kciBMb2t0aW9ub3YgPGFsZWtzYW5kci5sb2t0aW9u
b3ZAaW50ZWwuY29tPg0K
