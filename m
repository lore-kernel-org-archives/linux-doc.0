Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3900E443A8E;
	Wed, 15 Jul 2026 11:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784114326; cv=fail; b=ijQDRMLZBGg+vqFE+S86Gihu8GlvOOpCWpAO7RSe4fZmC+6Oo7v7SRIu3n+0R16+bAkBh4UZAsKvZ4zd0OW1Yy6H//Fexpx0ZX8Gn86Uvpr9RJ/YxE50zZwAqYsa47dVpUYr6txvCx65NMD/8FI1yrc8AbTfo7pQGU81mlasSpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784114326; c=relaxed/simple;
	bh=y6mx1LlW2qb9wOPq56KmBkTkpXp/lHXQwtuCd4MwxhU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ohug7vJamMr3n2zXawipv9pnb8YdW5iYYZsyfMOUe5UhZs20uMVy4K/8L4hqmLeInlUFo9l6xRPazuu5Iv9TdAQtzJPAdOS2sOKWrDfTc08XakKWqJPRdXRzfdhZ7Cy4QOWtqpHnS1UWPXkQwUs854V1XFdIefu3/+mjVx1lFSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQUeDNO6; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQUeDNO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784114324; x=1815650324;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=y6mx1LlW2qb9wOPq56KmBkTkpXp/lHXQwtuCd4MwxhU=;
  b=QQUeDNO6rUpnq7G6QiWrVCdJea0nmu+jUVVf+c1YlCs/+EYX4cEq449c
   bV1ueyliDsWDwcSZxwdiCdi0yAsbg201EduvlPlaHlkAbFtSuJ2wSmNx1
   9r8yxDtG0nSYQRvcUi3JIQbIKudo7O7GsxMRmiyFhlyu3DFLTntu1dj1M
   OCrbuUOGiulOPoKeCwt3Vfz3/KkTf2HsLKXe3bV5cyVcjCClfVAZqORMe
   WddNtQKloodZYeZp4Td5+QuDTti4SYDyN2bPyp+PhJCNwDFogA+MB1vIG
   I0xKCZQ8AZxmLv5yeGia3Htn6NJlmQVvq/oxc1DIpvTj3vXSd8nayy8pO
   Q==;
X-CSE-ConnectionGUID: ucLnxfTNS4+grwJuNfUNbg==
X-CSE-MsgGUID: 2hzdmRJrQZeqXXS3j2SMQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95350274"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="95350274"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 04:18:43 -0700
X-CSE-ConnectionGUID: 1ORRsANpSCyg6ia6oqU7dQ==
X-CSE-MsgGUID: Jw4FEJ3oT2Wb4yEig/wj8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="251743543"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 04:18:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 04:18:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 04:18:41 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 04:18:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bagfGBiH0Wg9VrTlTTa7Hda1noLDa4gzMa6myBgsoZi066mdJTu58A1z8rUmNj9eD0VIoyax5Umbn+KGkVyc15OCdT4OIqPa8/g9bEoCUxdWf46v/tV5tn5gxiCel4M+WTMHRLcf6zirbM4ZmjgNraCf/+IiTmPHfj+TRIi4kPraEOK6soAAPA/wX6Ip4xJhulCTRKU2ZMwRiIexrBRMA0jkk4AQd88QPkBOxFrQVp2VK8HvRVSYxCL43ZpFbN7edAXOPom1e2QQ5sbQc114kYPezaqwLMJNdo4mQK8GldzqfDeYQwDKCk/ujqT9EvJkctyCjL7ZDnnkDhinEhBWDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6mx1LlW2qb9wOPq56KmBkTkpXp/lHXQwtuCd4MwxhU=;
 b=QyeVFE3pGRFX079V9HjcSaopbdsIFZJGS9j3TMS/AOzg/H5/OotL46bYq3diQmfNvFLQGzse4lTl5rr8qsNhnKkkNuTQqiGSKjwPtbs3nfK7U8g7nYm+vAuQOiyoe+g7hhNxjaru+xyQFTFePCWm+WXPLL3fuk/p/4QorSuWD0D2q84sTUhrDQdNxEpg2d1eqKA2/pRqg8Tkg7QKEz3tmDVlyZruOUFrFlBtT3qfQyycEvbXvAjOBU/sWzBEYJWGahveHVAnTblXtAtldWpEORON0CiTfSQHivrSerzYPQzLzLefwCKPKqeYUB+oMTX/skgxtQNnHsq0T0u5aYrR1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by SA0PR11MB4608.namprd11.prod.outlook.com (2603:10b6:806:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 11:18:36 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%5]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 11:18:35 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "jani.nikula@linux.intel.com"
	<jani.nikula@linux.intel.com>
