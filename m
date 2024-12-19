Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7D11AA1FA;
	Thu, 19 Dec 2024 22:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734646390; cv=fail; b=NgNVuT+hvuZChH4bxnCB6hq/npzwB5ds/tr6u9+OCRV83j2uFBbmBzkvR77AHslrnVxrPCPjRxSDDv5NBHNbIYsOPFLmijiF/DjiiJEQOlDdZhD80tRZD+AXseG9A12dG9pKO+nuV5qromLyzpRW0/pbyD37f3ZNDU+HKZA7JBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734646390; c=relaxed/simple;
	bh=gtJ+d/KppK1nJK0/ng1vPholUGuzhjXgFFoiQctAk98=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KU1LCpQ5M+bep4ri3WhPQWJKTZw8mlinahJiJlfZEMBI03sfygvdV/yRN3selC1gGfMN6N26U9tlLPR5j/EAOzEIuCQfn9eaPE+iHyXrTZIw/aF5r0Gg99skt3g/EiZ3RNfj2UOSGTKgUeFc2p8w62J7LuAGcIlUAo6kzHWiJ7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlgeurAp; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlgeurAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734646388; x=1766182388;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gtJ+d/KppK1nJK0/ng1vPholUGuzhjXgFFoiQctAk98=;
  b=WlgeurApzoW3EHJ6NwJvjHqri3Wx/Ct/EOnjNNXj4E96P9eCNlf98RbY
   4EYiRM7qCouuyz98yq1wTdt6x5NOF2oDjCwEWSNN7ZsMvxNKKJ4XM3EKc
   1OGExPh4WFHVWHzV02dSQiq4ZYzqtmIIDSGx45/6oiuxfmRuuLdQnAH8k
   B0qgk9w57yVBbhBji3Xc2EOaeVjQr0BXnbRw5WA2Br730jJ4NqVL0tlCa
   GMBYurmUgueHqjVDzLR1EqG0lU0d/p0MKywAPgpS9u0WF5U2DdK+UmASZ
   PJKRloiMLMRBf4XsC7HaQ+L7tx2H+s2ZoT//gdbaTl6yPI6b0l58LNh5q
   A==;
