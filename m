Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1538E19E98C;
	Thu, 19 Dec 2024 23:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734649490; cv=fail; b=hGdZ47vR9Ua6EK3PAsqVuuCp18p36iKbnHlt9uxf+XNluKvuSJ8N89uLENHlClt8j5G6xbwL8Tv1yrjMB7IsZj6Z5a2SvbuOOGLT7FnrBv1W5nVzT45mxHhR1t8pCzovde1K+DlK2oVW4lm9fC6ZmlDMy+bQEAuRNfPpCAi/ZY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734649490; c=relaxed/simple;
	bh=TbTdqZqMaEoXZ1Rh4Y2SxE65NY///e79WCDtttae7WE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SaMQvL7cV2TcKyWeWyJ9lJ8hv6pSoAY1rKohyrO++KwYzqf1V2YT2fEe/YaY4SMQBHyoiw01ReaZ/7nqL789X//obWRESOMWgthEHum8QLIcr8Q7cwUoXL+HzlHLBaLQx7NJndRmy2FEuOHf/4AKCoIV5sSelDbL+VgDT7k/JOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VX0PAG69; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VX0PAG69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734649488; x=1766185488;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TbTdqZqMaEoXZ1Rh4Y2SxE65NY///e79WCDtttae7WE=;
  b=VX0PAG69IrkaTJwIZSAjfEDX+DDywez8YK3Q1Zk1L5Nwg0KQ3BK1l+v3
   wo0FaZ/At0+kRh/eiacWXueIxkobO//Sq+fX25LisU2xbRwqlGhrDGsJ4
   kmCIdhe6yegVRx/ioxWR7G6Wgz2KSRIAYAA5KImvlLd9QjbGP1mVdRzTw
   d9LqeF0dMAnFma/bA0NMVfJbLMAVpExH2usjJAlieCgEiJvxKJIt5Fy2L
   Ec4LlJvw4pyRjP3GYCgXmDRb96W4hx5VPecTbocoguwfLaSJHqvVeu/CP
   oVKp1MCbpRllpIDbzxKZGzVU6wm79P2hayXsqJ26T8qeE9Hg48B2jUe1a
   Q==;
X-CSE-ConnectionGUID: n79nS2MyRtK0gD1/Q4R7dA==
X-CSE-MsgGUID: oKg5iQolTheXVLMGvUEPUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34513690"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="34513690"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 15:04:47 -0800
X-CSE-ConnectionGUID: ftNRaOSiRD62LkzChTcmOQ==
X-CSE-MsgGUID: 8cbvSKpATTantVtAxwpDuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="129160889"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 15:04:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 15:04:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 15:04:46 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 15:04:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rV8yN7H6CvQKC5jG7SZnJX6g5wW61Oi8zicC0naUhx/OMSgb8moLOYU6Qw0/R9p8y0JjV7cBnyXosvW/48Z0ytfJhftPisVT8I5yusGQfWj7/N3Zb3EhpGpMXkZoBrWkeAaQB7Iws3jCdsYGYg3gdGlz0xJRWUnND3Pn87nxgLnamTADAs8SX4RTjAlUyQygOOMHmYQNSzs+Sxbby2szKUH/NSYOS2F1C706BYR/StLjRrNMkgegLUpKDSSEtbh5SNTaSKg8A4pVS+H9kTyll8OK2FShOQiNd+4ozyK3VP18DjipsOi23EYqO8eWbkklA+Rx+biW1YNOZVPnUhfulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FztH2f/ugr+DkEKof5BLgCumNHTW8l44HRl+cTduQQ=;
 b=g2ZqSJpTR9N0K3pH3EbiMnrRcDl455atqDCoQvXmzvWUq7YcdVb7a/Kjfu7O/rXrfHRqK211PMGr+nsBdfhMwDFj5YmlUnB2j5DuK9PTH8VWpnyGGj0i1p6J6xMaas7fuaV3PFwwzRc2ndtIoGNE2zTtvzqXJswoSGnsMpY3I0reFf7LHxR4wZTl/YblGxqUiW5wor/6/q5bhj257sbynyzEvd6v/cKb2u0F8a1GQOu+kRNq1Own0Jr8wN8k1DTIccDxOtpOxO/un0CGihIZhzdlO1cEddHEK4qUIDB+YPG5QqIUgjysZD4wjPXgG+ehtnRC+To8QKTbG7yGHvmnsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MW3PR11MB4572.namprd11.prod.outlook.com (2603:10b6:303:5e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 23:04:42 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 23:04:42 +0000
Message-ID: <d6bc8c3a-932c-4bb2-8bb4-b44b05baa9db@intel.com>
Date: Thu, 19 Dec 2024 15:04:39 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/24] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
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
 <9f74a647d9ff929f040c57e32e253ac824d12086.1734034524.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <9f74a647d9ff929f040c57e32e253ac824d12086.1734034524.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:303:b9::34) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MW3PR11MB4572:EE_
