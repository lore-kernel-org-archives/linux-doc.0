Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7FD2EC0B5;
	Fri,  6 Mar 2026 00:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772758199; cv=fail; b=R4kRDeZP1AJ8tows1Fthm2ojU6/Tjt7tB/Lw34wdW41xfADFV/J6d3gI10Ca2PAhtOSgsI498btyDd06LtAeYoJNrtdun0G8+jRkbFevDeG2VGmcKWRRQMASt+HzpKlkfyjNqB+DjjtvpjeO824AWdsCka0y8k1DuBgy37NlC5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772758199; c=relaxed/simple;
	bh=B0Y/c5Z+5ITIZBFS+c4WiAF8ZdK9kOKYrhWQ9mBXEUk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DrwKaCCCTL/Ow4i6s8lpKfEBUNmJWZGENK3UF+qPazqzH89FAE0/uZNAwBx+BmfmS81cAB4xYnwXtTFYTwPkXpIFODTT6NEX26s33ME4r1+v7Knj41Nj4AmlWP4N0JDYCkZktZdzuIurdtzrGk0tthfi0tgCJsBCuVDh5alDG1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ohy7q3Fa; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ohy7q3Fa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772758197; x=1804294197;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=B0Y/c5Z+5ITIZBFS+c4WiAF8ZdK9kOKYrhWQ9mBXEUk=;
  b=Ohy7q3FaYg6fhrXjG2X+m/R2rOYhd/1VzZiBdVjT1Yb//+oKf2TZRBtK
   lARYrrtaViGY+fXQYbNCQMoMXsFYdESwETYAWrIhiC7B8s/P0m6Nf+YAo
   zzcXUvNwMBzy1l6E9skYG85lZm7Woite34NAoQ5tdHRk1su9kkD+lbevp
   nc9UjoUAQBGLR75wzYNJC6kfNPT41Lh1rJUrVXE3SMi7d6V7ftPRPkALe
   EDfepZqNZG+nCp/uhHALN8slPoYXLRn7dxEufH941Mzl/GxNJe9qi2+5C
   oG7hx7jACVr5bjiIhzbQH3ZSjSxfJEv45xPP5qbHWnq4zD/90bl/YOebt
   g==;
