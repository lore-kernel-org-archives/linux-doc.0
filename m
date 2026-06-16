Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD67335F184;
	Tue, 16 Jun 2026 23:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781652633; cv=fail; b=fyB/vqCBG6ckD9CM3aCja5hzQtedAvrR08TuONL/fliGGMKSTs928bUbo/hHs5+8ikA2RaYeTjHpotpvovNCG6kt3js2MiduTfesBqXYvE+1RwDAnohQWLNe/wSq8++RCA/4jXqR13UgPIYXPxdI6Aw8fTc3xeFjIPE5jW1e7gY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781652633; c=relaxed/simple;
	bh=Sw8+Bbr4PFS4ABucv3/XwGls1bOaA2QCWATzRkeoH2A=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oPP8XhKLbV0Ko3sgNBSznYXDFYIQjF7T3O0qCXJF1Pf7dHRmfZBwyd/ZxqPdJ3tr6l5+T9byOD4MOxQEl8CkD/76wsp7DaaBk0qTtb4FZUPvUJSJHDu7GQawW+IcvihbxH4LrdkuDyGRdS6rugCcu6Zg8ycUaS/rbUxHb1txRgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0VYKp5i; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S0VYKp5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781652632; x=1813188632;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Sw8+Bbr4PFS4ABucv3/XwGls1bOaA2QCWATzRkeoH2A=;
  b=S0VYKp5ioGtOZscUWpI+IMZHY4T2kHDZglRvEKWBRGoRAGymhLPMaYkq
   rBJvcKNuQABveseVYmX78iqFN1B593+QnvwjtI/uvqi0FJBk5fNivroUG
   Gx/+D82lAoSwbHLofrGF3f8XyFAlgYcyR0WbojknlQre23XK5gx5CI4zN
   zzadH7ksg4d8WzMvri3lVeYDvScKPXFNxyZxYUHoCz9bl+7doqoksKz6N
   Cptvw57rtc3xcuRNYFRfaNXIiMRHp+XDlSiJ6AQ2XdzETAnzWVfEno4oQ
   V+tiCK14taXotYfCbABdupF4hCnsbGPbA/4QDuZdLEDeZRdEr/rYul31d
   w==;
X-CSE-ConnectionGUID: gH7std9aTreGZklKh2qouQ==
X-CSE-MsgGUID: p3p9FP+gQ+OAFXvU0e/oRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82445676"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82445676"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:30:31 -0700
X-CSE-ConnectionGUID: NaqFvcXZRfqv8ThjIqBHoQ==
X-CSE-MsgGUID: fwlJas61TdiiuenKtVynjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="247021325"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:30:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:30:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 16:30:29 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:30:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bU7IxTkwPB//R+7hqxt4ri7G792n3VD949MPwnSdaxuRw6aw2PLhGbmS8KWd0h887FPYJCsmzE+7YHwSzTs0HJN94ci171aZoLu9DvHpDiXjwD/vikOn1Umcb+xkOVqewWUvJvQi7RJsT0EEex7IUz0ZD5o17CYgEDa2bziC0/jnv1+0McykVGjYFsbNPQZxeDJToFLULvG9AVrEr9rtQXRYBtT6jTRdFMVXm2LNj8Fo8hVj38DYZuXbEuz42Kyz2hrvR9Te3q+B2A2daUxAziKudeHSNGELfFTmbN8saaLzfpTZ2QAUBUzeVHITEaRHgKrob/iNuI8bzvHUyXL0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGP3FBvQVavhsQkoHsBcwR1rRQi7tPte9Zym4pNc01A=;
 b=FFnVn0IN4TnPDLBEGf6/U1Yfywd93nCdl+dKyAwbu7xDtiadKh89QEGuQcFquCyF1876Bcq5A+GIfcF9eoeUmBPVjjLIbPKppGX2Gif5aQMv8ZVzNlT1osSfVm/oMF75roF5LUcdXy/SRHWhJeZKsv0x+J9C2Um1Rz3BHXPWmj81ED14AnZtP47taFYFZunmfLHjWDrmPQQqTrH9DHsX+yvBjSoJJTNRlJDg+uje8GEZgnzkkmn6BhPhkN2LyYDqlrgxzWXtDtnVs/BeCRt4l01wO/pfy8D+KpoXsQ6TtWTk3YQtCBMrXauZ+duKpAI93KhRlQup/tqlTreZPYW2sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ5PPFC35D45AFD.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::853) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 23:30:24 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.017; Tue, 16 Jun 2026
 23:30:24 +0000
