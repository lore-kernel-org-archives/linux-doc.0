Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187751A3BAD;
	Fri, 20 Dec 2024 23:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734738472; cv=fail; b=ih9tPvKaQ1Up90Gu6CQSYz5OamBzz8wz5Ik6HeAcdD/Gb7PuUiJX4cui3yHEwyUjmtlqjzluI4YAOUM4p7PkBIhHUMNtCOFbMiIQ4TZ68XcO2IKCxc7oFhw0W885UrELiFwX7ry/W9KNTsb4ANsMokwCx4+krJ1D6e8LpQeWV2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734738472; c=relaxed/simple;
	bh=BbMSqLvZAdtyoUg6J6s+KwemnKa/24p/1N4X4okJceA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fR5wilOlkleKCDEgsVqTk7TSgdb6pHfuAUh+D0S2z8xhTMLZ58+tI2fi2lKpRFhoeKZwQjdTHkJoleiOaOLHGZD20kWwvz/Exn8i/z1YWQ1rnMm/naHbNa2Swf5PeJVHZclLRG3NHVFXsQZrhaho0wN1cGVV1KHMOixelM4NgoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Av5EsbtP; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Av5EsbtP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734738470; x=1766274470;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BbMSqLvZAdtyoUg6J6s+KwemnKa/24p/1N4X4okJceA=;
  b=Av5EsbtPGqvWpyZJ0tOchrC9GlDel5+Xpg0gZx03Fbzb9K9soRxe0uje
   WgIm/TqUh0+yWsTkY1e7LVNv8evll/z1sx6Pp1S0f00G1IOM9MVsjFdp+
   28CA5PFyknJCAIEbUkWVqZCMeNmlwFSmSvs3a3zMqvacj7n69qS0OHKjA
   mSzLLevNx2zYnku1eFyCdQtS9hrHVqUpv6nuIRFkAjAhcYBlt/s92RHzN
   ds5C+MfJKQL5gZtR5ZNHO/6DtLxt/9Af3hOTqIihdIUZsK89uY1mdv+qp
   bX/taPA9+14VQXyVsv3MZjMt3h16URy6g7zE6N2J6jOpvttr7yQenWTuF
   g==;
