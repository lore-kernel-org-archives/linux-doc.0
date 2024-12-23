Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4469EAC5;
	Mon, 23 Dec 2024 21:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734988464; cv=fail; b=Qa0o9A2tEjxFFRKhhKiYr6NGL+kPLkrOPCTwDVezUZB1DOkfPJfK9Po+kcd/efTSBoGOOCFNAOTbMQ62cEWZwdVwJPck9xz7j7WePoOQ4yAoBfEvlOWYlycvEAPhg3WvbWkRHD4e0zBxf4knoYsjsaD/HyXMhQfzt0HebfKAqiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734988464; c=relaxed/simple;
	bh=AFPJUUkwlq7X+FgPkRGOzXjBourhJzs63ZsrXrTWc0o=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Yl4bmKeyxN0ZxTgYrGKLcb6PfXaookQIXWCnqFdJgFQflIp3LHjz3RDxZEixPQmFDyu407xO0+/E0tY1K6xafOzgwl2PGVKLQwZw1NrcMjkaU2OIprhjoyFwPzSanZn0O7Yrk287fiFb3Rxy9rmIzVHReiRqzC8UqgU904vZG5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSIbJKDs; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSIbJKDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734988462; x=1766524462;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AFPJUUkwlq7X+FgPkRGOzXjBourhJzs63ZsrXrTWc0o=;
  b=VSIbJKDsfJ+27wnYIyoWMohIZMukJSTutAmN9SKBDJiHNYpzmF2gDoWC
   iKuIpxBryNbBpFhn8Qw9lFUDqxH6+PoOib5ls6RSVSKVqGmbA6YLyI7WB
   9RtJ9pMreu55L2p91su/eDGBmGYKkYDbrXlK22QtcGltz8LkF8sd3qXOg
   3jtD5Hl1AJiAqk+fA0dBIAioiG7bxBhveQQ80Qyd9v9I7oOnBHYGR+hxG
   JymAH9vQT0Ftl0n0Mra1SEjBfEX9asecY47QvGx2FpYj5EQT8M97rfV4R
   5c/v0GXIEihj/Nam+nIY6bNRVETW69oT3YkCkcDa2q+DZ7OhGDuduivaB
   g==;
X-CSE-ConnectionGUID: n6C142wmRryndC8CZfXgCg==
X-CSE-MsgGUID: Kb4QmxGVRSm8oVqabEUuSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="57923002"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="57923002"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 13:14:22 -0800
X-CSE-ConnectionGUID: 0u+wdfEDRderk9JftbttdA==
X-CSE-MsgGUID: itpQZyRZQVSiAe+8Bx/BWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103391364"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Dec 2024 13:14:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 13:14:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 13:14:19 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 13:14:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0QekU0aRSmXJGQKlk2ynNkfbDxZ/MAiWzhSUZTf1mP2rRuM4G/6gy3KMgjzcr5lnVj4UKD+5Rp7idzhTVrZOdYbovFjFiv1dVFQ7YN/5kbTqDwlDLiEyhmcXyNoyG7dQo0gyvUZBzVRZDnfk9RfAVssTK3mcQXCjlyOOiLaF15M6wx8c1YcpPduZIixLgCfxG7NUVIMK39PaZyZEYvr+owQRBzrnQQdoOWFpbuIgXtR0XlY94gB7DE5stygVMEuE3QOKv8z0oZujQE/vGoA5wu2SxgC8gBcmNHFIca5zoyKAAw4k7RUlMMYe5X/9zExIQlDGwluS+tPAug6lsaecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09wjvH/XmSiFRbK0TbfC/PPPTxBePI1octb/vcuPrGk=;
 b=DoJCbUhVmDjmrOoIGGYnEbYwIPqmNbBMAhiFL7yAsFm6XBqpi9JXxTg2MSwmumsFUrFMKlHnY6kY0VVdSoVhMy/XXqF7NHaB4mzf/oarBuX7OK2Lrq5acDMXwkVLOF7VqOjFd990mR8Q9m+8GklBhvEBz73IjPS6zj4pdD1D+I0o+ELU2JexW7iaDvP5Jb7PQjLsygfnMomR9W0xII2wIWdInRVxZ3HR55UWVP62Mt9q7f2EMuHBRmv9D02dha+j08Y9P33szguEzEepBQF/D2LMpsx6k6D/8qhgE9A/he7T1iwLcDYz1hjJmPeDfkZ58/3JVI0OoUamp4nzgkNo1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by BN9PR11MB5241.namprd11.prod.outlook.com (2603:10b6:408:132::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 21:13:56 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 21:13:56 +0000
Message-ID: <8f7f2839-4c96-46f5-8d39-5d2a974f6fbd@intel.com>
Date: Mon, 23 Dec 2024 13:13:51 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] x86/resctrl: Detect Smart Data Cache Injection
 Allocation Enforcement
