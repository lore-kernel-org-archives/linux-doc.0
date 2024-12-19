Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF36C1DC9A4;
	Thu, 19 Dec 2024 22:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734647656; cv=fail; b=s0N02/2xwl8V9G4KHmiRBKWN+CBZRbxySbZMKdYdPhq1XOPmKxpVm2qPmYrgaxVswUa6JS7HWlkF74e+7g2XR7oQ8VINBmnag6DEO9GNFhQsOByVi2/JpVSIAXB8Q66BvK87INjGuPNbJH+weiAHZjATvzgNvtCF0LC+SZNyhi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734647656; c=relaxed/simple;
	bh=1fPEP3v7jhN/EFLzuGLfG0RzgyDYVuXVz8G8M2SRRvw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CFEuLnmzasMnKvhwdUSBFdmMUUJ5NNbpwrloWS4EW6HSdJyeLs6D7xIiGN7izhdnlGznv5iZ7Rd33wj+czUF3WMg95VWKbtRfxgitrKH/GmuxbDCeV7YCHdQPpveexWuYC3dD/ajdXx24h48ZoG7keNgQndvY/0CDrbm5amB3Hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGuJr6gf; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGuJr6gf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734647654; x=1766183654;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1fPEP3v7jhN/EFLzuGLfG0RzgyDYVuXVz8G8M2SRRvw=;
  b=iGuJr6gf0HFeKcAiRIm9fjhJj1jxwz43oqOuSza6N6slHrYJspsECzzB
   KsG8V08Khxnm6i5fy7/Bu6XdsJqC1G1Li+Wdx/nQrh9oAEPS4camNhAzP
   x3+W3xqYLboiIvIH+33S5mrQmgwTMrWPdtj58EfwHtUgchTbHnwcCaUAo
   KuWiwYUBPnV7rkgqopdxxg2VnqOQJNEl9ToPKWYe0HHQ98W40ALpn6j36
   G8pVOxqt6MJ1ht64JyaEmxJOhZuAJdUGp/kIeAT84OPs0V0lwRxjN7yYg
   ib0GXXEW17EVDZB5BxcqjQX8uL2RK8YDtz//4LymK7txKL6TAlVareQU8
   A==;