Message-ID: <d994c06c-db1a-4745-aaab-3abb05466a67@intel.com>
Date: Tue, 16 Jun 2026 16:30:20 -0700
User-Agent: Mozilla Thunderbird
From: Reinette Chatre <reinette.chatre@intel.com>
Subject: Re: [PATCH v3 03/12] fs/resctrl: Add kernel mode (kmode) data
 structures and arch hook
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <mingo@redhat.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <rdunlap@infradead.org>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<lirongqing@baidu.com>, <paulmck@kernel.org>, <bhelgaas@google.com>,
	<seanjc@google.com>, <alexandre.chartre@oracle.com>, <yazen.ghannam@amd.com>,
	<peterz@infradead.org>, <chang.seok.bae@intel.com>, <kim.phillips@amd.com>,
	<xin@zytor.com>, <naveen@kernel.org>, <thomas.lendacky@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <cover.1777591496.git.babu.moger@amd.com>
 <3996883c2d1d47e094f97bab2a2e74df3f8c55e7.1777591497.git.babu.moger@amd.com>
Content-Language: en-US
In-Reply-To: <3996883c2d1d47e094f97bab2a2e74df3f8c55e7.1777591497.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:303:b6::19) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ5PPFC35D45AFD:EE_
X-MS-Office365-Filtering-Correlation-Id: 9094a95c-f9de-4d11-7b4d-08decbff3d77
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|6133799003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: K611KUlUp+pyTaHcGeE4d+ylgAdLG7SECttt0X7yfp+AmqS1Tl4pf+80U240BdK4hhVAK0ccUoAnA7bRuxMCvEFdLef8b1Et3O0bQJhFk8gObDASCo+TdXsxY56EVGtJDt6iJaCMw3vNYlvMuIJszgHDEmWOTVR4ZaVe4XOciyTdFeQuoH5ZDPAOMO3GiiBu/CF+sIS1e1RWZOKOETTWXLXs1sDhnxFi1R2mJVHSXOFB5aM/avO2qtGUzxERry3iYW7T3XKou9jbrSya8wlT6VNqIx3JT8TyGvQuxuXDwGhzei8mt/EXP9px0V6obKC/Ks02yLsbTv1ru+aoLNulaLC2dsJO8LqUzhNNOoEwANex3ncuImhm/VtpjS9vnisBRnaOnGlJzR2JUcTYDtIZ4Lx9x2e/0y3eJO5BIkQXT5oD+R10Ssd0CYzCCycRExLWhxcl7FmYWgy1dL9J4pcqlUdi6Q5E1zn640j6H4o9KplcCFg42o19+XVtuJ/IHAUNQ8NwD1/EbC9c/IVSZa1wWiTZE7cY93ISwBySXiu14cpwO5G4Lmx8fQ6yJSzWMEbHFKCk7d9jXaqImSd9GW9mUlOD5v80rrjoTp8Bm+pP/a8/V/kY5kOD/AOyRmOWd1VCekFmtAAjzXR7jEZJix4fn6uQK3ciqCpWN61WzYiRiGdtvs0DmgN1m4IgpDwT6UKrq+hF7NwRYvLvF+/0vPpE4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWM1MGdXTEc5UTB6dTgyTUp2VVJ5d0U2eS9JOGVMSXdWQVFoQlNncDRQQ3lj?=
 =?utf-8?B?REJCUHdWZDFUN29zSDZMS1JRZXdkV09tbmhXSFNMWDg5N1VxL3ZTNnVYSjFI?=
 =?utf-8?B?RDZic3czQlllL2ZiSGc4bnFXL29Ca081VzFad2ZHRXdTaUJ0ektrWW1rNXg5?=
 =?utf-8?B?c2ViTkhjMVRUcVp1aXg1cmdHNHdXT2k3cFNWQllOazl4dmdjSGh3UDJuRHZM?=
 =?utf-8?B?KzNyc1RSTWdNbmRVeVduNFlESURnaHdaSEVKYWJmWGZ4VGpBcGorUUhiQ3o3?=
 =?utf-8?B?TVlXRXBaMWtvWXFWaE1Gd3pJT2R5cDR4VHdjMnFpM0xtTExYeVhWWnpuRkJj?=
 =?utf-8?B?WjZGQWlxNGgyeFpnLzJyU1I1eTRqQk44dUhUNEdQb3pPanZ1cTBsY1I4TDQ3?=
 =?utf-8?B?cTVGdndwa2ZJVG1rOXIrSnJhWnhhV0laeGZMMmJjbVpyekZ4NW9KWjBCeHVV?=
 =?utf-8?B?d1VCT3lncmNDalB0eFlNcXEra2Z0MXFSU1RMSlhNclBSdmZVQlhVTmRxUjUw?=
 =?utf-8?B?Y0hZQ0k3Z09FSVcrdFJBZHN2STRIS3loVytLNks4dm1rRjBpRi9MZGxJZ0Fh?=
 =?utf-8?B?YmZHem5oTFZ6UlBncHN3eHM0NmwwdTJleFprVDdkbTRFRWNVSEhqM0N6Qkpi?=
 =?utf-8?B?U2R6RkgzK0x6Zllhak9nQW1iM3E2REs3MC9ZeThOMWJxajN1VVNkU0FPeHU4?=
 =?utf-8?B?cXFDTTBrNlY5TE9IMUh2bUUzK2hoNFpaUHBPU0JEZEd4MXU1NWFhM0FlVyt1?=
 =?utf-8?B?cWZHTnJCU1o4Yi9qaERrcDlHZ0ZnajFRMDljTHFzRklHdGxNeW9zeVVLYU1l?=
 =?utf-8?B?TVczNTIrSFZoUzNSMEZCNEdUK2U1eWNZMlhjbzVKOTNHK0p5cXhFN2Rzbk9X?=
 =?utf-8?B?NnJ2UnZkTkJqNWM1SXQ3M2JXc1NZT2RtdDVUcC90WVdxazhhelN0N0hhRGVX?=
 =?utf-8?B?ZjZTelJqa1A1MFJIU2RDbWJMZ21zV0MxdzVGenZXZURpWGVmWEVTcTlVMlg4?=
 =?utf-8?B?R2JRY24rZTYvYmc4U0xFajJNL0JwR3dmSnRESFhnajUrVHQ1dWMzcy9IOFBM?=
 =?utf-8?B?c1B2SktaOFdDZE0yb1pJdjF6QXB4U2NSSzRUcCtOTW5uZTUrM2RJVEVqMXg2?=
 =?utf-8?B?ZE1Gb2VGU0JDcXFmQnNMYjRDK1IzU0ZGV0lMOW9pYUVwL2M1LzQrYks4Smxr?=
 =?utf-8?B?KzFNTjlqVjVFRElpY0Yrc3prSnpBOHRSMHB4d3MrZGhVY2crb0hjTHg2YWkw?=
 =?utf-8?B?S3Myc3A3cGhpQ3FIa2V3S0RnV3RrcXBIOTVjT2g5QVhuMXI1S1FWZTJnUjBS?=
 =?utf-8?B?UElBQUs3WXF6Z0tOcHNFVTlPNnlCS0JueE13SStBV2wyODZQNzJXU0gwWVFC?=
 =?utf-8?B?QURJaWliSGZWVGR6ZGRWbW1SVGUrV1dkdm13MXB0THZGVjJwV3l5dFZjeW9G?=
 =?utf-8?B?ZWRNTnRGaFo2YWZKejRkM2g3dis5OTN1UVdMS0hLQXh5YU5JakNPeFl3NkQ4?=
 =?utf-8?B?NWhydVRPSEFBNWNhSTkrUUh4bTdxNUtKbEdncUZZMFNwK0lDZ2d6M3lEdUxl?=
 =?utf-8?B?a1hFdXdIY0NMVHpJdm5VYmRCOWN6VG50YTJKeVVncEpyeFYxc1pJYjdJMFY1?=
 =?utf-8?B?YS96YjlrV20yVnZoaXF0bnVMc0hFaWl0aTg1SFVlVDdlenZNaUYrcWxBbmNt?=
 =?utf-8?B?c3N1NUIxNERuZHNQSHVvdVNwWkUwSCtKK3dpSFN2WmdnaHFwY0I2azIwMzlu?=
 =?utf-8?B?angxd2s0N1BKSmlSb0tjU3RDUm1IWm5yeFViUkFPQ1gycE5MZnNtaEZKMW5u?=
 =?utf-8?B?V2NuTTFxU1BlcWxUQUo4aHJiZ0NyZy93elhDTW9lalR3NXF6YTNuS2NuZDJp?=
 =?utf-8?B?ZVBVSTJEejc2NHZqeG5tM0lnWUNabEthNzhJMTJtSysrSTc5aklPdnZ4eW1M?=
 =?utf-8?B?ZzdVZ1VXZmdWckE0U1RMRmxJZ3psS2FhYkRHUkJkZ1p1dUdsSGRraXVCOW5p?=
 =?utf-8?B?VEhTN3VoMmdpVTVqN3J5bmJhU3ZqWGVhdTNnTCt1LzgzL09jL2RsUHhpSURG?=
 =?utf-8?B?VUhBZjdsUWVsZWlXRVQzSzBPWmtoSW9RSzBNUU1lUVZydlo5NzNtS3BkTEQy?=
 =?utf-8?B?MkJERmNhUE1zRC95SHVQTW5RWVlGY3I3Y2k3N29sZ2VCRGFOaGNIbzhYdGtP?=
 =?utf-8?B?VlY1Slk4UGwvT0hQd21hdk1YS1F1N080NGJXYThndnoyNlRCWUV2YVN0NDJS?=
 =?utf-8?B?RW5oUEEyakZNZlBuMnVsMkF6N1lNelkrS0JvK1VBMXIzQXlySWNmbnJiYklw?=
 =?utf-8?B?eTFHNzk0Kzd1MWVEMW1kWEhRRzFBTkxlbHlUL3pvbE5tRzZ1NjRvYm9udm5t?=
 =?utf-8?Q?bwY0sxC+f+H0PVFI=3D?=