To: Babu Moger <babu.moger@amd.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <fenghua.yu@intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <jpoimboe@kernel.org>,
	<daniel.sneddon@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<seanjc@google.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<tan.shaopeng@fujitsu.com>, <james.morse@arm.com>, <tony.luck@intel.com>,
	<peternewman@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>, <corbet@lwn.net>
References: <cover.1734556832.git.babu.moger@amd.com>
 <ffcbf189201c4b79b91a2f94cfe219acdab807d5.1734556832.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <ffcbf189201c4b79b91a2f94cfe219acdab807d5.1734556832.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:303:b9::19) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|BN9PR11MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f9267f-5865-4d53-c8a5-08dd2396b5d1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWFjUnVGMUZHNUlIaEpOL2V3RHRpVjZNak1yMzFwTVNIS2RLdWlZQU5Ub1dk?=
 =?utf-8?B?TVFqcGJsS1F1N1lwTjU3cVAzMmhTY2NXLzVaeUFyTGxndHpkOURhR1V1cmZM?=
 =?utf-8?B?LzNXY3pEbFMrNkZOZzYxSkU3M3RiT01lMzZJRFRSREJHRS9NQkEwYTZjZkYx?=
 =?utf-8?B?cHVuWTl5d1NQenFjMnZBOGVPRUNtTUlDOFA0MWVaYW5ia2VVL0lpNUt4T1ND?=
 =?utf-8?B?V1dTd28xYWZwbGc2eGZ6bXpFdjBsU0Fob0dFQzJOYnZPUGtpWFJ4cXRERTNn?=
 =?utf-8?B?eXJuUTdEdk53YlFsUzBkNmNmZitVdUVQYlZYOUF2dmJ2U2FROW02OEp3L0p3?=
 =?utf-8?B?WnlTa2doQ2YvTVRTcnJCUGtPa3lPYjFqUWVnUmgxT0dPRmxjWGlSQ2VLemU2?=
 =?utf-8?B?V0UydnVGdEFTRnBwMTh0SUNGTWRhRXY2bDdKSXU3TEhucnViUWRSSXJIdnV6?=
 =?utf-8?B?N0hKVkY0akVLeG5VY2RNRU0vNHMvVkhPSzNUOGhxQUwwbUlhWFNKbDVqcjhL?=
 =?utf-8?B?QTltNUUyRXphUkdvUWE3NlIrcjhnb3cvQWw5Ui9aTngwUFFhdHJWbmVmcCtN?=
 =?utf-8?B?dTlmTm5iRUF4Q1JyU0RiN2tvNmdjUzQxeUovWGQ4amRqWXhjMERvcHhVcE5S?=
 =?utf-8?B?SmRUYlRoVHg5K2RNaEpNY3V0UnZtUVJIQzF1RWlnUFQwbkxJb2lzRGRoSTAx?=
 =?utf-8?B?czE3YWdGYm9LdWc1Mml0S0JEaStZL2tiM1RLdDlCdFVxRkl0UmZoT1UxaDVX?=
 =?utf-8?B?WHYya1RjQnVyZHpnclNMZWlYTTdYb2RnYm85VDA0RXVleXB2MFNVVi9hbndK?=
 =?utf-8?B?Y1hOcW51UGlPejZyQVNoa2lYMldDdDFKelAvVUJ2UTkwN1I0c1VJQXZuaHdU?=
 =?utf-8?B?UVY5Zm5DQXJyVTJabFJpWkUwQWRRb3lZUWRUd0pMdysyYlRPVzhvRWY4ay9S?=
 =?utf-8?B?OUhhaGswQU45MkJrbkIvUjNSbUxRb2JDa2lMVXZTZnRNWSsyOExOSTdKS0p0?=
 =?utf-8?B?cVhCT3IzQTgwYXFPWXNwZ3UxSHJUc3l3amgrbFQxdFF6clJqeVM4R1VvY1dQ?=
 =?utf-8?B?VjBsU3FFZ2pxVkRQTXo3QTRlZHMxUU1EbU9MUHd6Q1I5VnF6Wlhwa3pPNjNQ?=
 =?utf-8?B?UVE0SGRRdGVLd0tObVlIRk1kMmdxdkNFYzk0OUNSK21rUmtSZ0VBQU5uZkJr?=
 =?utf-8?B?d2ZERHd4NlprQWxtUDJLRko2Yzk1VFhQRmlUM0pzYXJpZzBFQmZkem1oKzdR?=
 =?utf-8?B?NlZlekxqWjFKcnNTdkFCSms1TitkVlBCY3duNGJSMm1oSWx2MjdBRHhQWGVy?=
 =?utf-8?B?RTNUZ3lTNm9YaTd6bG53cGtsQmRPMm1uZDJJV0RyRkd6OXZtdzZ3L1VRUTlu?=
 =?utf-8?B?NnFzVEx5TVpnVmw5cGJPLzdOdG1HN1A5aXhHUTgxVGQrTXROSnNlTS9PRjdB?=
 =?utf-8?B?MEU1RHFET2xaMjkxeURPVVI2OXpBUWZCUzBnSlQ1SUxmeHhUaU44WUdPamM3?=
 =?utf-8?B?YURYcGtkc256bGZBMGIzeEpldXV5SkVVbDNkc203U2J0OVNVS2p2L0p6SHlN?=
 =?utf-8?B?Z1g2VHp6cWw2ZWwvb3dKb1NicDk1VDlJL1haTGpnTzBhUFFiTEJEQUJvRjBm?=
 =?utf-8?B?WjZYd2t0WSthNmJCN1AvenNWbk1FeU53MHFESXUvT2YrVkRGUU9yNnZjQWRV?=
 =?utf-8?B?MjI4Wks5MFVacExkbEY5YXlFV1ZVZlZMb1RXUkNqZVU0VnFITmFiMFhWcTlr?=
 =?utf-8?B?WjZpVG9reWxYQmJzckRybUZMWTZ2akhOcHhMY1l0QnlRZVdqa29wVzVsV2RD?=
 =?utf-8?B?TW5vYnV1Wm9EY2pVeExQd09SamZtOTljYWJBcXBlNUFpUlNBWlF0dEE3WWF0?=
 =?utf-8?Q?OB+bLVhvpdZxl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmRFN1ZMakYyWDdERE9qckR2dHFWSkNUcXFEV1lVc3BVKzRGR24vUVMrbXcr?=
 =?utf-8?B?UU9BYmI5RmV0MEtFQlZObGJSS2FzK3hqa2tWdkd6Z2c0cjhTSURCOHBJY3Jz?=
 =?utf-8?B?YUtJUlVtbkFBRmd4U0xRNWVCVk1rRUt6cTJqQmpCaXZtUlNxUW10Vm5US1pQ?=
 =?utf-8?B?aks1ekhiZ3M5UjJkMU5xVm5YUGxEZWtZbm5ScHpHeUU0bkdPMFc4aXZvbGFw?=
 =?utf-8?B?WWF3ZTVLQ1Zlb1YrNVJpUGVsSk1aYkFvdzhhVzYrUlRPeTgxUWh2ekxTdG5L?=
 =?utf-8?B?Q3dqMnhSVDhlQXNucDVNV0QzRnRwalErTm04UUtaZnkyNzNwajQzaVpROGxJ?=
 =?utf-8?B?YlFjZEhCYnJNLzNKSW9xNW51ZWJWbDc2bEs5Wmd3NHNiSStXRzRaaGJ4SDNa?=
 =?utf-8?B?TkxjN0c2M2xySDhTd04wazA4bVNhTFJuK2tDWmF4Z0tGVUt6V3hRVUdIT3cr?=
 =?utf-8?B?MGFGNWk0NVJMZHNhTVh4ektFUjQ5bTdPU3dTMk1zZkhnY0hkeVU4aVhtejZu?=
 =?utf-8?B?TmR0WlJwaS80RFlKeWNjb0NzbzkzY2VLanhCQlJGZ1N1STdHelhRbGsveVkz?=
 =?utf-8?B?U1BBQ2svM2Z4ajI3L2hjQlNNZ1JGekxSRUsxQmc5eDQvYUZjZzRUMHBLV1Nj?=
 =?utf-8?B?Y3h3TFF0dU5qSFVyUURkZUt3M05SSlhCM3hNcUpnSDNRQVFkMGtYeGwxaHhw?=
 =?utf-8?B?Z0lpa0owS1MvVmRHTHRhVE4zWTFLRGd3RFNvQTFuS2FheTZtNlBUTkZiSzlP?=
 =?utf-8?B?akdTNksvWTB6RG9KMnJzdnBJcXFrUk05WWg5U3dGYitMK0FNWFVlQ2Z5eEVr?=
 =?utf-8?B?TVFBWUxCTllmSVZnTHRYOWF6VDFJV29mdFdEMVYvSGtEcHh0T0pDUi9GM1ds?=
 =?utf-8?B?L0hXUC91QjJ6Y29pZFBEaU5IUCtFeUw1UFh4WkJ2ZFQvVE9iWkIrQ2dPbkZP?=
 =?utf-8?B?N1hlbFZJSjVRVVVsTmQ1WFFYU3NJZC8rK2ZpSXovWHZrQnZZMWt6dFNhZUln?=
 =?utf-8?B?WW1OK1VXRlU4SnNEaUh2aHNpUlRweXZCT3o0WTQwRDRjcFhSY1B2WmZ3c3pL?=
 =?utf-8?B?cjVwWGpuMXhVaVJSUE1FOHRYWlVrSVp2Ti82ZWdnKzJURElwUmhPS1NJNExF?=
 =?utf-8?B?VW9xMTF2Y3VDYW1MdXl0cThPTEkvRVJ4VlptNExsb2ZGQlE5a0F1d1h1eTNR?=
 =?utf-8?B?NWlXRkJIRDM4a2lSVit4ckdKYWFPdEJsUndtc253UU0xd0JhajgzUVFCc24w?=
 =?utf-8?B?ekljSU1POExWUkcwTlZPaVBadFNJbWxOVlVBUVV1WGFsbk9wTHhaMER4NzhY?=
 =?utf-8?B?anU0ZllKc1JJSndacit3MnltbjNYTWloVXR3SzlHd2VQMnlyVzBleC9hMzVJ?=
 =?utf-8?B?TmRORGxrQ0gwZFRKM3J5ejd3T2dZN0hBRUQ0cnUrVGtaMWRML1pDdlZUa3dt?=
 =?utf-8?B?Q2xnRWxLS3BXbjk1eUUzSENaTk5MV3ltYStPTXh0VDV5RlgySVZQelIwdEY4?=
 =?utf-8?B?TDBiTG54ek9lMUtQMldLaS84UzJiQms4Mm55TEJqMUZYTnAvYXd4TGsyODdu?=
 =?utf-8?B?THpoN1hYaTZCV082WXR5TGhMbklCTWNIR0tJV21mdE1LcUJIQWVUeEQxa3NE?=
 =?utf-8?B?UDNlT3AyWnFFeG5sU21IMEh5ZEY2U3ZyOFk1UWpxRU5kTXhJSnpFR0NKR1VO?=
 =?utf-8?B?MG9IMHVyM2tueG1Tb2gycDhJb3pmc1Bodnc2bGJkM0xhS1RsTkxjL0xndmFG?=
 =?utf-8?B?V00vbjVOWHpkaU9yUzN3TTN5dzhEV0JkZ0R4R1Z3S1RvR1dxMlNZcW1aZEhC?=
 =?utf-8?B?T3Nhc1NMOUtoS1RRZXVpS3RkZ01iZHpqZElLcVQwMDNBaWtxK3lpZkpMQ3VO?=
 =?utf-8?B?a2p1cENheDN2RkcxaWpQOCtSYXBGS1QyRG1HaXBEQUxtbUh6TCtyL3MyNUJx?=
 =?utf-8?B?MXBESTVZRzgrRlAveENQb2pHVnZRc25URjZQdFhTSE5qOVdOTWNZTGordjNG?=
 =?utf-8?B?MTk4dzJWdWtYMG90TWU5NXV5L1UwaDFLY1RZUERrMk5ieXVRVFZ2U2Q3Uld0?=
 =?utf-8?B?RWFOVnlqaDBqZ3dKMmY3WW5mZ1ZEdTNrUTlrc1U2ajdwRnhXUUQvTWRMYUh5?=
 =?utf-8?B?ZFNnTC8rNlgvVG04cGlueTA4OWl5MEk1cmI0VHRoY1d6a0xkeWgxRDc4N21F?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f9267f-5865-4d53-c8a5-08dd2396b5d1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 21:13:56.0398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBuE9PqgyruHdFTxvkGeGu0/GllU8LlvZaKR+q/gq6xexNii2yLDXMyRBhf4a1APAkTl6gyBXJdzHtDZia4hn6/10ckIIFVXGJg2f0mF/VM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5241
