Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0497134AC;
	Fri, 20 Dec 2024 03:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734665042; cv=fail; b=PziQL2Yv4Zn5Uis8cyJ+UcCrgtg7pWQl+5gmZmxrLd/uuKfT6R+FcA2JUv9DiNZWrNAO2D0synvv7ITgW6dvE+PdBLrUwY3tS80RqcWClSlZL6njZsPelDk5P8tmFewz7TXtvGbyv3x7rBCtX/5OeWfhq5boleTvb1DufnZFdFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734665042; c=relaxed/simple;
	bh=wqXrJh4Un0NuGANg+ELkrNxfpxTNq8dcg0ASoYJFJ4U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sM34ft5zibZAodOftsl4ghPnSgQKQG80l4iEKWqmMID/gTx1Q7xe9j+Qo0Jh+6Rahlc9i6vo+dUFzbb8ZO/jgP67X4YiPAu/5mvwpA7ak9VzDzhKYEqLsxaVuGaEb3aaCjMrusy4iuteS/NgLBUo7CcQRoeneFMPq5DvvaW2TE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JjwWHlib; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JjwWHlib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734665041; x=1766201041;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wqXrJh4Un0NuGANg+ELkrNxfpxTNq8dcg0ASoYJFJ4U=;
  b=JjwWHlibwFeZhjkqyHGOKUYedODkc6lP5eXtH/JjDrhO9WjzbIjqyB6g
   dADoh5bdeJOFUDfJQi0aBz6DRhWN11HafyzJyKQ9Gi/zUDroZsqMIJB3g
   Uw4wTfV/c6NpWaqhEy6VoLc1LJLfyDQezFG0W3ntpVRBcBbg2Qn61yQMr
   ccug2N+H9xhCHUjO3/gVLKdbC9kizRZIdyvAvqvr4HwaiPRV6YXGEbPMc
   rDniYR8AcFGjzOzAViT5iQuWW2VdNo5nF6z5/OWkHNTF34gBZLxaD/gD2
   K8XA8nHOoDr5yvAZ7Sh2a2Q9rTtmvOnQRznEj7eMzgpW5jgNvBFjb0uoU
   A==;