X-Exchange-RoutingPolicyChecked: Qtdy8FU4AyZlyd4rYQfhugpYCzaznGXrqpuAGw/fUfzzWpSstIB5YiTGVLOb9OrhAW6fer8NiE6epq1xEumaW0t9am7NHIyDF1npp2ApuVWQ/jqHbZ7yDmZ7JxgxVUF+KoQPc4UU5k7QYODzFF+/1nvWlK55UdwGKbIC2bswcTLvuhU74XoIttigHSzprs+U+BQIZ/PduxY3+k8LgVv54mcyG2NTSxkcfm5NY6dAEvMjkBpk5AP+bR9ON+6TkxiaHnAQLdgt8+Ngmggmkgo1VwzzA00BEN4B2uOYPXkRXBXRtu6EzIUEbkyBV+1ZXXR4wAqmxhC95GCBQ7rUDNfHNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9094a95c-f9de-4d11-7b4d-08decbff3d77
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 23:30:24.2996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrZyvUqgOP0Li4bngzkmFUxccyVTTFN+ITsAKIKN1JcKMH+DmsSTfBGkJ+9nlSmy74p3anoC+xYjyy7wKzfEOs3CDOlU71ruQlGO63pkrrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC35D45AFD
X-OriginatorOrg: intel.com

