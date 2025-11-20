Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2201636996A;
	Thu, 20 Nov 2025 16:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763657194; cv=fail; b=cafIgJ+vCpV18sJXwWeLxku7j/cvt02L0879qs03XJqJEJ2BWxhr/kwwRRewq/zNaOcCxg+MfCH8M60endhzBMoiEVRmHoxFIBVOp320YG0t7UoFY0sQMMNxLoCoNwyxY369M2KFuOt1/1fFyEAVGnU3dH/OPQLyAiQeuAfk2Po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763657194; c=relaxed/simple;
	bh=dGYCT0ulgCnfCkYNkMQW03JuO8WY2Wl7csfyT8yNDVY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rCYcvpd+qVqZ+Hr/8iWScqP/xJxbEisM8nXtGB11NNNColu4Jsy8HoK50W7TUQqY14ay1Kj4TZWcc5ILKrAY7OY2hszyGfQHgkOxyMD/Ivlwk2PPj7wzo6bQdKtAeHDe2dbcJTyZ6PRDS1bkO3k9j12bHA+tX8WL4PRCQEbcq0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dELWdXFm; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dELWdXFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763657193; x=1795193193;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dGYCT0ulgCnfCkYNkMQW03JuO8WY2Wl7csfyT8yNDVY=;
  b=dELWdXFmxsro6QR/OCdoL6tLw99jF8QA+vTcUqREtSRq+oSgh9ZZ4T5u
   8u74BBWZ4GTh8BfSgfwgvz2LKOYdXqaiwdVV+s8pi8KRLzaw8ZLfcMPD6
   uinWAjYQ2XHWHOqwJeJ9AoQ/XMwF7jKYTvljyXfPO+PTCjFBdnkUpYEGL
   ibggddfdF2ewhWkmi7kZlXjJL3aI6lk9axoNGWBcRpbdT0WAHbWsUtBnt
   5FW+KF3nvv0LHB0fDVmT54eCPzoc2dXGdj1OjSaQjNgf3jQZjq+YvKoBL
   hbQO7q47U9j5JaXjH808qKfACUa6MEY4slvi9Tu037Td+toHKSZW6ZOmf
   w==;