Subject: Re: [PATCH] scripts/kernel-doc: Suggest possible names for excess
 descriptions
Thread-Topic: [PATCH] scripts/kernel-doc: Suggest possible names for excess
 descriptions
Thread-Index: AQHdE9oCuF+WY4cC5E+1bbvL8qTBCbZub6QA
Date: Wed, 15 Jul 2026 11:18:35 +0000
Message-ID: <2cd1d670895c0c8242e7cea36ab7e1a5b8a12d3e.camel@intel.com>
References: <20260714111208.323108-1-ryszard.knop@intel.com>
	 <12d74842-c826-46ec-922a-68f5e4042cb6@infradead.org>
In-Reply-To: <12d74842-c826-46ec-922a-68f5e4042cb6@infradead.org>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|SA0PR11MB4608:EE_
x-ms-office365-filtering-correlation-id: 62336dc6-7797-43ce-22dd-08dee262cfd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|38070700021|56012099006|11063799006|4143699003|10067099003|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info: /aBztZ/9h3vpl5M2T4ovHM6uAa0SAE2ykMpPJ5VOD1s1ClDuZNY7oleztku/5ipjrYvgfRSWXhaQxZ3Poo2L9Ba3AifhpKW22knwYinNftE9bc3wI3xUyxHxNwtM1cXvUHDuiOgRyh1pSSP2fjYE9LgvzerfWR7r8BHOg2wL8A+pMXRH8dHCKXbEGuOv0YDMuPKe/MnCVcFqJ2rRMbgUbK/aluW4XFcsq8opb/7CBJRuqvL/RCKFMCY8ry0ayADOLytMeWoTuz77KdKpyB4BsQEbcUrvQsfvkJn2+R9RIGG/gbOtZgFyvOnIaYnG5CeO6RV+29IlPRYsAY9oGZusZscNum5nDPLUk1N+LDqRgRr9iMFXXpuxWBqkcZfTo6jyeWs5gtZmODzchLFLO3GhEFC9fJk3nyM1LzWcoExCrZJdGKU6ruDRlJv83pWqcNpPPYHIhzyF+BL98rKC6O6efXt6qQmBoNDDb/KpjbZIEdFZKcOs1LEWcrYhCNr7tPkkzuEuCaWs17gdZUn+Jxo4yrx4v87HF60x09pAGqBAlRGrCYIRHaPd/ZdObpBunF/xSxVaSZg7tbw1M1uj3nsqLLriMdsdZXPmWi2+VRw+u5MiWo86ZJ1qEAW40FZeaZMZBbzjgAiATMjcpTCGvaLkQ8RYe9daOaCEz6rn1nrWB2sMpTkHcVyLzQWR2NAF+8Q7aVt5qzJRuwG8TpQqVlvH0BOsToWCN9JU3CA6ph/Xje4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5663.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bS9oVVk2MGRkZ3NLeW1yOXhZWnQySWx4YUxsVW5wR2lJTFExUU9UL1NiNnRP?=
 =?utf-8?B?dFlJdlJjQmdzSm94STdGUTREOWQxWTBhMjVuQ2dIdlgwYkxQcGRuVEFoY1hw?=
 =?utf-8?B?VHd0Q3VpRFgvdWhtQURyMlVIWlRuaW9VTlNINGp0dVdGd296dk45aWlVd2p3?=
 =?utf-8?B?ajJXbjYxTFUzVDcvaWhDbjZmUjhvUGl5RjkreWo3T3VzWWVPczFIeG9yS2Zi?=
 =?utf-8?B?MjZMb0ZxRzkvbWk4SVdwNkRqQjlpMGJRVkFlT0doRjNSR3gwb2prVFRYRWRo?=
 =?utf-8?B?NXZaZ0U0UXpkeTAxYmRGaWtyVGJsOU9QaXY1ZTVPVHlSRkczSFdHTktBRExR?=
 =?utf-8?B?Uy94SGNHMnRub3hkckxmNlVpUjcrQ3Z0ZThIS0dmb2lOK1A1UG5LLzRJTzVB?=
 =?utf-8?B?K3lWblJxU0pKeXVZYkJOR3Z2MmZpcUZrTkMvL3h3YnpGWnRWc0tOUGxIRHVN?=
 =?utf-8?B?K2h1VFhKY1dzbXQzeTJTZkNrTWZQRlA2MEJBbGh2a1lldFJLb2dBY0JvTkhL?=
 =?utf-8?B?MWtLRzlIMmFsNWtMWDFNVDZpOGFXUDJSbFBUdGJaZUM4Zm53VVZ1TVk3WFR1?=
 =?utf-8?B?elVQUkZDWWlkWnhhRnN1MFV0TDdQRktocW1YYno4OU9iaWlBRVZXTWk2cEVM?=
 =?utf-8?B?akFPRlNXZ1VYN1ozcG5md2R4ejhtajRLWXA3MlBnN3pLeHFSanlSdWI4YzYx?=
 =?utf-8?B?bSsrY3FPU2VJNDN0bFlhRW5nS0FDM2t5RWNHWEVvSU1HSGVzcUtyZmczNHI3?=
 =?utf-8?B?WWtsOUhuSWtMOXplN0ZKbURGemprdlVLRXZNZHJSTTJRczJ2Q3VKblJhRnpK?=
 =?utf-8?B?THpvenBIcGlFTktJSFpJVHI5SGlOVk9jUmw4TWI1czA5ODdVUnRKYU1WUndI?=
 =?utf-8?B?OUk0U0krZktQaTE2VDArdGcxSXVwUkcyT1JPOTd5NmZ3QnVrYnhTMVAxN3o2?=
 =?utf-8?B?ZWFmVU4zQXNzbWROTWI5SzFZYXVjWnRPaFhGT0VRcFY0ek90MnBzRUxmVHpk?=
 =?utf-8?B?ZVA2Z0I4ZEZMb1p6KzFsa0U1Skx3MVd1aTRBYnE0YWk3NytIOXFFckJLMHRB?=
 =?utf-8?B?MkpIOUFQWTl3QlJqdnlZYzNXK0pKZU45NDhsd3RVR2hreWNodVBCM0c2QWc1?=
 =?utf-8?B?TE9vSzRFc0s0MXNxNEUrb29rZE9XeFFiYVVJaXI0UGp5SUxGMEx2Sks1ZzR2?=
 =?utf-8?B?WVhaN3h3VXZtNHBmQm12b2VSTGZCMnVwdXpZRDdkODE2YjdyS1IwdzluOGVK?=
 =?utf-8?B?WFlLajlzNThOUkxkbmltK2ZzVUxWc1pSSHZZcGgvV1B6eld5R3J1SlNTTldz?=
 =?utf-8?B?TEN3NmFxOHltVUxpQXIyWktkQzYzMUdRaU1QeC9JanZ0c3ZuSEZlWVU0YWJL?=
 =?utf-8?B?YWtVQUNSbUhjNENPU08yb0NPMmFGK0FKbEIvajF5em5LczhQZlBxMG5jNTVy?=
 =?utf-8?B?aFl2cENpRDZ3cE43Z1pSN2dUcjdDRTFNQ3BqNWcySkJ4Ym05dHAreU5jY2NW?=
 =?utf-8?B?c3pjTzNOSyttNDFJUlF4UjVxa3d6UXJVWm9XeUQyVjc0dThBYnJyVnZiVXpa?=
 =?utf-8?B?Z1ZNMmkydGdkOVhmUVdMUDZOMmtWblpVNXY1S2h0VnVlZVREaGVvUWxBR2E5?=
 =?utf-8?B?ZC8reWh3VTZNUzE4aitvbWxCNE9ScnYySVRnQzBKV29Od3RzdFlGQWdxdDNr?=
 =?utf-8?B?WDdlWm1zaVY5cE5MTi9FZStkVFdxeXNacHBFMDV1eVpacXZjR1FUeGRnQVNJ?=
 =?utf-8?B?eFBDNGh1a3hxTVY0bCtFMEgyOWY2SzFGU0VnQ082WnQzaWI5ekxVVGVqbWd4?=
 =?utf-8?B?SkJ2RlVCRWZyV1paMzIrRkE1Qkk2WTlTQUtzSG5tVFhVWkNoZzd5NnpkdUY0?=
 =?utf-8?B?Rko2N2dQMlVWemFFVC8xS2krQ0dGQnU2YXdBOU5XcElyMEp5RFZweTJvbytQ?=
 =?utf-8?B?Zm9DVitOZUNyUXh0RXIxMlJOUk52MkNpSzVpekJaUUlJQnFmTU1nVTVhWjE3?=
 =?utf-8?B?dzk4R1BKdlluN0x5bkx6ZVYyWTA5cDVERThaempOZzZORTdMa1Q3aUYxbEFQ?=
 =?utf-8?B?MUdMd21ubTBOMFVEUjdqNUxtM3RiTHREc01JdDZCU1loWFVFOUN5dXBuU0ZU?=
 =?utf-8?B?eXFTVWtUUzRmclZWRkpjOFdER0hlVHROSzdHVGJ1dFE1ZkF1TndsZkgwNWlS?=
 =?utf-8?B?NnZEVzgzNlp0Y3RiSjVWZHd4aUZ0RWlVRnl5aEJCRXgvUitVYjRORWdTcVg5?=
 =?utf-8?B?cmZwK2owbXNKOU43V0ZacFZuVjZ6UmtPOENCakpXOVlYUVNRODd2TUtFSWZ6?=
 =?utf-8?B?alV2UzkyUjBPYmRnbTVJMlhDUGtnTDVubHBQa0dVRXluYStiOEI4L0N1RU5R?=
 =?utf-8?Q?2Nzz0SayjZt5gT9E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77B28DEC310F7649A7862F9E09AFCB35@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: k1qFkJ8h9ngnwpB9ckBXAPOsOGpA5LzI4U82EcynkwfIf5JttOvZkezaWeCZZEWamFDTkTweafujJW4iEBtVLLIJMSnf0jeWaFmYxpS12m2NEbsQaOFaRy3l0vASs3KhTt+/RNlofWqGPOUN8euwmpoX+nB1BLVApbJzWYP3rkyLwA+O6vczVGKbjLTGUayW5omN0/AaElBg8lXojkQxaDAQ0u72Ieoo9ArdVZEKGDq/6KZdLE4dtKFkCfC8XxHvCpvWhKjEmmOqtJRlaE1FsP/nDysd5lj33k3pmggeOlVdTGjqlWHE74cUfOUGAxWqcFNCntWwc/CJAyezDFcG1g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62336dc6-7797-43ce-22dd-08dee262cfd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2026 11:18:35.4523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e9o7DpGGDHq85PeoEOyf8DvmmCYinEybcoxBB/JZ6WlUZylSZPL0adR8XQCF0CT/tWwyQ8gdGymqCEqWrn6KFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4608
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTA3LTE0IGF0IDE0OjQ0IC0wNzAwLCBSYW5keSBEdW5sYXAgd3JvdGU6DQo+
IEhpLA0KPiANCj4gDQo+IE9uIDcvMTQvMjYgNDoxMiBBTSwgUnlzemFyZCBLbm9wIHdyb3RlOg0K
PiA+IFNpbmNlIGNoZWNrX3NlY3Rpb25zKCkgbm93IHdhcm5zIGlmIGEgZG9jdW1lbnRhdGlvbiB0
YWcgbWVtYmVyIG5hbWUgaXMNCj4gPiB0aGUgc2FtZSBhcyBkZWZpbmVkIGluIHRoZSBzdHJ1Y3Qs
IHdlIGNhbiBzdWdnZXN0IG5hbWVzIHRoZSBjaGVja2VyDQo+ID4ga25vd3MsIHNvIHRoYXQgaXQn
cyBtb3JlIG9idmlvdXMgaG93IHRvIGRlYWwgd2l0aCB0aGUgd2FybmluZy4NCj4gPiANCj4gDQo+
IFNlZW1zIHRvIHdvcmsgZm9yIG1lLg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBSeXN6YXJkIEtu
b3AgPHJ5c3phcmQua25vcEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIHRvb2xzL2xpYi9weXRo
b24va2RvYy9rZG9jX3BhcnNlci5weSB8IDEzICsrKysrKysrKysrLS0NCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYi9weXRob24va2RvYy9rZG9jX3BhcnNlci5weSBiL3Rvb2xzL2xpYi9w
eXRob24va2RvYy9rZG9jX3BhcnNlci5weQ0KPiA+IGluZGV4IDJkZWRkYTIxNWMyMi4uM2Y4ODA5
NWVhYjA2IDEwMDY0NA0KPiA+IC0tLSBhL3Rvb2xzL2xpYi9weXRob24va2RvYy9rZG9jX3BhcnNl
ci5weQ0KPiA+ICsrKyBiL3Rvb2xzL2xpYi9weXRob24va2RvYy9rZG9jX3BhcnNlci5weQ0KPiA+
IEBAIC01NTgsNiArNTU4LDEzIEBAIGNsYXNzIEtlcm5lbERvYzoNCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgc2VsZi5wdXNoX3BhcmFtZXRlcihsbiwgZGVjbF90eXBlLCBwYXJhbSwgZHR5
cGUsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXJn
LCBkZWNsYXJhdGlvbl9uYW1lKQ0KPiA+ICANCj4gPiArICAgIGRlZiBnZXRfc3VnZ2VzdGlvbnNf
aGludChzZWxmLCBkZWNsX25hbWUsIHBvc3NpYmxlX25hbWVzKToNCj4gPiArICAgICAgICBzdWdn
ZXN0aW9ucyA9IHNldChuYW1lIGZvciBuYW1lIGluIHBvc3NpYmxlX25hbWVzIGlmIGRlY2xfbmFt
ZSBpbiBuYW1lKQ0KPiA+ICsgICAgICAgIGlmIG5vdCBzdWdnZXN0aW9uczoNCj4gPiArICAgICAg
ICAgICAgcmV0dXJuICIiDQo+ID4gKw0KPiA+ICsgICAgICAgIHJldHVybiBmIihkaWQgeW91IG1l
YW4gb25lIG9mOiAneyInLCAnIi5qb2luKHN1Z2dlc3Rpb25zKX0nKSINCj4gPiArDQo+ID4gICAg
ICBkZWYgY2hlY2tfc2VjdGlvbnMoc2VsZiwgbG4sIGRlY2xfbmFtZSwgZGVjbF90eXBlKToNCj4g
PiAgICAgICAgICAiIiINCj4gPiAgICAgICAgICBDaGVjayBmb3IgZXJyb3JzIGluc2lkZSBzZWN0
aW9ucywgZW1pdHRpbmcgd2FybmluZ3MgaWYgbm90IGZvdW5kDQo+ID4gQEAgLTU2NiwxMiArNTcz
LDEzIEBAIGNsYXNzIEtlcm5lbERvYzoNCj4gPiAgICAgICAgICBmb3Igc2VjdGlvbiBpbiBzZWxm
LmVudHJ5LnNlY3Rpb25zOg0KPiA+ICAgICAgICAgICAgICBpZiBzZWN0aW9uIG5vdCBpbiBzZWxm
LmVudHJ5LnBhcmFtZXRlcmxpc3QgYW5kIFwNCj4gPiAgICAgICAgICAgICAgICAgbm90IGtub3du
X3NlY3Rpb25zLnNlYXJjaChzZWN0aW9uKToNCj4gPiArICAgICAgICAgICAgICAgIGhpbnQgPSBz
ZWxmLmdldF9zdWdnZXN0aW9uc19oaW50KHNlY3Rpb24sIHNlbGYuZW50cnkucGFyYW1ldGVybGlz
dCkNCj4gPiAgICAgICAgICAgICAgICAgIGlmIGRlY2xfdHlwZSA9PSAnZnVuY3Rpb24nOg0KPiA+
ICAgICAgICAgICAgICAgICAgICAgIGRuYW1lID0gZiJ7ZGVjbF90eXBlfSBwYXJhbWV0ZXIiDQo+
ID4gICAgICAgICAgICAgICAgICBlbHNlOg0KPiA+ICAgICAgICAgICAgICAgICAgICAgIGRuYW1l
ID0gZiJ7ZGVjbF90eXBlfSBtZW1iZXIiDQo+ID4gICAgICAgICAgICAgICAgICBzZWxmLmVtaXRf
bXNnKGxuLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmIkV4Y2VzcyB7ZG5h
bWV9ICd7c2VjdGlvbn0nIGRlc2NyaXB0aW9uIGluICd7ZGVjbF9uYW1lfSciKQ0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmIkV4Y2VzcyB7ZG5hbWV9ICd7c2VjdGlvbn0nIGRl
c2NyaXB0aW9uIGluICd7ZGVjbF9uYW1lfScge2hpbnR9IikNCj4gDQo+IFdoZW4gJ2hpbnQnIGlz
IGVtcHR5LCB0aGlzIHN0YXRlbWVudCBhbmQvb3IgdGhlIHNpbWlsYXIgb25lIGJlbG93DQo+IGFk
ZHMgYSB0cmFpbGluZyBzcGFjZSB0byBlYWNoIG9mIHRob3NlIGxpbmVzLg0KPiBDYW4geW91IHBy
ZXZlbnQgdGhhdD8gICh5ZWFoLCBpdCdzIGp1c3QgYSBuaXQpDQoNClN1cmUgdGhpbmcsIHN1Ym1p
dHRlZCBhIHYyLg0KDQo+IA0KPiA+ICANCj4gPiAgICAgICAgICAjDQo+ID4gICAgICAgICAgIyBD
aGVjayB0aGF0IGRvY3VtZW50ZWQgcGFyYW1ldGVyIG5hbWVzIChmcm9tIGRvYyBjb21tZW50cywg
aW5jbHVkaW5nDQo+ID4gQEAgLTU5MSwxMiArNTk5LDEzIEBAIGNsYXNzIEtlcm5lbERvYzoNCj4g
PiAgICAgICAgICAgICAgaWYgcGFyYW1fbmFtZSBpbiBzZWxmLmVudHJ5LnBhcmFtZXRlcmxpc3Q6
DQo+ID4gICAgICAgICAgICAgICAgICBjb250aW51ZQ0KPiA+ICANCj4gPiArICAgICAgICAgICAg
aGludCA9IHNlbGYuZ2V0X3N1Z2dlc3Rpb25zX2hpbnQocGFyYW1fbmFtZSwgc2VsZi5lbnRyeS5w
YXJhbWV0ZXJsaXN0KQ0KPiA+ICAgICAgICAgICAgICBpZiBkZWNsX3R5cGUgPT0gJ2Z1bmN0aW9u
JzoNCj4gPiAgICAgICAgICAgICAgICAgIGRuYW1lID0gZiJ7ZGVjbF90eXBlfSBwYXJhbWV0ZXIi
DQo+ID4gICAgICAgICAgICAgIGVsc2U6DQo+ID4gICAgICAgICAgICAgICAgICBkbmFtZSA9IGYi
e2RlY2xfdHlwZX0gbWVtYmVyIg0KPiA+ICAgICAgICAgICAgICBzZWxmLmVtaXRfbXNnKGxuLA0K
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIGYiRXhjZXNzIHtkbmFtZX0gJ3twYXJhbV9u
YW1lfScgZGVzY3JpcHRpb24gaW4gJ3tkZWNsX25hbWV9JyIpDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgZiJFeGNlc3Mge2RuYW1lfSAne3BhcmFtX25hbWV9JyBkZXNjcmlwdGlvbiBp
biAne2RlY2xfbmFtZX0nIHtoaW50fSIpDQo+ID4gIA0KPiA+ICAgICAgZGVmIGNoZWNrX3JldHVy
bl9zZWN0aW9uKHNlbGYsIGxuLCBkZWNsYXJhdGlvbl9uYW1lLCByZXR1cm5fdHlwZSk6DQo+ID4g
ICAgICAgICAgIiIiDQo+IA0KPiBBY2tlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJh
ZGVhZC5vcmc+DQo+IFRlc3RlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5v
cmc+DQo+IA0KPiB0aGFua3MuDQogICBBLiANClRoYW5rcywgUnlzemFyZA0K
