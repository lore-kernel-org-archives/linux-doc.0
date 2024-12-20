Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F742594A6;
	Fri, 20 Dec 2024 02:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734663438; cv=fail; b=dvE5wg5soVzObOFfwtF2jGsivXFM4S5+4JSwBmRPoP45gjEKMLwb+GixkLFABlOQAehl7kMrA6qFx3ZzhecgQQxtAK4MCNfh7TXm3ED1edyrIwDMS2XnIBBAQjksQiXOLSUXDyHd4SIMUT4VTa0s9uI4eM5G02CFiLIoXrPyNfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734663438; c=relaxed/simple;
	bh=sBw0h/NPvSZnbxKI5CwOvN/yy+0oQHJwA+a4uFWOH1M=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F9VE8gQqp3Cjk0SKb5rP9BIaRtwUh68S0OG76qPqJBY4e1hZh1u9TBdbVMBRl8ndPQAz+FXtwCXPPxwvQu3ZCf7R7URDu9+lKXjJrWoeeq08hiKmmIrhEWAq/w9MLyRHfZOHWtkBBLrKEOKsEIcSeAJV4jmv5NX+0ha0mVMMGp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4h5Wetd; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4h5Wetd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734663437; x=1766199437;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sBw0h/NPvSZnbxKI5CwOvN/yy+0oQHJwA+a4uFWOH1M=;
  b=A4h5WetdTWl56K6lmdkpLOKggDu3jI4CWnwB58dYEWbLWhhgTIPAgu4/
   jzhHDQG8tJQ3sWikg1j09wj4cIC1rcQ2eLLiUy0+gVwaVqyO+x2GtkmyC
   lG/x5ABrSA8u+QQVz52VEoevc3RUp9LJGNth98Fx/JBuzpVgoKcMGX3Pd
   3ffFEYeul68fJgpuQ5APf7ZiMefjfmsFJaV8MOs4LKMR2EUP1FaF3CznR
   suJIeb/47Mpznw7dl8tdQLJhMO/X8yhrz1JLSemjq2KKib7E17B0pTc3X
   /3VlwxDWY+0SJRC+VrQYlmpRK0FbsGTn/WHWiQ5ss39z8YGBlAE1PdzSn
   Q==;