X-OriginatorOrg: intel.com

Hi Babu,

On 12/18/24 1:37 PM, Babu Moger wrote:
> Introduce io_alloc_capable in struct resctrl_cache to detect SDCIAE
> (L3 Smart Data Cache Injection Allocation Enforcement) feature.

Please distinguish clearly between the resctrl feature ("io_alloc_capable")
and the architecture specific feature (SDCIAE) that backs it. This is similar
to what you have done for ABMC and makes the work much easier to understand.
When the resctrl and arch feature is used interchangeably it becomes confusing.

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v2: Changed sdciae_capable to io_alloc_capable to make it generic feature.
>     Also moved the io_alloc_capable in struct resctrl_cache.
> ---
>  arch/x86/kernel/cpu/resctrl/core.c | 7 +++++++
>  include/linux/resctrl.h            | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index c2450cd52511..39e110033d96 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -306,6 +306,11 @@ static void rdt_get_cdp_config(int level)
>  	rdt_resources_all[level].r_resctrl.cdp_capable = true;
>  }
>  
> +static void rdt_get_sdciae_alloc_cfg(struct rdt_resource *r)
> +{
> +	r->cache.io_alloc_capable = true;
> +}

rdt_get_sdciae_alloc_cfg() looks like one that should have "set" in its name, not "get".
This also does not seem architecture specific so "sdciae" should not be in the name.
rdt_set_io_alloc_capable()?