X-CSE-ConnectionGUID: 0CGWdIk1RiCPfPsM6wzKUA==
X-CSE-MsgGUID: YlYQCsefSiisrLbQrDufVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="85335000"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="85335000"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 16:49:38 -0800
X-CSE-ConnectionGUID: N/yjfI4GRl+v/oSiK0dSpw==
X-CSE-MsgGUID: dtqRtliEQfustZtz1xCs9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218094307"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 16:49:37 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 16:49:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 16:49:37 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 16:49:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXJ01UB0WRZtvmi1NR4ENFlDcXtE76Y1iO+pZpIMIhwqKx+W/h1fVF3TjXjRJSgMyzajT9RMtQed7n9OISvlCTotuufUl+yq7/kBL8hUCtnRapaqkm1Rn6JRbFcp0UUXvFzKpv8Mg5e/lZGTqbjA61HssjGvGCAbJcpjFV8yZG7g0zqRLVs5ONSyWfxV+8gzVfj6aj2xD5+obLdltjA55QJIEVruNC7PuZkkt3AqrykBosuocIHy4RPLGdirm03RFKLAGVJaNp9Kay9CBrVxHUSuGYZLkOSCo7H8PZwUY0tQaG1qh3VbUBOLlfNkB7b9Sd2WDX/xS6YIuPwBV3Z/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPCCGp++T42vsHI6Hkd0INv5ktHV90ypqSOkxvz2fLU=;
 b=On+AjCF6ZTPZkMTn2oOq7T4xWJOLbi+KBe+IBH72DWttUEzzgbNQLXhg+caz0sL86PqIG16xeMpsE5JX0R4hy59I3Y5UQqb08QsQMXa6M0GkrinkP1+T7XSiekWqXjQeQGchCVOIcfwIMH/pu0U+wvkhYzQ3dKUHf1osHm80Jur8PNeJnZWcuZfSI2kCMWUbovEYQjujPUFu+Bp3CHCq51IJ/kyoFUWULXV4y35gwh0+l2/VX4hLv+pWZMykm/QyCg4zLn1zy++GDY30Eb+a/GnV/tfDAQFdbT4eXURI9F/Y/1+I/pmo1/qxSCa08SYUV3zTtn93oXyDEnNEtjREyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by BL3PR11MB6339.namprd11.prod.outlook.com (2603:10b6:208:3b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 00:49:29 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 00:49:29 +0000
Message-ID: <5dbf57ef-efcd-43c7-a0d6-c31538242e80@intel.com>
Date: Thu, 5 Mar 2026 16:49:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/vsyscall: Reorganize the page fault emulation
 code
Content-Language: en-US
To: "H. Peter Anvin" <hpa@zytor.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, Andy Lutomirski
	<luto@kernel.org>, Borislav Petkov <bp@alien8.de>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Kiryl Shutsemau <kas@kernel.org>, "Brendan
 Jackman" <jackmanb@google.com>, Sean Christopherson <seanjc@google.com>, "Nam
 Cao" <namcao@linutronix.de>, Cedric Xing <cedric.xing@intel.com>, "Rick
 Edgecombe" <rick.p.edgecombe@intel.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Tony Luck <tony.luck@intel.com>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Maciej Wieczor-Retman
	<m.wieczorretman@pm.me>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260305214026.3887452-1-sohil.mehta@intel.com>
 <20260305214026.3887452-2-sohil.mehta@intel.com>
 <2074c00d-2e73-4bd9-89d2-7b0a015b134e@zytor.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <2074c00d-2e73-4bd9-89d2-7b0a015b134e@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|BL3PR11MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 410deaa1-4c71-457f-b58f-08de7b1a392e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: fh0h+LlMDKO429mfs6KLS9oBmRXjpPCIorIEv0yPe5YVwzvt24TSmZOfSIP8v32hethB/UA9jYjI3WM9iT4xLPm6HG6vFiYW1zo8DVyDV5p39Uf24uUWSpj+ZMOwcVoo41s4hxPXY5OvrfpCA8QjmeAePwI+Ypm3jJiCJAIYHjtVRBZbCtyxVcM/i6SU2R7LFSePxhDlGJMeQH5qqatrJxJBWLg7OyKRI0Q39keIt/5iPVi2ZuZnM7m0ZugfjJrn3zq4R0M6XObjg9Gjmt8yLKsPFq8ufCx4BGGRS1YcBvgkQsXG/cnIPCQo2MjK0qaKWpMUXiw7HAib/8nCGKNY9KYJh8FbhCHbC79azhIzZX3Xk8tp7qchNysS7iDGLSqoZw8c+OnA+0Wj8c7Jllfdrktv7RTyjiE0CxVGDyNayrybEIJLNIuvX7Gxf7Y1szb7/r9PsEy+IUqm2w1lXyYOQWO5tC66ppb+OgIAcYGrCCff9P/RRCOqTS7jpdV4fy8MYWNwCQ/zEZvW+2SHy0on1nSC3ijrVQfcR1rFuHXz3TTrsPITjcbhi30ihCfBQgTPJTUl5aSL/ZeWwOODaShwzrPqBdITnYzgUDOsAFbpTg5WOmeYidVhLLbfPp7j5QY8MmrgoPzOdCxav21YF67hyvvw/AOTwwpFdUjs0a+oto9/iM4qJr1Y/mdIGN3H4okfd+5p2G1mEYyCEDNLW0mNMUsxx0dVhgvgttxL+CXnlUQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3NRa2ZSS25pM25sdG9PTnN1WlI1c0o4a3RWc2JRK2pJWnJOME5RVk14V1BH?=
 =?utf-8?B?d3lHMzgxZHpuWWlEREtZTFFoVmxNRlN1VVpWUHlnMEQxd0pwYXZPTTFWQ3ls?=
 =?utf-8?B?MWVNR0hwQ210a2gzNWFzUFhITThaT1NIZndGaTI2cmJYZWxvL1NUZ0k5am0y?=
 =?utf-8?B?VXY0Y2JTNzh5UGhMY2FjNmk2aVVXTkdFQlIwK3A5TTl3dStleVNyWkhwNFNt?=
 =?utf-8?B?RVBUdVE1WDBSbEFhbmJab2czeHNMdzFXQ2RQbld1Smw5ejFoblVaY2FYUUwx?=
 =?utf-8?B?cnhSS1V6SnFiMnk2QWR4TXRwSW1uZkwwLzhkWm1ZUGV0ekVHTkRMNzVUYjMx?=
 =?utf-8?B?RGpqVzZCSnVwaDF3NmozNm9RRzF5SHFPWVlKY0JOSy9QaWNYRWtTL0ZxNWRZ?=
 =?utf-8?B?QS8razZ6cGZHZ0Vac1p6ZUIwekhaT2V1UndvMzFBejBHdlJXdGg1NWJSMjE3?=
 =?utf-8?B?bzgxZXpiY3AvdG9aU1VRYnJoclAvcDRNa2RWMHVqUERTbm14eHE1TnR2aXk2?=
 =?utf-8?B?Tk5SN0p4Q21obFhnRWY4YS9oemk2UVBKRmVWWW5FUlBFRGRnMFhZM2xkNWFy?=
 =?utf-8?B?M2FuZFJ5c3FrcUZuQ3RZNGJXMldxV3h2N2dUSlZzSUxtb25vaC8zLzBGS3dU?=
 =?utf-8?B?SnJkeThQdXhOeDZNaGhIbGdKTGZmZ2pwYWVMRHNrdXVrYkZsWkdwQ3AyVHNT?=
 =?utf-8?B?NVROYVQreXBEN005WVVGQXBxR3Z1aWVBdFlzdXQyMkpGdWRGTE9mN3VqR0da?=
 =?utf-8?B?K1F6NjhRaVVxak1EUmJUUEpMenVYN0hiZ2N0L1BZS3VFQzcwQ1l5SmpDNmpW?=
 =?utf-8?B?WU1jbk1mczB6amxlQmVvaWRrR2Q1UUhscEh2bHFKdEllUGFzMTlTRjlGdzNS?=
 =?utf-8?B?NHB0V21Vd2txYUljYWlIMElLV0g4ajgrbm0wYm84dUF2UytMWmp1cnNzWFhR?=
 =?utf-8?B?bXE1WlExUzl3Yy9XYlBqWHcxRFViZ1ZLejB5RXliU2VRalFWWS9ldVdFMDNt?=
 =?utf-8?B?c0trU3MyUlRYQVE2VEVHNGVYRFZ0K1hnMjA4dHRpMzByd2l5d3BoZ0RsTUM0?=
 =?utf-8?B?aW9NMUFGakZlNjZVYWt1ZHBoWEJDRHN5UlU2WHF2TFZIcjk2U1JZSzlFaFBm?=
 =?utf-8?B?RHJrUzh4NlNjTUI5eDJWNUVYdDNoSEpsMjJTbHJNYlFvK0tRb3hCeWhkY0lB?=
 =?utf-8?B?eXpVNDFIUjlDM1ZlVjVrTy9ZbjVoUThVaWNtM0pxUnMxbSsxVUNJeG1SOWM1?=
 =?utf-8?B?aVFpWGsyMFRUV3NUV1NwTkYxMUJCTlFMdk1yYlFReG5wTm50Y3N3Z2RkVjBn?=
 =?utf-8?B?TzM0VHpnYXJEcVBzNUgzL0wyMWNIZFladVEyQWNUWjVvT3g0c1hpRTVyS3hD?=
 =?utf-8?B?VTJFekFxTGhpQldDVm4wRElSdU5YUXlxZWFFeC9Hc241elNGTWJvUGp4K29k?=
 =?utf-8?B?SENIVitXVHE1WEgxa0VaRUhodFMvN2FpZ1VyYTBlNFV3MEVESkVNLy9OV0x1?=
 =?utf-8?B?U3VESDUwN2g0TXMyeHhqY2w0SnBQdmtHcG1GT3lLVlhaMmd1K015SFhUMENm?=
 =?utf-8?B?SUd3elQ1UTdpVVBrNG5wTm9uS3JacGlUaVhkSDR1ZWQ1MitiZkxZN05XOStS?=
 =?utf-8?B?U2c3OG5lbzI4RTJJS0wzaTJOQlRLQXV5LytKbVV6UHdRc1pwcE1zcWUrd1Rp?=
 =?utf-8?B?bktZaDVPN0JLaWFTUDJUamVCQ2VhdnM3bzV0b0lJUVJERlpKM2ladVB6YmJV?=
 =?utf-8?B?S3ZtcGdJY1Q5UmRZSGxCVmZMejlQL3g1OXZJK0xPcEExWC9YRG5lWER6Snkv?=
 =?utf-8?B?QkRhRmxGbGlJVkk5eGNTR3RPS0VpaXdPcGNHMjVTZkpBU1JycXNwRGNsNDU5?=
 =?utf-8?B?bmdGTzVFby9ST3BnMlltV3BrVnU2Mnc5MXVudXZjYlE0Qm9JTVh3VS93a2Fa?=
 =?utf-8?B?bW9KTGJHWG5uamNUTVpSQVlhamFNRlhzcGtkL1Y5WVZIaWluSk9MbWlweU5o?=
 =?utf-8?B?dzRTbjROR1Zscm81cDdsdWNZWjdueVZxS21PRWxTZDNDNHUzU3F3VktjWEZH?=
 =?utf-8?B?dkQveTJROVRVNzBEaXRlVG5iczNvMHhFTDVvN0lIT0xBSm1idFArNjJYdVlI?=
 =?utf-8?B?NjJpYmZZaEpUcTBtQXFhRWZGazQ3UWVqOC9JdS9Ra1NqUmExcUlWMFk0ZWVN?=
 =?utf-8?B?bzc1dFBPSGc5NTZVOUYxSGZjbmNUSlhlN2t3WTB6V1lJbjZHdkNmeUE2bWlj?=
 =?utf-8?B?NmpaTERhaG1saWRYNElmcmRsV0E3c2FzWENqTTNTTlVzR1NQVXRZbHdWa0VB?=
 =?utf-8?B?WUtUWlN1b0J6MVlhY0ZnRGRPVWRMdDcwTG9XaTRRUXcwdTRRKzVEUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 410deaa1-4c71-457f-b58f-08de7b1a392e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 00:49:29.3756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLlnP69VFt2IdV+/EAjRWGt73eWpPqRsbOFuHLfVFW+ITqkGhcFONbqbbNzOvGK6mrUvkiCBBFuSVUiKq74j7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6339
X-OriginatorOrg: intel.com

On 3/5/2026 2:36 PM, H. Peter Anvin wrote:
> On 2026-03-05 13:40, Sohil Mehta wrote:

>> +bool emulate_vsyscall_pf(unsigned long error_code, struct pt_regs *regs,
>> +			 unsigned long address)
>> +{
>> +	/* Write faults or kernel-privilege faults never get fixed up. */
>> +	if ((error_code & (X86_PF_WRITE | X86_PF_USER)) != X86_PF_USER)
>> +		return false;
> 
> 
> I think this can be tightened further.  If X86_PF_PK, X86_PF_SHSTK or
> X86_PF_RSVD are set we should definitely not try to do any emulation, and I
> believe the same is true for X86_PF_SGX or X86_PF_RMP; I'm not 100% as I don't
> have the semantics of those bits in my head at the moment.
> 

Could some of this already be (or might need to be) taken care of in the
calling function do_user_addr_fault(). For example, I see comments such as:

* PKRU never rejects instruction fetches, so we don't need
* to consider the PF_PK bit.

* Read-only permissions can not be expressed in shadow stack PTEs.
* Treat all shadow stack accesses as WRITE faults.

I would prefer to avoid changing any logic for the existing #PF
emulation handling in this patch. If it's okay, we could pursue these as
a follow-on to this series.


>> +	/*
>> +	 * Assume that faults at regs->ip are because of an instruction
>> +	 * fetch. Return early and avoid emulation for faults during
>> +	 * data accesses:
>> +	 */
>> +	if (address != regs->ip) {
>> +		 /* User code tried and failed to read the vsyscall page. */
>> +		if (vsyscall_mode != EMULATE)
>> +			warn_bad_vsyscall(KERN_INFO, regs,
>> +					  "vsyscall read attempt denied -- look up the vsyscall kernel parameter if you need a workaround");
>> +
>> +		return false;
>> +	}
>> +
> 
> I don't really like the reshuffling of the code here.
> 

Sure, I'll keep the flow same as the original code. Will change it in
the next revision.

>> +	/*
>> +	 * X86_PF_INSTR is only set when NX is supported.  When
>> +	 * available, use it to double-check that the emulation code
>> +	 * is only being used for instruction fetches:
>> +	 */
>> +	if (cpu_feature_enabled(X86_FEATURE_NX))
>> +		WARN_ON_ONCE(!(error_code & X86_PF_INSTR));
>> +
> 
> I realize this is the same as the previous code, but I really think this
> should have a "return false;" in it as well.
> 

Yes, returning early makes sense if the warning triggers. But we would
need to change the logic to:

	if (cpu_feature_enabled(X86_FEATURE_NX) &&
	    WARN_ON_ONCE(!(error_code & X86_PF_INSTR)))
		return false;

Again, I would like to avoid such a logic change in this patch as it
only focuses on code reorganization. Would it need to be backported?

Preferably I could send it out as a follow-on patch along with the other
tightening that you mentioned above. Your suggestions seem fine to me,
but I really want to understand and evaluate the changes before sending
them out.

>> +	return __emulate_vsyscall(regs, address);
>> +}
>> +
>>  /*

> 
> Other than the above minor nitpicks, looks good to me.
> 
> Reviewed-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> 

Thank you!