X-CSE-ConnectionGUID: xPY/9nSXSWWj55vU43J6OA==
X-CSE-MsgGUID: jw/MP6LaRRuW/oP+AspBcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45786895"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="45786895"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 14:13:07 -0800
X-CSE-ConnectionGUID: RxENzaTyQ9W2kLFDiERWZA==
X-CSE-MsgGUID: vuFlRHHHRWGOfTPGKRtlvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="98228788"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 14:13:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 14:13:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 14:13:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 14:13:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIut9pB2AVYSBOumzt70M+gRdPvEvpH5HIO9F1OoiP4NwPYcsyCGSxTKx5Xdsm72KuG0NCy/R0BcPDb/3+rnCABvva8RJhw/VzVCQ9O2T1r3mtrKMSqmAzQQ9LOqzMtGWtb9HZWIfBpftrEID0z77RIF9G1jqd34XGCTTOvf8mael7kdqfAyUOAoom1LXujQyhayrP/jvlPyTTZkG8ibMhf0H6WSw8pIbjPmsS3AZXOSQ7JwUSeIeoUAHF9XhWeQWQuRUoTJl/iZXuV9Zr7QkmzbH/VaxqoRdap5ka1M/87ey9PHvajYfQbcquOHyS31+/0hdAbqy0C8RCB4eJmrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voSrmB70MqeDP+GQFTG7fPCCNBTgRI1I+xou2WOxB60=;
 b=MckKofKCDMxkfTPYgoPSmliGMTz9KX+RFx/Frh0ivoHWQd8KjZ/SQPzS0Vd8nWcNusIgqFCv23eFB13+v8tH23JDxEvamJSTYICbbfROyRFh5wpRFmRF6RxZ6JwMA9Of2bZA9XM6rdH2SPYGulYbGDEq5ja5l4tRO25iuu/McrdXNDehG1QBD3P/AO1U4kaoQ95Jb9bC1RwOkmEjNfYaFsfh4XjZcAFEixx9vjIeC+mod/d6Qk2vFgDwopolA53WecngwQ0CRiLjjMLuk0reeyFd1oPFCm9p+7uO2j+hzG+prp/3KySgTYXMye3f44b+LO7DDg6lZ22j386OEwJl6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS7PR11MB6248.namprd11.prod.outlook.com (2603:10b6:8:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 22:12:58 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 22:12:58 +0000
Message-ID: <aa3e7a8c-3145-4358-96e8-bc2f3cc2b4f5@intel.com>
Date: Thu, 19 Dec 2024 14:12:55 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 11/24] x86/resctrl: Remove MSR reading of event
 configuration value
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
 <123e82c551444762300a483aa3fa687b70a0ba7f.1734034524.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <123e82c551444762300a483aa3fa687b70a0ba7f.1734034524.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:303:b7::32) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS7PR11MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: aa44df37-1e4f-4524-2f2f-08dd207a4b81
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGpHNGcyNThqVFloMEQ0STBMK09rS2YrLzhjT2pKc0tNWG9FVGFiYmtTaWdU?=
 =?utf-8?B?QTBVYUlSd1ZtUGJ2UFRIT1pSVlNaTFkyYVJjak5rQ254MkZrYW50cGNZZW44?=
 =?utf-8?B?bDl6dWFraERoUjVURWIydDhjbkZQNjd4QTNsRWNsVGZKT0cvb3FxNmY4Rjlo?=
 =?utf-8?B?Ni91ZEQvVDFRZ1hJeDM0dlF4QTNkcUZ5QkNLMHc4eVJwMzN4NkttcWhMSXdW?=
 =?utf-8?B?Y1EzVXhhTUU5emRsUTZ3d0wxL2o4S3ExUUQveUhuNHZBdzEzVXNjNVpocU9w?=
 =?utf-8?B?ZHI3bjZsT0pocEZIcElMTVpnSlNsWUZRRkl5eHNoUVNkWlo5V1ZrMUxJRktz?=
 =?utf-8?B?dkgwQVU5eWdEVmxCNFRmbzVGZ3E3UmtzMFpsZkpnSzhPVE5YakxzV2lZRjBT?=
 =?utf-8?B?RkVrTmYyZG1yN3k0SklVdU9DZTRzVEt5RjVlVGx3NzNSc1d1c0VLT1NlRU0w?=
 =?utf-8?B?T2hKYUI3N2VGdFEveHBTbjNpSUV1d05XQldoQUZ5alkrNjRTQ3o1aU5UbW9E?=
 =?utf-8?B?MnBBR2NqSDUzVkcyM3RiNjg1WTE0SW1aMlBsWitaeURvbndkTUFkWU1uMlla?=
 =?utf-8?B?cE5JNkVpWHIzeXQrL1dQTCtVczVzQndhSWFaZkRJNFF3NE1DK0JNRUhIMGdy?=
 =?utf-8?B?MzNvci90aWNlUXUwZkdtN2ZmM0I4QXJRcTJheTU3dzNBUW0xc2RlRExyaFFX?=
 =?utf-8?B?VGVxUnhaSk9NYVNwTU5WZkVaNWVJTGJvL1FiNjU4ZlRSclh4YUtIUjhNZTVH?=
 =?utf-8?B?L1RHcURNT1JGTW80R05RditUU2VnRzFsVTBLRFhoR0VzMHBVSDlTL2gyaE1Q?=
 =?utf-8?B?ampIQ1hHK0ZlNXNWL2hwU09HVVdzcnVNZDdtM1BieTFLZ1M0eGkzMjJ5cVJu?=
 =?utf-8?B?bzdUT2pYQmMxd0hySURrTEVFTnlzcEtJZFJxNXVYTldJclp6bVdZWjNJUDVn?=
 =?utf-8?B?NWt0RXBhVGdidDdOTWFxMk9kQURsWTJyUVRkSWxiRXZFSjlZQWZPbzVHSUJq?=
 =?utf-8?B?QUV4cmFxbThibTRYeTJXTy9GQldzMDJjYXhLbHljYThldllRQmN4WWZ2a0tv?=
 =?utf-8?B?ejZLWUVXMkJoSSs5U0ZRNjE2MjdlYkU4YXNBbXlxWDI4dThWekpMa3NDU3Z4?=
 =?utf-8?B?ZE44MTJwdE5RcitqRGNMNnNId21uR2VjSVhGd0c5UDNBQjJFaHAwNEtDSHV4?=
 =?utf-8?B?YlZPeWZoNEhDaTNCbVd5S1FJQ1lLZlRCUUhKcUlnbU94SU9JSzg3VmNOUUJ1?=
 =?utf-8?B?Y0p0VUZpZWdPQXpBYkxqU201RmlFN09aYXJ6aWI2Y1I5UzQyWnlaSkpNZncv?=
 =?utf-8?B?ZmdrOVg3VDl3RGZHZlpwUkVhbHRxUUxZTlluc2YzYXJHVWpwRFNJaWVZdGVX?=
 =?utf-8?B?UE40M2U1eGNlZTlWdVFESFJTbG5vMlRUWFJlc0hsaWl5Ykc2M3pWSkxtYzZG?=
 =?utf-8?B?VmhrY1B5bERrV2ZsekI5RDNyRmhkYk5Lc2ozOURmTzlKNVVLeUJyby9Fa2wz?=
 =?utf-8?B?cWZoMzI2Y2RyYXBwVmM2SXV4YUdEeWVqVVd0SE5GSkI4NDRQemNVdlNMWmtj?=
 =?utf-8?B?VVQ4MnArbEVCbmxRVUVvUTg1dGJRM01WbHNvWFdsT3Ztb0owNHFnTWtTeTJQ?=
 =?utf-8?B?UUxZbWZwWjFNNi93NjVDcTVjSnVlY0NHcnYrUWJlaHgrTEQ0VG41U2FLREtE?=
 =?utf-8?B?MG16bUxmKzh3MmZFZXkyazQ2dWx6MlhkdkJkWmhBakRjQVAyT3IwTUdDM0R5?=
 =?utf-8?B?ZHMvNk53M0ZyclY3ZVQveklkdjhIUjY3eVozcklpaEJmUUtzbUZ5MkdpZXBE?=
 =?utf-8?B?anA5Z0lpTzZ5VFl4K1p6RWhBYjJqTHlLMTNDR3lDL2hKTTltSytOVUlqN2RB?=
 =?utf-8?Q?QpU5GoQgZsnIH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEd3SUxvZStWQ1ZsMDZBQisyMXRsUVpQeHJKZDZPNWFudU1XTVJlc3FRK3dB?=
 =?utf-8?B?SDVkY0Fxb1AxdzM4SmJQUkRQVXdSRU1Cc2lwV3JxWnBNOEhXSjgrckl1ZXVL?=
 =?utf-8?B?SzFCdGhsd3JZZWVmUU5PcnFEaXpEQVc2NmVTWEloKzVTMTYxb1VMczNaUHFK?=
 =?utf-8?B?bXdXUWkveW12OVl4NXhGWnZJWHpMTytSSC83c1ZUdXF1ODZCY3dkWWhXKzhv?=
 =?utf-8?B?cUJzakhDUGF4SkpUSi9LdlhJSE1zZkNjUGtzL05YTzc5R3Z0RHRVdGVNblNv?=
 =?utf-8?B?eENySWVZYStlRW9YeW9CYnJ6VkhIVXJHWGxjMU5VclJUcDNHaXJhUGN6TEIw?=
 =?utf-8?B?Mlg5RE5IbVNtb1NZb21Va0JSTVVOSjdTOSt3MFBFTTJXTk5zNXVwS09UYWlr?=
 =?utf-8?B?VmFONzU2SU12andSaEVUekpGSlRjMHFJUEhJYzF1YVVYTFcwdDFJeHk1OW5Y?=
 =?utf-8?B?N0xPQ1FvMGxiZzNKL3RBZnhDckpoeURBakVsQ0dxd09ESmNDNlMxaytBc0U4?=
 =?utf-8?B?dVA4R1IwaHoyeUFJaDNNVmsrbUNyWGpkSXgzeVlTTnl4WnlPdzVKQVpseGVu?=
 =?utf-8?B?NHlHZFA1cEhsWlhWa0NzQ2tHNitweWd5anJiSTYwUGlKa2VJS1hvVW81U0hj?=
 =?utf-8?B?a2k2cFdZMmRkSS9qRlhCTHhMcERJRjdIVStEK01Bb25kYnZqTXgyb1RCZDln?=
 =?utf-8?B?RWhsaEFMVWVJOFhzVUk4VkJPUityQkhnZktyTm80RjFNNExOc2hNVXZ6V3o2?=
 =?utf-8?B?bVZTSDkrM2tSTUJUQVNHdm5TaFdGVWJNRDBQT3VGUGZSNEFDNjZZVVVqajhS?=
 =?utf-8?B?OGxKWERqWnRuUkZ6RkJvWFBBTVNMZHQ1VXpVblpyMnJyM0dvSGRUSjJiYkpO?=
 =?utf-8?B?RHNUeXlienVwQWUyYkx0S3VabERBSWtRZlpyT0R5cEVwY0tueUlERXg4dG5u?=
 =?utf-8?B?bTh3RUNQZzRIZkdRK3pTM2VKa3lobng4Nm9KWEl0V1lIa2tQMkU1L01Zbkl1?=
 =?utf-8?B?bkVHUFVBOVJLUjI4STVTNitIbUlQZ0pNemIwbytZd25KaDNMajRGUTlNMWk2?=
 =?utf-8?B?ZXREVmR0eFBPS0pCTnYvM3IvSFB5UEx6MWQzREtKTENMUkQyK3BLVzNYRGZn?=
 =?utf-8?B?RDVqRFg0VFAxYjg2cmRMWmRNelNEbVZGR3lVRnJVQXJPenloOW1vSWZQK3d2?=
 =?utf-8?B?YnJpZzlweXpLKysrN3FzNi83dWJiKzhnOWtpcThXMGd3b05JdWc3S3k1WktK?=
 =?utf-8?B?ZFRkdVlFUXpqWUd3WnFSODZXZS9ob2IwZVlVNkMwb3BNbHlqSGFtVGhpdkFH?=
 =?utf-8?B?T285M0tuZFNUUEhNeDFLcis3V3BUNVR5eUovSDlaOE16RUJMZER1RWc2d1Bz?=
 =?utf-8?B?MVZGY2xudDd6eDVFWjFNWXlEODJ6Nkg5QVNzdVF2Y2tjNUlSNzcrRFlyQjNz?=
 =?utf-8?B?MitQb2FZakpWMUFWZjh6U2V2aTB6K0hJZzNNNks0RW94d3ZmMmxoMkdmNVBa?=
 =?utf-8?B?NS9IYkRqZFdBUmdpMldTb2FUelpkYWRHaUJRRlZobDMrVFJmNHgwTFRsbE1R?=
 =?utf-8?B?c2xmM2NDY0ZPNzlob0FoNWpCdHNxbndrUDVkVEhmTWRPMDB1dEV6M01hZ3ds?=
 =?utf-8?B?cEp5UzY0Z00wMVN4bk9WM1E5dUVTVDl5alV6SUx0eUsrU1A4N1loQTRHL3Uv?=
 =?utf-8?B?M0RqWlRFNmRITUE0RDRwbnRzOFFDNkU5TGpMK2lYYXFNL1l1NkZ5MHhSUWtl?=
 =?utf-8?B?M0xaeXVvU1JrSEt0b0NnQ2NvbWhtWDRGUUVFOHJCYUJKOTVJdWwxdUJjc0pC?=
 =?utf-8?B?UldCa2x3VE1FNnpyTUQwSGJUTERBakhscldaeW1xczR5a2wySFhzUW9TY2Jy?=
 =?utf-8?B?UlZBSXFjZjl0QVZDUjZpb1FZT2FQL0tVVEFWUVc4STZHcEp3YzB1STcyU1Yx?=
 =?utf-8?B?RTl5d3NiUDBQNDZKTzdBWFRCNXFmRFdid2FOSCt1K296aGpId0lmakFWUjgv?=
 =?utf-8?B?U1JmNXhVbjdtbDdOT1hTUlVMckpkbmszMDMySXpnQmtmTU9sTzRFNllxWUtz?=
 =?utf-8?B?a2NwZFJFRDErVmxUcyttQThZT2p3WEc0SUlWOXB0VmJNUTdXVzYzOWRvYXgw?=
 =?utf-8?B?SThEMG0wajI5S2VYaWRVN3RPcUk4eTN6QUdjQ3U5ZTFBbXhPRW4xelZlUTkr?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa44df37-1e4f-4524-2f2f-08dd207a4b81
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 22:12:58.2617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYGcANYR9B/UcnUbZ68k2I4sCYLC2a/R6o+QHeRpfTp3pfcLJUzxe5LSeyDehB0+qV6TLEq8FTkxrky4fiJgZeFky2xSQpWXw1oSR3uvbDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6248
X-OriginatorOrg: intel.com