X-CSE-ConnectionGUID: 6OH2dwMqTdaitOdj1bYHsg==
X-CSE-MsgGUID: 51i9xSQmTLeEaVlE3Mzbtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="46717171"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="46717171"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 15:47:49 -0800
X-CSE-ConnectionGUID: efgbIlVuT8yU9NYN2ubm0w==
X-CSE-MsgGUID: 8uo9SjmwSTK8ZMEzSrYUWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103630936"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Dec 2024 15:47:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 15:47:48 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 15:47:48 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 15:47:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2RVnhI5b0rOo3ynY+gKmUEwwAa56iB8BP+epR/txe4DE7ADL2xUVqY7948U1h9I3C0nxE9VlEEEZ1+ko1uFKP/Jt3eZVgPTZyezPHe54Rkm2fzDT5OnF/It9BEvOuotZzTvvo3etLPL5vrIAo1j6jEJPYY3z+9g/Wm+TvWJPM13H9gfYrdlTXoSgScVvhAjjWyChm1D40vakF4XUmi8GtZJv/UxdKxhYCqAknI3ydTAk04R0o+4pqd1vuBBoastKZ28bMQJRWcBkQR1nqut6C09kXM36t/ti4kg1f01HOCP27moxHpOEJhCmruGDzxoPE1g0LwfJfEYepzoG1qWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLyLtxPVDGwmObxmIQkga/ck3YI5ol0Yts/MwGbrZ7U=;
 b=HwqjDUBJ3qw7iTaehAK7dzoQNqDhoELB8yBh/qLIYE+41ON6XcHIVKba6rUsxNA8VHh5pcydF0FM12VE+v93NrGI+ZkLLnk2okfS6NQ8ATHDq0Af9j3NZ7+lAQAnotgZCMNJgEZ58y/MxUrJp2Po4zTMuPLMtT2x2xxwUsSEJmbWhZ/C1ttjVUrNtmvbiSaqxh8/5lpTEKN1USRge8OZq6vubZjvQxbl2TixR9X3l8li63ZzdKR8Fch4pmu3jTUYy6wN8auNrGVaszYx6J9YryIjfHe86gL4OWHylArGf9pWLSuX+vbY2+Q3YPrewSUCb9vgWXrx7ZpjRx2fdlyNhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB7494.namprd11.prod.outlook.com (2603:10b6:510:283::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 23:47:46 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 23:47:46 +0000
Message-ID: <08f3d2d7-06d3-4dfc-97ef-5351e93964ec@intel.com>
Date: Fri, 20 Dec 2024 15:47:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/24] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
CC: <fenghua.yu@intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<paulmck@kernel.org>, <akpm@linux-foundation.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <perry.yuan@amd.com>, <sandipan.das@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <seanjc@google.com>,
	<xin3.li@intel.com>, <andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1734034524.git.babu.moger@amd.com>
 <9f74a647d9ff929f040c57e32e253ac824d12086.1734034524.git.babu.moger@amd.com>
 <d6bc8c3a-932c-4bb2-8bb4-b44b05baa9db@intel.com>
 <a8b7c71d-b501-4efd-8e79-db14f1704aa6@amd.com>
 <92bd670e-7d06-45c7-ad3c-e52f67e53210@intel.com>
 <e800c0d1-fad7-4388-93ce-0a7a58c4d340@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <e800c0d1-fad7-4388-93ce-0a7a58c4d340@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::12) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: dbca307a-874e-4368-9916-08dd2150b430
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGxNeWZRa25ZU1Q2dFFWUU4yZ05SZnpZakVZM0wxcC9JRnJQcjFnVVlQcjNp?=
 =?utf-8?B?MjhrNW95WnhuV3FBNkR2Z0dnZmtpNlBKdXQ0aXczaVJMY2w1R1FKWFJJd3JM?=
 =?utf-8?B?SGpFWTVxQkFoZ2N4L2doUkx0aHhYL2ZESkZjUHovekxkZnp2SmZiV0kxOUtv?=
 =?utf-8?B?S0JWYXNjbXcxbjRFV0U2TE9vQWpTZVVDcXpIeEErRGRSVzNnbzBEb3BDY29Y?=
 =?utf-8?B?SEVhVDNHaHM4TVhESzl3NzdEZk9kODhjYW1tbUg4MkFvTzNxQUdkNFdycXNs?=
 =?utf-8?B?ZitXemtqM0F4QzZnUDdpZnp2eUZuMTdhOXpDTUJIbGdRTTYvYVdtdllqZUNO?=
 =?utf-8?B?REJnTHYvZThhMUNlQW8xQU9WRXR3dFRKc2RWM2N4RE9qRTB3ZzJ5MHBNR2xB?=
 =?utf-8?B?SEJvNVY0eDBCdXV4UXJMOHF0MHROUHQyLzdnMW41NURTL3JORDYvRkd2YWJE?=
 =?utf-8?B?SUJBTFJyRnJrQXBLb2dNTy9MODRkL2RTK3VIby9taXkxU01oSFVkbHhMYTRB?=
 =?utf-8?B?UHA5Q2M4bnR0Z0UyMzd1b1NZaElGdVo3a3ZvU2NrdlhQV3l4KzNzYnBmbFEy?=
 =?utf-8?B?UzdjdUg3RGtqLzRMdU1YMTVjeFBoTFhjYndHaCtGQzhiaXJDODAya3hITklu?=
 =?utf-8?B?K3lUaEtHNGI4TkZzb05NNTZUb1RpL3RPeUtOc2FVVXlrbUhoK1FENXYzQzUv?=
 =?utf-8?B?RVRrUVFIRVhSeFhiczA2Q2xXV3FsMHU5ZzFpdi9xTTVXRFhxZ3dhY21LcFgy?=
 =?utf-8?B?QmJFM2UwcjlUNVdVRmpNN3JqVjBZU2ZjZE5RYkllVklFN09OQXNxbFJyMit3?=
 =?utf-8?B?aTVQcUcyL05uTkh0dE1UR0h3RHJWWHRXK3RwTzhIUlZSOGZoaUZMRDBJMEp2?=
 =?utf-8?B?SGt3ajFsOWoxZnFxdGVvVzYxSDlCSmF1YzdPcGt6SElZU3lyNFpZeTAvQmF5?=
 =?utf-8?B?dkZSaU40a1VMVTdtdWdFaE5BRXdLTksvS0NtQU9xTTYwNklrd2sxbXFNdmlB?=
 =?utf-8?B?bUh6WmZ6b2VJYjZSWWZxeU5PTVpEcFRxU21kRlN0Y1I2MDg3UHBQcUxVdElJ?=
 =?utf-8?B?UVZjZXFKUzh5eGJ0QTFlNE04dFlRcWlQdmlVcXF1ZUhVMWhQRnkxQnBFZ0ZG?=
 =?utf-8?B?b0U2WWJlNFZleUlBS09CVlpmeHU5UUJISmxGTmo2MmJ4NUNkUWRWTkpxVmxv?=
 =?utf-8?B?ZWphRXp6WTNldUVydG9QRGsvcmJTclhpVTBTcDhvcnV5NTVZdWxPT0x6NEl5?=
 =?utf-8?B?Vk8vQ1QwSGdzYnVFT1FoUW44Zml4UzhCQXRlbzBVNW15WGZnd3JHR1FVREJS?=
 =?utf-8?B?TTdEQXgzQjJ2SURpeEIwQ0JCT1BobHBHTVR3ZHBpVmVYcXZPUDdsQVJzYTcz?=
 =?utf-8?B?NEtlcFNzenlLa2dQajMxR2FxSTR6VW9xRjR5WFZCNUcwZXFmZWhwRCtJWGZM?=
 =?utf-8?B?b0ZSMTJTMm9ZaENka2s4aktQaVRuMGZoV1dCeUcxOHJxUHJaUHFuangxaFB5?=
 =?utf-8?B?VFlFOTBwQ0Y2SjNsUytTRDlaeFpDWlkwSENBU05Fc0MyYXJYb2wwZEFVcEs2?=
 =?utf-8?B?WW0xeXJHT21QdGxjcWNyK2wxYW9KaURGNE9DdzNLb3ZpV1NoNkZ0MzBSeXQr?=
 =?utf-8?B?Z2FDSTcvdXZEMm5aaG5Rc202QXpKQWxFSmsybUxPaE5mYjJEMnBwcG9hbExa?=
 =?utf-8?B?YnhrQUw3TExtOFI4OE8xQVVEcG81MVRySFFPcDUvWlUvT29aczNtZXhhTHZC?=
 =?utf-8?B?dzBJSlhtQVBJM29FblAybXNYeDdobk94OXpRM3M0NXpTeHAvdmNwb2pCbjRE?=
 =?utf-8?B?TkRiYlhXRXhSYzloRS8zRU8zc0VhSUFjWDJLOEF3d0JYQ3M3azd1NlRSVGJl?=
 =?utf-8?B?TjMyNkk4cE1jbXU4Qm5zeEtiYkNSbjZpV2NQTUpFcWQyTEIvUmFLaEVvVXJS?=
 =?utf-8?Q?YWNdcXmjmlA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUlOSFBQcWV3ZjlyK2tYeDhnZG1XN0VlQnZIQkphTmh6S05XMk9aVVl2bmdm?=
 =?utf-8?B?MG55VzRqWkQ0WWFhVEt0eFlKV0pwVlhVVStMYUIxNHE4MjkyUEdjRUxzbzNu?=
 =?utf-8?B?dXIwK1lQcTB3Mld5Uk5WKzdaTlA4ait4Yy9RcmJ0bWlUSUpNYWhWS2NzQTVB?=
 =?utf-8?B?QldxWXhzVDRRUW1oTjFZeGdwOFRZTHJuYUFwSjhCZnJoSFRRbVJrR2J1Y2hy?=
 =?utf-8?B?M2M4dE9SZWFaTXFyMFUvYStOTzJPdUNXWmdMaHAwSWJUS0NCbnFLaWFGam85?=
 =?utf-8?B?S0h3dWt5WGF6OS84dWdGd1BTS1orbUI1MWFnNW9CQUhZVGtCYVZCb0J1TmZ6?=
 =?utf-8?B?WHJ3SklqQU1FOHpldkJ6OVRodHpVU3czOWtQQVVib0hwQkFaVzhLVG94NDF4?=
 =?utf-8?B?RDVSS1RLTm5RL3JiU3lhQUc3Qm1oWmJDTDhzaWl3UzVBTmNrTnkrZjBndmFJ?=
 =?utf-8?B?YnhSemF1aG5zajl3Zm9pL0JLOVZpTFhIci8xNlQ4a2w1M21Sckh3R09TQ0RV?=
 =?utf-8?B?Q3ZRbFp3bGc5QU9uWXA0K0dod1AzcEFYMTRkTVBsNDlDcDlpS0YrNEIraU4w?=
 =?utf-8?B?aUhjUGJicVdhVWVVQnJucmZnMitsS00xekQ2VkJpU25nM1V0V3cxbEV3TjR4?=
 =?utf-8?B?ZGFBdmZsMW9rMmZyVkFPRE1tMzlORW9xZUNsc0pMZDROWFlLcGI3YVQ5U1dx?=
 =?utf-8?B?MnNEaVU4VjgwNlhJM3l3SzRoVWpuSExwNGpxdzB0ZEdrMkdlTVlRWHh2d3ov?=
 =?utf-8?B?bGI3akoyTkJIWENCZkxPQ2dxUzRaNVkyWU1KQVEwRGNERzNFK2tLZUdSaXlH?=
 =?utf-8?B?Nmo4QWxndWVqWGx6MHdKaHZOcjJ3M25ZMXdqWUFrdjZ2UW1NK2ROa2Evc0xF?=
 =?utf-8?B?ZHZvNTl3cmp0ZkJxLytFZmVCdGlybm9oaENOT2RMMW9DNUhYR3V3V0NrMHNw?=
 =?utf-8?B?WW9YL1k3OW9qdGVQUHJaRWIvdjBQTzRuVVQvTDVBd3BUUDZmdnJMa2Jwajhy?=
 =?utf-8?B?cXJxOEIwSFFPYjNBTWdGUG5WczZPN2s1UHAzdTRIY3F5SDJMOWZiQm5RZW1Z?=
 =?utf-8?B?MC8yTGNLWEk5MmhaL0Izck1ETmNiMUVXL1FMaUkvUStuSkl6Yk5CWnYvS3Yz?=
 =?utf-8?B?dUR3aVJSdkc0a0hyNXk4S2drWVB0dnpUbFNMdUNmQUQ1T0xmc2o2SUNDTkJh?=
 =?utf-8?B?RURTa0VoTEthZmFTSWpCRVJlK1FXMGp2NjJiVmJod1V2ejhLbzJxQmZhMVZq?=
 =?utf-8?B?Q3VnRlh2VEdsaWtIb0JyVW42OUFTZllVdktBSldEN2RTOVZvdzVFcVNqckVQ?=
 =?utf-8?B?SUp1dk9jVm1vcFg0MkJlTFFKMm1TSS9PWUwwNWR0amlUWkFHNEJIS1ZkVGho?=
 =?utf-8?B?RXl1S2lBZXpYNU9CeWNVUWJ0RFg0K3JMb1BNSUgwc1loSVI0M1o1UW9GMEd4?=
 =?utf-8?B?UXp1NTZnNHE2ZGxuT3c0dk5ZWU5mQnRTR1hxbkJsY2JmUmV2UGIxM0xuRHBQ?=
 =?utf-8?B?M216MWZROVg2S2xnZW13dEJzRzJqSVJUMVJTTEdBYm9WOE1rN1czL2FyNThv?=
 =?utf-8?B?cEhkQzR1M082V2RBRWdYYVBxNHF6OGFUc0VjRXVxZm9MSUFFNzVGcVVFQWJP?=
 =?utf-8?B?b1RhRG1WbGJlRE1hV1k1dEZpcmY5UXRxZEF3aFgzQ3pCR2d3WkpTenduK0RG?=
 =?utf-8?B?Y1hFY0c5bksrdTlDeG91SWptbXYwcVIwN0FvanZOdWJncVNtU2hhQlhKWU9w?=
 =?utf-8?B?WXgyVzZEcy9vODhEK1VTeGdrbkdaK01GRG5QM0ZQcnFBV1BJMUd6VjdIMXl2?=
 =?utf-8?B?S2tsOXQwVEJjQkJIK01xUVRFblRwRWIvM2xDSHhYMWx1blRyY0laZHJnbWN4?=
 =?utf-8?B?RUw2RE94VGo3cUpJRTZ4akhCYmhKZWVvdlMweE9HSmhSajV4Uy90by96Z2Ux?=
 =?utf-8?B?eW5nOU8vY3FXNmNtdXhaaG5MazhOMCtqYlhCNHVUVVhUb3ExOFRBdXdUWlJY?=
 =?utf-8?B?T1dWZXNTVis0N3B2WGIrcEdqdEUydW1Ud3NOeG05dXpYZE5iZ2FldEFhbnhB?=
 =?utf-8?B?TTg4djdLMEladmw4RzhZSU9qSUxZb0xEZkd5SituZ3lDNUhDQ0xyOTRRM0JM?=
 =?utf-8?B?TTk1RGpScThKUWlZSm1vb0RBQ0d3K2U0SldEM2lqWGo5OGVFemJIaFB3NkZ6?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbca307a-874e-4368-9916-08dd2150b430
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 23:47:46.2162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArAXEyqqxiLMWeq1eWU/hWZ76HmhqacoNsFA0hHuWASnnhFAQJY671kRnsSDpdcKTy9+4IDFgTy6gSb51Kj/zgyJ6Y1ZnepgfCmoONeUwN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7494
X-OriginatorOrg: intel.com

