Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E438F6D;
	Thu, 19 Dec 2024 21:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734644930; cv=fail; b=uYl88rDayF9aGzuOohhKmm9E4XYq2ItuDo3D9dC5TwSi0FEO1pEeujN+DFEoFjEuCQMtYdNo9VFsAnprXuns1IBYsC4PBXZBW7Jra5AcTIpYfQcAX1hRaf+g+ekV9lS7ZD7Xu7wtUWN/iERJ3DTdaVrK4gHa7EwIXsg0sqKo08M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734644930; c=relaxed/simple;
	bh=6yHP6JSCTTdzDfxmqOpaKAubwjQf8K6wAyOw8hWb2bw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=au4GnsYCDTSNuQU/yfy0OYQORiIgnT+yRuIGluqmA4+Mv8+KLzd6oIgtBq26Na38RR+yNTFi51GgjgGXceVbLhZ49Lux5InyilAbuSGLm/txJJJpyuFcONwhkHvVVnHarDe6z/0/NOU4pYo8h4zmaF3tb0TUoeDFguKS9IEkq58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jw4ToZG5; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jw4ToZG5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734644929; x=1766180929;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6yHP6JSCTTdzDfxmqOpaKAubwjQf8K6wAyOw8hWb2bw=;
  b=jw4ToZG50j2ALXPDepoC13wy+/ploMOaJhVS93Cc3nkBicQ+1pF4U02L
   qUiSsRQhHgYo4Hgu0ZazPYEWaaQtoqLkHn0pEnNLEDDgCNq1iz2Yxo2WR
   Z4kCDryFf1vYtPqXf83yiHwKzHySG5s+owrP410IlXiM2hvj8yNutvAf3
   /Vwpt2lA1hH5zGFdwfV236iDLWEtIhIZVDlKkw4PyscfNt0ayG8AXgVEt
   YrC7ZJsa13t8bvRG/yFetlmNsUzITTaS7CP5V5Y/ka34/DzVG1BB7iW6h
   4j6kuCtRmtvt6VhuPUbx5xU9/V5IIoL3nSVoW2KKZsWOoByZnNKxUdZFp
   A==;
