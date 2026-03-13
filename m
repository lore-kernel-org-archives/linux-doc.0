Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD9F282F29;
	Fri, 13 Mar 2026 11:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399917; cv=fail; b=UZLk7HBpfbKkM5Vxocg2CZ37lSRQX8h3Xa4OpbiCr4YAbUmS1uFGME8y0tOZlp+hD4utaftWSu2SPXV2NhsQItnvVNeBYA2X16bxQveMyu7Dnfkxqskjr+qkVqDSXYxnst8KE8SD5VBXsN6hzX3bEnXsaG9fDbtLEGAF/4LUlGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399917; c=relaxed/simple;
	bh=lqxsFr8YPShRmpW84jPC0zhv7cBMaWBUaNBQj+7QXLM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q8OWT2J4fNfjkD1zj7MATqMYIpjvqIrpGPfTZ+UsYNF0b9NZczxRMiq/ae99Vt8bMlSG+81J0U4gDSmQOg2GiLKLks+srbVc8ksdBOvc/+2YpFK24DoQBZzHLoMC5eytdc/GDCon6zL1zED7S2xC+kcc1zEKwahjrhB5WrtUK68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QydUgK/y; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QydUgK/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773399915; x=1804935915;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lqxsFr8YPShRmpW84jPC0zhv7cBMaWBUaNBQj+7QXLM=;
  b=QydUgK/y19uCg7m6KiYTJ6KXpb66K3XQlOpGX+R9q9XlHJcyqlP18zDC
   mdBBMJ39h9tdPkZ3VkPCtEuQr5mS67GdSqmnzqCtXhIciK48aG6+s/OXf
   zkfSIVvhk+Raz2UF3EPf5pedukMbDdqhmprmxemStKxgqd/3GncwvW4Vu
   DGmxakvsohiuItwpCaABwTB3cJh2HOj6uiknYepUERQHQbWpKx15J+pIF
   q6BZdQU4cAGTpD+6WRm0yO8IwM8G8T5taSEtNfsOgKvUasp1hfwKE0BKs
   uILnjVWhHPzQkB7wAm2d1YqZzVBj8oFDu3GYrl73HmdYGElCr3nl+RCvs
   g==;