X-MS-Office365-Filtering-Correlation-Id: acb3a541-1453-45eb-8b7a-08dd20818575
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzJ6OWZHeGV2YXlOS0YvTGJaY3BhTzUyc05WL1NLM215bGh2MVNjZnpBQmRE?=
 =?utf-8?B?dW5KSHlUS3M2QVJoTGNKT2FaUWZjenJweDduU245TmNiVHRJa1dYMEJWb3Vv?=
 =?utf-8?B?bmxOZG0xNFpjZ2tjSFNka05WSXpyTXdad2hVM0dnK2E4WGhrMFRENUJNY1kr?=
 =?utf-8?B?dE43MnVQc2k5Mmh3V0xZdXFFWGlwSVl5akE2NXdFZ1JhdWJjeFpZc0tNUk44?=
 =?utf-8?B?NTl0OHhrL3ZGd1pSWTYzN1A1VGJYT3orQTY1SUVwRkZESkl2bS8xeHlMc0pC?=
 =?utf-8?B?b2JZRzBVNlA2SHBSVU1PSDdPZDJQbmtCMng3SmNKUFBBUHQrVmNiR1JQYUZy?=
 =?utf-8?B?eTZEdHM5T20zd2hvNWc0czEwMnJzcXZlU0dpNzE1anlBcXBJMTJJTkRsMnB3?=
 =?utf-8?B?REswdUdMOWtHVmdoZlVObmcvTmhvNWxraTdkRExlNmpqLzI5ZkY3bm1EN0M4?=
 =?utf-8?B?YVdhakxGZWE1YTlNaytwcXFvS0dNd0VCeklIZ1hCSUdDZTA2bTQyZUtRN1dv?=
 =?utf-8?B?RmNsSzVNeUJPc3hhQmxWR1NXa2t2NWpJR1FOdWx4eXRNYkRzei9IWXY1NFRN?=
 =?utf-8?B?czRTekVJNmxJMS9sWXgvYkhyWEVHUVladmkzY2Z5elFOcFEwWnNNUmJWNkJ6?=
 =?utf-8?B?NVhlMEQ1TUVycXlEa2hhc2F6OGh6dTBFYkt5b08rdGVhVTkvWWJQamJxWDZJ?=
 =?utf-8?B?VWFGLysvamgxeW1ZcmRZaTNlU3pTNHArdDJoTkZscE1YVUU2UUY2MktydE52?=
 =?utf-8?B?YUJtdzMybEFoajdia3NiS0MyMG5xVUZxT1ZXUW9GRDA4M0s0NUhxaHJpc0Nl?=
 =?utf-8?B?SllLMklieUI3Wi9LK21EcW9FL2hsQnIrYnlnc2ZHUmk5TlpwOGZXNTJDWEFo?=
 =?utf-8?B?ZXRhR1FNQ2F6QkFCcUNHVmVsOThxNGV1MG8vWUVWTzlXNVRaVmFNdnUxV0RD?=
 =?utf-8?B?SWx0SFZYcSswZ21VTHZCSCtpQk9wRURiZjRDY2VyTWJNSldxbWZlKzhWaEtV?=
 =?utf-8?B?d3ZXQzNrL01KektZbllHTVp5YUtNeVdqQnhqWmhYWFRVY2thSWRkc0IvM2VD?=
 =?utf-8?B?dHNFYU5leWFIOHRuaElrQnNhbW4wL2hyQURaZUJGT2pIS1ZYOVBHR0RSOVV2?=
 =?utf-8?B?a0JjLzhzTWc3MHlWbitHTThmazJrU1Q0VDk1UXF3OStLMnNiOUF4cHd4ZU9k?=
 =?utf-8?B?OWppM0JGclNJU0hFYnZza1hzVjNvRUZvWUNDS21EMmxqbXl0MndwQWUza0li?=
 =?utf-8?B?eUxmTGFmNU5MN0VmbXVUVlM5UWpqazEwYko3Z0tVUmt5UTd2M0k0Nm5ESE9N?=
 =?utf-8?B?WFJnYXRiWVpiMHhiaG9OcVc4M3lsTzBiN3h4V0xUVDRFSWg5RWwzWml6N1Ra?=
 =?utf-8?B?M2o4MC9qd1ErNGVQRDVRQ0FxM2M0N2k5SkpLbnBMM2VjYnFyeU5BdzB3K0dp?=
 =?utf-8?B?QncxVXdYOXFFM3BqM09JdGxyeFRkOURtTWlYc1ZONGR4M0cwTXlLdllOK292?=
 =?utf-8?B?TXI1WVREZjEvNkMyZmJSTFlQNUhLQVEzVWRVaFRha3lYekZVbS9HRCt6VG1D?=
 =?utf-8?B?RjFGc2ZZNXFGSEl5eUhNUlJXQTlCbDRHckZjUExSLzFrRHQzbHRhNWJsZjFV?=
 =?utf-8?B?d3g0QVpIZGF2KzN3RUtOYzlSYlB0TWcrYzFlVFdMTTdpei8rSkRGZlM4ZEl6?=
 =?utf-8?B?VDNad2t2WVpnWDVpMFYzQ3g4MjZyeW5NdlVIakVQZWNQMENBang4NzNJVVNG?=
 =?utf-8?B?QnJPUVpkNHhKcy91aWplUkE5ekRJSHZWWkpsRE93MDhzamprakNpcGxmV2lT?=
 =?utf-8?B?OG9iaTMxTUJvZTRXVnZHeW5lUHNIQkh5dUt2RW5FWkkzVzg0dDJvSi9mNEM4?=
 =?utf-8?Q?1IqL4/8MCTasg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QURHV1hsem1GK3BUMGdNWHowakpTWExycThQSW03c3BsU0ZWR3E1dll5TFFv?=
 =?utf-8?B?V2hHbE1DT2Y2byt2NkNNNURBQ2VielVwME90dXNFVWNFUi8xcVFxV2JBYUxi?=
 =?utf-8?B?TzBYam9NNnR0aDhjanVQd0VPVjNoKzZsRjNvaXBrMFRTa2k4aSs2OTMzQnRm?=
 =?utf-8?B?NTVMYWNQb0NVdW80bkRDcmF5SE1JUmU5dmFZYUF4dHdlMUF4S3BTcWRPdEhH?=
 =?utf-8?B?TStva3crTmNvY0NOT0V4WnMrWWdRa1FFUlQ2bHpUdnV4VXFpcmJMVndKSWRu?=
 =?utf-8?B?WldpbXFLS3Z6MVpvZVB5SGorcGxNUUJ4Q3BiSHlyV2dNUTJxRTFSS21vNmxm?=
 =?utf-8?B?NUJBaEJOczJDanVRRUR6YnRsTGY5TTRFOWMyRVBDY1BOOG9vbmRVUmRJYXpQ?=
 =?utf-8?B?cExHaFBEcVRsdXRPcjdNS2JkK2hvVTF1L3VnSFJrZVJBNEdqWGxxSDZBR1gv?=
 =?utf-8?B?dGVQWmlUeDJLYWZrdjR1YmF3djZSaDJBM21IbGtmYnpRcjdzelFJSmFNTHlI?=
 =?utf-8?B?QWUvTVVOb2JhYnVwQTBaQkVHYk9lTjhUN0dqUmFPaEE1ZEdXT3FlRjdTL2l1?=
 =?utf-8?B?cWpEdVdIM1BOVndQMWVXODJXTHlHSnR3ZlR4dkhEeFBLdEU5SnAvSlNObkgw?=
 =?utf-8?B?MUJDOHdEakJFOG1EWnhhc2E3djZ6VUhpRVZQRWI5TUZuTmpUb1laYW5EdmlX?=
 =?utf-8?B?cmllT0JFdVdhak1wVGJ2dnBNYnRMSE45dkE4RDQ5WmYva3pKeVd4Rks0NVMv?=
 =?utf-8?B?Z2lUNWViTmQ1ZFp1TVU5dmQ3cTcrd2NxSkdrc2tZUHFwci9rbmV5dFpxNHlR?=
 =?utf-8?B?RnA1Rnl6S2VHdDkxWUVFN3lQamMrbXN0dzVkZGxLTVQ0S1QwL3B0aS9reVph?=
 =?utf-8?B?WVFIbWVHcWNGeWFvN3ExUGtLeU4wMmxEa2JRWVlSVU51cy9ZQjAwU2pySFcr?=
 =?utf-8?B?eXBoNEFNY0s4SExCWmJSVUlma2FWaFN2NGcrQWppTGdSWnBTb0dUdzYwVTdp?=
 =?utf-8?B?NUxjQ2drZjVuNWF4VHFoRVhwU0hQZis3U0xKQzdUb2MybWdRTklSNFByVlRS?=
 =?utf-8?B?Wms5THRSQVZIMGlUQkNVdlV6SnBreW5udXVGY0lOQXZhUk1DL0VCV2pBa01M?=
 =?utf-8?B?Q2VjcmR0RFRMbWExUnVnS1RSSUg0Qmc0cmJiNHZkS0dPRzVjd1BYZnNKemJy?=
 =?utf-8?B?NnJoYmtVWkhZejg5TlBubTlROUw5akRWKzNQVWQ1bnB4NnUxR1VTT2c5YkxK?=
 =?utf-8?B?ZWd1TkQ3V3F0UitJSFp0SEpGTG4zYjhCMHRHY2gwdkZwd3JoVzFsNnFQMm5P?=
 =?utf-8?B?ZFBia1IyZHcyQ1p5QitoQnpNTGYzNTI0UHo5anUvMU9DZG1EWTR4SFdETktN?=
 =?utf-8?B?Q2U2M0t3QjBHYVlKMXVhN0lseG9ROXZiR29LWUljQnZsam5Ra0IvMUtiYXpT?=
 =?utf-8?B?bWRNL1JSKzFCNmlabWRuUWhQYW5SV1pDWW1FRGNqcjJCa0VxTVZ5VkpDMVVk?=
 =?utf-8?B?M1ZzcDBBY2p4cW50TlREYkJuZXNTZ2VBMVBZdVpXWGZqY3lRQ1ZyK0l2WWpp?=
 =?utf-8?B?L1ZJeUJBVURQNnlLUEFMc3JRbkJPSXFyMHRlSUxsNk9uN2FkVkJ4Ukdod2lv?=
 =?utf-8?B?L2RMYVNFUTA2RjBSVDBJbDR2L0h3TWl6SGpJOGlqWnl3VjNOVUlsaUVrb25I?=
 =?utf-8?B?bVliU0cvVTIyOGFjV05URjgxSHF6eFZaSjU2NnpScldjcFpXL3haMlZSenNu?=
 =?utf-8?B?b3dGeENvNDdoVnY4UmJZdG9uNjZsZjJNR1RIODBXSWg5dSt1TkJnaHgycG1R?=
 =?utf-8?B?NVBPb1IrYkx6QlN1OUdZRnEzbWNWVURjTjVpek05bjZENC9rbXVpNjA5bzFN?=
 =?utf-8?B?cUdoVk1JMmk4ZTJpTTJuR2ZidEhEaXJ0NngrdktvMlRkSFVPa3V0TVB4V3kz?=
 =?utf-8?B?cFBlc1h1S3lta2JYLzQzdEF1a2x5am1vNzVSQ1dmczYrbEY4LzBFUlFBS2F2?=
 =?utf-8?B?NjdBSU1SemtRelVEaktpVndocWZuYTltcC9FLzBYVE9PQk5XbU5GTmVIWVFt?=
 =?utf-8?B?MnlYWWRWaGUwTjF3RjNlRzVXNlFna1htODFxMXllY1VVa0svWEdWcHhtN1FD?=
 =?utf-8?B?SUkrUlV0SW1wTXZFOVR2My9PTzV0TUVYQld3cjNMU3hnQ0lBUC92WGxqYlZq?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acb3a541-1453-45eb-8b7a-08dd20818575
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 23:04:41.9774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5komCCKUQnOZeD49GaUWkZNt85L8g9hg9Z3k6yB5XbYOIV86hpyfKNuTxUj+H3MKhMBdqoEo+ylKExmzCAd7TPSMGxbe/c5UMT05jj9bxwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4572
X-OriginatorOrg: intel.com

