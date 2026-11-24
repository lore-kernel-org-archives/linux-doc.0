Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795546338;
	b=4Lr8BOFlgXeYoKi/5M18fmoMnLiEzRvbqp7bu51zg3takVxpEEksaVld+4DUVMIwou1w
	 b3M5aGqLd6pNcMxojZ2F2NjgGnpCFvK79rAtqt0DNqc6mBd6dcvpO5ErejtanuSPcWC32
	 xODC7GB+GAaAs04VAOkDX7pnFHRy6IwVl7OkTBXfB07cgfe78wEtbFkHfU2jgd1PZwqkY
	 ObsFimduK09/24t1XBwYZ96NLiHgYs6hfHovkC6sg2BX8sJR6/U53FZs0cFbY0MTtW63C
	 Rex8iuGoDbw5L7N4rFpG8o5uq2zDY1IXn/hAQk2XCHi4lferAR6G0zn/CuAtlrwfh5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546338;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=Vqh3xpyKeJeBls6s/kI3oP0HTW1ahAXRorRdea6j4Vw=;
	b=tuf/p+bV7+x+Mwvt9qmH8oW2UsovHBZ1wZqDLfBJW99Lw1ZR/w7BGcVIomy8HG+B/kro
	 TtfS5cGa1W2jYua6t1uuZN1R23J9/XL+Z7jGKDqlEFAMxDaK78qaI+3O5iXVFhJlB+zfX
	 TV1RqUc2PbUKzHoXIlAch89JB5KfblGk2eGeylGZGyGqi4OVHjQr+osvkmEXHZLnGN2a5
	 aTOHJtqqkDmBXIsA5JpggASp06WZ2G8ShUSDe2zX7yShut2/+cSaVzpbzPBADKsAqZgwe
	 69/rlTDKkhybcYeOIuK5gY1RmtOXBX/4QFQQCafZF5+d5txUywqqYup2yZhVKY8GJ3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="YnCiIR8/";
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=apD8x6Qg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDF9606A331;
	Tue, 24 Nov 2026 18:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BDF9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YnCiIR8/;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=apD8x6Qg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795546338; x=1827082338;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=I5MMF/O8IOPDcqiIvJMY3asHuctA8EVhYY2d0skUhfU=;
  b=YnCiIR8/lcFMstBup14ePgragOAdkRQZdh9su3Bkc8h1VjqNKq2zO5qn
   tiZCqCuuHSviCpZlpAiuzeFbDXvzv5QHTvF2Kg32C5YecK8GMJcOys5J3
   Esoo35X/0kjRTpMO/CHDc3FA9wEwUoodVuZGGZ4CX13mhD1wVeN+j++jv
   dV0YIbCulEK1W40CIlmjtqoBkFP4J4BfeF45MO57YB/2AAc5T+qlDpLdu
   I1YPSHpYMeBxCbQRJzP/CwHHe1tR9nhgLS64Yf6dq+MI/jFaA8t/OB3eR
   nvSYPXtZgcJ7xeTgAeNF3PKrKBLuJ/Gvwj3Vu2vkWmbkig7F91e/JmERJ
   g==;
