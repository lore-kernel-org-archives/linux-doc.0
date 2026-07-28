Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FDD63CB;
	Tue, 28 Jul 2026 00:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198604; cv=fail; b=Fh1h+OzFjX9ReLn9V+sf8zJjDPmd68BSHUOfz0Cn7hYOj2qo1VcLNVhBEL4s7KTtx6IDXhL8QXR/nBUNPkKuPyv6z6LAXAq4jJ+QBuZFQ7XAoNX9thw31nrCzyAlDYTOMi3xzau2VnqpnK09XTwyE/NMEksNX6Pq7AZwg+8ieEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198604; c=relaxed/simple;
	bh=4x02D43li8EbUpjipvuom9zgylzs2uz7lL0Q4SE1UQA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WEAsc+rmNtd75QghM/ZHsYMVDLeA3iUIprL/ryPuUQFQMOUj+sHpJJGcQtBBvYKf04XuS2vONq1wynO2UvFnZ8Vmid21cmRW0K9HHDceZeLnUv92ZvxHC+Oc+Yd2wwFVcMbH2kboioEqHWOxC430mI+LE8XEB4NtO27tC3ckbuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdedDMVl; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdedDMVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785198601; x=1816734601;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4x02D43li8EbUpjipvuom9zgylzs2uz7lL0Q4SE1UQA=;
  b=OdedDMVlxUJL5LSCH2NYb3dFQKS9jkzfFRwf/Y/LCyCl05yjjF2lLxp9
   kYR4EOf4xN8Hlw6NGNaOnpr+0Rf49W6+DiQf2kbjlM9RLAL+8T0QTSKkt
   TlNYP75HXaMnxpaoYwXgDlUy9BBnw3OG93BERv/LL5VJUuUju200tpW1Y
   U/NP/0UgmeckTjX/BKCvCZKRW9TXpTXV3AM6ugfH2e4TZWRr8buxXjS3N
   0n/+AJz8my2ltCHt7yQQ33sQrw4MhLHO01wasNe97y4rTvrBptPeYSAV/
   iNvDV2kkbG16222aKGNpNW0oRivw/bXgl+aTQ2i7o81+ZEGuGM2Tv94B+
   w==;
