Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956B746D09A;
	Fri, 24 Jul 2026 22:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784932116; cv=fail; b=M1cbg+HVBntGJ37/zaetlvb7d/IDShY6KnnXaqsBF46VsOLokSk6UXs75kLfAFeIXiZZdmwgy8098L+ZPAGRYj29Oj3irAw2BPYrjRm8aTeaa4mBwueRUD8WUzJBUPgvk6b/Nu4HorjIFtrIxiC3nQMhpK8Hu/omS7B5d59atNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784932116; c=relaxed/simple;
	bh=+TfHfEX4Je/IoTIuiR5maNVWR8GbLr8bvU4qDq5AelM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aN/YHbLymrhvG17TTOghmxo08hnrwwfuDLuCJnEF0tU5wp5vUDr01dZauSyocy3bvYfCWQZ00ytm8oTuu8ju1+rHLq8jA/XvJm6Vm/bcy+uYOoPeAdtg36U8Wix0CqhQtDoux1EatIKkKzdo/lQ6WrYG7z9BLCfctEpNFDdUjdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePvRSZBM; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePvRSZBM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784932113; x=1816468113;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+TfHfEX4Je/IoTIuiR5maNVWR8GbLr8bvU4qDq5AelM=;
  b=ePvRSZBMebilo9vv2wug8zKXgAUHZmHdK3457jfrMKS/qLrWWELykr/p
   qFNmXdpe25FTfpTsi2zNZ520qFcYr4/uyy0wcspXevPMnnWxKewX8RAof
   SMM/pnFOCw8qgjTJYoavXtJ5IKrNt1FHI2GgiQGGvt0VHKZxMvCjw/65R
   J3VJ4918H8vT77CtPo5vQVQaGchZtgAmCuWt8st2zIh02lwUUVWtLpuFs
   qdT+BWD3mzZKbTfG3dBGFxyT7UzXGqNK3WDUSRJ1SO+7iBmFcTTGaGlpb
   P+2moa2nZfbzY4VqjzNWqGD/8jTX/snBUtR4lUBuNsCp7sQ/mJhOcRLKz
   g==;