X-CSE-ConnectionGUID: ZM8/3ngBRsGvswGU9vQ3QA==
X-CSE-MsgGUID: XbAiwrydRVikQ8LAEfX+7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4419494"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4419494"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 10:31:54 -0800
X-CSE-ConnectionGUID: 7xxF86vKTkin2rpLEWDNVg==
X-CSE-MsgGUID: Vupg9wYSRAOUYXQvggxh/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11977012"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 10:04:08 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 10:04:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 10:04:07 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 10:04:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ag/6n8wyhZlSSS6d/x5jinL9iN1Yvda4Yk+BxKahR7dWwDpwEhc4oBtQiW0sc1eki/bPGGqlhEH31ytmSV9PswEGq48b9hPe/mD0n/Pmuq3WwK4bFjrKnLQltSvXXWw0Y6X25kx0/4OceT+TEnYeQtbpMreWENHe6b2kEZnEvKDIDctvMs6LCxn6rnyCSYUsY4CSwK0M/Pvoi+TAYxr3kvF67p8d3cbzSYuoxKdx+Hma02wEG5MjhrSQfDAJ3Kvw3ZNztEndX14SHxgGD5UI6iSiuxNe8BSMezU3Brqn9oLdfzdgI32nZYq2pGV0VFPghBYIsz7SxAODrZ4OOhp72w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vqh3xpyKeJeBls6s/kI3oP0HTW1ahAXRorRdea6j4Vw=;
 b=XYO2b434XG/hSfbdO5NQ6QK6e8kGm1RzT2JwHcNAhF8pG4lvAd3Nf6Pt1JnNhrKVFnz6VetoMsLWKj1yhqJSeCGZbZdBIauJf6jlQKSDa4t12+vcnCfjDwjghJ62p3jPam6YcZ+mNoYSRiZT/iMIkdToEEzWUdky3CWtgYpiBt8+TGjaJKkiqoJoah/6rVHUOC/9yF8wX6Lsgg+RgsBLsU3Fgo0lBVVxKdCczrlcaI46538w2I/Ak43tEzkkNo6u4SUrtVvmkc1V93eCgN1jH1rVEF3FjrHwGLXea5PlBmQEqXexifLFSjzoxTj6OfLFJRiwA5lkHO9CN7Hm9PSsYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vqh3xpyKeJeBls6s/kI3oP0HTW1ahAXRorRdea6j4Vw=;
 b=apD8x6QgFb76Dusy+DRmTxTKXU1zff94dhXTEhw2qwhocQkLjHA9FnUM8i+f+LIBz4L6OpDme1M2cVMFyDgSVHBW2w84h2jMLGkIxwOriIXPsANlh8c91SXTQKdUR85UZOZXQWBR8cOFqPZblMQWOzwoDGp4DMaBdAMmr4DjcpI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MW4PR11MB7126.namprd11.prod.outlook.com (2603:10b6:303:222::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 18:04:03 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0615.009; Tue, 24 Nov 2026
 18:04:03 +0000
Message-ID: <4712b9de-811f-44f8-8ee4-54cd0df8892c@intel.com>
Date: Tue, 24 Nov 2026 10:03:59 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] fs/resctrl: Release the limbo RMIDs when the CDP
 state changes
To: Ben Horgan <ben.horgan@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
	<tony.luck@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <bp@alien8.de>, <tan.shaopeng@fujitsu.com>,
	<gshan@redhat.com>, <jic23@kernel.org>, <fenghuay@nvidia.com>,
	<zengheng4@huawei.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
