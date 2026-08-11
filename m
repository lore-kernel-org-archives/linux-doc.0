Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF7C1F8AC5;
	Tue, 11 Aug 2026 03:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786419621; cv=fail; b=svFyPp1IkwQCjRDETh8rhr2DvkNgcZuxZzIlw1Emdv+HR7aj3ggrGDS9a3YgSixjKP/pNTGg6Oy7sEpu88JwxtFSdhEiIFsNuDf/a+Ch1fy3IPvGTnOcTjAxdH9Zp+scF95fdj7M/wA27K8Shb2yV4CEjWjEP1G+Q3aVRCO3MPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786419621; c=relaxed/simple;
	bh=Cgv1UECHPqzddL+bpj4Mbi/KycSlea3G5q3CWqTICeU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AX+c38OaQQJZRg/BDNgQLud4LwxAWrUX4K0Km0fgVEUq7S8o0N77E1vpytGSyFi/oBs4+kHYOSpWB+5kQ+GGO2xg2dIQtXD43HpfptQSnXf55Wu3oH8PwaUdam5DQ9X4WDP60b5GWVypPJ2AjGSKzv20jdn3t77Ngj2Vy717YPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5gN8/p3; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5gN8/p3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786419618; x=1817955618;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Cgv1UECHPqzddL+bpj4Mbi/KycSlea3G5q3CWqTICeU=;
  b=d5gN8/p3bJsBxT1kjxEYGMqFqjUMRV7MmD/uoR2RTeAXdo+9R9OBU7ZQ
   Ekp//3wvgAfvzcFRa3brQR7fsNa5g+F8Q9Rz/0fnK5kG3gfYSQXLVNURo
   Ll+ZClLgF9F5cvTZO0L9sc6WIfE+PVZQuY1yTKrlvmFXJprl9i3wqIz4C
   iev4ShUdB0a+Zp5GbL1iqM33zdDGZlLduxWI0flau0A1GWaWCnAXEoHNU
   AgpDTdg0L3dt0un6TFBdDpFJxHMaL+C1o4l39WEQLmTAl7j4BpQOlVRyp
   a1cauV988U/FQYJsSrtJPhVaQp1RtwIFMRLmUXyb84wk4uxARFZbYVP0Y
   g==;
X-CSE-ConnectionGUID: TpUuM5qQRPSdkxGs3PnwVw==
X-CSE-MsgGUID: 6Aa/3XBPRMqwOYE2j6j0zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="97601613"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="97601613"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:40:15 -0700
X-CSE-ConnectionGUID: mQ3kNReoTaG1cjSocogTcQ==
X-CSE-MsgGUID: QYYORn2RSfuVz2sURmv7DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="261461590"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:40:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:40:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 20:40:14 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:40:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDEgdnS9D6/HQn46NHFFX8BDheKNz+KiFxN595eQ8Jz+iRmymw79DBxgHXcgpKTiSf51y76H2a4jI2UxCI66hbu+5WLZi/c8yXUfJ/82NYX14tvRqEqZ6gyXFRNPjfHfa6OpVimL2h5SCFJUKiU4wYbpJfVJyyB1GGNxyWFdPXQ9/bKRbp1jfDVdfnW1q7omxjX0ynLuFXERAa4TYBvz53+mqA6B7wLwLzbUR5sGtxIHs8pTn4Bik7mYkpOaE9aAlQ8IkAKPm0IUqQoAR2mC6V9BVpPjismdAv97k+Eo6JM+yK5gYsZ9b4STjPZfExghMHNzsbTnyiUjKPG2RSDikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAISF4EnoQbVj1dFO0nIkvQY61XnZx2tYmgEvDhRfoQ=;
 b=IBR5DqKb1ZQ9LAvgk7f7l9b5A6Ab2ubuLvUtcg+vL7nbTxrckkxIsm1TMddSTKB/5GxL5v2vFjwyXCvs7/2vz5sY4NvpkUcRZi9rKe+tC3YQUSZT5qC5zGAyMmU00piQWYjrxuHf3kofsIaJpYU0V/JABCMZbBkmEmbEAFStJmFwcw9j2+08XOS7LUaiM3AA1DsE1p4YiixddqxGDCrI6YGU8ugzGHTe1AtcI+Xgcq5N4+TrEN1rdwoZwQZjF3+orWnvAkT/qFbofRUhl32abKWtuZdRit7cHokbldgRlTxa5sl5IW/GBc57RG4EDnXYl84fKGY0ans23uZo3LvxSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DS4PR11MB872716.namprd11.prod.outlook.com (2603:10b6:8:509::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 03:40:10 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 03:40:10 +0000
Message-ID: <4203f7a0-25e5-41d4-b6bb-95652540a834@intel.com>
Date: Mon, 10 Aug 2026 20:40:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 13/15] fs/resctrl: Add interface to modify
 kernel-mode via info/kernel_mode
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <lirongqing@baidu.com>, <seanjc@google.com>,
	<nikunj@amd.com>, <xin@zytor.com>, <pawan.kumar.gupta@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>, <kprateek.nayak@amd.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>, <naveen@kernel.org>,
	<darwi@linutronix.de>, <elena.reshetova@intel.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<thomas.lendacky@amd.com>, <eranian@google.com>, <peternewman@google.com>,
	<qinyuntan@linux.alibaba.com>