X-CSE-ConnectionGUID: 4+E+XsEITQqwAXlWrjwd1g==
X-CSE-MsgGUID: Vzhk66xpS+aC4BNWYU6s6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="85792473"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="85792473"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 15:28:31 -0700
X-CSE-ConnectionGUID: OxvlU/nyQ5ayAKFAK/Rlxg==
X-CSE-MsgGUID: /jpQFUFgT4e2vJxGhu4OSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="259480470"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 15:28:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 15:28:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 15:28:28 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 15:28:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctNg1s3kfnOIZeQ+vFvkJzi2/InoAtkboBsVjnZ8vK/dxFMhL55ulndow/HOam/RkfeGfPsE5qFm5HAg7FrsTkw8ZiaZkJn+tKh7dXdpUrbhvqtNQCVkn/cBoXVMpZ4PC/9jPO2cmTRxfR8NChbBpLbrJDCaD4/MhCm4Es8aET7v2RGGm3Y0C3JEVXt//m5xf6zrhjkNEglSfoXpV620Y0xtLydEMwuHmWEc70xDguDS5kFlPqMniHblCv/si5xgAc5dhRf6vv27LWwfWtA2JCAuCennAz5sq5zQb9ZhW/9SwgqcG8Mw9YcDrPfViTcdIBiMHTfIsdrJMl2Qmj39rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/esXxns5vjQvCD+sqxwsDofT4gzUqggo56RmHKVMino=;
 b=gmTJSCyLv/gtoUeFw3jVjItzacL661p3wqt1jTY+LtdfDvKX4moGJHshw8yMgX+29giKZ6ldThvuaK47Y5fvax50aXYhFCIFW4+foK9U8yiPgzAY/Cvoxh0O4RPCl5G9rjR3naVgBs4GJ2kUhSXpasHV5ukEmKVFlWK7iox9V9UGuDx3xkqhtvt8KtbTOr+jABaD7SsHcI5IYrE5pQNgYQHjbet901To5WKvDh9RY2OkGf7BXbLGBiFbVsDD4RjwNMAcuvvppgV02wxUbMSNRZ3Z1yqlG4FgU0BugwwK8+X84vFFmvXK6y43BLjDHs2Y8EE2ohWRnGkGK6YrwqE4Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ2PR11MB7502.namprd11.prod.outlook.com (2603:10b6:a03:4d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 22:28:21 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0245.009; Fri, 24 Jul 2026
 22:28:21 +0000
Message-ID: <c1979f4f-eabc-4d71-a711-ab465b9d9c1e@intel.com>
Date: Fri, 24 Jul 2026 15:28:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<tony.luck@intel.com>, <bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
 <d337915a-ef4c-43b2-a915-e97381b7dca0@intel.com>
 <b0dc49dc-ac35-457b-90c6-842a3cfcf8e1@amd.com>
 <f3fd774d-0662-4094-90b6-f0c5a4bc5d26@intel.com>
 <78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com>
 <dbbe2eac-bb0a-4655-9d0e-6e8feb702717@intel.com>
 <e77ef79c-5241-4f7c-b0af-dde6f131600a@amd.com>
 <bd739e7e-7a86-4291-9c08-f2c72bc2dc3e@intel.com>
 <48fef38f-8e2a-45e3-bb60-f293a1d60be8@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <48fef38f-8e2a-45e3-bb60-f293a1d60be8@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:303:b7::8) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ2PR11MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: b1decf4e-04d3-4dbd-ac56-08dee9d2ddf0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|6133799003|22082099003|18002099003|11063799006|5023799004|4143699003|10067099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: LkX+QvHWFRQIwlRHXW08DU+v6nsiBRR/89lfC4+/ZyvzWm9fBAuMZ6snJMTXJeKNq6Vuqb6h/CTwO59SrchysJnRc2fZI9IfVgDa+aeNIH0lPAaXIuqQF36FGVOvrCMp91FOqrvtLYdjYN/WVXTtjy+qmJsgmA8l8KBdzEq/5xELXBJKYdW0Sj/SDsQ8S96kP7Yq7y+DvInmT625E/5dFSOgka8wmj81Id5WeVInnPYJym222Q6ialiodRYvXPCM3huc8DM8hM5dRkR77ucHtYtMv618ILlMBKcyF3v6NMp+Y0F1THBuc76Cr6rdoRNz6QvFLeP1mVH5OYLT3s58oBRpBIN7Nn4YTpsPlXWvYVBp9GGMRpky0M1mrYQdpNDxShiB4krGzWhKsp5hAqnlU74UrZOSObuE3udiZijWtAN9DOCcd3Dny7ZBHnEVXvjWGBkj3glOxObeKwZF526qiPacsbC2a5RXYdQBMwFE907Q6PJAXBTPtkMtEVmGVUyxJWgf7+7JKMLIVASOhDrvUDKeryzKib3PM95WxF0FcRRtxrgwwgFZFY4bnDQ4xOOUPXz8XJE4U/5WH3aQZA+0PyPDHwmOX+bPLT5EtBcWN1aij3RXr7dVZ5uMpyxDpjABSPc61AaW9Pg8gP/5aHs2LsJrQ+Y+wG10txThi3+/hdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(11063799006)(5023799004)(4143699003)(10067099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXpPcXB0K1M2b3hJRG5hNWhENDhxVUo2WkJ2Y2wrOWE5cExXcTFvUjFUdjZD?=
 =?utf-8?B?VXhKSWN6RnNWWmNYMXpoZFlBVFBXRHRWMjVSL2ovTXpUM2dNNFM5WmJJV3Fa?=
 =?utf-8?B?VkVxc0tDQnRIRGxDazBYNTBYMzN0WW4rckhielkrdjJ1ZVBLSmJhWXJSS3lC?=
 =?utf-8?B?eGZaQm1PQ1VEUm50TVpuaHBIaFEvRnFiSVUwQkpCTVIwbHpwL0c5OUdQTEJ3?=
 =?utf-8?B?MjBNRTAwNzE0ZWRlQVVoYVV3UnhkSVY3eU9GUDE5WVRTcnFRTWZhSFdWTDls?=
 =?utf-8?B?eHpOd2R1S1d5NnYrZGZwb3gyV1J4cDVpWEE1bGRNRFFrZDhqa3dvRlJWOG1R?=
 =?utf-8?B?bjk1a3lyUWNZZjZyazVyVEU4ZEdKblowb0d3NWhYbStMOWZhWHFJSitwZFlw?=
 =?utf-8?B?RWZWZjJRR3pQQTVhbVVNL1k0bnBYcXJxRVljNC9pODE1R1M2RjVHbFA2ZVYw?=
 =?utf-8?B?a3BEWFpYL0o1ZVdleWJMR3BFZTlFRVU1ai9FZytLQWxaWnU2Y0lPZytKUWNm?=
 =?utf-8?B?eGx1bGQwZWZJZUVkZ05jMjFWRHR4YTdvVTI2ZVJJS3JvVFI4R2ZHcnpSeGh6?=
 =?utf-8?B?UC9mai9rNDZmd3BycE92TnpCN1N4c3dublNKc21ZQnEySXp6ajFwM0JhWDR1?=
 =?utf-8?B?c3FyNTBsNTFkK1lPYjU4RjlqZkNIbzg1WllGbXB5VEc1QUIxR1h1aFZrZ3NL?=
 =?utf-8?B?Wjl4WHd0NjBOdUVkRm1hVVE4OUdYTHZwWlRHM3I0emdEbmtOeDRJaEp4aUUx?=
 =?utf-8?B?SmYrdGYwMm9IZUo2c2dlcDFOOGZMOGN4T0hLVG9QZklscGx0cXJkSEhYQmdC?=
 =?utf-8?B?WXhoNkRnc1lMczZBSHVCcWVIeitkMHZONjdBclUxbDNFbTUxK1F5OWpKaHdN?=
 =?utf-8?B?dEM0MkQwT0FBYXovU3E5bWJBcmE4ekthSWhqMGl0YlRwelg0UysxeDNnTEZ6?=
 =?utf-8?B?bWFORG9LMFhaZ2s2ckk3WHNydE03S2gvMCtNZXZSdU1LQVRuTlNSYndWKzhs?=
 =?utf-8?B?QW5FM09aMmgyVDRlaStiaGFUTHBpNmN0eXFpa0NqMWRWbWtUbzNoaHdKd0dG?=
 =?utf-8?B?NHNDdFVrZE1aSVdZNTZVd2dRL01lVVdTakRnYjBhalBiQTU4NXBVbVI0dngz?=
 =?utf-8?B?K1dPakYxNXJ1ZUdRc0NlSER6RS8ydG5UYXIrdnk4VzFSUmVma045UU1odWFN?=
 =?utf-8?B?QVBOQkxHWkM1aUQyL2NVU0ExWjRJbldqRTNsQ1BnZnBMVUZKMWp5V3RzSmZ6?=
 =?utf-8?B?d1hpYVNGSk9FNG9UUkc3MjlrVzZldUt1YThLeU1sRGYyUHpwWUZxc1V5MjBV?=
 =?utf-8?B?OUpySm1VSHV6RFZJa2FZNnQ1Zm4xa00zWkUzZXI3QUNiMEJwd3o3Y0RINURF?=
 =?utf-8?B?SVlheWZoRW5sQnBCSlA0aC9ic3ZDK25kcHhCRU15OTBITDkvaEpVVnR0Z3BY?=
 =?utf-8?B?MU1Md2szSk9RUkJPRjV4eFltRkdwajE2Z3hNOXgwU2cxbDZRQUdyVzNZMEM4?=
 =?utf-8?B?T3ZXZmNaMDlQVHJ1bm9Lbm54T0tEVUZzTlRVUlhmQStSQUlKaXlqY0FjbDNT?=
 =?utf-8?B?dC8yejRjbndPYVBUTXRjWnlsaHFtMDJLZTZqRVFqdkFPeUNFNFp0TWJPZVZ1?=
 =?utf-8?B?aXM4K05hZG84dHVuaCtXNjdEVkp0dm5oa3RIRmJCN3FWSE1Ddk5HbFZXZGlO?=
 =?utf-8?B?QkMxN2JGbks3R2dEclQzLzMvSnpJd0w1M25mVlA5K2ttcW9wREVmZ3JMdEs2?=
 =?utf-8?B?YzF4TkhsVlRKeVJoZHlKMDEyQUNFampzUnpST09jRllUMG84VTVlY2Y1NWE3?=
 =?utf-8?B?dmlBSVlnaHFvSFJtc1M3UTFWNk14TmN2YU0yY0xmWTIvQVBRTWE5RkQ3VDI1?=
 =?utf-8?B?MmFjMmNBbmlRV1I5ZC84QkVIbkVzMkxyUzRYdVVmMklTdFIvRzRTR0xXUVFw?=
 =?utf-8?B?Yk5JQzFINkx3SVpqMkhXN1NkZTUrWXd0YklKalFBemZzckRPVmliVk1XeFYr?=
 =?utf-8?B?dnJqQ1d0aFp0ajJsR054NUxoYWFLTDJ6NnFoM2xkdElaT2Rza3lNU25tblhB?=
 =?utf-8?B?b2E0QVNOYWlhNUFya3Z3SVRmZXNhazVDQjRMa05IY2E5MDNzY1pZaTE2a3VE?=
 =?utf-8?B?YjZlOStTTzBsTk05S0E1SWk5V0tZUUpGYTA5Q28yanNWQXRsUjhLMDliY2tr?=
 =?utf-8?B?VWV0YVk0eEtYcnJDV2NLZGFPMGhzQ1A4OUQxelZJTTQ1Ujl1Z2Jmc1lacVVO?=
 =?utf-8?B?bHR3SG0yWXUzdzBrQ2FqVy85SGhoSmpWTjBla0szc3JtWFR6VzNKVXFUREgr?=
 =?utf-8?B?UzdQM3VwL084dW82RWFhSmpvU2p0Yys4TnJHN0pLM1pZM1dqZzB0M0FuWWJx?=
 =?utf-8?Q?i84qR78zbVp7+x10=3D?=
X-Exchange-RoutingPolicyChecked: o1nMndcnHconUWQO5bqObGzpFesoYExiS0cQ4Y6zk16I4eMAz3ljpjRNQwAeyR3KDk5e/Ymp2uCljU9piWrnAEeiLawBWXq7s0g1QnXJjSh11jsaIIUppqALfTl3zbfvVeC4jMk5PN0ExQiqwWe8BHyn3IjI7uobi8Z9wu/UbmuP81aKwmWcyntqLXeKNF5k5VNX/W7uC5j5X/67Swekq/kgVq7fJeDM3/CGDAD6YMaJRmfvYj/7mvi6JGBjluc1rIl43kbicebRyDG9ClIjTygaaT15iIq62a4PQO9x1OIF89ODCbnJxZQINtRGZatv3vSjcZgSvtdaxGR9OB/lHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b1decf4e-04d3-4dbd-ac56-08dee9d2ddf0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 22:28:21.4144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6URRS27Nci+bQBhagb2EOoBNo8CHFEV3waplVid1+ourCV6l70ZXX1ru9q7n8Wpy19H1Tylvr5UwDzJFcxezy+UQGi4aq140x4tKQphJkUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7502
X-OriginatorOrg: intel.com

Hi Babu,

On 7/24/26 1:57 PM, Moger, Babu wrote:
> On 7/23/2026 4:46 PM, Reinette Chatre wrote:
>> On 7/23/26 11:03 AM, Babu Moger wrote:
>>> On 7/21/26 15:54, Reinette Chatre wrote:
>>>> On 7/20/26 12:15 PM, Babu Moger wrote:
>>>>> On 7/20/26 13:27, Reinette Chatre wrote:
>>>>>> On 7/20/26 10:00 AM, Babu Moger wrote:
>>>>>>> On 7/17/26 17:56, Reinette Chatre wrote:
>>>>>>>> On 7/17/26 2:13 PM, Babu Moger wrote:
>>>>>>>>> The kernel currently enables the ABMC-based "mbm_event" mode by default on
>>>>>>>>> hardware that supports it. However, this can cause bandwidth monitoring
>>>>>>>>> failures with existing userspace tools such as pqos.
>>>>>>>>>
>>>>>>>>> The pqos tool mounts the resctrl filesystem and creates 16 or more resctrl
>>>>>>>>> groups by default. On systems with 32 or fewer ABMC counters, this default
>>>>>>>>> configuration can consume all available counters, since each group requires
>>>>>>>>> one counter for local MBM and another for total MBM. If additional
>>>>>>>>> monitoring groups are created, counter resources are exhausted and pqos
>>>>>>>>> tool reports memory bandwidth counters as zero for those groups.
>>>>>>>>
>>>>>>>> It is not obvious to me that this is a problem. If I understand correctly
>>>>>>>> there are two scenarios possible with this pqos behavior:
>>>>>>>>
>>>>>>>> - ABMC is not in use ("mbm_assign_mode" is set to "default")
>>>>>>>>       - pqos can create 16 or more monitor groups
>>>>>>>>       - hardware still supports a limited number of counters with consequence that
>>>>>>>>         underlying counters reset at any time as the different monitoring groups
>>>>>>>>         need to be tracked.
>>>>>>>>       - pqos can read monitoring data of all 16 monitor groups, sometimes reading the
>>>>>>>>         events would return "Unavailable", sometimes reading the events return data.
>>>>>>>>       - *None* of the monitoring numbers returned are guaranteed to be accurate.
>>>>>>>>
>>>>>>>> - ABMC is in use ("mbm_assign_mode" is set to "mbm_event"):
>>>>>>>>       - pqos can create 16 or more monitor groups
>>>>>>>>       - only a subset of monitoring groups have counters assigned and these counters
>>>>>>>>         are guaranteed to only track the monitor groups/events they are assigned to
>>>>>>>>       - pqos can read monitoring data of all 16 monitor groups with two possibilities:
>>>>>>>>         - monitor group/event has counter assigned: monitoring numbers are guaranteed to be accurate
>>>>>>>>         - monitor group/event does not have counter assigned: monitoring numbers return 0
>>>>>>>>
>>>>>>>> If my understanding is correct then the preference is to rather have wrong data than
>>>>>>>> see 0? This does not sound right. What am I missing?
>>>>>>>
>>>>>>>
>>>>>>> This hardware can monitor up to 64 RMIDs without any counter resets.
>>>>>>
>>>>>> How many RMIDs does the hardware claim to support via CPUID that ends up being shown to user
>>>>>> space via "num_rmids"?
>>>>>
>>>>> #cat /sys/fs/resctrl/info/L3_MON/num_rmids
>>>>> 4096
>>>>>
>>>>>>
>>>>>> I understood from original ABMC enabling that the underlying hardware counters of "default"
>>>>>> and "mbm_event" mode on AMD are the same. That is, in "default" mode the hardware does a
>>>>>> "best effort" assignment of hardware counters to events while "mbm_event" mode lets the user
>>>>>> control the assignment. It instead sounds like this is not the case and there are actually
>>>>>> two distinct underlying hardware counter mechanisms?
>>>>>
>>>>> That is correct. They are two different counters.
>>>>>
>>>>>>
>>>>>>
>>>>>>> As you know, the pqos tool creates COS1 through COS15 regardless of
>>>>>>> the command-line options used, resulting in a total of 16 groups
>>>>>>> including the default group. With ABMC enabled, this consumes all
>>>>>>> available ABMC counters(32 counters, 2 counters for each group).
>>>>>>
>>>>>>>
>>>>>>> When pqos is invoked with the -m option, it creates additional monitoring groups. For example:
>>>>>>>
>>>>>>> pqos -m all:0     -> creates 1 monitoring group
>>>>>>> pqos -m all:0,1   -> creates 2 monitoring groups
>>>>>>>
>>>>>>>
>>>>>>> Since all ABMC counters have already been allocated to the default
>>>>>>> set of groups, no counters remain for these additional monitoring
>>>>>>> groups. As a result, the monitoring commands report zero values,
>>>>>>> effectively making monitoring unusable.
>>>>>>>
>>>>>>> In contrast, the default monitoring mode can still support up to 48
>>>>>>> additional monitoring groups (64 total RMIDs minus the 16 default
>>>>>>> groups created by pqos).
>>>>>>>
>>>>>>> For this reason, I still believe keeping the default monitoring mode as the default is the better option.
>>>>>>
>>>>>> It is not clear to me where the "64" number comes from. Even if resctrl sets the "default"
>>>>>
>>>>> The count of 64 is known from internal information. It can also be determined by allocating monitoring counters in a loop until the hardware starts returning an "unavailable" response, which occurs after all 64 counters have been assigned. This information is not documented.
>>>>>
>>>>>> mode as default, what will happen to the scenario you describe and 49, instead of 48,
>>>>>> additional groups are created? From what I understand the moment the 65th group is created user will
>>>>>> transition from "accurate per monitor group monitoring data for all 64 monitoring groups" to "inaccurate
>>>>>> per monitor group monitoring data for all 65 monitoring groups" with no indication that this is happening?
>>>>>
>>>>> Yes. That is correct.
>>>>>
>>>>>>
>>>>>> I believe AMD supports more than 64 RMIDs and in this case there seems to be three ranges:
>>>>>> [supported by ABMC, depends on events but lets say RMID 0 to 16] < [RMID 17 to 64] < [RMID 65 to total number of RMIDs supported]
>>>>>>
>>>>>> Current default "mbm_event" mode uses ABMC so as you state this always results in:
>>>>>> - accurate counts for 16 monitor groups
>>>>>> - zero for all other monitor groups up to total number of RMIDs supported
>>>>>
>>>>> That is correct. With ABMC, there are 32 available counters, allowing up to 32 monitoring events to be tracked simultaneously. Since each monitoring group requires two counters—one for local MBM and one for total MBM—the system can support only 16 monitoring groups at a time.
>>>>>
>>>>>>
>>>>>> As I see it switching to the "default" mode would result in:
>>>>>> Scenario 1, 64 or fewer monitor groups are created:
>>>>>> - accurate counts for all monitor groups
>>>>>> Scenario 2, 65 or more monitor groups are created:
>>>>>> - inaccurate counts for all monitor groups
>>>>>
>>>>> That is true.
>>>>>
>>>>>>
>>>>>> I do not believe there is any way for user space to know when or if system switches from "scenario 1" to
>>>>>> "scenario 2" on these systems and this unpredictable behavior that results in wrong data does not
>>>>>> sound ideal to me.
>>>>>    I agree, it's not an ideal situation, but that's how it has always worked. At the moment, I'm not sure about a better alternative.
>>>> I see the current behavior (return accurate data when available and zero when no
>>>> accurate data available) as the "better alternative". Intentionally returning wrong
>>>> data when it can be avoided does not sound right to me.
>>>>
>>>> The changelog states:
>>>>      The kernel currently enables the ABMC-based "mbm_event" mode by default on
>>>>      hardware that supports it. However, this can cause bandwidth monitoring
>>>>      failures with existing userspace tools such as pqos.
>>>>
>>>> Could another view be that mbm_event mode is the *only* reliable accurate bandwidth
>>>> monitoring and any other mode (AMD hardware not supporting assignable counters or
>>>> AMD hardware with assignable counters choosing to use "default" mode) can cause
>>>> bandwidth monitoring failures (with existing userspace tools such as pqos)?
>>>
>>> Yes, that is correct. However, the bandwidth counters become
>>> inaccurate only when users start monitoring more than a certain
>>> number of groups (64 in this case). In typical deployments, users do
>>> not create more than 64 groups, so the counters remain accurate for
>>> the vast majority of use cases. We do not want to introduce
>>
>> oh ... hmmm ... I have a different view of deployments since the message I
>> keep hearing is "we need more RMIDs".
>>
>>
>>> unnecessary complexity or inconvenience for those users.
>>
>> This sounds like a request to (temporarily) change resctrl user interface to
>> accommodate users that create between 16 and 64 monitor groups (where 64 is
>> a magic number not exposed to users) at the expense of users that create between
>> 65 (magic number + 1) and 4096 monitor groups?
>>
>>
>>> Additionally, changing the current behavior could disrupt existing
>>> tools and workflows, which would likely result in a significant
>>> increase in support requests.
>>
>> resctrl should aim to maintain a consistent user interface and changes to
>> that interface should be done with a lot of care and with very good motivation.
>> Above motivation sounds vague to me. You are concerned about support
>> requests from users that create between 16 and 64 monitor groups but not
>> concerned about support requests from users that create between 65 and
>> 4096 monitor groups?
>>
>> One could instead argue that this patch would cause more support requests
>> since users will start seeing unavailable and wrong data the moment they
>> create more than (the magic) 64 monitor groups.
>>  
>>> At the same time, we are not taking away the option for users who
>>> require strictly accurate measurements while monitoring a large
>>> number of groups. That capability remains available. We also plan to
>>> add more counters and enhancements over time, and it is possible
>>> that the mbm_event option could become the default in the future.
>>
>> Similarly, the default capability remains for users that prefer to
>> create between 16 and 64 monitor groups and do not want to assign
>> counters.
>>
>> Without exposing the magic 64 resctrl needs to provide a good default
>> and I continue to find the accurate data the better option.
>>
>>>
>>> For now, however, our goal is for the default mode to remain the
>>> boot-time default. This avoids unexpected behavior changes and
>>> prevents users from being unnecessarily alarmed by issues that do
>>> not affect their typical usage scenarios.
>>
>> At the same time this commit states that, essentially, this commit is
>> planned to be reverted in the future. Users cannot be expected to upgrade
>> their hardware when upgrading the kernel so this behavior is already planned
>> to be reverted on the hardware that it claims to support. Why not just
>> keep existing behavior?
>>
> 
> I wish I could agree with you on this, but I'm receiving significant pushback internally.
> 
> The primary argument is that, according to longstanding Linux
> principles, we should never break existing userspace tools.

Absolutely. Does the existing behavior break existing userspace tools though?
I find it hard to believe that tools would prefer to see inaccurate data over
accurate data just because inaccurate data is all they have seen until now.

> 
> Before ABMC was introduced:
> 
> # sudo pqos -m all:[0-191]
> 
> CORE         IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
> 0-191        0.01      108184k    385184.0    34100.8       22.1
> 
> 
> After ABMC was introduced and made the default mode:
> 
> # sudo pqos -m all:[0-191]
> 
> CORE         IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
> 0-191        0.01      109937k    385600.0        0.0        0.0
> 
> As you can see, both MBL (Memory Bandwidth Local) and MBR (Memory
> Bandwidth Remote) are reported as zero when ABMC is enabled by
> default.
> 
> From a user perspective, this represents a regression in
> functionality. A tool that previously provided valid memory
> bandwidth monitoring data now reports zeros unless the user manually

I question the statement "previously provided valid memory bandwidth monitoring
data" and this is where I am blocked.

From what I understand the previously provided memory bandwidth monitoring data
was not actually reliably and consistently valid since counters could be yanked from,
reset, and re-assigned to, workloads at any time while the workload is running and using
memory bandwidth.

I understand that if users only use a fraction of the supported monitoring groups
then the counters will indeed be valid but (a) this is a small number compared to
the supported monitoring groups, and (b) hardware does not expose this number.

> changes the monitoring mode. That effectively breaks existing
> workflows and monitoring applications, which is difficult to justify
> from a Linux userspace compatibility standpoint.

On the other hand I interpret this request as "We returned wrong data before.
We can do better now but we want to keep returning wrong data since that is
what users are used to".

I continue to feel that this is not the right thing to do.

> 
> While ABMC offers advantages and is the direction we want to move
> toward, it is still relatively new and the ecosystem has not fully
> adapted to it. Making it the default before key userspace tools
> support it creates compatibility concerns.

Indeed. Switching from the original unreliable bandwidth monitoring 
to accurate monitoring will require adoption from ecosystem since
assignable counters is a new interface to get used to. This seems to
be the only way in which users can obtain accurate memory bandwidth
data since everything needed to get reliable data from the hardware
cannot be discovered from the hardware (referring to the magic 64 number
here).

resctrl aims to support the adoption by doing automatic assignment.

 
> I'd appreciate your thoughts on how best to address this situation.

We appear to be at an impasse. One way to move forward could be to
request arbitration from the x86 maintainers. I will abide by their
guidance and look forward to learning from them how to navigate
issues impacting user interfaces.

Reinette