(andipan.das@amd.com -> sandipan.das@amd.com to stop sending undeliverable emails)

Hi Babu,

On 12/12/24 12:15 PM, Babu Moger wrote:
> The ABMC feature provides an option to the user to assign a hardware
> counter to an RMID, event pair and monitor the bandwidth as long as it is
> assigned. The assigned RMID will be tracked by the hardware until the user
> unassigns it manually.
> 
> Configure the counters by writing to the L3_QOS_ABMC_CFG MSR and specifying
> the counter ID, bandwidth source (RMID), and bandwidth event configuration.
> 
> Provide the interface to assign the counter ids to RMID.

Until now in this series many patches "introduced interface X" and every
time it was some new resctrl file that user space interacts with. This 
changelog starts with a context about "user to assign a hardware counter"
and ends with "Provide the interface", but there is no new user interface
in this patch. Can this be more specific about what this patch does?

> 
> The feature details are documented in the APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>     Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>     Monitoring (ABMC).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

....

> ---
>  arch/x86/kernel/cpu/resctrl/internal.h |  3 ++
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 58 ++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 35bcf0e5ba7e..849bcfe4ea5b 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -701,5 +701,8 @@ bool closid_allocated(unsigned int closid);
>  int resctrl_find_cleanest_closid(void);
>  void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
>  unsigned int mon_event_config_index_get(u32 evtid);
> +int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			     enum resctrl_event_id evtid, u32 rmid, u32 closid,
> +			     u32 cntr_id, bool assign);
>  
>  #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 72518e0ec2ec..e895d2415f22 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -1686,6 +1686,34 @@ unsigned int mon_event_config_index_get(u32 evtid)
>  	}
>  }
>  
> +struct cntr_config {
> +	struct rdt_resource *r;
> +	struct rdt_mon_domain *d;
> +	enum resctrl_event_id evtid;
> +	u32 rmid;
> +	u32 closid;
> +	u32 cntr_id;
> +	u32 val;
> +	bool assign;
> +};