X-CSE-ConnectionGUID: Iq0Sidq/TS+TMFckNG+YGg==
X-CSE-MsgGUID: 2wqKF9OgSQGjHnzx+HrtnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35094738"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="35094738"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 18:57:15 -0800
X-CSE-ConnectionGUID: ZD+w1D7MQk2fE9lYk0Htpw==
X-CSE-MsgGUID: dQuk203rRp2m/RgVwA/OAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102519188"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 18:57:07 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 18:57:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 18:57:06 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 18:57:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqsowYUL1rMKqpoty/6mVbfjX5uGqUwXSWrfCbJ0R8enJdTOBG01BpIZiVeIIfMGpDs7FwZnKZuJeGSNmt1zAaHIo8efzNkCngBLAyy0jheTZB0pLINjl9VVXXFuYdGnQ10trOv2kWJn52do357GD2NjaM8KSa1ZHKmaFFMXbIy4ScdqD/oxro8Z0Do2h8wXZbWMVNCZZd2RhJEVpRER5JS7kAJU+LW+7xYC334aJwEzpxFNcyWc+vG6eW0PqnkQzBXhY7v03lZFjDT/yXyZCyp0vwso2jG2Zaxb2GHKek1Ycj+cTja/zCuKJzMzpY6iH0rrKrgnanMIkiEhP1VaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lza3V2cBwszhvhJ3wUWL9DQI2JwuKO2EYuE6il7PG0w=;
 b=lZjZ9x69snBEAqvAelf0Ju68Bw8GS+DfLdWX8MGRjX4ALZe0WF4oMbf2J4HPp2WfxNZeGb1RHBj0gyFZ/RLZ5hq4pua0uy9c3pxvKVQioflva4+CeCH9Z6fe7D21jWVjuEoWHbR/Unhq/KowrAL9fTju7dQXqM107OZdNjhmW9ldTJm29ytKVm9gjNJFG7/hiG8pRykcxSZ37wYyqcC2Fbx2LvFI0069fgV3aKIAuTYOIx6UM0U51uV7LQnNwVPsUY8s5Yxi9/wYREvBo+1h+67/uGTF+NMfG8gjImMZEpuNZzsQlNwDUGGxGimlcB7flcVeS5JawSDQUr8srb52iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH7PR11MB8276.namprd11.prod.outlook.com (2603:10b6:510:1af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 02:57:03 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 02:57:03 +0000
Message-ID: <270bfebe-9a6f-4606-bb0e-c798e0984d3a@intel.com>
Date: Thu, 19 Dec 2024 18:56:59 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 20/24] x86/resctrl: Introduce the interface to switch
 between monitor modes
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
 <874347c318853ccaafc7efae79093f2a394bba77.1734034524.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <874347c318853ccaafc7efae79093f2a394bba77.1734034524.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:303:2b::10) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH7PR11MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: 336ff94b-5f3b-4b9e-8e2f-08dd20a1fb0d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVhSZTdreVJobHAzSmk1dHNBc1RLVUF2dmo1SE5PNjhMWjhDdmhubzNjM3Bm?=
 =?utf-8?B?WktKVzl3UXU1dHBxZXVDTS8zUTRsZWFiT3dpMkxMNnFveFNtNjB0SVBEcVhs?=
 =?utf-8?B?am9TajNoN01oNVlGU2NuVnp4UzlvOXhyeCs1UEJDNTNEbkN3L09uK05mKytW?=
 =?utf-8?B?NEQvQVJnRzMrUkVJNWUzWm1vNndSM3Z0YWhYUm8ybDhjdnd6aUpnZmNacjlw?=
 =?utf-8?B?YzNtSkR4VGdEYjBaaFV1ZHhDQm00SEMveFI5Vjh5WEp1a1dRWFJLRDFKcDIv?=
 =?utf-8?B?SVJvOFdUOXRweUJwbkhkWHdyNWY4RUtvanlrU0lvanVIZ28xallUVDFPdmZZ?=
 =?utf-8?B?bXQ1Qm5mb3NrYzdYdFRsclBvQXBXUnFmZUNyc3ZmY2s1ODZVdDk4eUxwZ2N1?=
 =?utf-8?B?OHMxYWYwc2NVY3J5SW5LUkJJRnRTQkZGQnlQVkViajNkM1haVWpOL1U0Nzlh?=
 =?utf-8?B?VDFETktFTXdDMGRwdXIzbXFzN2JKaWJGYk5pNSs0V2xkRlNCaklPbHUzM1Ez?=
 =?utf-8?B?V0ZVSThuMU5FTk9WOXcwUjdGK1pZa2JrQ3p6V0d4NjcrdHdKL280RHBPZjVx?=
 =?utf-8?B?dnQ0VEZBeCtNQWw4TFJKYSthdG5xK25jZERDQkVvQ3pvSEpPaUMxbmkwSGZp?=
 =?utf-8?B?ZUg0WkpnYjdiNW1MT2QrRnF2NVp4eCs3TTNVTS95N0VpTWk3MWVDV0p5TkZW?=
 =?utf-8?B?TjNLWTQveUkwRGROVlNUUXZ1bUg5aUd2V2l0bzFqVkJ0VVhCb1cvSXRyVlY4?=
 =?utf-8?B?T2hwYWJLcFZIdHNyYnRWV2xZODUxcnJvWENzU2tJZndEYjgrVEhHRHp3WFg3?=
 =?utf-8?B?QmJkSWg3MHAvbExpcXlIb3RoL05NMVcxYzFVKzJMc1JrK0FaUVR2dWdoLzli?=
 =?utf-8?B?R1JGd05Dd0ZVNzR4RXMvOFVDa28xN2JxSUxBSE50d1Rmd0dmRnVORlc1c1di?=
 =?utf-8?B?RWF5cURwZ0RKSU5yY1dTRWNsWDVwK2ZwaFNZemJtWWlyTk9tNXhYRGF0WHI1?=
 =?utf-8?B?QjBMUElFV2M2SVJSQm80S0Zhd3l4MElrQnl4UWJTVmplT1NCMThoS3FUT0Ra?=
 =?utf-8?B?NXZqQ1NwUmhNZ3hNRjNMTXRJYThqL25uM1Y5R1hTdDk5YVowb0FjVjZuQXd6?=
 =?utf-8?B?VTdnendWMVNVUGo1WUJZbkNxM2g3Y1M4L29Zd2FOajF0MldjSmZjV1VJWlhm?=
 =?utf-8?B?ZWYvOUNLeCtlWmd0NWh3bWJENEh5SXRFZlpoRHVCRS8ycnkxTDIvZWwwa0VI?=
 =?utf-8?B?S3dQSjhVSVlGN21jQlVKYUNVNzBhbk5OSmdMNE9uM0dVVjBJRHA4QVZsTWVv?=
 =?utf-8?B?Q3ZDZXZEdmhIemI1ckpVdy84TmJMTEFHdFUwa3VuOGJnVTNXbWRZajA2emY4?=
 =?utf-8?B?c1BaaWt4ZVlwbzcxSVIvMkNCTTIvTzc2Y3FnbmlFbWRiV0V6UUZoYzhRRVZl?=
 =?utf-8?B?NlpMOTdKV2Z6VnRwQUVZUnpUclNxUWhsM0drdFZwcmhsd0xmLzFWeEY3MXlP?=
 =?utf-8?B?aVVhdFZpVGdUV1B1ck5WNkNnSTlGa1lzbUlYM0d0cHF0SUx0V3VGNEtZOXZ3?=
 =?utf-8?B?TDkrYlBNbWEwTGpiU05LUmdIZ0VwS0MyazR0K0REU0hnY1BORUNSbkR1bW54?=
 =?utf-8?B?UWVZbG12QzZsSUIybkJ3YUZKTTZjL0lUMnR1RVhBS2NJdzFaVlVObnJRYXdJ?=
 =?utf-8?B?MHBrVllaK0lNWnUyS2hLUUgyVVdTWkxTRlhhemlMSFV3WmxrZERQWmtDN0Z4?=
 =?utf-8?B?djB4YmhJekczcThwbEdzNXkxZ0RPNVNGWjhVQlZPdUw4YmlTd2gvOElKdG5w?=
 =?utf-8?B?ZUdJbWU1eUx5S1JlZS9YOEtFWDlJUlo0R05uOWJKVWNYWEM3dTlWMU1rcFpM?=
 =?utf-8?Q?5TqwqiR+bua5b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVZmWW96MTdBQTI2bTVFNlMwdnJ2SWdvZHlFTUYxN1hqUlBMRThPcmpVZmVu?=
 =?utf-8?B?RlJCMjBnZXQzeE1PUENwcmNhTkw0Ly8wRlBpdFJsN0hGeTQzb1pCQVlGUEZw?=
 =?utf-8?B?akRPTFR2aG1MWERCRy9CU2lqUFpGN2pNRUJZVnN4clpSVDQraTUyT2svL0h0?=
 =?utf-8?B?OWRxNWJ4V1B3UTR2aHVtODBZVWh3TWY0UjZVZ0p3REtzLytIekFZblozOUZS?=
 =?utf-8?B?WUFRMldjbDNIbmlSdzg0bDNuRjJiTUc4RFlVWGxIRmJkNWFxa0hOend2bGg1?=
 =?utf-8?B?YzJFMTZweFRhVDBUQjJ4RXV3bHgrMGd3Qld2ZG9JYThLYUJsS0kxSWxWNWl4?=
 =?utf-8?B?dTJoUW9rcWt0Y2dWcmNnV3hUcCtQVXZMUmkyYkVNR0xJYUhGVGJWc2NLV1c5?=
 =?utf-8?B?RUJEZ0VRUFdSVTAxRkl2Wk5Nc0N3OTBVc3hxLzRMdmJqeFdKWXE1dzFvcUV1?=
 =?utf-8?B?REJWSW93Smt2M3M1M2RXbXpYZ2hoN0g2djZ6SVJVVGJ5UnYxYjFCK21qOTdV?=
 =?utf-8?B?Z2hWZnpZSmdoSVRvaVBidWlUTTZSdWp0Z2Y1aHlTYm8vUEhMU0I0elFlMFAv?=
 =?utf-8?B?Q25ldE5TWEJGQmdFWVJjMnV3eWIzTmVsbWRkbENMUFJmMHRCRDFoaWo4cDBk?=
 =?utf-8?B?RG9tTXJLazltL3AyYUtEN3JCOVE5TTFtWkZ6TXFkSVppc3NnSm5KbUNBcXh2?=
 =?utf-8?B?UU93eEdPUTJWNzdqbzBQQ0NaOVRCNEtTQWRzVW9EazIrY0lvZjZQRzdIUjE1?=
 =?utf-8?B?bzlKdVRsdnZ4aHVZR0ZpQWZVNitPOGtEbGx2RlA1VE1ObEJVOGh2clpRbmli?=
 =?utf-8?B?WlVHUVQ0bzlZemxDN20vVU4rTFY2UmV2aTNpNlBOQUZlSFBwdU5kQ0tSMExR?=
 =?utf-8?B?UHdWTEZsTGQrY3NKaEc0M1hjRi9sL1VYTVl4T3Zra3ZlY01oM3A1L0tBTlNr?=
 =?utf-8?B?T0NDK1AyNjczT2dWVTVlZi9KOTMrUDBpZ2NVWGk4R0JHSmNtOEZrMnQzWVZV?=
 =?utf-8?B?R0lRNzB5eUhZUGx1RER3RlBhRFlLMDVVMEMzaDBuR0lDQVc4OXp1NkFMb0Vx?=
 =?utf-8?B?UEVONmdFbEdzV1kxbGFHQmxyOHE0QnRzSHdNZ2l6cWJWQm5TT2RRa1Q0MVRN?=
 =?utf-8?B?dE53WFZGZW5DT3YrVGlTME9idlNRekV0TUZmOGlTd1NQK0ZReVlGdmlWS2Ny?=
 =?utf-8?B?L2xzSGhCUHlhc0luaTdkS2dvUi9IU3gvVmd5SDBmc1pONWlSemFldG1TdFdC?=
 =?utf-8?B?b2hOVnN6cW13ZjZDWjhuckxVZDg5eGNiZnNuNlBnTUlQM3BtcGlKanNaYlNT?=
 =?utf-8?B?eVVVa0Q3QUJ2TmM0bVN3N0E4RnhBb1Z1L3lIbVV4U2dUWGtJaER3UmR5NjQw?=
 =?utf-8?B?VGozY0lheUxtVTJSeDN5OVlLZDJTaDViYkJMQ3UwQmtod1Yxa01GSElIdUhT?=
 =?utf-8?B?V0pYdXIvQ280T0tUL3I5ZUVaQm9KcFlicnRGdjZVYXdudEdCSEFRalF6SVhU?=
 =?utf-8?B?ZHRYR0FvcHFTZjY4VFUvZGFCeEVxcnNneXVWanhpR3BRNW5LaTdqV2NpWUkv?=
 =?utf-8?B?eUI1bHJ4c2hCS2JHZXZhcFJ1Z0JFRGNDVnM3OENCcGZVSDd3eHptNURXMkxn?=
 =?utf-8?B?cVJabVg0WjJpQUNHL1J1Y0p2SktFYWtRaVc3OThkY1I2dmgzRW5kVmM4dkk5?=
 =?utf-8?B?WWRINWFId0FHU0R0RWpyTFRINVR3SEpqdHN6T1ZMakFSSTJ4MXhTdjAwemR5?=
 =?utf-8?B?YTFpbnlMQWhxM3BnZXdVcjBzVm1OL1hoRkFzZWg2ZzIrQVd4UlQyZEx3ZGVw?=
 =?utf-8?B?cElLb1BOMm13WURUYS81STlmM1VlNStJeHU5OE5ycnhPN1YrcXZrNnhWODRH?=
 =?utf-8?B?SGFJSjV4N0VmZ0dYNjVqb2FBQXRDaDcxUVQvbWtaU0Z2SnNmc2ZEaDRSNDdx?=
 =?utf-8?B?VTFxKzUzTWFQd3VzT3dsTDl5d3Z1SVNuUUl5MWlXclp4eVlmbDFaMW1wZm9m?=
 =?utf-8?B?WGkzTmhYRFg5TFdveGZ6Vmp1aUo0WVE3MXdRUEtQeEZXVWxGSHlGQnpHNDBT?=
 =?utf-8?B?NEdCbkJwcW8remNnRFN5ZWk0Mjk5azdTUW4wdlpydDJzTTcvMXlwRFNBd1Jj?=
 =?utf-8?B?aUgyRzg4Wmc5UlFtZkt1NEdta2loY2Ira2Y1VE5qRHRtVXVwMHZ2WUQzUkxs?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 336ff94b-5f3b-4b9e-8e2f-08dd20a1fb0d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 02:57:03.1897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iI9y10QYgam4v6uA7bVbKQ2vyn9ZWXim+0I1ycqJJT8Mnoj0n/BbiQRO2KPc/dtvyz9LPJpzP2Puf2lqdczx2CY3e7OMO4UTcG3SeRz0x54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8276