References: <cover.1783461016.git.babu.moger@amd.com>
 <9916861e5fe73cc8d7ea02ce366b512bc5424843.1783461016.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <9916861e5fe73cc8d7ea02ce366b512bc5424843.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:303:8e::24) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DS4PR11MB872716:EE_
X-MS-Office365-Filtering-Correlation-Id: 63254a55-4ef8-4ca4-d7d3-08def75a3e76
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|8126099003|22082099003|18002099003|5023799004|11063799006|56012099006|3023799007|6133799003|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: WNBo3WDVoyrV/Pft6RhgK+cmFPUVgmeDy9qJ+eNWKSyyw5ZcfnrH92Fb3MLBKPTMg81hzJZvWv+/Ren63aHkiNYcaTy39CcplJG3PaPhWv3HbMfgiB0BjfZM4VZqncD167blr5MVSox0ThdhO+Rpq/nXgs9u8fjY1425CfNw3uoD32vl03hhF1W2y36CIZmiNdlGFriLmo/1k3Z/D4uDDp/1uZUvumRkNmaNzkcAIAAVN33AvEkCypQB8DpH3FfPUgoqCMPFSB7VSY6VUgSm9+Bk2NpUohpKXlX05ChYM4uFpZBy1MMHqimhRmUJ11DPLn40QF6thKFw8OOgdMTjd/WrRHtbuGeO0q25G6aaeqRx4gYdhWARgs0BWlM20B1AwDr42+hnf3W9NSfv1DzXF5nibvWD+bC7Vi/w829c9DPe+pCmIMfb02OCUOub7qiaUoUrVwkCr1UtANhYAgHLL1e2l6dz0R8S9EsZOUFc/iaqk9qA7t3Z95Rwgp0MJ6jD2PWV3N+yF72Xr4ZLVI9T2zbrVuycx3ltEIJT9sNjs64wEZwTe6K63ZUguxuCJlljWIlUvdEa9bcROEjS2TyEew93g+uzfXfsZn55+c1aUj7cWkv0f0mIezjaTMKUT5l7a8y69c0GPVZ1ZOb5d1fQLKvSlRAMBNPfPbq7qI3wCCM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(8126099003)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(3023799007)(6133799003)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFNoc2liN1hPMkhaWENudSs2enFkSitZa3JJS2VSWE40djd2N2dhK3VRczd6?=
 =?utf-8?B?eWFhZ3RCNUw5YnQ5VUhnVXhLdXp0VGxXUnRIb3dFWWQxTStnTEhBTTF5bDJv?=
 =?utf-8?B?ZUpZWmVrLzEyWWpSUW5MTWZQU08yNWZCclVXZHQ4VHcxaFhMTnVmdllUTXAz?=
 =?utf-8?B?Yk8xUnRBeFN4OEJQcTRnaHE0OHBPeGQxa2RUY3VOejJBRUpqUWx2TXJKOE94?=
 =?utf-8?B?cWNXYUR0WFZvMWVkK0pYR2VEcWg1MUNhekhJRmNLVGNtQjlYUzNhbmx6VVAy?=
 =?utf-8?B?cWJVSml6Wi92Wk1OSlVZOXFmd0l6WVNOWHpobytTY0R1THlNcndSUGozVnRP?=
 =?utf-8?B?MS95S0JudG8vNU05enJNWFV5TTRYelBrSmxtWG5hYnlOalhZTkRRVXpaL1lW?=
 =?utf-8?B?VUNNSmUvOGZmWlpsYVFVaHZpZXduMkZwQTZBVmpjS3o2cUxvaGozMTI3cFVR?=
 =?utf-8?B?dW9KaURDMVlPTmg5ZFVEUjJXMEttS3ZXQnBaeEt5VTFzWXlVS0pIdXMvODVx?=
 =?utf-8?B?NTZrdVZjU3BJUTc0Z1VOVFhMaFlSQms2UlJEL2J1S3RCVkVZNExlS2I1ckJn?=
 =?utf-8?B?OWQxSC9CdDhsdUFRaXl6bnNVQ2R5RVR3S3E3MEgyWENRZlovNURsOW00K3hv?=
 =?utf-8?B?KytWZVY1dVdyRG93a01MVDZNRnNGZC9EZkF1Z1JqZWhwZWVRdFhKZVdNOXhC?=
 =?utf-8?B?Z1B2TWpvMUxNaHZKTVhOWU8wVTg0cWZXS2gvNXJWNWFjYUhIWnRKVXJHc2Rk?=
 =?utf-8?B?WmRNS0trcnFWaEJBSFVRZ1M3ZTVJQ0NhVGFIdW55SWxVSHRjZlQ3dC8zUkpp?=
 =?utf-8?B?TjFWSi8ydTBySXd1d29nS3FuTFRmRGdJZHoraXRrdnRkbXB4cUpKY0k1K0Q0?=
 =?utf-8?B?WENESmsxd1dKZkwwNVBhNWxpd2xVTHkrcHRpRDBvYkIvMCtlcWE1S1FoR2ls?=
 =?utf-8?B?WjI5RUlxWjQ5dURLTEVpZEo5aTQvRC9kQno5ckI2akxFcC9UTjUrVTIxZDFI?=
 =?utf-8?B?RFBDZnlrbkYwME5jOEtMT1VNV2xsdUFMcDA3WjRndVZaWHQ3ZWdjTmYyeElt?=
 =?utf-8?B?VkFraVd3aTRnQkFQY3cvUmN4bHNUMnBFSlc1SFZpV2xBOStkbk5ONmdyMkd4?=
 =?utf-8?B?UzFzbm4veHFUdDc3T1B2bTFkdWdMTm5Ka1NpbVVWZGlkQ0xDVHZWTmZCUTFz?=
 =?utf-8?B?TkZhOVgxZmtvL0J3dnhoUE9wV2hJY2FzM1d2d3U1REN4VCtxYVZyN2hBRjRI?=
 =?utf-8?B?RzFXQ0tpYjM4V0FZYTFrSFdwN3VvaHJEdEx1S0pwMTMzV2tjeEVkZG1YOU90?=
 =?utf-8?B?UTVTS29FM29CZjFtV3R4enBOWXJIbHY1VGg0YnVIaVZOYzBxS3BhVjk1eXRs?=
 =?utf-8?B?QzJZM0VRcVllK3NCa2swNkNCY0VqazlwWGx1RUtlSC85VDhycHRoRmRtWG82?=
 =?utf-8?B?aXZvd3RVaUR4S3lzS3U5STBnR3NxVHI2d3BzcjFUQTU1REhDU2Q1eDd4SlZi?=
 =?utf-8?B?UjJQSWZhTjFDbE5jSXArL2xwUDk2SHh6Y0piTVNiUzFQWW1ibTV4V1FaNTR5?=
 =?utf-8?B?SFpjWVFBWUh2T25qVkErRk5VejFFZmNBbjVKRVJEd295eXRTTlVWdGFSUDB2?=
 =?utf-8?B?Rk50cTR3djh3bFJ1ckFsUTNNY2t0dVBjQ1hwVXVuWWUxZE1DNVhHV3FTL2ds?=
 =?utf-8?B?dXI5bE52bC9ES1BKUEdWY2tPdFphRzF0ZERpVjBiNm1oZ204bFc2MjhpeU90?=
 =?utf-8?B?aTVuNlVyZWNzRjRXaFVYaUR1MVVSMGt2M1RPVzFsY1R6NUs1WUEyb2hwcUh5?=
 =?utf-8?B?RllScmxTTGllTmI3cCtueHYya2YycGV3MzU0MEkxRU0yUlM1UVhra1VPbkpO?=
 =?utf-8?B?Z2ZFWUFJcFI0N1NWVVc2ZW9WUGVkSDZ2eG4xOG4vK3o3YVFGR0tLdHBqMXFX?=
 =?utf-8?B?dWdPUlViZnZuRzV1MXJvZlVOVkxuUWc2KzI4TWoxb053bjNsTzNFK0Y0bHZz?=
 =?utf-8?B?QVBuSzB6bTBiS2pDNlBibW5idkRaTW5FTENjTHFoUElsNEwrSG5WeDF2UTht?=
 =?utf-8?B?OWhjMkovbEM5cDdMVXVvMzFzb3g0NmRydmhHazNsbXNLY1ZVRkQ4UTBOUXZl?=
 =?utf-8?B?VEU4TitYcmFPeEUwVFF0OGRkKzZaOXdsVm8rWmJOU3RWQlI4MmIyN2FyVDRE?=
 =?utf-8?B?TzVHUmFCbHdEc1A3cGFCQXJ5bDBHenFvY1FEK2xuZE5MQlVGUUtnUjhhUi90?=
 =?utf-8?B?UXJkQzNpU3d3MUt3d3QzUDllaTJySGgxR1JQeVJSSVZIYTloS3llWnBZY1Qr?=
 =?utf-8?B?Y0NuSzJkNW5YbHAvaXRxNnpsTjVuZ0NPb0xKVHQxUUE0cWM5VFptaWRRMmUw?=
 =?utf-8?Q?5HFj+5hZqXGhDhk0=3D?=