X-CSE-ConnectionGUID: qgL9LU5DSmaRmUSRPUbNCA==
X-CSE-MsgGUID: H8r36ju6QCSMA5FvR8308Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="38870350"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="38870350"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 14:34:13 -0800
X-CSE-ConnectionGUID: KgqNQ1c0R9ed/2XAz1HY5A==
X-CSE-MsgGUID: abe0fJBYQlOwK6wyTzoHGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="98863963"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 14:34:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 14:34:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 14:34:09 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 14:34:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5CCiLS8yuQsrSdF7IZBc+sVxWOTKrZhI5CMW78bCrtR3EQnB9e+L+fCuHZnv5qCZi/fQQFTtYHYDc/bTBVyqU4uZ9FQcrD3RNwUNrLPXXNegdue9srhRmxsOhSqEPfDyNdMuwVfpcOAAbhFaWvWS3nS5c6DsluRVTzCAFEIO1u3nxyZnYL5IXop8k5Q9NUPGl2Gb4sKVg7g/Ua81lLsslw7Sx/qxWCvum+/rN0c2akVRw20s+120lrEhTELH+tweNb69CsRY9/bJHtxjZPcPLnySwg404WpF9XUPmPRF4nZHd4L+Iyq40G/5fDbSdO16csvNpZPMHegfiokF6Wd7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGXiWZqz4vYBznoKS5OT2VbNdGt3Im7+ihkHb/yErRE=;
 b=Md6HfULaCT9SiyLDUjSDzq/Pwh9zp1HLhlmt4abwr9NYIEsnFozhHfaCPq2Cu8QEgF/0HiQjqvI4O51Bab4MmxFhjaTtmM6QmkUvaepUuZn7zY3d2lgtQbiWkrIihts/TMOmOzreymtGIFWgtHatafVsMX9o492Zg+ZBu5oV6JIKoLi39RQKVvFlQeGqY6WRP2TtL59iBGB0K8yG9QR8latBkrhUXcd9psprxaVti2VUdmar39vS+rFMV+Xcqnz8utWzJsEquDoEGlje8Z5sKqAk0U1aSrwP0IrKSkSTVTEphH0m/t0uq3XOx4zJPFiXQ96pAmglwOKj+SPkhrU/Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ0PR11MB5168.namprd11.prod.outlook.com (2603:10b6:a03:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 22:34:00 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 22:34:00 +0000
Message-ID: <9a8a0e45-82fd-4126-86d7-a4f7b2d583c3@intel.com>
Date: Thu, 19 Dec 2024 14:33:57 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 12/24] x86/resctrl: Introduce cntr_cfg to track
 assignable counters at domain
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
CC: <fenghua.yu@intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<paulmck@kernel.org>, <akpm@linux-foundation.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <perry.yuan@amd.com>, <andipan.das@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <seanjc@google.com>,
	<xin3.li@intel.com>, <andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1734034524.git.babu.moger@amd.com>
 <5abf8affeaade3e7b08e9509d11bc78143935800.1734034524.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <5abf8affeaade3e7b08e9509d11bc78143935800.1734034524.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:303:dc::29) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ0PR11MB5168:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f859dee-de92-4bbf-aece-08dd207d3bee
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFZYWU81dG8xNHJNV1hTWjU5SUVMQk1NMGFwcXZvQkM1VlpXQXJrdFVSZERF?=
 =?utf-8?B?bHh2NklmY1JpNGc2WWRLMTN2QmoxVEFXa2R6K2REOG5KTFhiWVZ0YmUvc0pk?=
 =?utf-8?B?cE1pbmhSNUVyTDV6R2tTM0xiUU9rSjNhbDhuRmpZS1FYTzAza05idDA4K1JE?=
 =?utf-8?B?a1RCdFArcDZtaXQ4U08rN3JsQlVxMTFWZ3RoL2pWbnhsTDFHdDNqMDhVTWtY?=
 =?utf-8?B?R0d5MEF4REh6YzE1STAzUW5MUUtINUJQd2hPUTAyamZpUFp3MzFVN0lRMyto?=
 =?utf-8?B?YlN6dzJlVlp5dkRuOFB1SGJhSWpWMFRlYjB1MytZR3VaVnVIMlE1UDJ2bkpT?=
 =?utf-8?B?aE9sN2RPNFB4eG96NFg4UFRGay91OSt0TUpQL0VlYlZwYzVCZFVzRFVxQWpV?=
 =?utf-8?B?dlQvd2J5QlBQU21NT05hZ1hJalJPbXpERE1WU3A1YUJFUmpVK09yMlpVVmhn?=
 =?utf-8?B?WnBOdTUrZ3hLKzRGUUsrV3NwOS8zRCtHSVd0T2w2RzJ6SmVDd1hOcmxvSGVu?=
 =?utf-8?B?RlNvK1VHM2t1Y0g2bnc2QkFQZk9EdnhxTmU1bHRKL3RHM1pwYUhPOXpZZjEz?=
 =?utf-8?B?ei9POWZ5Q2hPRFhzQTdnR29yTFRYbnFsQVA5UVQvUWNXWU9YdW94aTBDczB6?=
 =?utf-8?B?dEJjOTlzUENtSWNsY3FQc3V0SkVQUWF1dSs0UjQ0MnJpd2s1Y1VNYUxXQmE4?=
 =?utf-8?B?NWlxZW81ZFFwT0lDYk9LRjRsV2xJelZ0b0NOVjhwbld5YmpFNm1sZGhsU3B0?=
 =?utf-8?B?L2xGTkcwT0hjK3U4eUs4cEh0eFhGTVdlQ1F0bkNxY0IyWEZEZXUzUHNxakJI?=
 =?utf-8?B?dWc1MDZmY2RoOWV1c1F5SU12dVJ5T0FVREozakNCU09WdDJIRlVZNWxjWSta?=
 =?utf-8?B?UHc0dWhta0RIZXM1UnROdEg1ZE9hWDJnVm04ZlY0QUtYSWt2b01UUnZidG8v?=
 =?utf-8?B?c3BhYXJVMkEvY0dVeFMvU2dsWEk5MzZtU2lnYzVhMnByNGtyeFZLbXBBQ0tM?=
 =?utf-8?B?alBuRWk3cDY5NkxOU3hnMUFCSXNsVldwVmlMYlFUZHVjZTBKVStRdHNHaVpu?=
 =?utf-8?B?YXQwbUJpSGUwdWVSaDhnUG10MkI1aEVHOVdPVWgrTXhkc0p4RnVPTFBqdjVC?=
 =?utf-8?B?QVNEby8zbjd5SEU0RFZPUDVWbzVvNmZhNnhXaXkxQ2pMNnF3d3RBdTN4Z0dX?=
 =?utf-8?B?dk5WdHJnK2RsS3d6cXZaQy9uR1FyNnQ4R2hFazZTdXJHUkxNQ0paVldnckp5?=
 =?utf-8?B?Z1NnalFuMHovYTEybkpLUkhRc2pEa1RscS9OaXE0SXNzdFBxWkJJSU1iNFRC?=
 =?utf-8?B?R2NDbkJYbmdOS29hMXFOYmQ3MVVkYUdkckZnSmwzSHJvNzBWaCtVcm0rcWtY?=
 =?utf-8?B?dk9PcGp0dmtvZTBCN2k3djNIZDVEbHN4Z3FETEVKS0RpakxxczFZbHprUlNk?=
 =?utf-8?B?SG4xNXcwbWNBT04vVUJVSSthSnNOaWF2aW9ZdFV4TGlmS0ZLRkJ0eWoxQXZn?=
 =?utf-8?B?R2hQVU9idkI1OFV6UkpZSWc2VlZLek5pNjZrWHlOa01qRWFuMzNGK2lwdXB5?=
 =?utf-8?B?a0FpYXR0S2J0MjkrNEtTT1phUUFVR0VTZ3N1cFhZNzdjenVkbDZ4UWdLK0xC?=
 =?utf-8?B?U290YU14dWI5SE9LbUhRTURBT0ZtQ1lQU0lwRTRvYkU1U1paQzMvc09rZU4v?=
 =?utf-8?B?Q2pXR2lZMDJBQklTeEVQUjU3c3laSG9SczZjQVpyVjBycmV1dXhwMFM4M0NS?=
 =?utf-8?B?RlZkRENWSmpGWmpwMUNnblRTbGs5Z1JRVEp3UHlucEZITXVtdFNKNjMrN1d3?=
 =?utf-8?B?bE96WW4zOWxYdmdzVEpsMmZOdUhHN1ZRVzZhNTFhbkYyakFlUEdmcmdwWkdH?=
 =?utf-8?Q?opL1GTpD3WAnG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmdsWk1zTHhROUJUbnVGVEFZd3plOC9hN3kwRTNvcDQvdlBHeWpWdG9yOE5u?=
 =?utf-8?B?SXpPMmNUMnk2c29mVWxUemthOHdpczNZTWxrSTFmaklBVlp6SFF4bjRURkww?=
 =?utf-8?B?K0kvNW0yaVhuWnROTEp5OVZUZ1JKNjUzbmdJTWlsaFR1eXNDN0pNekI5Unk5?=
 =?utf-8?B?WHRxcGtYT3RlZlVuVExGQkJBN1RQWmFOL1ZzVnpzb0I5cTNsY1BhSnZGQXh0?=
 =?utf-8?B?OUMzQTcxN1htYm91bzIrY2V3LzlOT04zZVIzL2R1M1ZBRXdDVzUvelZsNjZF?=
 =?utf-8?B?K1Zsbk5MdDhCdk1QWE1wbXJ5RnJjUkwrUGphaXRha25kSDMyRlJ5N2RDZjZp?=
 =?utf-8?B?d1F1V3hFWHJXOGo0aTZPSEtLYXYxSHBadW43YzlIR1VXeWJPSkRERTlIZHhL?=
 =?utf-8?B?dlFnMERFRHBYbUhvbTFzcm42ZnFoZGpDT3BEaEE2Q2FtdjIrb1R1SWZRWTJx?=
 =?utf-8?B?d29DU0VYOUs3YU02aDJPT3RQcTZtNldZQXBYV1l6ZUYvdm0xRkI0Wit2SkNx?=
 =?utf-8?B?V0N6cFkyUzhyWUpPV2E3NnlDL1ZHQzhJcElnMlN2RjBodytoZVFodnlXaTgz?=
 =?utf-8?B?Tm5JSzlxdFYvdmlVbFZVaWhMR1NtUElIaXE5OUMvd0pLVElQMGZQWlExNnZ1?=
 =?utf-8?B?SWFsTHNSZVNQSjB5bzJnSEorNVVrNjB3eWdzYkwvKzg3UGRwdXdFL012YlNw?=
 =?utf-8?B?Z1BGRTNsRkEwWWgzVHF4cWNKSlpoOXJJZmxPSGttMnZSZ0FueGt4SUVrVlBa?=
 =?utf-8?B?djdqUXhBVjVOSmRsSGhPMjdnR205NXBnMW15MEFhc1NxMHFvUE8yaTc1V0xv?=
 =?utf-8?B?c0RvT0o5dzQwK21Pa0g5cFltdXRlamNsRi96OEgrN2tmTkczZTdUQ25PMFpW?=
 =?utf-8?B?WkUyMGp0YnJqQVpkRnJ3OWZOTDh3QjF6K2Npem1xTWNUMUw2MWw1SEpZWVlk?=
 =?utf-8?B?dUMzUVJZVDNEc1BZYzdZMlppZ0RxdmJZWEdUMVpOdC9LU2wwaVBqOUxvYUlH?=
 =?utf-8?B?cVF4WERTQUMzVWtwRjdMMjVPSnB3eHFuN2FUckZpb2RQK1lZdmpXZnBNSXFJ?=
 =?utf-8?B?aG4rRDdLVUNiVkJDV0g1ajNxbWo4bDZUSFVIMGoxQkdOa2UrMWEya2ZudDdM?=
 =?utf-8?B?aFJjeFcxbnBVUGV4NERJT0xUdStHKzQ3dWsxa0NpRk1KS1pFVERtZFZQYTlK?=
 =?utf-8?B?OHRNVEdHQjl3MHAwRHJvRm96RnBDNjZhZlo4L0lyOVczNFhmWnQvc0F1TEZy?=
 =?utf-8?B?Q0N5Q2RrdSthZmFwbEtkU0wzTGJyOVNSRFFaM1REdm1kSE1ISU5TUVdyOVUw?=
 =?utf-8?B?cVNoNDBwMEEwL2R0QkJSQ3NTSWdydjN0NFh1S0RQM0JxR24rbHA0d0drTEc2?=
 =?utf-8?B?b0RGTU92bFJyQldMOUxZeWxLWGtiR0wvY3lDZlRDOG1IdmdPQzhjUHJ3UWtV?=
 =?utf-8?B?OG96bDJzL0doSXJVa0FWdFQ5VjBvZk5uTEhUcGtxQkNBTTkyNjUyNkd1Z3BI?=
 =?utf-8?B?QjgwVjlmUDZjRnNjcUhyc0wyMlhiRElXNEMzY2ltVzY4QTRkMzlSTWxDWEtt?=
 =?utf-8?B?MCtrR2JQaU8wRTdXcDczdkVIQ1ZUaFpXWktJWVdYWDRScUJHazBoZVlLbW51?=
 =?utf-8?B?M1d4QVZsUnhaTHhWUzNFSUlyQ2EvOUVjVmJkUUdjWnQxM0MxdHNhYVFMaVpW?=
 =?utf-8?B?eUlrSXFHNDlscFp4RlZhNG4yVE1lbkN1YTluS2tXU1JpTyttK2MwM09jZjEx?=
 =?utf-8?B?aTFFR21TazlPT3I0aFIxYlBhRWN6TUZUL3oyVms2RWNxT0wxamxrZ3NUV2Rv?=
 =?utf-8?B?eHFocmQrVVpBT1J5RVZiaStnWURmYi92bW1xWlVST1VuMTJUS0dPVFMvaExz?=
 =?utf-8?B?SUNKVFN4TkRjUzR2UWJtdmVRWk5kTy8zVTN1clVEMkNnUERqaVQzSEZGMVdX?=
 =?utf-8?B?UDljekpFR1BXQmpZc1JNaHBnYitHVmxWN3Bla3hoL2YrT2ZVNEtVc1ZBZlZh?=
 =?utf-8?B?N05kZmJxRnM3T2F5OTJ3ZWk4K1RjZ1ZQMTljWTlGdW9DSm5YSHlvMFhmand5?=
 =?utf-8?B?UkdMYi8wMXZydTd3MC9pUzN5dVk3KzFoZExVS1hFSlFET0lPdGRLVXdkb3Jk?=
 =?utf-8?B?Q0trK0d0MGNwZHNRMlIvU0JVVzlLcHVvZWgrVzRVU2VIRU51RysvZDJkUjB2?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f859dee-de92-4bbf-aece-08dd207d3bee
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 22:34:00.6213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KP+akh0VvJpaQ5fQCZP9X9sEWRU4nF394OtVywynI4sho4mgn7SW+HdnKtAoosEqr5yidK+a1IqH987lKYS6AAy8UK1evnj99ZfqN/0Q2xs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5168
X-OriginatorOrg: intel.com