Hi Babu,

On 4/30/26 4:24 PM, Babu Moger wrote:
> Privilege-Level Zero Association (PLZA) allows the user to specify a CLOSID

Subject prefix makes it clear this is a resctrl fs patch so please take care to
not mix architecture specific terms with resctrl fs generalized support.

Something that may help here is to consider all resctrl fs changes to be
relevant from MPAM perspective. Please do so with all resctrl fs changes in
this series.

> and/or RMID associated with execution in Privilege-Level Zero. Introduce a
> generic enumeration so that architecture and generic code can agree on the
> available policies.
> 
> Introduce enum resctrl_kernel_modes with the following values:

Please make the enum name singular, "resctrl_kernel_modes" -> "resctrl_kernel_mode"
Doing so will make its use in code easier to parse.

> 
>   - INHERIT_CTRL_AND_MON: kernel and user tasks share the same CLOSID and
>     RMID.  This is the default and matches today's resctrl behaviour.

CLOSID and RMID are x86 terms where the meaning is not 1:1 with other architectures.
Since this is a new resctrl fs interface it is expected to be usable by all
architectures. Making this architecture specific is not appropriate.

These are the modes that are exposed to user space and user space has no insight
into CLOSID and RMID (ignoring scenario of debugging). I see no reason for
resctrl do dictate CLOSID/RMID assignment as part of these modes but instead
what the modes mean should be explained. If it is helpful then any x86 specific
details can be added by highlighting it is x86 specific. For example,

     "Kernel work inherits the allocation and monitoring from the user space task.
      On x86 this means that kernel work shares the same CLOSID and RMID as
      the user space task."