X-OriginatorOrg: intel.com

Hi Babu,

On 12/12/24 12:15 PM, Babu Moger wrote:
> Introduce interface to switch between mbm_cntr_assign and default modes.
> 

This changelog needs context.

> $ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> [mbm_cntr_assign]
> default
> 
> To enable the "mbm_cntr_assign" mode:
> $ echo "mbm_cntr_assign" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> 
> To enable the default monitoring mode:
> $ echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> 
> MBM event counters will reset when mbm_assign_mode is changed.

I think it will help to elaborate on this.

I understand this as two parts. As stated, the hardware counters
are reset since that is what ABMC does. In this patch
there is a mbm_cntr_reset() but that does not actually reset the counters as
the above implies.
Instead, the counters are automatically reset as part of changing the mode. 
resctrl triggers reset of architectural and non-architectural
state of the events because of the hardware counter reset.

The changelog can really do more to explain what this patch does.

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

> ---
>  Documentation/arch/x86/resctrl.rst     | 15 ++++++++
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 50 +++++++++++++++++++++++++-
>  2 files changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index 3ec14c314606..d3a8a34cf629 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -290,6 +290,21 @@ with the following files:
>  	"mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable' if
>  	there is no counter associated with that event.
>  
> +	* To enable "mbm_cntr_assign" mode:
> +	  ::
> +
> +	    # echo "mbm_cntr_assign" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> +
> +	* To enable default monitoring mode:
> +	  ::
> +
> +	    # echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> +
> +	The MBM events (mbm_total_bytes and/or mbm_local_bytes) associated with
> +	counters may reset when "mbm_assign_mode" is changed. Moving to