Hi Babu,

On 12/12/24 12:15 PM, Babu Moger wrote:

> @@ -1604,33 +1645,11 @@ unsigned int mon_event_config_index_get(u32 evtid)
>  	}
>  }
>  
> -static void mon_event_config_read(void *info)
> -{
> -	struct mon_config_info *mon_info = info;
> -	unsigned int index;
> -	u64 msrval;
> -
> -	index = mon_event_config_index_get(mon_info->evtid);
> -	if (index == INVALID_CONFIG_INDEX) {
> -		pr_warn_once("Invalid event id %d\n", mon_info->evtid);
> -		return;
> -	}
> -	rdmsrl(MSR_IA32_EVT_CFG_BASE + index, msrval);
> -
> -	/* Report only the valid event configuration bits */
> -	mon_info->mon_config = msrval & MAX_EVT_CONFIG_BITS;
> -}
> -
> -static void mondata_config_read(struct rdt_mon_domain *d, struct mon_config_info *mon_info)
> -{
> -	smp_call_function_any(&d->hdr.cpu_mask, mon_event_config_read, mon_info, 1);
> -}
> -
>  static int mbm_config_show(struct seq_file *s, struct rdt_resource *r, u32 evtid)
>  {
> -	struct mon_config_info mon_info;
>  	struct rdt_mon_domain *dom;
>  	bool sep = false;
> +	u32 val;

Could this variable name be more descriptive? For example, mon_config, or config_val as
used in mbm_config_write_domain()?

...

> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index f11d6fdfd977..c8ab3d7a0dab 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -118,6 +118,18 @@ struct rdt_mon_domain {
>  	int				cqm_work_cpu;
>  };
>  
> +/**
> + * struct mon_config_info - Monitoring event configuratiin details

configuratiin -> configuration

... but actually, the motivation for moving this struct here was
to make it available for an arch to interpret the data passed
via resctrl_arch_mon_event_config_set(). This patch passes data
in this struct but a later patch modifies
resctrl_arch_mon_event_config_set() to not use struct anymore ...
and then leaves struct mon_config_info here.

Even so, considering Boris's preference this is no longer needed.

> + * @d:			Domain for the event
> + * @evtid:		Event type
> + * @mon_config:		Event configuration value
> + */
> +struct mon_config_info {
> +	struct rdt_mon_domain *d;
> +	enum resctrl_event_id evtid;
> +	u32 mon_config;
> +};
> +
>  /**
>   * struct resctrl_cache - Cache allocation related data
>   * @cbm_len:		Length of the cache bit mask
> @@ -352,6 +364,10 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
>   */
>  void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d);
>  
> +void resctrl_arch_mon_event_config_set(void *info);
> +u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
> +				      enum resctrl_event_id eventid);
> +

Please move to internal header file instead and consider this for
all changes to include/linux/resctrl.h

>  extern unsigned int resctrl_rmid_realloc_threshold;
>  extern unsigned int resctrl_rmid_realloc_limit;
>  

Reinette