> +
>  static void rdt_get_cdp_l3_config(void)
>  {
>  	rdt_get_cdp_config(RDT_RESOURCE_L3);
> @@ -931,6 +936,8 @@ static __init bool get_rdt_alloc_resources(void)
>  		rdt_get_cache_alloc_cfg(1, r);
>  		if (rdt_cpu_has(X86_FEATURE_CDP_L3))
>  			rdt_get_cdp_l3_config();
> +		if (rdt_cpu_has(X86_FEATURE_SDCIAE))
> +			rdt_get_sdciae_alloc_cfg(r);
>  		ret = true;
>  	}
>  	if (rdt_cpu_has(X86_FEATURE_CAT_L2)) {
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index d94abba1c716..5837acff7442 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -129,6 +129,8 @@ struct rdt_mon_domain {
>   * @arch_has_sparse_bitmasks:	True if a bitmask like f00f is valid.
>   * @arch_has_per_cpu_cfg:	True if QOS_CFG register for this cache
>   *				level has CPU scope.
> + * @io_alloc_capable:	Smart Data Cache Injection Allocation Enforcement
> + *			capable (SDCIAE).

Please remove arch specific text here. For example,
"True if portion of the L3 cache can be allocated for I/O traffic."

>   */
>  struct resctrl_cache {
>  	unsigned int	cbm_len;
> @@ -136,6 +138,7 @@ struct resctrl_cache {
>  	unsigned int	shareable_bits;
>  	bool		arch_has_sparse_bitmasks;
>  	bool		arch_has_per_cpu_cfg;
> +	bool		io_alloc_capable;
>  };
>  
>  /**
> @@ -202,6 +205,7 @@ enum resctrl_scope {
>   * @evt_list:		List of monitoring events
>   * @fflags:		flags to choose base and info files
>   * @cdp_capable:	Is the CDP feature available on this resource
> + * @sdciae_capable:	Is SDCIAE feature available on this resource
>   */
>  struct rdt_resource {
>  	int			rid;

Leftover from previous version?

Reinette