X-CSE-ConnectionGUID: oVgHBcobSUyV49d+GjYEEA==
X-CSE-MsgGUID: osos/V8oQgi72lbbswf4Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="99966851"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="99966851"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 04:05:14 -0700
X-CSE-ConnectionGUID: 8R5OQc/BQ7275ZjZq4D5eA==
X-CSE-MsgGUID: ERoroJySTE6cpIawmKNAMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="217148450"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 04:05:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 04:05:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 13 Mar 2026 04:05:12 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 04:05:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqGfoAAPlD7iXiSKiTAMkayjTCEC79vOLc2aVMisqEBV6FqKzuRsEOdCzX1LP+aFpVKYXuCufNZKD/C1468LQKkH+B2XZ0OJuaPCW2ep2Bo51asXWhRG7z8f+d6c/rSzkt2W2p5hEObpj5DiB7vLHRd2Xi9jBjXXajZBBFopBOY/+sXNAPsj9hqQHOkilXhzs2QOLY5mw9XsN0OMfleChwOeOUCLdd7qQIv4S5QfZ0w0/oPoyIQLr+6EPBF+dnUCAfQipNahTW/E9485fQElLBfHi81sB2PC8o6YMQw5OgamOR7vOwwhQIuDd9kCSVaJFWe6Cl70Rx2ggFlR5Ov9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqxsFr8YPShRmpW84jPC0zhv7cBMaWBUaNBQj+7QXLM=;
 b=D3z+JsxzWqosiaFk1CySixVXfqvxxW7BE9l600c/uJG5MuteI9amQ7yJ5CsI2unO8AS4Sj5Q/cXykeB3KE478E+oHJo5bjSJgQhMrbTODx92gGCvIJFQYWlOBgpcHIzr9ZNaD+Jb62EEh35L3KF2u+Ex6dJZssQQvreNOoSAYIrpH/hGuBPMAlJzb76oqblbxLg+eM6ry+nmpeKGW+bYtgkhzy9tUZ4eo+sjbr7eNq7GehP3bZo33ZIUawYP/RS6pDbEg4ozKyJ6VBzNaJGrRszsVaRFVNpCb78+CvSZqy9Mlwsflwty1cy1gwx2yHcpcL/WfINNj9fpTywBz69zQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by IA1PR11MB6442.namprd11.prod.outlook.com (2603:10b6:208:3a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 11:05:07 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 11:05:07 +0000
From: "Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: RE: [PATCH v2 30/28] docs: kdoc_parser: avoid tokenizing structs
 everytime
Thread-Topic: [PATCH v2 30/28] docs: kdoc_parser: avoid tokenizing structs
 everytime
Thread-Index: AQHcssRKxx5FGgfJnEuGzGW96dm8nrWsTOOg
Date: Fri, 13 Mar 2026 11:05:07 +0000
Message-ID: <IA3PR11MB898690E20F945BEAF0D37DD1E545A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <d112804ace83e0ad8496f687977596bb7f091560.1773390831.git.mchehab+huawei@kernel.org>
 <a25a7663215a0d07fffbe299dd9a6a91aeddb452.1773390831.git.mchehab+huawei@kernel.org>
In-Reply-To: <a25a7663215a0d07fffbe299dd9a6a91aeddb452.1773390831.git.mchehab+huawei@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|IA1PR11MB6442:EE_
x-ms-office365-filtering-correlation-id: 1963da90-1c86-41a4-f064-08de80f062fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: /UtgbLMahg8QGAV2J+26DO3hFmLxsOcwGmerSh9/3LleZCVwLqoM1GPmZVkPjfRjexSmzDyF5ylBbbpQwxlLy/8yGqYNusqpzGTwxWNsDh3AjH2MwDRuA+1pNIfvs/6SDijQ+ddFOyAkUK6Y+o0EkyfGHNIyXDvHC7eXEVK86a9qVUfcGhMwBrptqsC+Yf+f4IWqW1vqDbfUSlXYhpt7/ADWen4BdZXEBgTWKL0masy9dSm6quTdesQDcrxQrR60jl0NIdJ+nPrmdpSvT+kRJg1iqtAu9RnL02pQYWu2MHSEsEXYEb/xcDregX9HtNrXOirSghT6ZLn2PFxeGrTW5BoazmAgQnKtvfltew4Nfg1lehkeln5PJ0UBmYpGGkLLcVBRWM4zy3iorzAFl4ZIbnLbIlICoe7H+RJXrSIUN0glZWDslaNZG9i9mWi7NEphpcoCagteQ3CGry65k1yA1avsYylr6TZ+JU2xCCenk6RnHXQMyvXOz3vJGxcc8Yii+ZuXuQJqeXnhzxkpkW8Ydu4aQbDa0X5qpvFpkfdMmXZ7v6ykgEUt1JvB+onGQ/JftOyiq0F6+L/9foXUrCOBIIUdwtzUOylqwGQjYCGQtphw9LqtLbfGDlUsGNiEG4wRNoEx+V12bXCl8m1iGyWBEEE9qXYVCL7EC90l3J0xHxngdrGaXvtNE+EtVeWgwc+yUgw1EXAZ2ltxq6/imdMs6w6DJtv3rH6pEJw198ZORXHDcMVgSr6/vfnNs+ZLi/0Hp4KjKTpiqP1W6MmL8jKfZHl50jTIT5fpH04KUnbjs5w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUlvcXhReDA5U1IwQlF3bklGazFKNmI0OVV4eVdxNUpRYncxWWdwdVNJOVVx?=
 =?utf-8?B?SXhoT010d0s2TU15Y0lGa3RTQTBzTUxqSC85MmlNaEdOdktGdDRGUUx2WS94?=
 =?utf-8?B?OUdFMjNJQ2hkeUhHTGpZTFVFaVg3aGwxYzVlTENYKzZEVUhJaWJmLzRpcE9o?=
 =?utf-8?B?MkVIdk1RVHBPWjBYMUpvUUpSdE5kcGdUNjUzTnZvWGxieFlkTHdLWXJ3bjVx?=
 =?utf-8?B?emtha29wTG02a2ltZy9vRlZyaGpxM2ZaS2JVcDF3eEFHM29INnVhcHc1VjFo?=
 =?utf-8?B?WDZvZlRPSWtLaTd3QWZIN2Z4M0tOM05Rd0phOEhSSFF6ZThjVVBMUzdTZm1m?=
 =?utf-8?B?UTgyRXRyM3A5VkUyZjdlK1BsQ0luN3hRYTBBUEJkd2JqVm01am94WFhJYmND?=
 =?utf-8?B?dDJhRWxsRTl0dmhWMzFkb2dKS1NjdVFLenlvakZvWS9KTys4THdteEZza2JN?=
 =?utf-8?B?YmhJNVdKZEpGaVpvVForcEFMSHA0ZkVkWWNyTUpLL1ROU0lPRkVvQnc3ZjNq?=
 =?utf-8?B?L0RQWVBXYWlRanQ2R2xid2hZejkzOGlpOXVpWERCakplWmZZL3RpK09PZDds?=
 =?utf-8?B?Y3NRUDJyeW9YbUJBL1NMbENqUDFONTBDSjgxN3l0OGQ2dlpUa1hFcGZGM2dQ?=
 =?utf-8?B?SEg4ZXJqRERFMkJzeVNzYU5qUGRpdGZGOFFuWHRUSFpVdWxvS2dEM1UxYm0v?=
 =?utf-8?B?OXVDSjJjKzlIclAxT1dnZEZhdkpBU0xkVE9DZ0dqRjZ4bG03NmFsdm0wZjRt?=
 =?utf-8?B?S0hFbjRiTmNyZ3V1dTFBSlVJVWk5anFSeDUxbUVDMVZ5K3FYUi9zVjJPbEZo?=
 =?utf-8?B?dXFDRnNlcG5HL21ORzJadWtFMktMV0xtV0FrUHJXZlFiOVBtWVhkR053UWJF?=
 =?utf-8?B?RnVaY3lWM2dUMXg3UnJPL1FZWGlxL01zNE15WThLdzRjNHBLM3lCRzNTVE45?=
 =?utf-8?B?UTRUNlFpMzVwdnR1cjA3eGxFd3Ntc2hHMUUyTEVVVlg0M2hCVXRsTEhmcHgy?=
 =?utf-8?B?U3FmQTM3QmZlbStpZXEwc1ZncmZsRXhTYkN0R3U1TDdrYVVMcUdBWmp3eFU0?=
 =?utf-8?B?cWpSK0NyOVAyVThOZmZMOW5MMkQydjN5S256R2xOL0hmb3JpVkU1MmJ4WVJi?=
 =?utf-8?B?ZjJFOERpbFlvZkxHVzk4c1F6YTNGUExZSjhDaThRVVZmdDl6Zm1QVmxJS1p2?=
 =?utf-8?B?SEtBaG1ZNEt5THVSaDVMbjUwT2ZBU1F4R0NjYjljcmw5cWRjUFp0UTE0ZSto?=
 =?utf-8?B?SWRoSHdBaWJIdVpzZzlmak1wRkZ5RTFKOXZDYm9McHUwNDQ0eDdHL09xZG5v?=
 =?utf-8?B?bVJBQnY3UHpyVC82VGhRLzVtUFgzdFE2Qk1MaXBVZ0RTSk5KU04yZ2FSYWlC?=
 =?utf-8?B?NjB6Z1dxdlU1THk0V1o1d3J2eEdWcEdTdVcvZVFCRi9KczhiaGtLZWdJWjVI?=
 =?utf-8?B?bStWNFg0TG1JeUZCNkZxa3FjRDJKa0thNkR0V3pLUFRWc2VaKzhCWkVxYm1Y?=
 =?utf-8?B?bzFnbG5zRTluS3ZYck5raE5uaHlDbGlUb0x1QTE5TG9VNjRLRVlGa0hxZ0pM?=
 =?utf-8?B?UUphbEp5U0pLOHQxdjZaQ3Z1Y1Aya29ja0pZVStYZWxhRUFsaHpjY0F0d3hu?=
 =?utf-8?B?aXR0R3pKZmEvZFNZZ29lcFRmMDlsQTJZUW45UXJIWkNoQ1BVZHNEZHBvKzVm?=
 =?utf-8?B?aTBjd1RtWkdRZFJQT2llaU4xWlhtNWhadjZ2N2VQdjdQQXFLT3ViSUZiYVpq?=
 =?utf-8?B?bFNZaE9NeGM3aUpsOGZoa1dqOVU2TFVpcWk3aHVxYnJWMmtnNTdZTkhGWEZM?=
 =?utf-8?B?L0xyV3FLUS9wVGs5ZklNNGFwK3JWaGZ0M3F6MkxmU1lZd3c3ZXJVSU82V0M2?=
 =?utf-8?B?cnpXM254SmM1eFlmWXZRSnk0VXhLQ0JmUEdiUzkyM2xSZW9GN0NiTlBCeXFh?=
 =?utf-8?B?YURIUGVLUWJBZ3EzMmk2cjBzb3crYWIrVDlLdlNmeFZzbGd5czJ1OHhCM3Jp?=
 =?utf-8?B?dmh2c1JGYzUyYWI2WXBjZG5EK0JyVmU5UWNLQWtaSXBhcFpVWkpqR0pmR0gz?=
 =?utf-8?B?OWJMb3BOSFU1UmlaUXhOcktFNHYrY0FsRExGS3FteWpxTzFaU3hJcmRJWi9C?=
 =?utf-8?B?ZWZIaU5qVUpJbXJLVGpuY3BvNHdmK1N0RWJPaVo2ZWVoRjlGSi9uZ3R0SFI5?=
 =?utf-8?B?ZkE3M2tSNjhSMDdkY3ZVRnNab3plck8rcnJTRTdJN1RRQVg3WEo2bkxrdnlr?=
 =?utf-8?B?bG96bThvcXpwMlRHakhFa20vV2pEcGJodjVSNUs1eDhrZ0kwUTlDMUhQVEkv?=
 =?utf-8?B?Q3BUVWxJQS9BWCtud3ExMUp0cnNJQ0FHblczU2NvWTNib3h6S29MUDh1STYv?=
 =?utf-8?Q?+G3axUsoKNR//Zz8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AToDVkMTWJJgNRwg6bCB9fHRQq4rtwg9yqXNpwh74HvaoiogmkcMCsBa1jgU4oMB9wmUdrtW8zXUMFc0LlMoq8oY9HHaLbXdsJImZs8LF9dMutzUm7DnHQq/fk3M1u/BqRZQUAwS4I3Y0dQYKEWWeSUz0cKSbPHIevMSMrwlmXsX1Ijh/jBZLIVxEUsOP1k7I37CN9W/y2qnSzsWSOpGyHif8rEmG0+rLg+qQOCYY5TihpuGsbvEtdAAetrKiw8JgGIOSW0VnK4ROPo+psPw/gP4ZWThCjtpzhM0x2u8a86ULK9xNAXNYVywrt/1sW+4pBkYckJR6JmIJWj58uuaBg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1963da90-1c86-41a4-f064-08de80f062fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 11:05:07.4213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oXztEwB1yQvWVGS/jVPQU3ouoyinPYBmEeDNnlFouR5C8Hr09tvP/EgTvJC3Pylyr+tAld1RxjNGxz11EH0LX+ozaCuR+gFCUSUmdo28r1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6442
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIDxtY2hlaGFiK2h1YXdlaUBrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIE1hcmNo
IDEzLCAyMDI2IDk6MzQgQU0NCj4gVG86IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+
OyBMaW51eCBEb2MgTWFpbGluZyBMaXN0IDxsaW51eC0NCj4gZG9jQHZnZXIua2VybmVsLm9yZz4N
Cj4gQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitodWF3ZWlAa2VybmVsLm9yZz47
IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBMb2t0aW9ub3YsIEFsZWtzYW5kcg0K
PiA8YWxla3NhbmRyLmxva3Rpb25vdkBpbnRlbC5jb20+OyBNYXVybyBDYXJ2YWxobyBDaGVoYWIN
Cj4gPG1jaGVoYWJAa2VybmVsLm9yZz47IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQu
b3JnPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMzAvMjhdIGRvY3M6IGtkb2NfcGFyc2VyOiBhdm9p
ZCB0b2tlbml6aW5nIHN0cnVjdHMNCj4gZXZlcnl0aW1lDQo+IA0KPiBNb3N0IG9mIHRoZSBydWxl
cyBpbnNpZGUgQ1RyYW5zZm9ybXMgYXJlIG9mIHRoZSB0eXBlIENNYXRjaC4NCj4gDQo+IERvbid0
IHJlLXBhcnNlIHRoZSBzb3VyY2UgY29kZSBldmVyeSB0aW1lLg0KPiANCj4gRG9pbmcgdGhpcyBk
b2Vzbid0IGNoYW5nZSB0aGUgb3V0cHV0LCBidXQgbWFrZXMga2RvYyBhbG1vc3QgYXMgZmFzdCBh
cw0KPiBiZWZvcmUgdGhlIHRva2VuaXplciBwYXRjaGVzOg0KPiANCj4gICAgICMgQmVmb3JlIHRv
a2VuaXplciBwYXRjaGVzDQo+ICAgICAkIHRpbWUgLi9zY3JpcHRzL2tlcm5lbC1kb2MgLiAtbWFu
ID5vcmlnaW5hbCAyPiYxDQo+IA0KPiAgICAgcmVhbCAgICAwbTQyLjkzM3MNCj4gICAgIHVzZXIg
ICAgMG0zNi41MjNzDQo+ICAgICBzeXMgICAgIDBtMS4xNDVzDQo+IA0KPiAgICAgIyBBZnRlciB0
b2tlbml6ZXIgcGF0Y2hlcw0KPiAgICAgJCB0aW1lIC4vc2NyaXB0cy9rZXJuZWwtZG9jIC4gLW1h
biA+YmVmb3JlIDI+JjENCj4gDQo+ICAgICByZWFsICAgIDFtMjkuODUzcw0KPiAgICAgdXNlciAg
ICAxbTIzLjk3NHMNCj4gICAgIHN5cyAgICAgMG0xLjIzN3MNCj4gDQo+ICAgICAjIEFmdGVyIHRo
aXMgcGF0Y2gNCj4gICAgICQgdGltZSAuL3NjcmlwdHMva2VybmVsLWRvYyAuIC1tYW4gPmFmdGVy
IDI+JjENCj4gDQo+ICAgICByZWFsICAgIDBtNDguNTc5cw0KPiAgICAgdXNlciAgICAwbTQ1Ljkz
OHMNCj4gICAgIHN5cyAgICAgMG0wLjk4OHMNCj4gDQo+ICAgICAkIGRpZmYgLXMgYmVmb3JlIGFm
dGVyDQo+ICAgICBGaWxlcyBiZWZvcmUgYW5kIGFmdGVyIGFyZSBpZGVudGljYWwNCj4gDQo+IE1h
bnVhbGx5IGNoZWNrZWQgdGhlIGRpZmZlcmVuY2VzIGJldHdlZW4gb3JpZ2luYWwgYW5kIGFmdGVy
DQo+IHdpdGg6DQo+IA0KPiAgICAgJCBkaWZmIC1VMCAtcHJCdyBvcmlnaW5hbCBhZnRlcnxncmVw
IC12IFdhcm5pbmd8Z3JlcCAtdiAiQEAifGxlc3MNCj4gDQo+IFRoZXkncmUgZHVlOg0KPiAgIC0g
d2hpdGVzcGFjZSBmaXhlczsNCj4gICAtIHN0cnVjdF9ncm91cCBhcmUgbm93IGJldHRlciBoYW5k
bGVkOw0KPiAgIC0gc2V2ZXJhbCBiYWRseS1nZW5lcmF0ZWQgbWFuIHBhZ2VzIGZyb20gYnJva2Vu
IGlubGluZSBrZXJuZWwtZG9jDQo+ICAgICBtYXJrdXBzIGFyZSBub3cgZml4ZWQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIraHVhd2VpQGtlcm5l
bC5vcmc+DQo+IC0tLQ0KPiAgdG9vbHMvbGliL3B5dGhvbi9rZG9jL2tkb2NfcGFyc2VyLnB5ICB8
ICAxIC0NCj4gdG9vbHMvbGliL3B5dGhvbi9rZG9jL3hmb3Jtc19saXN0cy5weSB8IDMwICsrKysr
KysrKysrKysrKysrKysrKy0tLS0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYi9weXRob24v
a2RvYy9rZG9jX3BhcnNlci5weQ0KPiBiL3Rvb2xzL2xpYi9weXRob24va2RvYy9rZG9jX3BhcnNl
ci5weQ0KPiBpbmRleCBlZDM3OGVkYjFlMDUuLjNiOTk3NDBlYmVkMyAxMDA2NDQNCj4gLS0tIGEv
dG9vbHMvbGliL3B5dGhvbi9rZG9jL2tkb2NfcGFyc2VyLnB5DQo+ICsrKyBiL3Rvb2xzL2xpYi9w
eXRob24va2RvYy9rZG9jX3BhcnNlci5weQ0KPiBAQCAtNzM4LDcgKzczOCw2IEBAIGNsYXNzIEtl
cm5lbERvYzoNCj4gICAgICAgICAgIw0KPiAgICAgICAgICAjIEdvIHRocm91Z2ggdGhlIGxpc3Qg
b2YgbWVtYmVycyBhcHBseWluZyBhbGwgb2Ygb3VyDQo+IHRyYW5zZm9ybWF0aW9ucy4NCj4gICAg
ICAgICAgIw0KPiAtICAgICAgICBtZW1iZXJzID0gdHJpbV9wcml2YXRlX21lbWJlcnMobWVtYmVy
cykNCj4gICAgICAgICAgbWVtYmVycyA9IHNlbGYueGZvcm1zLmFwcGx5KCJzdHJ1Y3QiLCBtZW1i
ZXJzKQ0KPiANCj4gICAgICAgICAgIw0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGliL3B5dGhvbi9r
ZG9jL3hmb3Jtc19saXN0cy5weQ0KPiBiL3Rvb2xzL2xpYi9weXRob24va2RvYy94Zm9ybXNfbGlz
dHMucHkNCj4gaW5kZXggYzNjNTMyYzQ1Y2RjLi5mNmVhOWVmYjExYWUgMTAwNjQ0DQo+IC0tLSBh
L3Rvb2xzL2xpYi9weXRob24va2RvYy94Zm9ybXNfbGlzdHMucHkNCj4gKysrIGIvdG9vbHMvbGli
L3B5dGhvbi9rZG9jL3hmb3Jtc19saXN0cy5weQ0KPiBAQCAtNSw3ICs1LDcgQEANCj4gIGltcG9y
dCByZQ0KPiANCj4gIGZyb20ga2RvYy5rZG9jX3JlIGltcG9ydCBLZXJuUmUNCj4gLWZyb20ga2Rv
Yy5jX2xleCBpbXBvcnQgQ01hdGNoDQo+ICtmcm9tIGtkb2MuY19sZXggaW1wb3J0IENNYXRjaCwg
Q1Rva2VuaXplcg0KPiANCj4gIHN0cnVjdF9hcmdzX3BhdHRlcm4gPSByIihbXiwpXSspIg0KPiAN
Cj4gQEAgLTE3LDYgKzE3LDEyIEBAIGNsYXNzIENUcmFuc2Zvcm1zOg0KPiAgICAgIGludG8gc29t
ZXRoaW5nIHdlIGNhbiBwYXJzZSBhbmQgZ2VuZXJhdGUga2RvYyBmb3IuDQo+ICAgICAgIiIiDQo+
IA0KPiArICAgICMNCj4gKyAgICAjIE5PVEU6DQo+ICsgICAgIyAgICAgIER1ZSB0byBwZXJmb3Jt
YW5jZSByZWFzb25zLCBwbGFjZSBDTWF0Y2ggcnVsZXMgYmVmb3JlDQo+IEtlcm5SZSwNCj4gKyAg
ICAjICAgICAgYXMgdGhpcyBhdm9pZHMgcnVubmluZyB0aGUgQyBwYXJzZXIgZXZlcnkgdGltZS4N
Cj4gKyAgICAjDQo+ICsNCj4gICAgICAjOiBUcmFuc2Zvcm1zIGZvciBzdHJ1Y3RzIGFuZCB1bmlv
bnMuDQo+ICAgICAgc3RydWN0X3hmb3JtcyA9IFsNCj4gICAgICAgICAgKENNYXRjaCgiX19hdHRy
aWJ1dGVfXyIpLCAiIiksDQo+IEBAIC0xMjMsMTMgKzEyOSwyNSBAQCBjbGFzcyBDVHJhbnNmb3Jt
czoNCj4gICAgICAgICAgInZhciI6IHZhcl94Zm9ybXMsDQo+ICAgICAgfQ0KPiANCj4gLSAgICBk
ZWYgYXBwbHkoc2VsZiwgeGZvcm1zX3R5cGUsIHRleHQpOg0KPiArICAgIGRlZiBhcHBseShzZWxm
LCB4Zm9ybXNfdHlwZSwgc291cmNlKToNCj4gICAgICAgICAgIiIiDQo+IC0gICAgICAgIEFwcGx5
IGEgc2V0IG9mIHRyYW5zZm9ybXMgdG8gYSBibG9jayBvZiB0ZXh0Lg0KPiArICAgICAgICBBcHBs
eSBhIHNldCBvZiB0cmFuc2Zvcm1zIHRvIGEgYmxvY2sgb2Ygc291cmNlLg0KPiArDQo+ICsgICAg
ICAgIEFzIHRva2VuaXplciBpcyB1c2VkIGhlcmUsIHRoaXMgZnVuY3Rpb24gYWxzbyByZW1vdmUg
Y29tbWVudHMNCj4gKyAgICAgICAgYXQgdGhlIGVuZC4NCj4gICAgICAgICAgIiIiDQo+ICAgICAg
ICAgIGlmIHhmb3Jtc190eXBlIG5vdCBpbiBzZWxmLnhmb3JtczoNCj4gLSAgICAgICAgICAgIHJl
dHVybiB0ZXh0DQo+ICsgICAgICAgICAgICByZXR1cm4gc291cmNlDQo+ICsNCj4gKyAgICAgICAg
aWYgaXNpbnN0YW5jZShzb3VyY2UsIHN0cik6DQo+ICsgICAgICAgICAgICBzb3VyY2UgPSBDVG9r
ZW5pemVyKHNvdXJjZSkNCj4gDQo+ICAgICAgICAgIGZvciBzZWFyY2gsIHN1YnN0IGluIHNlbGYu
eGZvcm1zW3hmb3Jtc190eXBlXToNCj4gLSAgICAgICAgICAgIHRleHQgPSBzZWFyY2guc3ViKHN1
YnN0LCB0ZXh0KQ0KPiAtICAgICAgICByZXR1cm4gdGV4dA0KPiArICAgICAgICAgICAgIw0KPiAr
ICAgICAgICAgICAgIyBLZXJuUmUgb25seSBhY2NlcHQgc3RyaW5ncy4NCj4gKyAgICAgICAgICAg
ICMNCj4gKyAgICAgICAgICAgIGlmIGlzaW5zdGFuY2Uoc2VhcmNoLCBLZXJuUmUpOg0KPiArICAg
ICAgICAgICAgICAgIHNvdXJjZSA9IHN0cihzb3VyY2UpDQo+ICsNCj4gKyAgICAgICAgICAgIHNv
dXJjZSA9IHNlYXJjaC5zdWIoc3Vic3QsIHNvdXJjZSkNCj4gKyAgICAgICAgcmV0dXJuIHN0cihz
b3VyY2UpDQo+IC0tDQo+IDIuNTMuMA0KDQpSZXZpZXdlZC1ieTogQWxla3NhbmRyIExva3Rpb25v
diA8YWxla3NhbmRyLmxva3Rpb25vdkBpbnRlbC5jb20+DQo=