X-CSE-ConnectionGUID: bwWS/DyfTvO7+vwjj5oing==
X-CSE-MsgGUID: Q7IShAmSRamWxiQqet9rGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77097317"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="77097317"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 08:46:32 -0800
X-CSE-ConnectionGUID: C3i5F60BRD+JlSGPMcV5hg==
X-CSE-MsgGUID: Z10wieAkRPWSYku42lPyYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="190657787"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 08:46:32 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 08:46:31 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 08:46:31 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 08:46:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkHgp/qQpWjH4JRjQF9qwd3rjgJYh5UQplldpGnlJ/xFk7kJaITZbtRTXDojolrC5VA2QUMidti7w5yAWX+FICHd1LuKcyffJ6T1etUJQhtZ/xCuhSbAMge91XtkVfLe8rmvNXIB31YaMuQsKWTZhSVHDHem/egO4wJzHSrdvCGnkH2Ty93ddbhMXx56LlSSv9wotZU40/8IiFMjJsa9Qut9+hZafNbKkM/9bb+gD0sRG22e/HIuCODlW8FQYf/oK+37iZHxDq9/Bp5izszBhjTYKlk9jK03mAxoI2aVMPutxviac8xBXVc/ogbSV0xP7pQZJDd7xkX6f/PlBu5PSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaoLtp07aq7jVosLFYjEXIzqv28/MbFhZhJ3FgMKW7I=;
 b=YaEmJxK4s/K8SOfu59JruxXDQ5zil9yBsZfcuRprmkuXEiGLpaYicdsa1LpnXie0AL/hugKt0MM+H7UzI9VyRjFRA2Q8jE8N0nZwr1s6lxjofTn54tjNYiKtmMcbfnsmpHqijv6XBI86WGWw2YHzbPfBF1SLRSHn4904NxEY+Ghh+ScCLvEpaW09GaoeKm1yEbSMFyd96Dz4yCyIptkmvtgx7tOWuSuwxFeKyk1ZmVn0oQDDP3nlJFYYD7K1jWLQgmcgiMU7rs4tLi13ZJWKnm+CQPV6bEHawtf5PHbCYE8C6u0HprSkh00xgwRymUdHGHNk0mnXZo/a2ZDxm7jntQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA1PR11MB7272.namprd11.prod.outlook.com (2603:10b6:208:428::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 16:46:28 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 16:46:27 +0000
Message-ID: <45b96e99-ac5e-4546-b58b-f4d062d2f823@intel.com>
Date: Thu, 20 Nov 2025 08:46:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86,fs/resctrl: Factor MBA parse-time conversion to be
 per-arch
To: Dave Martin <Dave.Martin@arm.com>, <linux-kernel@vger.kernel.org>
CC: Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>, "Ben
 Horgan" <ben.horgan@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Jonathan
 Corbet" <corbet@lwn.net>, <x86@kernel.org>, <linux-doc@vger.kernel.org>
References: <20251031154225.14799-1-Dave.Martin@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20251031154225.14799-1-Dave.Martin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0118.namprd04.prod.outlook.com
 (2603:10b6:303:83::33) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA1PR11MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c24c364-dda1-4a5b-2bb6-08de28545942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0hsYkIvTXVJcU5tUWVsMkFkbFpYSWNZL0ZQNVlFT3BycUhJRUpmZmZSeUdp?=
 =?utf-8?B?dUlNY0IrVG1tem82eTFneFBNVXE0THBBYWJ3VHdkcHBrdzB3QjJMT2tVSG9H?=
 =?utf-8?B?WWRoVzFQK0dRaTlRWTVvUEc1ckZrbjN6ODY1bFJjUHBaMjNtMm40RTdScVk3?=
 =?utf-8?B?dlUvU2UydnBVVm1iTEJkRk1lYXB4bFdCYXNqaG1hamY4WkNzWVlnUWZTZVhz?=
 =?utf-8?B?MVVBQm5Oak9UbEtQTnJMdHB2d0FoVDh0Nit1Y3VvMVVsQm5oNzNHeFY2NVQ0?=
 =?utf-8?B?VEdxMzhubVczVCtnTDlNdmx1MEtvR0RmUG9RaWdhSEpoZXUrbm9ieERNK2tX?=
 =?utf-8?B?dDE2eExONVh6cmtJbC9nRzlyYlY2cThjclE0R0xBYy83ZnBibWpRbHN4TWtR?=
 =?utf-8?B?RjkwNDBadkxBUWJMNVIxUGJuTXVoaTVjVUJyT2tyVFdVdGlYMUk1SnNUemk4?=
 =?utf-8?B?SjkrMUovb1AvR0FKeTVFRUNWR2RHRldUaTNFcHBhRWMvdUs2eDh0RUZqQWNx?=
 =?utf-8?B?QzFyTDV2T05pYVRJendBMjM4MjNrNDBVQVpYamZLN3I4YTRVQ2haSGhHSXNl?=
 =?utf-8?B?dFhQRnFkRko2Rm43b1U1NEVTNFNhcXI2TUVEN2trcWZoNHZrYm5oWmVUMWk4?=
 =?utf-8?B?YlZldlFTUzVpYTZUY3RxUHUrRmFPOTZsN2hjNzloQWpoeGNJQkFWVnRqWUdT?=
 =?utf-8?B?VkpUeC9hdEk4eG9NZVIzUkdha1dGTCthcjJHa2xMVERvcWlBeEZSOWQxZTdL?=
 =?utf-8?B?NmdRVmFtbTllME5kTTVEOU9UWEZJQlljMzB5dlFlbFcrRXNNVUgwQTVHc2pF?=
 =?utf-8?B?dmw4c2pOeW4wWVYzUHhqbEVnTE1HZWNMVmdoWXBjc2x4Rm1oZ0J3bk5rdStJ?=
 =?utf-8?B?SUxrWWcwY29HV2dKM3FVeStYOUtBRGVGK1hBL2ZQbENBWFdCcExuREFGazZy?=
 =?utf-8?B?MmlvR0k5WnhxelBMQzBNNFhvamR0R0F1ZDBIZm9NWVoyREp3ME8zeHZWNW5z?=
 =?utf-8?B?bTRHTnR5c1kvSGtjL3R0Q2tLVlhLc1EyZTV6TFNaRDZkcHI4eHNiaUdDRis5?=
 =?utf-8?B?VUphbzI5clJnc3UrMTNlYTZFZlY0Q2hnTDYrTVBLT0k2U1d5QVA4VXVQNjVy?=
 =?utf-8?B?UVNNaWc4MDA4ZC82OXlBc2NuMEpxbU9hSWdDdWFjRW4rZngxcEpJaXMzVkMz?=
 =?utf-8?B?WnlISFRwUU8vVHVsNFRmZ3haS2wwOWd5Wmd4WURJeTJZZ1VYU1Q4dXNrS2FS?=
 =?utf-8?B?ZEJ4Nzgxb252ZkFPVGkweVBPanRsU0xvalZJNjdITjl5Rk0rWlNKaDNXbXRD?=
 =?utf-8?B?UFpGcVc3SWQ5UHRpdzF6TG43dzE2c2xYNitBQ2hLU3FpalZ0U3dEVzBGVTM5?=
 =?utf-8?B?c2gyRzlRdmpMckVMZjVTa2xhODBxRjVBbzQ1cEpmRFl5WVExZTBZd2ZPd3Mw?=
 =?utf-8?B?a2FFTXN1WlExYmxZTGJXVUx5SFFYc3ZvRzB6a3dtRjRpK2RkTkF0TzJCZElt?=
 =?utf-8?B?NS9lZXFXTVY4SUdNOTB0TmRVU1ZBOWVXb0Zob3RGVURubldvaGN6MDZBL1lU?=
 =?utf-8?B?RWpZRkVrUE8wc0w5SDgxMzBYQWdxRmFHUGVCS0U2M0xWS3BiTnRmRERIL25D?=
 =?utf-8?B?MHViblR3d3ZQaS95bGp0MXNGUmdkTmxtK3cyRUV5Nm1RL3Nyc0VoRGoxeDZi?=
 =?utf-8?B?U252WFBIZGNycEtkZVNlQXN1b2pOTkNuZy9nRFIzWFBNVHVrMVpmdEl5dUdt?=
 =?utf-8?B?VHRqK0xMRjJhQUg0TXU0RFA1bG9JTmhRUGhaNUFRL3ozRnJmRHZIWVJRMXhT?=
 =?utf-8?B?YlJHOW55SkdXT3NzeUxxZkZaVnJ6bUFac0pUU3c1QmJSaE5LMThka0ZJL1JE?=
 =?utf-8?B?MkU3Q1NUOW1GTFhVYkR1QTJiWWFlOVVzUVpwbC94S0FxK0RqOU9SL1JuMFBy?=
 =?utf-8?Q?8NXRf5fJuNKxMMbTkrgKrwPQNzOZMsuW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW51TTJrNkJsV3dGc0p2OGRLT3NpYTNNaXpObXFvekl5cmlIOStpWi9FNWVX?=
 =?utf-8?B?d29hR2djN2JIRm1xN1BhWlJnSjBGM2tZblpaOUFiMXhhalhvenpQMGZ3TDJM?=
 =?utf-8?B?engwS1VCQmdaRUlScGVYZ1IvWUVXR2tnM3U4SVA5S0ltcmp1a3d4NFdrZG9x?=
 =?utf-8?B?THpCbFhFa0NjODJ6VjB6UWo0eGhGdjFtQ1Jab2dabTNVdVAvQnJTUFdKRk1v?=
 =?utf-8?B?R0pjQUdqaWF5ZGN0bS8yUW5kK0g2Q0ZMNFlJcGFUcUVHY1RDSUMzNUtSOGFt?=
 =?utf-8?B?aDlWbkpOWlNVOFZtTUFhenZKK0E4a0xoWTdTZzRxcW83TURoQkF6YUJWWk5u?=
 =?utf-8?B?VmFyVkNKWm5wWGJuVG1lM3lFMCtVY0R5SDFuWGpZWnhqbHYwYUdnY1J2STJP?=
 =?utf-8?B?K3NjaTdnTDg1czJEMFA5Z1ZwQjlMbWJFNlNHeGl4bEVpSndxNE42emdRWWcz?=
 =?utf-8?B?K21UcjN2UmdyZTlkRWpGUGI3ZHFldUtBbU5qUmFtbS9yN0xkTm0xNFpoV2Vs?=
 =?utf-8?B?OUlWaGRDendzRFNJWU5BaWRsaDRScjVxa0hpMExRTXZiQWZhOG5aQXUrR1RM?=
 =?utf-8?B?SkpWN0E4ZU5BUDdSV3pZaHJKc1VoeElLZXI0SVBvOVVsVWdNSVd5YWhWTDY3?=
 =?utf-8?B?TnhCZDJSenRYaGhzdFNKQmEwVWVWZTFKZkxwRWRzY3FKQTFWTjZaWUpqd29M?=
 =?utf-8?B?QlR0b2NwYkp6TDFYa2g1S3ByTmlBeXY5N2hpWll6Wk9kN2FJWmRhZG5RZGFv?=
 =?utf-8?B?K2xSNlFRV0NWdjgzT2dvK2VOWWNVSEZIb1lUM3VmZ1ZtWFFBOTM3aFhjaG9C?=
 =?utf-8?B?QXJpRnhtbXNnWXBpUmZnRFFBS3pxblVPbVQ0b05xSEFEZmJtM3ZOSXJweEtt?=
 =?utf-8?B?Z2lCMlhuNDVaendUMUkvSlhMTFNnb2MyUXBaaWZhcjZNaU8yY2d1cXJVcnQ1?=
 =?utf-8?B?enRuUjh1ajViUFBVR3krUjZkNTQ0eEFGS1dLZ1lDRlpZcE4zZ2xzaGM2QXFV?=
 =?utf-8?B?aWE2SEtMVkR4UmNmUVc1SFE1UjlMcGhuTlhYYVpuQzhJTWFKRTFHOVZ4Y244?=
 =?utf-8?B?bHErTUhlNnR3SDIvckZ4NjdoU3htSzJYSHMvb3NqSWlYa3RDbGp0OUNiV0Iy?=
 =?utf-8?B?d000czlRVGF5c3ErUytwNGVsdFRzMEp6WU5udEdyYnpodFYzZFdKcmppSDJv?=
 =?utf-8?B?RWhyekhPQjhPaDBPWW82cjdFZmdLZ3FubXk1TnlISmhqMHpMV1c5Z2xkODdK?=
 =?utf-8?B?TzE3UTlTV2FjZmJWa3VYN042VnBmUGpHaFlCL1FjcE1qU1k1VXdvTFZrK25z?=
 =?utf-8?B?Wk1leVg4TnhyNy9NTnBEYWpCUk5VS1pDaFVCeWYrTWZkZlFCdWs3MWJ6RERz?=
 =?utf-8?B?a1dMWWpFUjdWSEpPTnpFKyt3TUV0U3FiTENRZ1V6elJHUWlWM2NVbklYREZu?=
 =?utf-8?B?TURORTV3L2o1NVRYQW1sUzVKbjZsSUFwWThjVGdUSGVGRHRMQVI1NmY1MXVJ?=
 =?utf-8?B?MjFrSGxOZExKVVNKb3dOa04wcHkwZyt3NklVZHJtRytDb0RXME40R08zQ2VL?=
 =?utf-8?B?d08xc2dYQmNSR1A4YVNzekZyZWdqZkVGTVlIeFFIcVc5d1E5VVhEVytrcEdO?=
 =?utf-8?B?Tkk3VjZTK0swTUNRTUFRZWU4c1VYc0ZtRVFhQkxUdUIrQVhUZzFMeG1tbmgr?=
 =?utf-8?B?cEFvT2dQdlZ6WjFaSWFTNmwwTVVlVHk0M3VCVnllTTdtbSszRWxUMDUyM2Na?=
 =?utf-8?B?dUM2QU1xMTBGT2RmcWg2Ny80TndjN29uWGExb1hqWEVLbEo2UDdnRndHZGRz?=
 =?utf-8?B?Mm5OL25yYWU4RHg3dm9qT3UyclNNeU81NE01SnFCOG0zdTRoZ0trRUNKWlQ0?=
 =?utf-8?B?aDJhaVVSSnRpRkMyN090YWdWc0F1OTlNRjhPN1pCUjNHRGZ1dWltODlhRUpM?=
 =?utf-8?B?ZjU0M1JFZXpxR0c5bW5mV3RZaUNNRC9LaitlWE9HZndHK1VFQkNGUGVObnhW?=
 =?utf-8?B?R25IYWVjbDNUWHBOUkNZOFAyQmZwZTBLM3c2UG5aeGcvaThQYU5DVmhlN1J0?=
 =?utf-8?B?T1hJTjcrSGozaXZrS0ZBU3ZralgvRWhzbWVQdnYxb2RwT2paSXRPOWFyNWZW?=
 =?utf-8?B?NitXNEF3aXBXL21RMEUxUGNCMXRFZ2R1NHZOVmtTajZPQXZKTXUxOEVuMHNY?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c24c364-dda1-4a5b-2bb6-08de28545942
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 16:46:27.6038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GwyM0XdQqRH6wADGIEVGh3kjhP6RwmVKXpD0YJBcTJxUUJOCYqQmIK5tzeSrf2A4C7DphHALd10c3mIPDO9mm8McQc0jzxK9MWvQQHLZHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7272
X-OriginatorOrg: intel.com

Hi Dave,

On 10/31/25 8:41 AM, Dave Martin wrote:
> The control value parser for the MB resource currently coerces the
> memory bandwidth percentage value from userspace to be an exact
> multiple of the rdt_resource::resctrl_membw::bw_gran parameter.
> 
> On MPAM systems, this results in somewhat worse-than-worst-case
> rounding, since the bandwidth granularity advertised to resctrl by the
> MPAM driver is in general only an approximation to the actual hardware
> granularity on these systems, and the hardware bandwidth allocation
> control value is not natively a percentage -- necessitating a further
> conversion in the resctrl_arch_update_domains() path, regardless of the
> conversion done at parse time.
> 
> Allow the arch to provide its own parse-time conversion that is
> appropriate for the hardware, and move the existing conversion to x86.
> This will avoid accumulated error from rounding the value twice on MPAM
> systems.
> 
> Clarify the documentation, but avoid overly exact promises.
> 
> Clamping to bw_min and bw_max still feels generic: leave it in the core
> code, for now.
> 
> No functional change.

Please use max line length available. Changelogs have to conform before merge
and having patch ready saves this work.

> 
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> 
> ---

...

> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index b7f35b07876a..fbbcf5421346 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -144,12 +144,11 @@ with respect to allocation:
>  		user can request.
>  
>  "bandwidth_gran":
> -		The granularity in which the memory bandwidth
> -		percentage is allocated. The allocated
> -		b/w percentage is rounded off to the next
> -		control step available on the hardware. The
> -		available bandwidth control steps are:
> -		min_bandwidth + N * bandwidth_gran.
> +		The approximate granularity in which the memory bandwidth
> +		percentage is allocated. The allocated bandwidth percentage
> +		is rounded up to the next control step available on the
> +		hardware. The available hardware steps are no larger than
> +		this value.
>  
>  "delay_linear":
>  		Indicates if the delay scale is linear or
> @@ -737,8 +736,10 @@ The minimum bandwidth percentage value for each cpu model is predefined
>  and can be looked up through "info/MB/min_bandwidth". The bandwidth
>  granularity that is allocated is also dependent on the cpu model and can
>  be looked up at "info/MB/bandwidth_gran". The available bandwidth
> -control steps are: min_bw + N * bw_gran. Intermediate values are rounded
> -to the next control step available on the hardware.
> +control steps are, approximately, min_bw + N * bw_gran.  The steps may
> +appear irregular due to rounding to an exact percentage: bw_gran is the
> +maximum interval between the percentage values corresponding to any two
> +adjacent steps in the hardware.
>  
>  The bandwidth throttling is a core specific mechanism on some of Intel
>  SKUs. Using a high bandwidth and a low bandwidth setting on two threads

The documentation changes look good to me. Thank you.

> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> index 1189c0df4ad7..dc05a50e80fb 100644
> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> @@ -16,9 +16,15 @@
>  #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
>  
>  #include <linux/cpu.h>
> +#include <linux/math.h>
>  
>  #include "internal.h"
>  
> +u32 resctrl_arch_preconvert_bw(u32 val, const struct rdt_resource *r)
> +{
> +	return roundup(val, (unsigned long)r->membw.bw_gran);
> +}
> +
>  int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>  			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
>  {
> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
> index 0d0ef54fc4de..26e3f7c88c86 100644
> --- a/fs/resctrl/ctrlmondata.c
> +++ b/fs/resctrl/ctrlmondata.c
> @@ -35,8 +35,8 @@ typedef int (ctrlval_parser_t)(struct rdt_parse_data *data,
>  /*
>   * Check whether MBA bandwidth percentage value is correct. The value is
>   * checked against the minimum and max bandwidth values specified by the
> - * hardware. The allocated bandwidth percentage is rounded to the next
> - * control step available on the hardware.
> + * hardware. The allocated bandwidth percentage is converted as
> + * appropriate for consumption by the specific hardware driver.

The text looks good but adjusting the right margin mid-paragraph seems unnecessary?

>   */
>  static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r)
>  {
> @@ -69,7 +69,7 @@ static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r)
>  		return false;
>  	}
>  
> -	*data = roundup(bw, (unsigned long)r->membw.bw_gran);
> +	*data = resctrl_arch_preconvert_bw(bw, r);
>  	return true;
>  }
>  
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index a7d92718b653..1fb6e2118b61 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -485,6 +485,20 @@ bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
>   */
>  int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
>  
> +/*
> + * Convert a bandwidth control value to the appropriate form for
> + * consumption by the hardware driver for resource r.

When being as descriptive, please switch to proper kernel-doc instead. There are
a couple of examples for reference in this header file.

> + *
> + * For example, it simplifies the x86 RDT implementation to round the
> + * value to a suitable step here and then treat the resulting value as
> + * opaque when programming the hardware MSRs later on.

This "For example" can be dropped.

> + *
> + * Architectures for which this pre-conversion hook is not useful
> + * should supply an implementation of this function that just returns
> + * val unmodified.
> + */
> +u32 resctrl_arch_preconvert_bw(u32 val, const struct rdt_resource *r);
> +
>  /*
>   * Update the ctrl_val and apply this config right now.
>   * Must be called on one of the domain's CPUs.
> 
> base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa

Reinette