X-Exchange-RoutingPolicyChecked: Gtn/bDnjLT5ADrGIHm2RlGN9eCwbhB+QQp3XkCUZFN7qe6K7VCLqk73HyspPkEeljrhGWzM+VJlVW1ZIQB/o0qdb1XOxKy09aXHUc1Njv5nu5rmI5RXZtzKNTcBkDsdig0MTwaq5hXQhOOfort7Et1V+3UPGfR/C9phoe58iN6YS9jgdzkaXumwCeoCTjxbu/HQx+nlDMdEuXfjplpSt7FQg9HE8LlIu1C96q4Bl7mcO/OO+GinMExU5aZLGKy9jcRT1bQ5694MO3o3j/sB8sV1taGGxkWXU4Sv99xprnkjrHUpyIoPX6XNK4ZPBVGkIoXPOP3gwchymrKKqSFq45A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 63254a55-4ef8-4ca4-d7d3-08def75a3e76
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 03:40:10.1625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDtP+dDXHnD14Il/0tFR9LL/BoS+PSIhZrhLHWYi+b25rE93wfdsOkrvHMM0601hYELgueEgnXF1ih4MXpDxhrxVoiul434Es126Z8TPHxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB872716
X-OriginatorOrg: intel.com

Hi Babu,

On 7/7/26 2:50 PM, Babu Moger wrote:
> info/kernel_mode reports which kernel-mode policies the platform supports
> and which one is active, but it is read-only and does not show the rdtgroup
> bound to the active kernel-mode policy.
> 
> User space needs both pieces to manage kernel-mode assignment: it must be
> able to select a policy and bind the global-assign modes to a specific
> resctrl group, and it must be able to read back which group is currently
> bound.
> 
> Make info/kernel_mode writable and extend the read format to identify the