Hi Babu,

Did subject intend to use name of new struct?

On 12/12/24 12:15 PM, Babu Moger wrote:
> In mbm_assign_mode, the MBM counters are assigned/unassigned to an RMID,
> event pair in a resctrl group and monitor the bandwidth as long as it is
> assigned. Counters are assigned/unassigned at domain level and needs to
> be tracked at domain level.
> 
> Add the mbm_assign_cntr_cfg data structure to struct rdt_ctrl_domain to

"mbm_assign_cntr_cfg" -> "mbm_cntr_cfg"

> manage and track MBM counter assignments at the domain level.

This can really use some more information about this data structure. I think
it will be helpful to provide more information about how the data structure
looks ... for example, that it is an array indexed by counter ID where the
assignment details of each counter is stored. I also think it will be helpful
to describe how interactions with  this data structure works, that a NULL
rdtgrp means that the counter is free and that it is not possible to find
a counter from a resource group and arrays need to be searched instead and doing
so is ok for $REASON (when considering the number of RMID and domain combinations
possible on AMD). A lot is left for the reader to figure out.
> 
> Suggested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v10: Patch changed completely to handle the counters at domain level.
>      https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
>      Removed Reviewed-by tag.
>      Did not see the need to add cntr_id in mbm_state structure. Not used in the code.
> 
> v9: Added Reviewed-by tag. No other changes.
> 
> v8: Minor commit message changes.
> 
> v7: Added check mbm_cntr_assignable for allocating bitmap mbm_cntr_map
> 
> v6: New patch to add domain level assignment.
> ---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 11 +++++++++++
>  include/linux/resctrl.h                | 12 ++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 682f47e0beb1..1ee008a63d8b 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -4068,6 +4068,7 @@ static void __init rdtgroup_setup_default(void)
>  
>  static void domain_destroy_mon_state(struct rdt_mon_domain *d)
>  {
> +	kfree(d->cntr_cfg);
>  	bitmap_free(d->rmid_busy_llc);
>  	kfree(d->mbm_total);
>  	kfree(d->mbm_local);
> @@ -4141,6 +4142,16 @@ static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain
>  			return -ENOMEM;
>  		}
>  	}
> +	if (is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
> +		tsize = sizeof(*d->cntr_cfg);
> +		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
> +		if (!d->cntr_cfg) {
> +			bitmap_free(d->rmid_busy_llc);
> +			kfree(d->mbm_total);
> +			kfree(d->mbm_local);
> +			return -ENOMEM;
> +		}
> +	}
>  
>  	return 0;
>  }
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index c8ab3d7a0dab..03c67d9156f3 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -94,6 +94,16 @@ struct rdt_ctrl_domain {
>  	u32				*mbps_val;
>  };
>  
> +/**
> + * struct mbm_cntr_cfg -Assignable counter configuration

Please compare with style use in rest of the file. For example,
"-Assignable" -> "- assignable"

> + * @evtid:		Event type

This description is not useful. Consider: "MBM event to which
the counter is assigned. Only valid if @rdtgroup is not NULL."
(This was the first thing that came to my mind, please improve)

> + * @rdtgroup:		Resctrl group assigned to the counter

Can add "NULL if counter is free"

> + */
> +struct mbm_cntr_cfg {
> +	enum resctrl_event_id	evtid;
> +	struct rdtgroup		*rdtgrp;
> +};
> +
>  /**
>   * struct rdt_mon_domain - group of CPUs sharing a resctrl monitor resource
>   * @hdr:		common header for different domain types
> @@ -105,6 +115,7 @@ struct rdt_ctrl_domain {
>   * @cqm_limbo:		worker to periodically read CQM h/w counters
>   * @mbm_work_cpu:	worker CPU for MBM h/w counters
>   * @cqm_work_cpu:	worker CPU for CQM h/w counters
> + * @cntr_cfg:		Assignable counters configuration

Match capitalization of surrounding text. 
Will be helpful to add that this is an array indexed by counter ID.

>   */
>  struct rdt_mon_domain {
>  	struct rdt_domain_hdr		hdr;
> @@ -116,6 +127,7 @@ struct rdt_mon_domain {
>  	struct delayed_work		cqm_limbo;
>  	int				mbm_work_cpu;
>  	int				cqm_work_cpu;
> +	struct mbm_cntr_cfg		*cntr_cfg;
>  };
>  
>  /**

Reinette