X-CSE-ConnectionGUID: QDRcs5ejTASvgmCLfSqszw==
X-CSE-MsgGUID: aMghS+7lRcWYL+SI0cCDlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34924636"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="34924636"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 19:24:01 -0800
X-CSE-ConnectionGUID: IcQI6Ls7Sei2QtvVhD3EWQ==
X-CSE-MsgGUID: eXBHL0FtRV6omwi6VA5WpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="98226256"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 19:23:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 19:23:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 19:23:58 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 19:23:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/u2PZwTRHCGWx8FgDF6yusLVYPNgqGEzinGA9zEOskqTEAjQZoZHA1VBiwNAnoR4URDrt3WJ866OMlKsutKZimRabhDRSUbh0+kbDMbZ1xMAuyQzsntYKgHGIeQmlLZoFllza9uJB8ulSPBuH4LiIKDI15FGWGnZhGtWuNkXVH2rOQq3jFfiAbCPc92nuw5nWAJCsvZknWJAlQ57DWb0QiYjnJD/IOkpb71dOclU986cRRcAPovKXSmqiq1FQUd8qtmhowfrI9poZ8uFMoCexQqsqtr6q9n4qleoQBKVkzP7TNZplY8+pM44mkl0+kllGV5vmJVKF9/HLZZHg0T3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNOX/V+9o9khx15VTXB0QXCifEjBIfd2yljAx/+HwVs=;
 b=pIjq41fUgivgP3bNAZGfcdwnZ7Zh1a7NPTNgu1377Fj8jCcMah7iQ2MbmZg1OkNJ0kS3fTY3uXwi3pFIwEPNKR68XuT4rLgXWb8MmweEjcUZHOIVp5VJ9Q2GbOUGD5DKgAYyLsvqRsa8FAISAhuhCvuBkGP0Ww86pF2a7yir1VhA67/AVLkaOm++yhLcudR++TIXf/orsrZPmpXFVtjXCNBTN9d/DoK/Ql8tVsBXcn+57ya/Aohbd4LKb077fhs2vUoeGdzWwkglcy+KD4U0YRrC1UNouecpTQvVp7IGJSed/YoWahn2LYgGhXWR6MiQwxSsoHwLX/r65QlI/5Chbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by BY1PR11MB8125.namprd11.prod.outlook.com (2603:10b6:a03:528::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 03:23:55 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 03:23:54 +0000
Message-ID: <a14c9534-6176-4459-af24-9668d35abcd3@intel.com>
Date: Thu, 19 Dec 2024 19:23:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 24/24] x86/resctrl: Introduce interface to modify
 assignment states of the groups
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
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
 <2da72f1a57beb1f3de5cb2bdeda2269bdade8c76.1734034524.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <2da72f1a57beb1f3de5cb2bdeda2269bdade8c76.1734034524.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:303:b5::14) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|BY1PR11MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: f36e59c1-b416-426a-5343-08dd20a5bba7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWc3WnVNd0NKdUU2Yno2YlJnWGhDVkQ4STZERkM0WmpMK0xIdUV0bzBTenNY?=
 =?utf-8?B?TFhYS3k1akpBMjhqMWtJMno2L0N6c2ZoUHhlRjFSMFdXWHRELzlYNVhRc2pw?=
 =?utf-8?B?a2FmNGhMT3dQd3kweFFzSEdxVGg0SXFjdGx4eUdiMDFTNVJhcEt2d3lhN1pS?=
 =?utf-8?B?VkRnRXZOeExleVhkUmFMMWErVDRuQVliRjNaYTRIbHFmUmR3TXMrTWF4NXNN?=
 =?utf-8?B?Q1Q0RGRVaERLdjRzL3BGaHZzMDBnSEg3SFlLSVlaNHJmU29ZR1haS1lDUzNT?=
 =?utf-8?B?NTlRcVJVM09CSERXdkphbVkyS2VFNXRuZ3RydWswN1ArOTh2NGdFYU1OVWFV?=
 =?utf-8?B?Q2hZLy95UXNDeDYxYnVoQVdCd0R1akY2dm5KMU0zWUFvSmp2SlV6Y1MvdkVK?=
 =?utf-8?B?NG1sUDgyVzAvSDFTdWtMQ1FnU0pMaE1qY1ZhUHo4QUwzdzJQK25CVzhVS3d3?=
 =?utf-8?B?STAxQXY5emZlbWNlUitvbTBNRVQ2NUJwM3RvaVZvamRvYUs5Z2tKYlJvNERT?=
 =?utf-8?B?TlZzVmVJSzlZcUlCdkFuWUpGZTVyODNwaEJXNjhwU3JtTk9JckNXV3Q5TzhJ?=
 =?utf-8?B?NWVnOTNOQ2lodW8rWFFVMW9WR3ZaZlYrZkRvUWp1WGJHTzZ3UHYvb1VraDda?=
 =?utf-8?B?Qm53NFlwQWVHZU0wQ2xHcm1TanFJb0VYTTJEN3EzOGk3K0N5K3J3eWR5Y3VP?=
 =?utf-8?B?aVBYQytwVXdLc0NCZnhvRmtXMVRoSVJHeXh2N3hvRnhpU2FZM3c1cFZOb0o5?=
 =?utf-8?B?N0dFR0tRUWtZK2xZTldHSXYwVEVOL0R5b2RGU3RvY3o0Ti9YdUlXNXNQRXNs?=
 =?utf-8?B?blJqamIzclgvNzhXODliWmdGTG1YZjVscHBGZDVDWnE0MlB5enFsK0IzLzBM?=
 =?utf-8?B?aTZnTGs4aHVKbVUrdSt1cFVBK1Z5dEFmaG1iL29EMDhFUW1tWUhGMmUvcVlU?=
 =?utf-8?B?YnpQOTZpZ1UxbXRwM0tyamxLY1RXZXJobXhsQ0NyMHJXTVVENWZUUFRGckZS?=
 =?utf-8?B?YWVyaEsrK00wUkp5WWtnNDFnVWEzd2NCc1MycUhFSHkwSWtPTWxOQXZyR3dX?=
 =?utf-8?B?b2ZmblB2UWh5a3dkZ0tuZ3czSkJwcU55Y1B1TWhJRjE0OG1JcHZyeVFvSDhh?=
 =?utf-8?B?VWNoR0VieHE0K2RhTGhFMWkvLzFMQWlWOWprRFpvRWw1R1BCaU5TTWtKTFVK?=
 =?utf-8?B?VGVmYnE3WEVnQ2JjWlZvNWlURmxXZDdCbk5NNGlxM0R6OUlaRWpraHRaejhT?=
 =?utf-8?B?Q0c0OFRPaU94Z0xFa2Y5Vkp4TlZSMlUwUDFDYzI1QkxISUlPb21TYnFWWkhQ?=
 =?utf-8?B?N2RoUDRLQU1RL081ejBxUUlBM2NtZytxbUJwVFh1emdWeHdncEdnWjRsZW50?=
 =?utf-8?B?NTVhMGhKWmg3UDd6RWV2ZHNuSjdKUGRkK2N1MGRhWXZLZ2NkN2psWDJrTDJz?=
 =?utf-8?B?VWw4bWJYL003UENUN3N1RUZma0Z2Vkpvc2FDU3NrdHdhanZINzdsbjNINjlB?=
 =?utf-8?B?cWgyUllrMGNYVE9PYkFEYlBMaWx0a3d2WWtMSFgrZDNKMWJ3L1E1QlFsc29a?=
 =?utf-8?B?VlduZUhlMWJodGpsRWkyZmFXSXpVUGZ1SkRQTkJxZENGVWQ4aVcyaXpXekM0?=
 =?utf-8?B?d3d5MzlRZGNGNUVDbEtMNWxhRjZmdEY5QkNSaEd0dVh5Wk9KQ3NReUZUK1p5?=
 =?utf-8?B?OUp2Tlhac3EvL0lqVHZRMnhVeUlaZUtEM05qYy90RmZnQmhVcFB4c045dzYx?=
 =?utf-8?B?ZFh6bFZYUFhHMmtKZW9xSDlFcUE2NUdRWjJxejVXczUrZml5R3dLdzJnNThy?=
 =?utf-8?B?b09MYkNCeSs5VWswbTJqNHZ0NU15QmRlaWEySm9GUW1xWEVUb29xWFlCSnNH?=
 =?utf-8?Q?PX5fqzp1bxgSW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzF5cndUdUFWYWNsZ3BSVHRiY3dkdjhNcEV1am42ekFucmQyRzNtbnltY0x4?=
 =?utf-8?B?KzhGaVc5aVlXWHBNVFFQd3lYODRFM3ovNlNwcXg4Y3ZKNldJeU9jOVpkcnlG?=
 =?utf-8?B?YWFYU0RrU1ljS281MlVKK2pqeDdyeWVPQTd4TjNIeUVwYSttMVlCdVp3OW5l?=
 =?utf-8?B?MktteEZXSERzTTcxM2dvR3pMUlRCQ3dYYUdxdjZ2dlY3NVVJMk05VUp5M0ZQ?=
 =?utf-8?B?TnVteFRMWWEwZ1I3UWhiM3VzL2QycGg5dGoxRnZreWJ2WnVJd1BjVEJPY3Qy?=
 =?utf-8?B?RkxFNnM4eTFYYXRmdDNENk9FTXJsbFBvRlN3SG1sdnM1U3pTZDJQSmk5RG1O?=
 =?utf-8?B?OHNUaEQ3VDROVmZsVEpaOFRGOTlpQ1RXUWQ0d0NlanBhNVhyUGUwdkh0MGh2?=
 =?utf-8?B?dUFJek1CdlZlUm9PR1dYcmhobUt0ZkhOalJ5aW1KUDVibStiL1U2UlhxaXhp?=
 =?utf-8?B?YkwzQkczRUF5Q1MwWVJaRHRScUl4am5iaUFwSm9ZZ2FqSW9nMmVxckF3aDEr?=
 =?utf-8?B?V3BQQSs3WWNtc1piTHkwaVJCU2lnVnR1K0pEU3JNN0NXbTZVVjJmMXRReFFM?=
 =?utf-8?B?bTdUOWRLaStkRi9YN2x6Ky90Z0FyWUd0aFpWcjZzVWdjT2drWUprSHhQZ2FU?=
 =?utf-8?B?V1pDVjBTL2JEd3ovMTRHNVYyQzR2U3lCL283cXA3TjRobFpmMGdCeWRpU1F1?=
 =?utf-8?B?bWRqa0RyRE1yeFFIRDlybDZvcmp3UmlYUU13b29LNVRqcXRtZDVPbEIyQ1Ba?=
 =?utf-8?B?dVQwbXFJTkJla2llcW8zNE83Wi85R1A5N0czaGx4UlZqY0ZwbDAwOXRqTU9I?=
 =?utf-8?B?dGZTeS9DeDRadnlGTEk0WUN4dk1EMHJJeXlxdndGeDlwOE8vMUxHMDF2MEZ0?=
 =?utf-8?B?UFZoOCtxQVQxR3VUdmRoalVXSnQ4MzFHVUJPSzJxSllwV2lDSTE2Qm5BUWhr?=
 =?utf-8?B?YUtJc0UyOTVSajFocnR4c0lIWEw0TWlyUXdIQVZjbkVXQityN3JBUWhURmNj?=
 =?utf-8?B?NzRXNnJSQkVEN2N5NVgxVTd0TFFTQ05nbnJva1U3Tml0TGFQOWtFSUFMeVB6?=
 =?utf-8?B?YTBJTjF5VmlHN2ZneVAzd2VaZHBsaVg3OExnTVRNTFZaMm1hMCtYNHhNekZE?=
 =?utf-8?B?ZDJMazIyNnpDa01uVWpHRTg2b2JjK0l5N01BdkdMQ0VGd0FWbC9RUU1YTmwx?=
 =?utf-8?B?U0FodFpxc0ZsWU1jZ3M1L3h2MldVQUh3UUUvdG5VVkNvMmF6bE9nVlVHMjVO?=
 =?utf-8?B?UERnMUxERGc2NjZHbFRpd051R3MyblkxUEo2eEhWVDh0WHJudlUyTGgzeHh3?=
 =?utf-8?B?cjVQL0RkaWQrZzcvUitaYkhzQTdRYjh3eUtYOXBzYmp2bFVEbkVGMWdiMjZE?=
 =?utf-8?B?R3FnZENQL01oQVVQZFNuZHhITEgzTzNkQmhZVHFBczUxZVA5MnZ1NmJ3WUpa?=
 =?utf-8?B?WHJSbmZhV0ZpUG9MSDFleVRsbTFZWmw2MTgvMnU4eHJjZC9nekpqUCszeDBP?=
 =?utf-8?B?QnpkVlQ2MW1xNFUzUU5OaFNacktCaDRtanBCR25sRDRSTmplbWV4YjJBSXZq?=
 =?utf-8?B?eTJEWmNwVDlHaFRNZ1AwS3lEc1dMajBWM2s2RDNVUWV3VlIvb2p2ZWljLzds?=
 =?utf-8?B?ekdkZXVQa3FxVlhRelBXWEpGb3ZIL3pqcVdMRklJSTl2dXpCdG9FbTN2OG43?=
 =?utf-8?B?U0Vod01wbUR0NW1MZTRIRzY4VUFzZmNXbktGako4OWxMQ0dOVVZxSTdzUjJR?=
 =?utf-8?B?ZmhaclhlV09iOWFybEI5N3lPMk81dGk2TjBEUFVUVk1UekJRditaNGFiTXBi?=
 =?utf-8?B?eStlZjZhL2NCMkJVSnpRU0txck9RK2NiMENJUUQzS3ozU05tUzZUSUhPZDI2?=
 =?utf-8?B?Nlg1TEpiUE1ncTUxNmh2ZTVMWmJJUVArSitTWUlQY05GbnZLUkxwUWtSUlhN?=
 =?utf-8?B?SzVLd3BSNlRlbUx0cGxURlF3UXREOUttZGt4amY0V1gxMkkwVi9WU3o3OXBK?=
 =?utf-8?B?UCt3aUVlbTdsekJ0L3E5Y1YycWZ1ZUQwaHdyME04RDlDYk5iQzM4b1RzRE16?=
 =?utf-8?B?YU5pd09ySDFKRVBSQURWYTUzZUR4ODBaR1V3cWptU09xcTIwT3ZORXhIbitx?=
 =?utf-8?B?b3ZUOE1Pb1BNR3BSQlNQalJsMVN4K3FDdTVnbkhGRS80NWloNDZ2YXd6RENM?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f36e59c1-b416-426a-5343-08dd20a5bba7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 03:23:54.7931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuATUdRaizepQkN8HP3AloE93TDPtaAX14NdInm7tDXZKIMrbqx6J/3zufWG/viX3uaw9b3gKkQbeSYuhxe2QLo+K6iJ06rInw7o8ccstkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8125
X-OriginatorOrg: intel.com

Hi Babu,

On 12/12/24 12:15 PM, Babu Moger wrote:
> Introduce the interface to assign MBM events in mbm_cntr_assign mode.

Seems like something is missing ... there is no mention about what
MBM events are assigned "to".

...

> +	if (assign_state & ASSIGN_LOCAL) {
> +		ret = rdtgroup_assign_cntr_event(r, rdtgrp, d, QOS_L3_MBM_LOCAL_EVENT_ID);
> +		if (ret)
> +			goto out_fail;
> +	}
> +
> +	goto next;
> +
> +out_fail:
> +	sprintf(domain, d ? "%ld" : "*", dom_id);
> +

The static checker I tried complains that dom_id can be used uninitialized.

Reinette