Hi Babu,

On 12/20/24 2:28 PM, Moger, Babu wrote:
> On 12/20/2024 3:41 PM, Reinette Chatre wrote:
>> On 12/20/24 11:22 AM, Moger, Babu wrote:
>>> On 12/19/2024 5:04 PM, Reinette Chatre wrote:

>>>>> @@ -1686,6 +1686,34 @@ unsigned int mon_event_config_index_get(u32 evtid)
>>>>>        }
>>>>>    }
>>>>>    +struct cntr_config {
>>>>> +    struct rdt_resource *r;
>>>>> +    struct rdt_mon_domain *d;
>>>>> +    enum resctrl_event_id evtid;
>>>>> +    u32 rmid;
>>>>> +    u32 closid;
>>>>> +    u32 cntr_id;
>>>>> +    u32 val;
>>>>> +    bool assign;
>>>>> +};
>>>>
>>>> I think I am missing something because it is not clear to me why this
>>>> new struct is needed. Why not just use union l3_qos_abmc_cfg?
>>>
>>> New struct is needed because we need to call resctrl_arch_reset_rmid() inside IPI. It requires all these parameters.
>>
>> Could you please answer my question?
> 
> May be I did not understand your question here.
> 
> We need to do couple of things here in the IPI.
> 
> 1. Configure the counter. This requires the cntr_id, rmid, event config value and assign(or unassign). This is to populate  l3_qos_abmc_cfg and write the MSR.
> 
> 2. Reset RMID. This requires rdt_resource, rdt_mon_domain, RMID, CLOSID and event.
> 
> So, I packed all these in a new structure and sent to IPI handler so that both these actions can be done in IPI.
> 
> Can this be simplified?