References: <20261119094858.813874-1-ruanjinjie@huawei.com>
 <20261119094858.813874-6-ruanjinjie@huawei.com>
 <6dd79d09-576b-4086-ba5c-7f8663292a6e@arm.com>
 <390433eb-30d8-442a-8d7e-30f15bbe8f9d@huawei.com>
 <03bd150c-f44a-4ae6-b544-3f819e4bb7f2@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <03bd150c-f44a-4ae6-b544-3f819e4bb7f2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0375.namprd04.prod.outlook.com
 (2603:10b6:303:81::20) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|MW4PR11MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: ed52d7a0-9f26-40cc-00fe-08df4a5552e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|921020|261022105027099003|10067099003|261026140227099003|5023799004|11063799006|4143699003|56012099006|261026121527099003|261009223027099003|261021123027099003|261021121427099003|261022075727099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 36mrxOsqlMfbW/gmTjlSPCiHlXo0Iv6j9voX29Oc/9Mc0f+bI0bBw0e3jesg7Y/irR5dk/qIA5hWgau32ROeMaOGkCGwYxISsKGaT3sGHEqb7/e7hULfsnsQ7dWCq/CxSVoIGW0/Bd7c7iw8wxZEK7iV6rumGDDaYYmVA3o9RP/G22zdWtlOM16HbCamHtohwIEhLeFtgHvyjlj7wVe1WvACuERp7/jBr57j6XqzK9mASu2JRvGKjvJQLCAuRC8DljK2RpTVXmhLxkSrQOSa6UcsNell844C98N/iGo+V6qUDsEVz18s7K6DiBHy3rp61z4xwEYice+KEPtoDyCUql8Kc1DG65zXqQi3Fk8GhCr6JATX4jnXDtKq6bms+oyPIt+QYsDPBEYtd+TjI8vUAaLH/hmyl7m68U4H2VZH8K5IPnfj8tzETsLs5ekknfQGiY7EY9qbcJRAKY4+mm8sxzezyUO5yPiH4lE20bRB9M1U21Dwo6UtazaWQ3i0/lY3iGvT8dE9QawkNCrPqRUvhi/pcD1VcOZvZYZVnqNhJ8x3BzV/gYiU8sG1oI0MyIVhAo6qim7FntMj6iQb736JZkwPS1uhEp1xoCi8ZJmi6eBCH0a9P1TpTZCWnLXQnsdf+1i1WqelGKy1S2UOkDiaY/508tYnfoqt4iy61vs8/0OfpVgsE8IBi858zcMFALPbKHIVmdwo+96p6389Gedh8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(921020)(261022105027099003)(10067099003)(261026140227099003)(5023799004)(11063799006)(4143699003)(56012099006)(261026121527099003)(261009223027099003)(261021123027099003)(261021121427099003)(261022075727099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2JQQ0V2V28vUU5PVjIwdk9CK3N1SHpHKythOXdjZVJvTUdKL2NFRk15WTRw?=
 =?utf-8?B?a2FQV2hid0NIQS85eS9FV1VaNFpzUFdFVEd4VkJFSHZWd3BpOG1qelV4Rmdw?=
 =?utf-8?B?dHhmRlBRR21pcUVYN01yblgxV3pVVGF5eWFOYitjQ2dOL25qU3lIU0NZQURR?=
 =?utf-8?B?M2dTaTVUNXIvcGJMcWd5ZUlMWjh1OGo5OHlOa0F5OTIwZEJGM1ZyNWJyOFVT?=
 =?utf-8?B?RGhUMW1QRktoeDFEbjB3ZGhnZ3puN0NnSStLT05MQXdwaTlkZHhub3FsK0hx?=
 =?utf-8?B?VGw3TjZ0Y0VIWE5Ma2JrRDhNcVdGZ1VzOTBzb0gwZExlbVY5WVdYaFIraXhP?=
 =?utf-8?B?VThKSDN2S0hQbDR6a0Q5am9XR2xjdG9qSDhzUHJqdUpNd0plN2ora3lhYTVC?=
 =?utf-8?B?ZzU0cktmcGFHSDB5bHFkOHVveUF4TU9IV0lMeW5Qa1VaV3M1S0VwMS9DNGZk?=
 =?utf-8?B?OWNqMHdvcEY0dSs4QkRlQWJVNnpSN2lDaWJ1OWE2QWNDZlJnZUR1aGVCaUc1?=
 =?utf-8?B?ajB1WU9IZC9nVUZ6cTF2ZFQvdUF0YzQ5K255ekhkT20xbGM0V1lDZVl4NWZM?=
 =?utf-8?B?WERFUktzbHIrdmJ0VkhmVmt2ZXJ4WFg4clJmTk54UDhhRFJwcVo5enU5OVdG?=
 =?utf-8?B?bHR1ZVZyMG1kYk8weCtwSGwvUGE3eHdTcU53UDQ3VHNVVHhzV3ZCMVl5MktC?=
 =?utf-8?B?aEY5a2JGYlVyTlNZWG9lZmg4UXBUcUQxdDdhcFJNdi9qYWRpc255ck5LQzZa?=
 =?utf-8?B?SXV1cjZwUzhYTFJybGQ4OUQ2WEVNVnlSYkNiU1FzdGlEMnh1QUtEYmtCZ3FE?=
 =?utf-8?B?eTJ3OTJ6NkxZLzFCeU1VSnJoNFVKS215OERWamFKcmkwS0x5c3czUDRWbkZv?=
 =?utf-8?B?bDBUWm9pQXVFUzRoZGdidXV2Wkc2cG0vSkNnN0pjUTRBUnFQUGpjQXpPbnNR?=
 =?utf-8?B?YW1pT2FiOVhJbUgvUEpGemw5WE5nZnZxb2NwaEpWZ1dPcmpwaUloSmJ1WkJP?=
 =?utf-8?B?eE11RGFvUEczMmFidVVaeWgzazF0aWNkdlFTSDRvSWc5UVV5TDR4dFpKRkdJ?=
 =?utf-8?B?K1ZTQ1hIQ1QwbFFCWm5CVmhMNjQwTjEzRFdYNk1vRUZ4YWpvL2VWMEwvWEhQ?=
 =?utf-8?B?bUNNTkRYSWdjcnRadHJyckxVNC9TMUlVS1RwOVpsRG1Ma3FCSkRjNnBScWRx?=
 =?utf-8?B?UmZraDBTdmRYMzR2Q296bUdWN0V4UFkwMmRzbEVrbmZqTWZxbXRENTVlZWwr?=
 =?utf-8?B?cWlNZkxlS1dveU96ZHU1ZmRIVTBIVTh5YU04ckxIV04zeU5hVm5QN2UyM3Zi?=
 =?utf-8?B?M05Wc3hRRVN1Z0U0VEF1YkdNalY2ZUlMMGVrTlZha1dWbTRYMFQ5L3JBaURr?=
 =?utf-8?B?dmJweVpzTUR5ZGRVTDlGd2dHR205ZXZMN2JkeWZ2K21VZVJUeFBSU3hjRFlR?=
 =?utf-8?B?N29ubDhidDlNck56ZU44cDk5SnNGaUhlSzI3ODA3NlRlMVl1OVI3am4yaStZ?=
 =?utf-8?B?cGl6eWtlK3J4c0dZOXJIL2g3aHEyb2RDN00wdktTakUyOGl3cnRhY2Z2REdj?=
 =?utf-8?B?cG8vaG5RVHc5OTFHbFRLTm16c0dJaEhIWVlhMU9pUHZTYVpsKytjVEhWTktp?=
 =?utf-8?B?TWx1UEtCNmlrdFVBWTI4anVOc0lybUx1ejFIV0pIY1BURU5WNmdJcGgrdWJ6?=
 =?utf-8?B?L1paRnViUDFpZkxSMy9uQ1RKaFFQaSs5THhReVA1bjFSbUtzaTR3SkRqd0Nk?=
 =?utf-8?B?elRNN1BqR2ExWEYvZXFXYVBZSWt2TWdKdDRpTlBJSmxnRkEvTmFKVjZJTXQ2?=
 =?utf-8?B?ZTlybkUrL3dSeCtzdFJER3Y5RDVIdGlHUHU3bmo0eURlS0xtK3pCMzh1UFJh?=
 =?utf-8?B?WUJaL1RYaU9jQ2JBUktZeGpBblN5eGZUQTJXZG1mK0p0K0ErWjZpeGhIcDVY?=
 =?utf-8?B?Nk12bnVFc0dla1hySkNBRGNLeGZieDhjbnVvMEVTVU0yZnRJS3FMSnZDdXRa?=
 =?utf-8?B?UThuMHluZ01pWFhvSHZJNWZheXVlV1c1QmdmQzJjcEp5VmdFeWxCV2piT2Qy?=
 =?utf-8?B?dmQ3eVZXUVZTcjBqSjdGWVI3ejZPcVgrYi9HNlp4VFFXd1lERlhhRnFndS93?=
 =?utf-8?B?V1VGdktQNTU2MkNYMzMvZU10T1ZCbzB3SE1aSk1GVnk0dUozWGlPNXFlN3gr?=
 =?utf-8?B?aDU0elNJY09vU3ZkY0hqdXpjbEJncHpFdk16bHlFVW10SGtsaW5mQjJmWW1n?=
 =?utf-8?B?NXg2WVQ5Z1FXUDNJM1RJM253RC83YzdzZGVPeU1URjFYZzdWaTRyc3pPblVY?=
 =?utf-8?B?aFQ3bW5mK3k1M214NThUblI4QUxBNlJDUkZaR05lMFVEaE1IMXZBMzRGMVJS?=
 =?utf-8?Q?Le4zh1NrjT63tbss=3D?=
X-Exchange-RoutingPolicyChecked: Nj3YfAifQ2N9qzUOsv4/dm32mNKWcBKk6Y10JrJJrCY9WHTHE8nv6rVnxA+9bE6O2Dm1Eui1muJKjicwv/0bnkYYC42dJZnP2rNNhyKi5QI3g9goNlOsQrpAZm76RmkRtvOfrlLrDHsYDe6Srf9PGtXwoDQNHDudg5d6gE1RxlZ2ZmsAHkCDScoJKGgqOeltmnZbk7xTUj/x1Fo0oxXbQo2V69BUMXNgd2qFBFACrFHjhIqO4Ow0r1iMwBnrh25ZjllSGzsRZT4zEwazIZAXH306/Tegygzh8POx1scJxhfkrEmCriSBhli0o2a0UQn2eyQw6FNexXKyWzfO0mTVyQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed52d7a0-9f26-40cc-00fe-08df4a5552e8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 18:04:03.6660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZ96EP00M+SvQhXZ6i2lcbvvzoyfOV6UjE1Or+JD49j8fvu7pN6bqv9/68gICwVZ5LgW2PAhlQEp81LUa6DlQ0ziuFPp9RNLZlSb/1/AFSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7126
X-OriginatorOrg: intel.com

Hi Ben and Jinjie,

On 11/23/26 2:07 AM, Ben Horgan wrote:
> On 23/11/2026 01:53, Jinjie Ruan wrote:
>> 在 2026/11/20 0:49, Ben Horgan 写道:
>>> On 19/11/2026 09:48, Jinjie Ruan wrote:
>>>> On MPAM the counter of an RMID is selected by the PARTIDs of the CLOSID
>>>> that owned it. Without CDP, CLOSID c is PARTID c; with CDP it is
>>>> PARTIDs 2c and 2c+1. An RMID that stays in limbo across an unmount and
>>>> a mount that changes the CDP state is read through the PARTIDs of the
>>>> new state, which are not the PARTIDs its cache lines are tagged with.
>>>>
>>>> With 5 PARTIDs:
>>>>
>>>>   mount                  CDP off, CLOSID c -> PARTID c
>>>>   mkdir g1..g4           CLOSIDs 1..4
>>>>   umount                 RMIDs enter limbo with CLOSIDs 1..4
>>>>   mount -o cdp           CDP on, CLOSID c -> PARTIDs 2c, 2c+1
>>>>   limbo handler          reads CLOSID 2 as PARTID 5 > PARTID_MAX 4
>>>>                          MSC error interrupt, mpam_disable()
>>>>
>>>> The other direction is worse because nothing reports it. If resctrl is
>>>> mounted with CDP and mounted again without it, CLOSID c is read as
>>>> PARTID c, which is in range, so the limbo handler silently tests the
>>>> occupancy of the PARTID of a different CLOSID and frees or keeps the
>>>> RMIDs based on it.
>>>>
>>>> Where the RMID depends on the CLOSID, as on MPAM, release the RMIDs in
>>>> limbo without reading them when a mount changes the CDP state, instead
>>>> of restarting the limbo handler. Cache lines that still carry those
>>>> RMIDs are accounted to the next user of each RMID. Where the RMID does
>>>> not depend on the CLOSID, as on x86, the CDP state does not change how
>>>> an RMID is read and the limbo handler is restarted as before.
>>>>
>>>> Compare the CDP state of every resource, not just the L3: on MPAM, CDP
>>>> enabled on any resource gives every CLOSID two PARTIDs in all MSCs, so
>>>> mounting with -o cdpl2 alone also changes how the L3 monitors read a
>>>> CLOSID, and cache levels beyond the L3 would too.
>>>>
>>>> Reproduced on QEMU with the sequence above:
>>>>
>>>>   mpam:__mpam_irq_handler: error irq from msc:1 'MSMONCFG_ID_RANGE', partid:5, pmg: 0, ris: 0
>>>>   mpam:mpam_disable: MPAM disabled due to hardware error interrupt
>>>>
>>>> With the change the sequence completes without an error.
>>>>
>>>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>>>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>>>> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
>>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>>> Cc: <stable@vger.kernel.org>
>>>> ---

...

>>>> ---
>>>>  fs/resctrl/monitor.c | 35 +++++++++++++++++++++++++++++++++--
>>>>  1 file changed, 33 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>>>> index ede1708b920e..2c8c60138768 100644
>>>> --- a/fs/resctrl/monitor.c
>>>> +++ b/fs/resctrl/monitor.c
>>>> @@ -70,6 +70,13 @@ static u32 *closid_num_dirty_rmid;
>>>>   */
>>>>  static unsigned int rmid_limbo_count;
>>>>  
>>>> +/*
>>>> + * @limbo_cdp_enabled - True if the RMIDs in limbo were placed there while CDP
>>>> + *     was enabled. Only used when CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is
>>>> + *     defined.
>>>> + */
>>>> +static bool limbo_cdp_enabled;
>>>> +
>>>>  /*
>>>>   * @rmid_entry - The entry in the limbo and free lists.
>>>>   */
>>>> @@ -1044,12 +1051,15 @@ int setup_rmid_lru_list(void)
>>>>   * cqm_resume_limbo_handler() - Restart the limbo handler after a mount.
>>>>   *
>>>>   * The limbo handler stops while resctrl is unmounted. Restart it on every
>>>> - * domain that still has RMIDs in limbo.
>>>> + * domain that still has RMIDs in limbo. Where the RMID depends on the CLOSID
>>>> + * and the mount changed the RMID index a CLOSID is monitored with, the RMIDs
>>>> + * in limbo can no longer be read: release them instead.
>>>>   */
>>>>  void cqm_resume_limbo_handler(void)
>>>>  {
>>>>  	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>>>>  	struct rdt_l3_mon_domain *d;
>>>> +	bool release = false;
>>>>  
>>>>  	lockdep_assert_cpus_held();
>>>>  	lockdep_assert_held(&rdtgroup_mutex);
>>>> @@ -1057,6 +1067,24 @@ void cqm_resume_limbo_handler(void)
>>>>  	if (!r->mon_capable || !resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
>>>>  		return;
>>>>  
>>>> +	/*
>>>> +	 * Where the RMID depends on the CLOSID, the RMIDs in limbo can only
>>>> +	 * be read with the CDP state they were freed under. Check every
>>>> +	 * resource because CDP enabled on any resource changes how every
>>>> +	 * CLOSID is monitored, so CDP on another resource alone also changes
>>>> +	 * how the L3 monitors are read.
>>>> +	 */
>>>> +	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
>>>> +		struct rdt_resource *res;
>>>> +		bool cdp_enabled = false;
>>>> +
>>>> +		for_each_rdt_resource(res)
>>>> +			cdp_enabled |= resctrl_arch_get_cdp_enabled(res->rid);
>>>> +
>>>> +		release = cdp_enabled != limbo_cdp_enabled;
>>>> +		limbo_cdp_enabled = cdp_enabled;
>>>> +	}
>>>> +
>>>>  	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
>>>>  				lockdep_is_cpus_held()) {
>>>>  		if (!has_busy_rmid(d))
>>>> @@ -1067,7 +1095,10 @@ void cqm_resume_limbo_handler(void)
>>>>  		 * it is queued again on a CPU picked now.
>>>>  		 */
>>>>  		cancel_delayed_work(&d->cqm_limbo);
>>>> -		cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
>>>> +		if (release)
>>>> +			release_limbo_rmids(d);
>>>
>>> Rather than release all the rmids don't we want to check them all to see which are busy?
>>
>> We can not read them here using resctrl_arch_rmid_read(). On MPAM, the
>> RMID occupancy is read through the PARTID of its CLOSID, and the CDP
>> state maps one to the other.
>>
>> After the mount operation flips the CDP, this mapping disappears, so the
> 
> Yes, the old indexing becomes invalid. The user visible effects of limbo
> handler running between mounts should be maintained. As such, if the
> limbo handler can't just be simply resumed I would expect that the array
> of dirty rmid was recreated. If we put all the rmid (except for the
> default rmid) in the dirty rmid array then the limbo handler will take
> care of releasing those that are free. How does this sound to you?
> 
Thank you very much Ben. I think this is a better solution that better matches
what the limbo list aims to solve. It looks to me like the trigger for this
rebuild of the list should be the CDP change by itself, not whether there is
anything in limbo (so no has_busy_rmid(d) test).
Ben already states this with "all the rmid" but I think it is worth highlighting
that this also includes RMID considered free.
Consider the scenario:
- Under CDP the default group's CLOSID 0 selects PARTIDs 0 and 1, so its
  code accesses tag cache lines with PARTID 1, PMG 0.
- re-mounted without CDP, CLOSID 1 is PARTID 1, so a new group given CLOSID 1
  and RMID 0 starts out counting the default group's leftover code lines.
  That RMID was never in limbo.

Reinette