X-CSE-ConnectionGUID: Ai5tKgd4SfOUMmCkffkF8g==
X-CSE-MsgGUID: wW6jrgspRnuJeRzEsyNRJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85815787"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="85815787"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 17:30:00 -0700
X-CSE-ConnectionGUID: Bq/wn69/TIScBtJb/t0G9Q==
X-CSE-MsgGUID: ne16YxN+Rg++qNaZUQgVDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="284089221"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 17:30:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 17:30:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 17:30:00 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 17:29:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbYQoz/kCjohyM9AoyUe8V0Wge5iQE/tzzFDU3g558trIKsgW5vYnsLW0K2Izt8b1FwGCWNsIKMREnoYC4roNzPNJUiWYcuFKpdY14i7mt9RnVvR/0LwAgzZ9wEWQwiJDkzGKX7j7k7S8Gm9GpSAZ4XB7Xu6DOVVjVFvMNvmvMTVwZZSNpGBDAVHd3SXJlBUdwgsYtNF9k0i2O9n2zbqsHjj235pJ4TkqYfao9YHJVeSCCpRpWhK1/LDEmFYU6mq51n6oO0hbFXVBo0oGpuhgSoMWrzdFDoVw4DicQ2PE/bO6lgwb/g6NPpvq9UuLEhXNEHC0zrt37hlyFpYNkQasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwraReL7hNdULT9h/CPY2ke8Dxcudr8ZV9OFgjwf820=;
 b=qG8vYtBC6rQ+hguJMEImBa0vBqyv4LLZ23TqbWkqeOtg+3S8Jad7rl8ChOEMIPyhjBKNlRJ6OnMJ51X9s+B6rl7DtK0A3o9OBZLvGPoTVGiCGNtrT2Lik4bmIF24DnsAmXwQ6E/w1Lyn4QGYWFJXiSkByYZ9ATgGjZjbhqh7q+F27sE3SIcIEwjcTzB1RMdM92rp1Z9g1dCck4jL2jWAlwiD08nXLQKvjsq5Vimj8v5tjsdVxvnfKe8INhtSbv7zzTEdx+zqUq554pllmOlFV5BlinMqBIQ4hmnAV52HO9Iuy6kkIQ17ArBswNvW6tuiFJyl+Pbd0kT2BtlYXhygdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MN0PR11MB6303.namprd11.prod.outlook.com (2603:10b6:208:3c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 00:29:56 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 00:29:56 +0000
Message-ID: <77f77d02-fae7-401d-9bb5-c62b244d23cd@intel.com>
Date: Mon, 27 Jul 2026 17:29:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>, "Borislav
 Petkov" <bp@alien8.de>
CC: <tony.luck@intel.com>, <x86@kernel.org>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <b0dc49dc-ac35-457b-90c6-842a3cfcf8e1@amd.com>
 <f3fd774d-0662-4094-90b6-f0c5a4bc5d26@intel.com>
 <78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com>
 <dbbe2eac-bb0a-4655-9d0e-6e8feb702717@intel.com>
 <e77ef79c-5241-4f7c-b0af-dde6f131600a@amd.com>
 <bd739e7e-7a86-4291-9c08-f2c72bc2dc3e@intel.com>
 <48fef38f-8e2a-45e3-bb60-f293a1d60be8@amd.com>
 <c1979f4f-eabc-4d71-a711-ab465b9d9c1e@intel.com>
 <20260724231239.GAamPxZ2IZiFYRmAfg@fat_crate.local>
 <911ccf29-e152-4bf1-9773-04680bbe9638@intel.com>
 <20260727140539.GAamdls0q_W0zUmhqw@fat_crate.local>
 <119188c4-1127-4155-9a05-dff47e25be85@intel.com>
 <7469f2ae-10ed-4b30-a8c3-9d786c99c746@amd.com>
 <d2c4e17c-2aa3-43a6-980f-ab4bac769852@intel.com>
 <5a8815ce-487c-4ec3-8c38-d9b3c067302f@amd.com>
 <62559344-5182-4d16-a9ad-e22163b20e7a@intel.com>
 <d393895a-9763-401d-a04c-90bf15f7e9f5@amd.com>
 <386b441c-286a-41e5-b878-50a6debb7571@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <386b441c-286a-41e5-b878-50a6debb7571@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0240.namprd04.prod.outlook.com
 (2603:10b6:303:87::35) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|MN0PR11MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b1c6931-9cc5-4f4c-c648-08deec3f5984
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: FaoQj4X96Q/4kzThv9XMj+tDlVDR+Vm9j8HVBtxMLOIvUlitRtkfbjo2cenOm+nhQOnaxOEWeWB8San05RMBBfkHn74fNXs8Cng75pKdRM89DGPtLOtGbhu22SVmknNwTWFGhb8yJE97gl8Tfconw3PhTp8tXi5q00lsl9TkP17CvboFZOdVIh+ed9o7LZcWLRhUYI2tl03Bk59wit3dQBHyMrYbvDBX7o7ZRIRazcG2xmWZ0tVVIaFvyDHrTrq0Khyy1NuRCT/et2P5bHRjXBP7RjSip82yTMRJ0zn48GDvWAH05kASa1klnbmECj3utD3XIIc1JIyNawgB5PCDkLp8KgH8lH9l8Z0vu4cPGyS9+9WPXcupY1lYB/cMlcizHbvCAZpWoOHfdoiSFwr1YCqShAeGgUXrFxbIIprFs60y0GmNrnmqYAEfryUtDQRfNITCP64v8/EUcy0pRYG99/TAtoOYY4oAt9x1dGSS5GHT40lYWlZyooYBrIYqnsmrwe6oITiNGoP7haDm5y3NUTh3T90IPnqtOdJrKyUhwPOazdHh/KGy4J2bKJZHdHqIU/ZqXTk30w0DSKa516izigzazoJs0S+uW6I4Nw3I+kIxSyOpV35fgbTieUTgRW+V6rwjtknSPtGxE/HBMP0W5oaIvcrzgt8XrOCiVTf+DoY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnlIWURYT2FSZTNkYkVyajR2dHZSNmYyN0UzTHN1QVRRVEtjNGkrUUZnOXY5?=
 =?utf-8?B?cVRJZU1tU0wwZmRzWXJGREdvREFHKzlQK01RNGJMTHNJU05pUVdjOVFJWGl1?=
 =?utf-8?B?RWw4UVRvblBnd0p0M0g2T0ZmeXNXeUFaZXBaRHl0MU84VzNOUUdDQTZzVHB1?=
 =?utf-8?B?bWNsTG9FR1ZYclJ1dDhwVGJmOUNWY1ZhSmlwbXRhaTVJSWhsWUk4KzlwaFVY?=
 =?utf-8?B?MmdITE1WbXdBc3RtTi9IbmlsSFg0cXpBZXNDdEl3LzFNS3NTZzRIS01VQ1Jt?=
 =?utf-8?B?UVB2Y3R5VzZORTR2eXNyRlFydDFrSmV4MlRtRjIyTzZmd1JZc21KV005UXBx?=
 =?utf-8?B?ZXNnS251dWRPd1MyZjFmcDBSZXJITWo1Zkd0cXVoWm04eERrOVllV2hmdDM0?=
 =?utf-8?B?bUpuS3NWOG5Seml2S1dlYWpqK1J3ZGZjNjNLTk9KczFVMTJxZnNRWHE4WWZY?=
 =?utf-8?B?cmQ2S0N6V3RsajZCOXlLcW90NWM2NHp4SHJ0TFM4UkNOblQzUnBGYjdUbnZ3?=
 =?utf-8?B?OWNjaThpVHJyWmR5TFpDZlVFUDFFTWZ0dkVqQ2U0V0NObVoxUEYycW1mZGhR?=
 =?utf-8?B?NzNDUHBzMTFSRXIrNGF3Z2h5L1RDMG5lTGZQM050dHMwcHEwN0o0VHBsR0N1?=
 =?utf-8?B?UDBRSmlMb0ZUWnp0WVhWL1NucU9JY0plNXRlTk1scTlFbmR2NHZpaUJlMzVl?=
 =?utf-8?B?MElOVkxXTERlU2NXVkh6T1pUZStabkNwNGhWME5HQ2svbXN3Y0UrWE5BbnQ0?=
 =?utf-8?B?dW1DNXBSM3RtNWtVMjE3QlZJUWw0bmpWbE14R1I2RmxRZkxPSlZSMFNnNUpI?=
 =?utf-8?B?bnhaVUhrTVdQVEdZcFFtR25udC9oV25zeUpiaGIyVEd1RTJEekJma3ZnRzZF?=
 =?utf-8?B?M0lpaDJYMExIWXNDSVkyRlJheXFDbzBmVmhiSE51WWxPQ0JRQ0tyVjFuVVFi?=
 =?utf-8?B?dzA1YTZRVWNGUzkycUEvVFMrNHRzcHZzaGJiOG1wOVJ6VzJQaE5sbHc4Z1Ez?=
 =?utf-8?B?MGo2dndBUzBTOGtSMnJ6TzVCZTRrTDBBek9VUlVRVFVDbVhISTg2bDBZUTBG?=
 =?utf-8?B?QU15ZVVNb1NGU1J0bWs5SkxSdTJ0bm52cUdmUktQM0dxOXljN211MDM3bGdY?=
 =?utf-8?B?cTF3ZVI1M3FDSGszSjZWVEM0WUxrYmtkSkVSLzRWM013blF6ZDYwa2JlK1BM?=
 =?utf-8?B?YUpqcjJsMXRXTlExam5Sa2dpc0EzdnF4MUJiMkNBR0tqQ3d4M2t1MnZXMklz?=
 =?utf-8?B?eHRXdDE0RXliUFM1eGxkZEtDU05ubVhoQTZBQW9XbTB5MnVTK2QxcXhLcnh0?=
 =?utf-8?B?V09FTzdQUUdPK2plY2NTQ1RZK1hObFVUYUN2QXp1NmtSTEdjcGhyeVNvNG4x?=
 =?utf-8?B?S0tTMFBJclFyb2Qyem12d2NlZlBPelpKNmp6dGFXL0ZRTWliV1c3RHl5RDd6?=
 =?utf-8?B?eE5kaGhKSjdWYklablA0M29ud3hraWVMNHZ6Um0yZnU5K1pGTWMzK2g1V0Q2?=
 =?utf-8?B?QkZqT2tiOWl3OEo3TERvRW1Zazk0azN1K0RHSTBOUnBSMnplRnNRL1RWUmN5?=
 =?utf-8?B?N21HM0lvdjBHWWVEQjM2bEJtcmZ0eW9YZlVOK3dMazQ3L0s0dDZ0S0lUb2NG?=
 =?utf-8?B?ZDN1N2J5RTBtRWpwSEMrUDZrU1orTjVUN0ZjT3dDb1hneDNzRFh1bjNtOWFK?=
 =?utf-8?B?bUs2bmRVRE1RbWRDeFpma0l3alN4emZ6TTg1aHB2K0MzSlB3V1F1ZzZma3FP?=
 =?utf-8?B?ZEFZU3FZMGNnSFBMWWdmTFBGeEczWTJtQlFqdzNvdDVmZ0pId1NQZ2FUTStq?=
 =?utf-8?B?M084dHBtMVZISnlBUWlyQjZLR0hnNlJBdzFDbVNoVzM2bmtmNHFqaDhuVWcz?=
 =?utf-8?B?dWFRU0daTVlKeTh1aDdTY0tHYXZKTk1zQ05IU0VlZzFsVkh2T2FxOHA2QTlO?=
 =?utf-8?B?S0RIZEdjK0ZHUTBWamtBZ1dJVlFWOWh1S0FRTWdIOHJpNDB3bmdaV0p6aWgy?=
 =?utf-8?B?N2xqMU9XWExrdE9oMlNIRkZqS0Y5YjF4ZHdlaWlQWE81NUNrUGJPOEpzb3pa?=
 =?utf-8?B?NVd0N3QxV1VmYkJxSnpQSWQxZlRwRkhjTXowYkk5MXJ3OWdRRUhDU1lRa21m?=
 =?utf-8?B?L21hYUc2TDJ2T0IzUHRFZWQzMjJDdDYybng1eWpvTTVLZGYyMGVTSGhHYS9v?=
 =?utf-8?B?U0swTEszRHlhT1lsemtQWmhlMTU3T2Y3V0owUTNwZWh1dWhlZ0dQY0lzSUFh?=
 =?utf-8?B?NUJwT1BjQzRmYmZCaGMzYndVUkVtS2RKYmdsOG8vSi9YMTZBUkNYcHhtSmY4?=
 =?utf-8?B?U2JkcHpmTVB6Zy83UmFQMGZIdmhRczdvYVhkUE0reGpmeU9MdUVHZlF4WERH?=
 =?utf-8?Q?uBl5pgXdMEFDKE8U=3D?=
X-Exchange-RoutingPolicyChecked: o8oDaPpd8BxOJIZfC3EwBTxQxYAPB8XeV4wJV12q+9bg1Iu8hbfKAC+Fp3S740dic3xwxhY4Sdhv6ZSH5RtRfwPLDhoRvQ7xBBDBxVCU+v7QB3JnkXWD8s9dwX/4V6XW87NRwCPhA4BT1vq9m/axmWE5LsnzrklFsUcj0tAzgJMyqxvVOlg27W1BHrh331FZ0agSrZrjDz6FFZqh5sbc7MM8jSsRQ5Wn5SCseCPEy7RrulrIMaLo03mA5mlhFzFRZLq8QAPEqeMgUruZgP+aLcA1OZwEEy9xWUToElyvD3yvRNefCfCBfwu/OEToBDaqcoRkG3ZeRAQtb8jqiAD1Mg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1c6931-9cc5-4f4c-c648-08deec3f5984
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 00:29:56.5272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYjBzY3hDtYxblvYb1ZyMUviteCS2+1poln2bBN0iW7n0h/WFK0usaBs5BqQ5xEAem9HTf/+5gXNVmiQZjL2NJktyDMSQjz3DioRId+avCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6303
X-OriginatorOrg: intel.com

Hi Babu,

On 7/27/26 4:29 PM, Moger, Babu wrote:
> I still have to get back to few questions(test details etc..) on this thread. Let me get back to on that later tomorrow.
> thanks
Don't bother. 

I just installed a distro version of pqos utility and modified resctrl to return "Unavailable"
once in a while on an Intel system.

Below is the output on an idle system that confirms the pqos team's analysis that
it perceives counter wraparound when there is none. This is when I run with something like
"pqos -m all:0-143" to show all counts. When I run with "pqos -m all:[0-143]" to provide an
average I see the number repeatedly jump to the large number and back over time.

In summary I see:
- pqos utility does not support all scenarios of memory bandwidth measurement
  on AMD systems without ABMC active. pqos may intermittently report very large
  and incorrect bandwidth numbers.
- pqos utility reports 0MB/s when there are unassigned counters on AMD systems
  that support ABMC (and it is enabled).

As I mused earlier (https://lore.kernel.org/lkml/119188c4-1127-4155-9a05-dff47e25be85@intel.com/),
I do not know (and can thus only speculate) why the issue with "Unavailable" handling has not
been reported before.

If you are expecting more pqos usage on AMD systems then users may encounter output like
below more and more until the fix is created and propagated to users. (sidenote: You may
want to participate in the fix since it may involve exposing the text state, including
"Unassigned", to users where currently it is 0.)

Considering this, could you please confirm that you consider default mode the best
choice? After all, "it will make things keep working as it used to", which sometimes
will look something like:

   CORE         IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s] 
       0        1.77         16k         0.0 17592186044410.4         0.0
       1        2.74          9k         0.0         2.0         0.0
       2        0.75          0k         0.0         0.0         0.0
       3        0.71          0k         0.0         0.0         0.0
       4        0.71          0k         0.0         0.0         0.1
       5        0.71          0k         0.0 17592186044415.9         0.0
       6        1.59          0k         0.0         0.0         0.0
       7        0.72          0k         0.0         0.0         0.0
       8        1.20          1k         0.0         0.0         0.0
       9        2.48        887k         0.0         0.0        90.6
      10        0.73          0k         0.0 17592186044415.4         0.0
      11        0.68          0k         0.0         0.0         0.0
      12        0.53          0k         0.0         0.0         0.0
      13        0.71          0k         0.0         0.0         0.0
      14        0.72          1k         0.0         0.0         0.1
      15        0.70          0k         0.0 17592186044415.9         0.0
      16        0.76          0k         0.0         0.0         0.0
      17        0.72          0k         0.0         0.0         0.0
      18        2.48        116k      3456.0         0.0         0.0
      19        0.66          0k         0.0         0.0         0.1
      20        0.64          0k         0.0         0.0         0.0
      21        0.65          0k         0.0         0.1         0.0
      22        0.41          0k         0.0         0.0         0.0
      23        2.49         88k      6408.0         0.0 17592186044313.9
      24        0.96          1k         0.0         0.0         0.1
      25        0.03          0k         0.0         0.0         0.0
      26        0.72          0k         0.0         0.4         0.0
      27        0.71          0k         0.0         0.0         0.0
      28        0.67          0k        72.0         0.0         0.0
      29        0.79          0k         0.0         0.0         0.0
      30        0.79          1k         0.0 17592186044415.9         0.0
      31        0.71          0k         0.0         0.3         0.0
      32        0.67          0k         0.0         0.0         0.0
      33        0.72          0k         0.0         0.0         0.0
      34        0.72          0k         0.0         0.0         0.0
      35        0.71          0k         0.0         0.0         0.0
      36        0.83         28k         0.0         2.0         0.0
      37        0.86          0k         0.0         0.0         0.0
      38        0.62          0k         0.0         0.0         0.0
      39        0.67          0k         0.0         0.0         0.0
      40        0.57          0k         0.0         0.0         0.0
      41        0.87          0k         0.0         0.0         0.0
      42        0.74          0k         0.0         0.0         0.0
      43        0.79          0k         0.0         0.0         0.0
      44        0.73          0k         0.0         0.0         0.0
      45        0.86          0k         0.0         0.0         0.0
      46        0.93          2k         0.0         0.0         0.0^C

Reinette