X-CSE-ConnectionGUID: LWQ3ZFDkQ2CmUisoDTS5BQ==
X-CSE-MsgGUID: ojMIlJJqTdGhj0Xvv2S5eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="38026250"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="38026250"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 13:48:45 -0800
X-CSE-ConnectionGUID: 5PpDztZcSX2wbvStD+nlNQ==
X-CSE-MsgGUID: EHUAlAUFRc6g5nVE+Rb61g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="98223088"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 13:48:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 13:48:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 13:48:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 13:48:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEUZ5c7V5KPl+HBOqYn3RkeBD9txPtr2mp88ftU+qktJKNGomYm1ik3Tls9X7+ZcZy1TnwEYBqNPesjNCR6cE/0Tr9g+Uj+/+LLm5eCv+FOxFw8IhUOC1h+Ap7zgFTWulZzj0AEn0cT8IJ0qvZ97jUb3tF22r6eUSiIUp42/tvogsR1ewEhzCqQmxsMfLr+nfEKtwr2tCs/AqWRJIewtWuRLllRuIJj1vlR9tFPoGRbdwfiPijIa8li/uOciBDDE0E7c/A3Ix5Ng3g8zrfdrfHWu3eijl9mMfd4RHwdjT2sAJHyioAzzG2JOjXupwExzkX7aIMoQ5AwXOujmwlg85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8htvYR9ciWeLcZiNgvnduPB6EQQMHdiUZv8CmQuqMI=;
 b=XwCvYQPuUdE4oS3+omJY27B2tdApeus2XxvAf0aylA42oIQlBet14SEf/E98OpYbPdQijWNl7vzg6nVwsW8Qt2u6WO3bY9uuCCGPWCJ0Vad7lKeqMyglJQjQAIFeD+biTFUiSvNK58mzEpyMa9dadEDcNlJCnYQLtmAQzE0ZagYsjlQ6jrvQAxYWS9cGI14FJqi+NnIFSEYjex9N+IROaCAecwYeZnQPnkItO8YXCqXTS5RTf/jDSwfyFCbjM5xSzsClWLWZas3VDXBj4fuR2sr9x5vktQ3SHQ2yZdpbFGemxOq/PEsrc1HfdW4xxVUaHv73l3Tup6r7c3FkGhtYYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH0PR11MB8143.namprd11.prod.outlook.com (2603:10b6:610:193::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 21:48:24 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 21:48:24 +0000
Message-ID: <76794aef-757d-4621-8158-d23eba2580eb@intel.com>
Date: Thu, 19 Dec 2024 13:48:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/24] x86/resctrl: Add support to enable/disable AMD
 ABMC feature
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
 <401d9591e0b76133b649f71029965d1eb2391f21.1734034524.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <401d9591e0b76133b649f71029965d1eb2391f21.1734034524.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:303:2a::14) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH0PR11MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7137c7-ba16-4932-7e15-08dd2076dce5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWJvSEoyOVFZUWlzZXJzdU9hQkN1OUhLcWUrdCtjZTJSWnJtQlhDZVhsbHNP?=
 =?utf-8?B?Wk4xUGV6Wk9OTUEyVWdreTNKeDNxM2Fybi9IUXlZSmMrOE43NmlvdXdKY0Ew?=
 =?utf-8?B?NEw2VTEwOHFZNFFuSGh2ekkybW9CeGhwSFAva1Y2Q1BxSlJzN2NFc2FRSzdv?=
 =?utf-8?B?c3dWKys2SXgwR3VKQVRNS3p1RWVHeU81YmRmRE1EWjI1SWM2NWI3NmNNVm13?=
 =?utf-8?B?UnU5SFhGZjArZ25pTC9YRWgzbE5XT0YyYVV1S2hHSlQrczhVVDV1TW9Qdk1s?=
 =?utf-8?B?clF6RGZVVnhkWUtLWnc5SEJXOE9DYnYvVzF0U1dTNXM0cngwZzhiUVluaVJz?=
 =?utf-8?B?WUhCcnZOS2JpTlZQcTFIekRxd2FORjQrSzJ5ZEt5Q2JlVHpubGZSRzIxU1ZK?=
 =?utf-8?B?dlJ2aE9HWkdSZjU1a0ROMXZsOE1zZytXTjE4QVIxNHJ6bjVxRnowdWNWU1Jl?=
 =?utf-8?B?V1RFSG94MFJlTXF4STJSNDhhQTg4eGt6b0NwUENvOHZsL0d0VWJ5Y1UwQ0JV?=
 =?utf-8?B?V3hWSW4vZmdyckdnUytFanBNZEQxS3orVXBlTjRRUFRrdngxVjJSa2x6QkF5?=
 =?utf-8?B?NnM5akhJOElmZXRYTWRCTEVMNXplWTgwWk9kcVBlQnBidVBic0NQUHo5Sk5P?=
 =?utf-8?B?bVBWWUx4aVFPM2VhOVlYSTdZM3ljRmwxa1gzRXBXTk5mTHFKWHJyaVN3NEdL?=
 =?utf-8?B?L3JDWmVVWDdRVkk0cncxRG4xaUVLcTBWc2ZLcUlRZlJQOEZ3UVFBQ3BncU16?=
 =?utf-8?B?MUxJUW11UGZJOTIxZTZyMUd4NThBRUtsb1h3d2xlUzhjL1lUUU5KR0FMblRz?=
 =?utf-8?B?aDByVTBlWEpHeTFNSVF0c1JrREFGemR3alZxWkJhbEFDR1RSZVpwV0JRZWFZ?=
 =?utf-8?B?OGJ3dDlhZy9xZWxQaHpJek00VnhndndXaDVaRFpwSndmQ2xxUDI5c2YrcHl6?=
 =?utf-8?B?a2lEejR3MGtxYVlYWUZHY1hNblB6MWdjWGJnSlpPTkl5VkZieEtCNnNsUHlE?=
 =?utf-8?B?RjFDUUdRK0hJVjRIcWpXSXp4eDB2Y3M4TnlVZC8rMnllV0dBamRaQmQzTk9G?=
 =?utf-8?B?c2o4eDkxRXdRbEQ2TmFwWEpQYWxmOHlZc2xTbWE1RXorVnNMRUw3Vk1KKytx?=
 =?utf-8?B?ZW5RL1A1WlJQRVB6UjM2dTAwdG5FbTBqU3BmRWR6NEFFVzZVOGxPY1RnVlY4?=
 =?utf-8?B?SnArSGpMUTI2SmlSZFFLNUZWMnlhYk5xYzczemlXc1hRUkZQNDU2czNyMk5z?=
 =?utf-8?B?WGVadHpKS05sRUNlWUVOMlNPOW1KaU1ETS9jZjlyZWIrVTRZOGlFb3NJY3RZ?=
 =?utf-8?B?d1BQUlo3T0pRUWFDK0JkNlpjZ21ZOVNhUFh6L2gxQTJIZW5DVUlwTGVkcGlE?=
 =?utf-8?B?VCtqMDJPeXJUVkhvN1pjeHZKdDQ5VEZBdzRaNUtseDRWY2VaQnJlaEx4b0Ja?=
 =?utf-8?B?Y2VnZXZ4VzRhbEdzQ2FMTzBVVEhwdGQ4RFlXRm9PK2l0Zmk4RFFld2plNkFU?=
 =?utf-8?B?b0VtdXNhZHdGSHN2UWF0WGV3L3ZaK1kzR3ZadnlrTWMwOE9LcFI2aWgvNzNj?=
 =?utf-8?B?VUdMTFNFOEhpZHJ2bzFFY0lFT3c5cDRqK2lxTmxoY0VHSGR0dXNFZkwxanU3?=
 =?utf-8?B?aHVkRU9XcjRraHBPZUJmYkJ0UWlsYmJDVXpVWFRCUFBQNGMweWZXTDBTOVYv?=
 =?utf-8?B?b1hVTFpZQldRczFOTzYzUGtKLzhHdWNRRmZ4TDZ5Ry94NVZvV3NGWmVSZWpJ?=
 =?utf-8?B?cUxqVkUvcUF0QWl0SVZHVU5wQlVuRUl2ZzFsZDdYOHFBRzYwRStYSjF2NWFM?=
 =?utf-8?B?WVpMdnFpbVdseXd3Umlnd1ZvenpqejIrUy9HTUdyRFJMelVIdGxva3l2eFdh?=
 =?utf-8?Q?mStqcCWHvWmbk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEQwN3BoN2RqaHJGYnk5dml5NC9QRllUd2ttL2lRMnBZd1JSd3E4bDFidjRL?=
 =?utf-8?B?S0krRHVHRXpQN0sxdU1XS2ZrSGZlcUFnM1JuSWhyV09kVHE5bDhOQTZyLzRO?=
 =?utf-8?B?NmtUNXJ1NDV4c0hwdlpncGR6d3J5N09YVDk0cmZGVFlXNzdkNXhCWVVIdkVh?=
 =?utf-8?B?MlhVNWpEQUNla0VCSGRZK0xwRHdoN2xSakFIUC9sY3VRN2hESUU0NU9USGRW?=
 =?utf-8?B?YXBrZ080WXVvMlF6L2Q0Z2xSZ0YzV0RldVk5M3VMUXp5LzlhbVNBQzJJQkVw?=
 =?utf-8?B?c3pjdVFrOFlDdTU1VTd3K1R2QVA3blQwb1BNSlpUR0hVMXZuKzJ5T3dwVzRY?=
 =?utf-8?B?dzJaS05GQkJFR0Fld2RjRzVLU3NheW1raVlmVFRBeEtXbSs0bUVIQlA0SWVk?=
 =?utf-8?B?NTEyM0xhcncrU25KZEs1akhpT2dTRllpMWIxSjRxUlNja0hqc2huSXU4OEZH?=
 =?utf-8?B?VUZsTzFsaDkyakNBZTJnYU5FT1Q5N0dMQnVyM1RnNlI1Wm1BYXBVNUZvV2Vt?=
 =?utf-8?B?b2FhQi9WbEF1YUNTYlZPMHB6aVJQTnNMVit2K3ZmT1J0UlRCSFFHdUo0RFBU?=
 =?utf-8?B?MGRrdXZ0VmU3OFVEWnFqRmtpTVpNQ3JrKzdlTjdKL254RFFPZVozQ1NhR3o0?=
 =?utf-8?B?Uk5OeW1veGpDS2pZY3FkSTVXMXBnU2VuNzBrUU1pekRULzY5SE5pNElqSUYx?=
 =?utf-8?B?dW9iV2FtU0lzZlY5bXhMRTUvVGx4dGMwM05sMlVVNnJ5Uk0wbE9JN1dnSFhr?=
 =?utf-8?B?ZDArRitHeWxBdHBxVXowVWRQbEpmeXRpeXFIaGw0cU1uVEtYRjh2b01nRnpL?=
 =?utf-8?B?T01JVXNSMEh2VnA2bVZJZnhGT2w5Vkx4WGlubVowWTNSVEdJQ0g4MHlPT1lq?=
 =?utf-8?B?a2NTT3pBaWJwMW1RNnF4dEZGdDc2aDZnU3hxa0tSbEpIbXRZY3JjSGtvWGVh?=
 =?utf-8?B?TUtZKzdwR0JhZUVFU1pPVGE0SGFLa1BGV00wZ29PY3dNRlRkamlFRFlya0dF?=
 =?utf-8?B?SEpmWGw0aklnc2tWaXA2K1loM254SlhwOEhjeEtJTnJicldxeW1rMURwU0NC?=
 =?utf-8?B?TUhUc0YzbTFXekdXYVNPNFh5QXY0aE90S242bGh2MUs5RmMybEg5ZFp6Y3Y3?=
 =?utf-8?B?ODNOQTI1Y2ZqWnpjYU1KOVUwRk81cFRtMlo4Q2NibXc5NXVTcHh6NjI5MWIr?=
 =?utf-8?B?ZlBTcFlVWFpwd2xCRDJtSFFwYnArM05jT0dXY2txdStVWndpTGk1Qmp1aW9q?=
 =?utf-8?B?bHRORGtacVREcWoxMHBqSHFqZklhUW16c3ZNMkxoaWtwSjE5STFZN2JGMUQr?=
 =?utf-8?B?QnlmTlUzZVQ5eGkzOTlpRVpJZExPVDlJRE9YZHU0eFlBeGJoOW9EUDZnejFk?=
 =?utf-8?B?L2R0SEFVMEt1UG5ZWUtFQ0dCbVFCVlZHZmMwVmRnKzRsUlg3Umk5VUZ4akxx?=
 =?utf-8?B?MjJNcjYvWC9rdWJDK0lsTHNhRHllZmlWcEMyT1pYK3A3KzRYcTRzeENpUGZx?=
 =?utf-8?B?YVJFKzBMbUlITmtJZC9ZUkJ5bDBCVTc3NG51OXIwUnd2RW4rS2FJdkJoYlNv?=
 =?utf-8?B?Z2JpNUxhWlFXWmtqaC9hUWRaaDAyc21UdDZ5bGlJbFJHUmphSHJnVDlkUFZM?=
 =?utf-8?B?ajFhcWVDUWhGQ3pZQjdBRTk2MjlyZjZra0FPcFNzYUpoRFJUUVRaeDNuZE1L?=
 =?utf-8?B?cFFrdGo3WHhzdDFPRFdzQnNpV3lnV0hJa3MzWWlYVzhjdVQ1UEhNakRwbUND?=
 =?utf-8?B?MEUxT0wwL2QrN0RsMXN3RzNjRE9JdEFOSmdVOHdLb1hpV2h5cURFOUFMNVB2?=
 =?utf-8?B?L0M0cHBIVExPcXhBL1MrM0lHY2NPd0R5c1pKbFhmQlV6Z3A3alB6ZDB5L1lv?=
 =?utf-8?B?cCsxR09FVm9tU09kN1p0SU9BV3VjMmpoLzZRRExoYTBFVzZNWklrcTFpNDJ3?=
 =?utf-8?B?c3FTTk9JcnpvQkVUc0E4QVVGMkllL3FXbHhydXdHWG9zZGxsb09GZ3F1UzZ2?=
 =?utf-8?B?UEJoN25OK01xbHN4dDRDT0RxcUtZYTBKa3RHMXZMNHlQeStodUhTcVpSZUJy?=
 =?utf-8?B?SnRHV0ROUGdJUUhTVnVKRlMvamFxdlVxK0h0MG51ZC81MHlibnZRQTlJUXla?=
 =?utf-8?B?WWFmcWZpd2ZZZXZZR2pKYWIxSWkxVGp5SkgweFUzV1lHTTQzdXFaM00vKzBu?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7137c7-ba16-4932-7e15-08dd2076dce5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 21:48:24.2327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvDL42VdM7jivjyebP/7A8ANYgrft1VDYNeIRvMFlPHBp4LbAWxko8fsiESwwR4kusAPBmvhI8yqexrcUgsUpLPWs+3wnCbJ7d+D8PxXco8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8143