"Make info/kernel_mode writable and extend the read format" - what does this mean?

> bound group for active global-assign modes.  Inactive global-assign modes
> are reported as "group=uninitialized"; INHERIT has no group suffix because
> it does not bind an rdtgroup.  Square brackets mark the active mode on read
> only and must not be included when writing.
> 
> Document the interface in Documentation/filesystems/resctrl.rst.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  Documentation/filesystems/resctrl.rst |  80 +++++++++
>  fs/resctrl/rdtgroup.c                 | 238 +++++++++++++++++++++++++-
>  2 files changed, 315 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index f3e941404967..5a13814d1325 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -528,6 +528,86 @@ conveyed in the error returns from file operations. E.g.
>  	# cat info/last_cmd_status
>  	mask f7 has non-consecutive 1-bits
>  
> +"kernel_mode":
> +	In the top level of the "info" directory, "kernel_mode" controls how
> +	resource allocation and monitoring work in kernel mode. This is used on
> +	some platforms to assign dedicated allocation and/or monitoring to
> +	kernel-mode work.

"assign dedicated allocation and/or monitoring to kernel-mode work" - I do not understand
what this means.

> +
> +	Reading the file lists supported kernel modes, one per line.  The
> +	currently active mode is wrapped in square brackets for display only.
> +
> +	The modes are displayed in the following format:
> +	"<mode>:group=<ctrl>/<mon>/"