This is all architecture specific code so I think l3_qos_abmc_cfg can be
initialized once and then passed around. Bouncing the individual members of 
l3_qos_abmc_cfg through struct cntr_config seems unnecessary to me. More specifically,
would it not make things simpler to make l3_qos_abmc_cfg a member of cntr_config?

>>>>> @@ -1869,6 +1897,36 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
>>>>>        return ret ?: nbytes;
>>>>>    }
>>>>>    +/*
>>>>> + * Send an IPI to the domain to assign the counter to RMID, event pair.
>>>>> + */
>>>>> +int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>>>>> +                 enum resctrl_event_id evtid, u32 rmid, u32 closid,
>>>>> +                 u32 cntr_id, bool assign)
>>>>> +{
>>>>> +    struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>>>>> +    struct cntr_config config = { 0 };
>>>>
>>>> Please see 29eaa7958367 ("x86/resctrl: Slightly clean-up mbm_config_show()")
>>>
>>> This may not apply here.
>>>
>>> x86/resctrl: Slightly clean-up mbm_config_show()
>>>
>>> "mon_info' is already zeroed in the list_for_each_entry() loop below. There  is no need to explicitly initialize it here. It just wastes some space and cycles.
>>>
>>> In our case we are not doing memset again.
>>
>> No, but every member is explicitly initialized instead. It may be needed if
>> union l3_qos_abmc_cfg is used as I asked about earlier where it will be important
>> to ensure reserve bits are initialized.
> 
> I missed your comment on reserve bits(Searched in this series). General rule is reserve bits should be written as zeros.


I do not think I am being clear.

Back to original comment: resctrl_arch_config_cntr() zeroes the entire struct and then
initializes every member. I do not think it is necessary to zero the struct if
every member is initialized. If you want to be explicit about the zero initialization
you can do so while initializing the struct only once where it is defined.
See for example, rdtgroup_kn_set_ugid()

Reinette