After looking at the final documentation it seems more appropriate to move this to
the top of the "mbm_assign_mode" section. The top already shows how to read from the
file using cat so it seems like a good match to document write to the file in the
same area.

> +	mbm_cntr_assign mode require users to assign the counters to the events.
> +	Otherwise, the MBM event counters will return "Unassigned" when read.

This portion can move to the mode it applies to.

> +
>  "num_mbm_cntrs":
>  	The number of monitoring counters available for assignment when the
>  	architecture supports mbm_cntr_assign mode.
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 8d00b1689a80..eea534cce3d0 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -939,6 +939,53 @@ static void mbm_cntr_reset(struct rdt_resource *r)
>  	}
>  }
>  
> +static ssize_t rdtgroup_mbm_assign_mode_write(struct kernfs_open_file *of,
> +					      char *buf, size_t nbytes, loff_t off)

rdtgroup_ namespace is not appropriate

> +{
> +	struct rdt_resource *r = of->kn->parent->priv;
> +	int ret = 0;
> +	bool enable;
> +
> +	/* Valid input requires a trailing newline */
> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
> +		return -EINVAL;
> +
> +	buf[nbytes - 1] = '\0';
> +
> +	cpus_read_lock();
> +	mutex_lock(&rdtgroup_mutex);
> +
> +	rdt_last_cmd_clear();
> +
> +	if (!strcmp(buf, "default")) {
> +		enable = 0;
> +	} else if (!strcmp(buf, "mbm_cntr_assign")) {
> +		if (r->mon.mbm_cntr_assignable) {
> +			enable = 1;
> +		} else {
> +			ret = -EINVAL;
> +			rdt_last_cmd_puts("mbm_cntr_assign mode is not supported\n");
> +			goto write_exit;
> +		}
> +	} else {
> +		ret = -EINVAL;
> +		rdt_last_cmd_puts("Unsupported assign mode\n");
> +		goto write_exit;
> +	}
> +
> +	if (enable != resctrl_arch_mbm_cntr_assign_enabled(r)) {
> +		ret = resctrl_arch_mbm_cntr_assign_set(r, enable);
> +		if (!ret)
> +			mbm_cntr_reset(r);
> +	}
> +
> +write_exit:
> +	mutex_unlock(&rdtgroup_mutex);
> +	cpus_read_unlock();
> +
> +	return ret ?: nbytes;
> +}
> +
>  #ifdef CONFIG_PROC_CPU_RESCTRL
>  
>  /*
> @@ -2222,9 +2269,10 @@ static struct rftype res_common_files[] = {
>  	},
>  	{
>  		.name		= "mbm_assign_mode",
> -		.mode		= 0444,
> +		.mode		= 0644,
>  		.kf_ops		= &rdtgroup_kf_single_ops,
>  		.seq_show	= rdtgroup_mbm_assign_mode_show,
> +		.write		= rdtgroup_mbm_assign_mode_write,
>  		.fflags		= RFTYPE_MON_INFO,
>  	},
>  	{

Reinette