Please no! We know that resctrl needs to support more kernel modes and we know that their
configuration interfaces will be different from what is needed to support AMD. They will
introduce new modes to "kernel_mode" but those modes may bring new sytax to kernel_mode
associated with those modes and/or introduce new files associated with those modes (like kmode_cpus
for these modes). Writing something like above derails the plans to support those future kernel modes.

Instead, please write something like: "The display format depends on the kernel mode."
followed by each supported kernel mode (nothing that there may be more) and what *that*
kernel mode's display format looks like. Please do not enforce PLZA display format on
this and all future kernel modes.


> +
> +	The inherit_ctrl_and_mon mode is shown as "<mode>" with no ":group=" suffix.
> +	Inactive global-assign modes report "group=uninitialized".
> +
> +	The bound group path uses empty components when they do not apply:
> +
> +	"//":
> +		The default (root) control group.
> +	"<ctrl>//":
> +		The control group named <ctrl>.
> +	"/<mon>/":
> +		The monitor group named <mon> under the default control group.
> +	"<ctrl>/<mon>/":
> +		The monitor group named <mon> under the control group named <ctrl>.
> +
> +	Modes:
> +
> +	- "inherit_ctrl_and_mon": Kernel work inherits allocation and monitoring
> +	  from the current user-space task (default).
> +	- "global_assign_ctrl_inherit_mon_per_cpu": A single allocation is
> +	  assigned for all kernel work; monitoring is still inherited from user
> +	  space.  Requires a CTRL_MON group.
> +	- "global_assign_ctrl_assign_mon_per_cpu": A single resource group
> +	  supplies both allocation and monitoring for all kernel work.  May be
> +	  a CTRL_MON or MON group.
> +
> +	Only modes supported by the platform are listed on read.
> +	Example::
> +
> +	  # mount -t resctrl resctrl /sys/fs/resctrl
> +	  # cd /sys/fs/resctrl
> +	  # cat info/kernel_mode
> +	  [inherit_ctrl_and_mon]
> +	  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
> +	  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
> +
> +	The modes and binding can be modified by writing to the interface. Writing
> +	one line (terminated by a newline) selects the active mode and binds it to
> +	a resctrl group.
> +
> +	Writes must follow the format:
> +	"<mode>:group=<ctrl>/<mon>/"

Please no. Here also, please replace with something like: "Write format depends
on the kernel mode." Followed by a list of supported kernel modes and description of
what format each mode uses.