> 
>   - GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU: a CLOSID is assigned for kernel
>     work while the RMID used for monitoring is inherited from the running
>     user task.  The default scope is all online CPUs and may be narrowed to
>     a subset via the resctrl group interface.  A CTRL_MON group can be
>     bound to this mode.

Is binding a CTRL_MON group optional? Consider, for example:

	"A CTRL_MON group is bound to this mode."

> 
>   - GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU: both CLOSID and RMID are
>     assigned to kernel work.  The default scope is all online CPUs and may
>     be narrowed per CPU via the resctrl group interface.  A CTRL_MON group
>     can be bound to this mode.

It should be possible to bind a MON group also, no?

> 
>   - RESCTRL_KMODE_LAST: highest enumerator naming a policy mode.
> 
>   - RESCTRL_NUM_KERNEL_MODES: number of policy modes; use this to size
>     static tables indexed by mode.

The last two can be dropped, this is clear from the patch.

> 
> Also add struct resctrl_kmode_cfg (the snapshot architecture code returns)
> in include/linux/resctrl_types.h, and declare
> resctrl_arch_get_kmode_support() in include/linux/resctrl.h so architecture
> code can advertise the supported modes.

Above mostly just describes what is clear from the patch. Instead this can summarize
what the addition does: "Provide callback with which architecture can set the
kernel modes supported by it". (not exactly what this patch does though, but more below ...)

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v3: Removed resctrl_kmode definition.
>     Changed the kernel mode definitions to enum resctrl_kernel_modes.
>     Used BIT() to set/test the features.
>     Added details to changelog.
> 
> v2: New patch to handle PLZA interfaces with /sys/fs/resctrl/info/ directory.
>     https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/
> ---
>  include/linux/resctrl.h       | 13 ++++++++++
>  include/linux/resctrl_types.h | 46 +++++++++++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 006e57fd7ca5..ce28418df00f 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -699,6 +699,19 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
>   */
>  bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
>  
> +/**
> + * resctrl_arch_get_kmode_support() - Advertise kernel-mode capabilities

"Advertise" implies a "broadcast" while the function name is "get" that implies
retrieval.

Why does resctrl query the support from the architecture? The typical resctrl initialization
involves the architecture setting certain capabilities. This simplifies enabling since
it does not require the addition of this feature to be accompanied with an implementation of
this call by every architecture.

Instead, resctrl can just initialize the defaults and an architecture can
make any adjustments using the optional callback. So, instead of 
resctrl_arch_get_kmode_support(), why not resctrl_set_kmode_support() that is
implemented in resctrl fs and called by architecture?

When considering the x86 implementation of this it seems as though this implementation
assumes that all architectures will support inherit_ctrl_and_mon but this is not
enforced anywhere. Having any assumptions enforced/verified will help to make this
more robust. The fs/arch separation depending on so many architectures
"doing the right thing" seems risky.


> + * @kcfg:	Architecture ORs BIT() flags into @kcfg->kmode for each supported
> + *		&enum resctrl_kernel_modes value (see &struct resctrl_kmode_cfg).
> + *
> + * Used for optional features (for example PLZA on x86) that can assign CLOSID
> + * and/or RMID to kernel work separately from user tasks.  Generic code compares
> + * @kcfg->kmode with the effective @kcfg->kmode_cur; when a global-assign mode is
> + * active, @kcfg->k_rdtgrp identifies the active &struct rdtgroup. The default mode

Does the architecture need to know these implementation details? 

> + * is INHERIT_CTRL_AND_MON and group is default group.
> + */
> +void resctrl_arch_get_kmode_support(struct resctrl_kmode_cfg *kcfg);

Why does architecture need to know the layout of struct resctrl_kmode_cfg? It only needs
to share the modes it supports and need not be concerned with any of the internals - from
what I can tell the hook to program the kernel mode does not use this structure either and
this is the only "outside of resctrl fs" usage and it does not seem necessary.