X-OriginatorOrg: intel.com

Hi Babu,

On 12/12/24 12:15 PM, Babu Moger wrote:

>  static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 687d9d8d82a4..d54c2701c09c 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c

These functions are clearly monitoring related. Is there a reason why they are
in rdtgroup.c and not in monitor.c?

> @@ -2402,6 +2402,42 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable)
>  	return 0;
>  }
>  
> +static void resctrl_abmc_set_one_amd(void *arg)
> +{
> +	bool *enable = arg;
> +
> +	if (*enable)
> +		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
> +	else
> +		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
> +}
> +
> +/*
> + * Update L3_QOS_EXT_CFG MSR on all the CPUs associated with the monitor
> + * domain.
> + */
> +static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
> +{
> +	struct rdt_mon_domain *d;
> +
> +	list_for_each_entry(d, &r->mon_domains, hdr.list)
> +		on_each_cpu_mask(&d->hdr.cpu_mask,
> +				 resctrl_abmc_set_one_amd, &enable, 1);
> +}
> +
> +int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
> +{
> +	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
> +
> +	if (r->mon.mbm_cntr_assignable &&
> +	    hw_res->mbm_cntr_assign_enabled != enable) {
> +		_resctrl_abmc_enable(r, enable);
> +		hw_res->mbm_cntr_assign_enabled = enable;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * We don't allow rdtgroup directories to be created anywhere
>   * except the root directory. Thus when looking for the rdtgroup
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 511cfce8fc21..f11d6fdfd977 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -355,4 +355,7 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
>  extern unsigned int resctrl_rmid_realloc_threshold;
>  extern unsigned int resctrl_rmid_realloc_limit;
>  
> +int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
> +bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
> +
>  #endif /* _RESCTRL_H */

During the software controller work Boris stated [1] that these APIs should
only appear in the main header file at the time they are used. This series
makes a few changes to include/linux/resctrl.h that, considering this
feedback, should rather be in arch/x86/kernel/cpu/resctrl/internal.h
until MPAM starts using them.

Reinette

[1] https://lore.kernel.org/all/20241209222047.GKZ1dtPxIu5_Hxs1fp@fat_crate.local/