> +
> +	The ":group=<spec>" suffix is optional; when omitted the default (root)
> +	control group is used for global-assign modes. Selecting a new mode or group
> +	tears down any active global-assign binding before programming the new one,
> +	including when switching between global-assign modes on the same group.
> +	The inherit_ctrl_and_mon mode ignores any supplied group and clears the
> +	active kernel-mode binding.  The mode must match one of the supported names
> +	exactly, and modes not advertised by the platform cannot be set. The
> +	display-only "group=uninitialized" form is rejected. Errors are reported in
> +	"info/last_cmd_status".
> +	Example::
> +
> +	  # mkdir ctrl1
> +	  # echo "global_assign_ctrl_assign_mon_per_cpu:group=ctrl1//" \
> +	         > info/kernel_mode
> +
> +	  # cat info/kernel_mode
> +	  inherit_ctrl_and_mon
> +	  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
> +	  [global_assign_ctrl_assign_mon_per_cpu:group=ctrl1//]
> +
> +	  # echo "inherit_ctrl_and_mon" > info/kernel_mode
> +	  # cat info/kernel_mode
> +	  [inherit_ctrl_and_mon]
> +	  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
> +	  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
> +
>  Resource alloc and monitor groups
>  =================================
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index c537846d9264..7b06c3b3f00e 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1059,7 +1059,8 @@ static_assert(ARRAY_SIZE(resctrl_mode_str) == RESCTRL_NUM_KERNEL_MODES);
>   * @v: unused
>   *
>   * Displays one line per mode set in resctrl_kcfg.kmode. Bracket the active
> - * policy (resctrl_kcfg.kmode_cur).
> + * policy (resctrl_kcfg.kmode_cur). Square brackets are display-only; writes
> + * to info/kernel_mode must not include them.
>   *
>   * INHERIT_CTRL_AND_MON is displayed as "[inherit_ctrl_and_mon]" when active
>   * or "inherit_ctrl_and_mon" when supported but inactive, with no :group=
> @@ -1068,7 +1069,7 @@ static_assert(ARRAY_SIZE(resctrl_mode_str) == RESCTRL_NUM_KERNEL_MODES);
>   * Global-assign modes append :group=. An inactive mode is emitted as
>   * "<mode>:group=uninitialized". An active mode with a bound group is emitted
>   * as "[<mode>:group=<ctrl>/<mon>/]", where <ctrl>/<mon>/ is derived from
> - * resctrl_kcfg.k_rdtgrp.
> + * resctrl_kcfg.k_rdtgrp. The bracketed form is not accepted on write.
>   *
>   * Return: 0 on success, or -ENOENT on error.
>   */
> @@ -1164,6 +1165,8 @@ static void resctrl_kmode_files_set_visible(struct rdtgroup *rdtgrp, bool visibl
>   * @kmode:	Kernel-mode policy currently active on @rdtgrp.
>   *
>   * Reset the kernel-mode binding on the CPUs in @rdtgrp's @kmode_cpu_mask.
> + * Called from resctrl_kernel_mode_write() whenever an active global-assign
> + * policy is replaced, including a mode change on the same group.
>   */
>  static void rdtgroup_config_kmode_reset(struct rdtgroup *rdtgrp,
>  					enum resctrl_kernel_mode kmode)
> @@ -1212,6 +1215,234 @@ static void rdtgroup_kmode_detach(struct rdtgroup *rdtgrp)
>  	resctrl_kcfg.kmode_cur = INHERIT_CTRL_AND_MON;
>  }
>  
> +/**
> + * rdtgroup_config_kmode() - Push @rdtgrp's kernel CLOSID/RMID to hardware
> + * @rdtgrp:	Resctrl group whose CLOSID/RMID should be programmed.
> + * @kmode:	Kernel-mode policy to program for @rdtgrp.
> + *
> + * @rdtgrp carries the CLOSID/RMID to program. For monitor groups, the CLOSID

I just cannot get used to this writing. It is not coherent. It reads like text
from several people were just concatenated into this series.

> + * matches the parent control group while the RMID belongs to the monitor group.
> + *
> + * The caller (resctrl_kernel_mode_write()) is responsible for validating that
> + * the (kmode, group type) pair is permitted before invoking this helper.
> + * This helper records the current online CPUs in @rdtgrp->kmode_cpu_mask and
> + * programs those CPUs with @rdtgrp's CLOSID/RMID.

Please do not describe the code in such detail - this detail can be seen from the
code self. Please make the description high level. Please check whole series.

> + */
> +static void rdtgroup_config_kmode(struct rdtgroup *rdtgrp, enum resctrl_kernel_mode kmode)
> +{
> +	bool assign_mon = (kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
> +
> +	/* A new binding starts with all currently online CPUs in scope. */
> +	cpumask_copy(&rdtgrp->kmode_cpu_mask, cpu_online_mask);
> +
> +	resctrl_arch_configure_kmode(&rdtgrp->kmode_cpu_mask, rdtgrp->closid,
> +				     rdtgrp->mon.rmid, assign_mon, true);
> +
> +	rdtgrp->kmode = true;
> +	resctrl_kmode_files_set_visible(rdtgrp, true);
> +}
> +
> +/**
> + * rdtgroup_by_kmode_path() - Resolve a "<ctrl>/<mon>/" path to an rdtgroup
> + * @ctrl_name:	Control-group name, or "" for the default control group.
> + * @mon_name:	Monitor-group name, or "" to select the control group itself.
> + *
> + * Matches the path syntax emitted by resctrl_kernel_mode_show():
> + *   "//"            - the default control group
> + *   "<ctrl>//"      - control group @ctrl_name
> + *   "/<mon>/"       - monitor group @mon_name under the default control group
> + *   "<ctrl>/<mon>/" - monitor group @mon_name under control group @ctrl_name
> + *
> + * An empty @ctrl_name selects &rdtgroup_default. Otherwise @ctrl_name must
> + * match an existing control group. If @mon_name is empty, the selected control
> + * group is returned; otherwise @mon_name is looked up in the selected control
> + * group's monitor children.
> + *
> + * Return: Pointer to the matching rdtgroup, or NULL if no such group exists.
> + */
> +static struct rdtgroup *rdtgroup_by_kmode_path(const char *ctrl_name,
> +					       const char *mon_name)
> +{
> +	struct rdtgroup *rdtg, *parent = &rdtgroup_default;
> +
> +	if (*ctrl_name) {
> +		parent = NULL;
> +		list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
> +			if (rdtg->type != RDTCTRL_GROUP)
> +				continue;

All groups in rdt_all_groups are control groups, no?

> +			if (!strcmp(rdt_kn_name(rdtg->kn), ctrl_name)) {
> +				parent = rdtg;
> +				break;
> +			}
> +		}
> +	}
> +	if (!parent)
> +		return NULL;
> +
> +	if (!*mon_name)
> +		return parent;
> +
> +	list_for_each_entry(rdtg, &parent->mon.crdtgrp_list, mon.crdtgrp_list)
> +		if (!strcmp(rdt_kn_name(rdtg->kn), mon_name))
> +			return rdtg;
> +	return NULL;
> +}
> +
> +/**
> + * resctrl_kernel_mode_write() - Select kernel mode and bind group via info/kernel_mode
> + * @of:		kernfs file handle.
> + * @buf:	One line of the form "<mode>[:group=<ctrl>/<mon>/]"; must end
> + *		with a newline. Do not include the square brackets used to mark
> + *		the active mode in resctrl_kernel_mode_show(). Leading and trailing
> + *		whitespace is ignored, as is whitespace between the mode name and
> + *		an optional ":group=" suffix. The ":group=<spec>" suffix is
> + *		optional; when omitted the default control group
> + *		(&rdtgroup_default) is used.
> + * @nbytes:	Length of @buf.
> + * @off:	File offset (unused).
> + *
> + * Parses @buf, validates that <mode> is listed in resctrl_mode_str[] and is
> + * supported by the platform (resctrl_kcfg.kmode), resolves <ctrl>/<mon>/ to
> + * an existing rdtgroup (or picks &rdtgroup_default if no group was specified),
> + * treats INHERIT as an unbound mode, tears down any active global-assign
> + * binding via rdtgroup_config_kmode_reset(), programs hardware via
> + * rdtgroup_config_kmode() when the new mode is not INHERIT_CTRL_AND_MON, and
> + * on success updates resctrl_kcfg.k_rdtgrp and resctrl_kcfg.kmode_cur. The
> + * display-only "group=uninitialized" form is rejected.  Errors are reported
> + * in last_cmd_status.

This is just a summary of the code? 

> + *
> + * Return: @nbytes on success, negative errno with last_cmd_status set on error.
> + */
> +static ssize_t resctrl_kernel_mode_write(struct kernfs_open_file *of,
> +					 char *buf, size_t nbytes, loff_t off)
> +{
> +	enum resctrl_kernel_mode mode;
> +	char *mode_str, *group_str, *slash;
> +	const char *ctrl_name, *mon_name;

(needs reverse fir)

> +	struct rdtgroup *rdtgrp;
> +	int ret = 0;
> +
> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
> +		return -EINVAL;

function comment states: "negative errno with last_cmd_status set on error" yet here it
returns negative errno without any update to last_cmd_status.
Please see commit 242c0ab4d51d ("fs/resctrl: Change last_cmd_status custom during input parsing")

> +	buf[nbytes - 1] = '\0';
> +
> +	/* Tolerate surrounding whitespace before mode parsing. */
> +	buf = strim(buf);
> +
> +	/*
> +	 * Split "<mode>:group=<spec>"; the ":group=<spec>" suffix is optional
> +	 * and when omitted the default control group (&rdtgroup_default) is used.
> +	 * Trim mode_str after the split so whitespace before ":group=" is ignored.
> +	 * Square brackets from resctrl_kernel_mode_show() are not accepted.
> +	 */
> +	group_str = strstr(buf, ":group=");
> +	if (group_str) {
> +		*group_str = '\0';
> +		group_str += strlen(":group=");
> +	}
> +	mode_str = strim(buf);
> +
> +	mutex_lock(&rdtgroup_mutex);
> +	rdt_last_cmd_clear();

Needs info_kn_lock()/info_kn_unlock()

> +
> +	for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++)
> +		if (!strcmp(mode_str, resctrl_mode_str[mode]))
> +			break;
> +
> +	if (mode == RESCTRL_NUM_KERNEL_MODES) {
> +		rdt_last_cmd_puts("Unknown kernel mode\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	if (!(test_bit(mode, &resctrl_kcfg.kmode))) {
> +		rdt_last_cmd_puts("Kernel mode not available\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	/*
> +	 * INHERIT mode binds no rdtgroup. Ignore any user-supplied :group=
> +	 * suffix and let show print the mode without a group.

copy&paste?

> +	 */
> +	if (mode == INHERIT_CTRL_AND_MON) {
> +		rdtgrp = NULL;
> +		goto update_mode;
> +	}
> +
> +	if (!group_str) {
> +		/* No ":group=" suffix: fall back to the default control group. */
> +		rdtgrp = &rdtgroup_default;
> +	} else if (!strcmp(group_str, "uninitialized")) {

Why is this needed? Dropping this would just result in one of the group error messages
that should be sufficient?

> +		/* Display-only placeholder emitted by show; not selectable. */
> +		rdt_last_cmd_puts("Cannot bind to 'uninitialized' group\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	} else {
> +		/* Require exactly "<ctrl>/<mon>/" format */
> +		slash = strchr(group_str, '/');
> +		if (!slash) {
> +			rdt_last_cmd_puts("Group must be <ctrl>/<mon>/\n");
> +			ret = -EINVAL;
> +			goto out_unlock;
> +		}
> +		*slash = '\0';
> +		ctrl_name = group_str;
> +		mon_name = slash + 1;
> +		slash = strchr(mon_name, '/');
> +		if (!slash || slash[1] != '\0') {
> +			rdt_last_cmd_puts("Group must be <ctrl>/<mon>/\n");
> +			ret = -EINVAL;
> +			goto out_unlock;
> +		}
> +		*slash = '\0';
> +
> +		rdtgrp = rdtgroup_by_kmode_path(ctrl_name, mon_name);
> +		if (!rdtgrp) {
> +			rdt_last_cmd_puts("Group not found\n");
> +			ret = -EINVAL;
> +			goto out_unlock;
> +		}
> +	}
> +
> +	if (mode == GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU &&
> +	    rdtgrp->type != RDTCTRL_GROUP) {
> +		rdt_last_cmd_puts("global_assign_ctrl_inherit_mon_per_cpu requires a control group\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
> +	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {

Could it be more specific to just require here that the resource group is
required to be shareable?

> +		rdt_last_cmd_puts("Pseudo-locking in progress\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +update_mode:
> +	/* No-op if the same mode is already active on the same group. */
> +	if (resctrl_kcfg.kmode_cur == mode && resctrl_kcfg.k_rdtgrp == rdtgrp)
> +		goto out_unlock;
> +
> +	/*
> +	 * Tear down any active global-assign binding before applying the new
> +	 * policy, including when only the mode changes on the same group.
> +	 */
> +	if (resctrl_kcfg.kmode_cur != INHERIT_CTRL_AND_MON)
> +		rdtgroup_config_kmode_reset(resctrl_kcfg.k_rdtgrp,
> +					    resctrl_kcfg.kmode_cur);
> +
> +	if (mode != INHERIT_CTRL_AND_MON)
> +		rdtgroup_config_kmode(rdtgrp, mode);
> +
> +	resctrl_kcfg.k_rdtgrp = rdtgrp;
> +	resctrl_kcfg.kmode_cur = mode;
> +
> +out_unlock:
> +	mutex_unlock(&rdtgroup_mutex);
> +	return ret ?: nbytes;
> +}
> +
>  void *rdt_kn_parent_priv(struct kernfs_node *kn)
>  {
>  	/*
> @@ -2117,9 +2348,10 @@ static struct rftype res_common_files[] = {
>  	},
>  	{
>  		.name		= "kernel_mode",
> -		.mode		= 0444,
> +		.mode		= 0644,
>  		.kf_ops		= &rdtgroup_kf_single_ops,
>  		.seq_show	= resctrl_kernel_mode_show,
> +		.write		= resctrl_kernel_mode_write,
>  		.fflags		= RFTYPE_TOP_INFO,
>  	},
>  	{

Reinette