> +
>  extern unsigned int resctrl_rmid_realloc_threshold;
>  extern unsigned int resctrl_rmid_realloc_limit;
>  
> diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
> index a5f56faa18d2..3aba07764b99 100644
> --- a/include/linux/resctrl_types.h
> +++ b/include/linux/resctrl_types.h

Please keep in mind that resctrl_types.h is reserved for those types that an architecture
needs to use in its asm/resctrl.h ... it does not look like any of the types added here qualify.

> @@ -68,4 +68,50 @@ enum resctrl_event_id {
>  #define QOS_NUM_L3_MBM_EVENTS	(QOS_L3_MBM_LOCAL_EVENT_ID - QOS_L3_MBM_TOTAL_EVENT_ID + 1)
>  #define MBM_STATE_IDX(evt)	((evt) - QOS_L3_MBM_TOTAL_EVENT_ID)
>  
> +/**
> + * enum resctrl_kernel_modes - Kernel versus user CLOSID/RMID policy

What does "versus user" mean? Can this be dropped?

> + *
> + * Enumeration values are contiguous indices from 0 through
> + * @RESCTRL_KMODE_LAST inclusive. 

Above sentence is not necessary.

> Global-assign modes treat all online CPUs as
> + * in scope by default; a subset of CPUs may be selected by using resctrl
> + * group's interface.
> + *
> + * @INHERIT_CTRL_AND_MON:
> + *	User and kernel tasks use the same CLOSID and RMID.

Similar comment as earlier. Since this is generic resctrl fs interface it needs to
be applicable to all architectures. For example (same suggestion as earlier),
  "Kernel work inherits the allocation and monitoring of the user space task.

> + * @GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
> + *	A CLOSID may be assigned for kernel work while RMID selection for

"may be assigned" - this is not optional, right? How about "A control group is assigned ..."


> + *	monitoring follows the same inheritance rules as for user contexts.
> + *	Default scope is all online CPUs: subset of CPUs may be selected by
> + *	using resctrl group's interface.
> + * @GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU:
> + *	A single resource group (CLOSID and RMID together) may be assigned to

"may be" -> "is" ?

> + *	kernel work. Default scope is all online CPUs: subset of CPUs may be
> + *	selected by using resctrl group's interface.
> + * @RESCTRL_KMODE_LAST:

Documenting @RESCTRL_KMODE_LAST is not necessary.

> + *	Highest enumerator that names a policy mode. Use RESCTRL_NUM_KERNEL_MODES
> + *	to size static tables indexed by mode.

No need to document this.

> + */
> +enum resctrl_kernel_modes {
> +	INHERIT_CTRL_AND_MON,
> +	GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU,
> +	GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
> +	RESCTRL_KMODE_LAST = GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
> +};
> +
> +#define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
> +
> +/**
> + * struct resctrl_kmode_cfg - Kernel-mode policy snapshot from architecture

Only @kmode is initialized from the architecture. The rest is managed by resctrl fs.
I do not see why architecture needs to know the structure details.

> + * @kmode:	Hardware- or policy-supported modes: each enumerator from
> + *		&enum resctrl_kernel_modes is represented by BIT(mode index).
> + * @kmode_cur:	Effective mode(s) in the same BIT(index) form as @kmode.

"mode(s)" ... this is plural implying more than one mode can be active at a time?
Should this not be just one mode and can thus have type "enum resctrl_kernel_mode" to make
this obvious?

> + * @k_rdtgrp:	Resource group backing global-assign modes when applicable;
> + *		initialized to the default group at boot.

Why is this initialized to default group at boot? I believe inherit_ctrl_and_mon is
the default mode and it does not have a group so should this not be NULL by default?

> + */
> +struct resctrl_kmode_cfg {
> +	u32 kmode;
> +	u32 kmode_cur;
> +	struct rdtgroup *k_rdtgrp;

Please align struct members in tabular fashion. 

Not specific to this patch: After so many contributions to resctrl I am very surprised how
this series does not respect Documentation/process/maintainer-tip.rst in many ways. For example,
later patches at some point just stops writing changelogs in imperative tone and just
documents what the code does, patches document locking requirements instead of using code
like lockdep_assert_held(), variables are not declared in reverse fir, changelogs refer to
other patches in series. Following Documentation/process/maintainer-tip.rst should be 
very familiar by now.

Reinette