I think I am missing something because it is not clear to me why this
new struct is needed. Why not just use union l3_qos_abmc_cfg?

If it is indeed needed it needs better formatting and clear descriptions,
a member like "val" is very generic.

> +
> +static void resctrl_abmc_config_one_amd(void *info)
> +{
> +	struct cntr_config *config = info;
> +	union l3_qos_abmc_cfg abmc_cfg = { 0 };
> +

reverse fir

> +	abmc_cfg.split.cfg_en = 1;
> +	abmc_cfg.split.cntr_en = config->assign ? 1 : 0;
> +	abmc_cfg.split.cntr_id = config->cntr_id;
> +	abmc_cfg.split.bw_src = config->rmid;
> +	abmc_cfg.split.bw_type = config->val;
> +
> +	wrmsrl(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg.full);
> +
> +	resctrl_arch_reset_rmid(config->r, config->d, config->closid,
> +				config->rmid, config->evtid);
> +}
> +
>  static int mbm_config_show(struct seq_file *s, struct rdt_resource *r, u32 evtid)
>  {
>  	struct rdt_mon_domain *dom;
> @@ -1869,6 +1897,36 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
>  	return ret ?: nbytes;
>  }
>  
> +/*
> + * Send an IPI to the domain to assign the counter to RMID, event pair.
> + */
> +int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			     enum resctrl_event_id evtid, u32 rmid, u32 closid,
> +			     u32 cntr_id, bool assign)
> +{
> +	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
> +	struct cntr_config config = { 0 };

Please see 29eaa7958367 ("x86/resctrl: Slightly clean-up mbm_config_show()")

> +
> +	config.r = r;
> +	config.d = d;
> +	config.evtid = evtid;
> +	config.rmid = rmid;
> +	config.closid = closid;
> +	config.cntr_id = cntr_id;
> +
> +	/* Update the event configuration from the domain */
> +	if (evtid == QOS_L3_MBM_TOTAL_EVENT_ID)
> +		config.val = hw_dom->mbm_total_cfg;
> +	else
> +		config.val = hw_dom->mbm_local_cfg;
> +
> +	config.assign = assign;
> +
> +	smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd, &config, 1);
> +
> +	return 0;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{

Reinette
