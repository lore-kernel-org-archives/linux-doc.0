Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA43CC9EA;
	Tue,  3 Mar 2026 21:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772572827; cv=fail; b=AdllCRJMRRlC+GS/nafei2/G3VdJ0LKH85JwceVzPvS3C6++oO5X5mH0VVddEZN1WEFGOQY74GHjRnxZ0Jd1qGz1FuEaO3jXRrhroi3Yv2z9Y5XwCUrpORA/cRlbSw/0XOex6HFy0bADkWAUaQXVERYXz5ZK29QotPFwhJGnrCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772572827; c=relaxed/simple;
	bh=GuAUzn8iE7qYivtkdJtbfxwp973/9gIDZQ8rctSa298=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LbgTLHgLb6Hvrs2dLsNcWEUDjOz2Uips6dnoBTObA2KpwJI9Z/PyuyQiCaOc76tNWTSRzI5y3opLM2+kWd53OVXnLU2VA12McEnawh87N4FO7RCLjQikXEwJc2FbHZMuHleH0wt3zmzXrFyEdytWhIejj4obKns5smE9mLVWe5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8J7FPWz; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8J7FPWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772572826; x=1804108826;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GuAUzn8iE7qYivtkdJtbfxwp973/9gIDZQ8rctSa298=;
  b=B8J7FPWzluwMkN7yzqd8Yd1gm8J1oesexMxLpZmiLlRJ/JUpndn5Pg9a
   sphA8mQdUbmvZFxj0edCLBV2YmLLN1DwgU8wq+Bnonr6H4IwiQuC/psfn
   MxS9+0/5rh+74Y+jZUOzNwJ6wQosreTE4BKRNhDWJUlIKgQrDRwtkZof2
   yRPKchzgrkEmA/xWDB+/fUGSdvA3Bk3/3HfbiZC253AHHKby0R4oYeDNj
   a0yXIu/UkQz4/dXIOp5cIoWDVQU4/c7Xe0A4gZ1Yylm2LeMBIjRR9+MeQ
   yISSzntDr7Efj1BBPAauBopzJ1dOPtBCmQV+vKw7pYYn3fTXKLfXvCg5y
   w==;
X-CSE-ConnectionGUID: YhgdTqJrSqi4zOqczAvkRg==
X-CSE-MsgGUID: VpyXcNFhSfeSPAY/Uu4glQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73588829"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="73588829"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 13:20:25 -0800
X-CSE-ConnectionGUID: tyLLg+ANR0e4pAk0CSrtDQ==
X-CSE-MsgGUID: ezJ09yzwTgutDqW5ZUxxQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="222600949"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 13:20:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 13:20:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 13:20:24 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 13:20:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPopNT+/SP4bW4hke5VQ1KvvIVUrZ56sgSZm5WaS1v6Oq65e9EjoeFK3JVVx/CR0R01KVPR1JuMk+a6ssZqx/110WY9gkIxTUxHvp9zwqAbsTGZWQLpEbMFs2boRVU/QUbXYnGs0cJsEn7YLmUJYHV1GHvoRqpEWGSRRIrIsyUcvpi13VnR0NO7vSqOymC1AKdoNe3glNCtbRY6GF/2F6CH3xXRPpPmH6CcqcQJMAhPY33mf+RinGcCp8QWkaf2rVhq9P5R25RnjMWCubiX8HdTM4+4dgEQVwnl7dUYRUPIXVeNJ0ci3kBIUyvwcuJDP00v1CWuw5ekzjpNXmf5j1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bijbI4eZyTWAd/9KTQLWHR8Fpy6++8hH74Ah+IfNIF8=;
 b=mkCvZizpulSkwY1Trfd1vS6fgMDp5Z40CrpHEF74+/tQQiB0MDfm3PF9of3vpo8OjaO3B0TCatpah6Tx9SE68VS2V8DJQv/hTiX/Pk8jY3RIqaREdVLLeVw37RplZ+4TVV/DJA4pnvbIVlUMR5jhuohty2D7iTp9uj/wXqZ2Dtov2MLZx+52AhWVl3pZT9Zdw5q0N7soJsRMP2PHv54ZtD/RIz3vUbHPGQm16WlBXCAWOGk2Ti+WyCDRfKAICm7wbnthbwCXas5M4x/vVc7dmOM1jlJ3PE7kl4Gk8kHvK1u7v2kRFOVztF77knEKDIndJejZXFRRkaeIaMLv/YighQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 21:20:20 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 21:20:20 +0000
Message-ID: <faf58379-36df-4535-8c17-bcfe838ae4c4@intel.com>
Date: Tue, 3 Mar 2026 13:20:17 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/vsyscall: Add vsyscall emulation for #GP
To: Dave Hansen <dave.hansen@intel.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, Andy Lutomirski
	<luto@kernel.org>, Borislav Petkov <bp@alien8.de>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "H . Peter
 Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Kiryl
 Shutsemau" <kas@kernel.org>, Brendan Jackman <jackmanb@google.com>, "Sean
 Christopherson" <seanjc@google.com>, Nam Cao <namcao@linutronix.de>, "Cedric
 Xing" <cedric.xing@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Tony Luck <tony.luck@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, "Maciej
 Wieczor-Retman" <m.wieczorretman@pm.me>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260219233600.154313-1-sohil.mehta@intel.com>
 <20260219233600.154313-4-sohil.mehta@intel.com>
 <1383b357-2a10-4b36-afb9-42e2724faa31@intel.com>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <1383b357-2a10-4b36-afb9-42e2724faa31@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 33eea3df-84f6-436f-cff1-08de796aac7d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: l/EXyfdIzAa95k1MEu/MOqDIwC58l9xTUfajp1XIdCbknK1IImXf3nVqURxNN5H9wBk4Zv8hCaLbuZLQ5Jo2bb25kSYLWEXrzqklht8uwJ+2OLNhqqb6Ega7CQZ4+uak0wa/f5TVirtsWaM1Rw6009ctSM0e2aRCRiXj16yX8XBwwHsdNLChUSOcnu3BoEUrJD/+PgAIsDvIspQvJz1irXvwVxuxE0yyLChJfjnVqwKC/jYTHC0z6f4G26ygaeefpjlmGcluoS0vgepgYt/1y0Sujhba7m2iJsjLMjRyt1yqq4DSlMX6FAzOU4ckT6Z3Jwh2a9uQ1o0t8o33Ns6EZVjat+IdJrN1ctN/cF5RvKLviQiv1kbwDwQGX1Wo6TUzamjfsE7kiEIWRjGmW41QW2K9wNz6XW49MkC4449bRs/JpGG17xbPqCwGSHZN14BE4FoC4TX+sRfNX0/tb3kpctz2J2DCsXghnFlEYJ6s/oJqudN//VtRAe4KbCs/iaek7Q7aujwDFOY9enyELDWc4qnynjH+o+oW56dGx3Ms/n8SUw1Bxu069JTA0z7rfq98yw4x+VJ6m06Qa5jYmvi0eGfPRsijcCYY1it088vz6ObwCwBJtuLrenLyTxOJY9d6EqsprnxAiDCc1z+ntExGe0q634aYpBOo6jz/AM38tJjY8bT9ivS/S0NGeQr1/aBX1BmkWn5ZPaRF6t5mmo47Y3pcKX+9PM+x9GiREGwfxgk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE1xWndsaEdmMWFEd2xWaW01dlVNMWVJVmlEZlRFK004bENtRUpCMC9sbW9k?=
 =?utf-8?B?SXR1Z1Q3V29KYTI2OHZxMWZmQTRhdmk4OXl4aXNOZGpHdzJFU3FQb0JBRGNz?=
 =?utf-8?B?TDF6OGV5Q0hmUllqYXErMjB0N2dNTVNoajJ2SWhTYTVuTDNsTzBZbjNSTW1C?=
 =?utf-8?B?MXl0aHFOV1VwNGl2NXRDR2picW1XMzloK05SLzE1MFNRUWRjc05MS21OMjFU?=
 =?utf-8?B?Si96ZDBUM04yVC9TRXB0MHZmdzNlcDJ0L090MEl0WVgzbldRdUJZTE82OEtW?=
 =?utf-8?B?ZkFPcVJ4dmNWTVp1RWgzN0dveis0cU9Ud3NlOXNickFCaUNsSGM5UlZmdnR3?=
 =?utf-8?B?dWdKY3gxSlc3OW9uN0tTanNkVDNPR0crQ3NTN05ubXpsL2J0cWwzYnpCZWlC?=
 =?utf-8?B?dVFIOUZEbmpROG1zaHdDaDJzdUdZdENUak5SbTNvMS9IdEw3R3BIQVV5dmNj?=
 =?utf-8?B?NFhjYnZrd2lKZDhGV0RzV3h4Y1BXNStSVUt2RzNFYmIrRnR0Z1BITzh0NVZS?=
 =?utf-8?B?Y080Wks3VjkxNGdvQTljVGxUd1lra25WdnZnbytqcFJsYXpRM2hTemRsL1lK?=
 =?utf-8?B?RExTUGJIc3RKTmo2alFvU05KOHhzMVlNUFFkUlM4QWl0RVZ4cGRTNG85SFBX?=
 =?utf-8?B?RmJZWm1KYlBLRDl3OXNtRGcyQlU0NjVCZHorNFhiWUhWdFJZT003aURYeEZy?=
 =?utf-8?B?aTVBcGpSNjdodjdTcmJaSU95ZXJmY2VmTzJ2YmpIUlRGRndlNThYOW9yalIy?=
 =?utf-8?B?RTBSNTl4VEFzbkl4WUc1czdrUWVta0F0UTdCclNFdUF5QzYyODR2VnR4ZS9U?=
 =?utf-8?B?NGM5aFc5VC9PZE41TzM0Q3JDNW01NnlBdHNHaVpzSWNSZndqbHd3Ym5sL0w1?=
 =?utf-8?B?V3JiSEtUbFhFc2VNTEV5d01MUWR3TU1RYU5jUU1nVWNGdnhGUDBQdTI2YUJN?=
 =?utf-8?B?RjJBRUJReEFRM1YveERFNUhHYlhMdlFtcitZZTczdUJ4KzR5TWxvZDgvaG05?=
 =?utf-8?B?NEZoM0Vubnc0N2VaNkNzemgxbFBaVDBVNGVOSk1sTjd2cGJRVVd1STlnTGZF?=
 =?utf-8?B?SUdIYld6WjhBOFBSakk1dHVzYi9kbFR2Ty9jOXB4U1lBSWN2NlArRmRxc1ZC?=
 =?utf-8?B?R0NVVGp3ZCsvNWJ4ajE5U1VPMHBDb2pMTXpnR3hkaTZDb29wY3dBSThML0sr?=
 =?utf-8?B?dW9TUnAzbXYyTVZnZ2tkYTd6RGlnZ0FHUzFvWmEwNmZzYVZFQlJ4bHYyMzlK?=
 =?utf-8?B?Q3UvZzZXUW9LZDV5aTJHcnZpNFhvS2N1b2ZpOUw5U2J2dlpQNWFlemxzZ21H?=
 =?utf-8?B?NnRiVFo2dGJ6TkhkbEhvY2VuOWVYdklqL1FGWWkrd05rLzFMMzlrSXA1cnNn?=
 =?utf-8?B?V1FzRXBPOWFrNDZJYzFTeUtzTExiNEEyR1JJWFNYb3FLaWJjRytzalF1WmpS?=
 =?utf-8?B?a0NObWVlU3lBbzZ2cTZLRWtnb0hUajNsZzlUcUlaRlNiOXE0bk5tc0Z4UVFS?=
 =?utf-8?B?R2w5MGlEcU5rWWE0S2VmQkhQMzNrQjNocFdZS0pXVGJ2QnQ0akFucDVhTzNo?=
 =?utf-8?B?VlRhN3MxRmlaRkcyNGZIMGFjbEVWQWxXbm1GWllMT0U2NHJjY1d4c2RHcWZS?=
 =?utf-8?B?YlR2NTJtWC9neU5vUU9tSHp4L3dpQ2ZBRVBScHZMRTlNbGdiUjNxZ3B4d3FX?=
 =?utf-8?B?QTJKUDUrL09LblRYMHZkbVpuZE9kNXJsZ1VmK25FV0xLMjIyRXJqbjhGVTJo?=
 =?utf-8?B?THljMEI4NHhnYWZVem9TNkx3THMrTUlZQytxWndyclN2aERKdjhBSzQxWitG?=
 =?utf-8?B?aHpybmZOcjBrZkFHaStYa1lxcFRUZUxaZmQ0K0Z4QWhPbDh2WkZVWGJmem1K?=
 =?utf-8?B?R3hEVGZiYTRiUDFGb3oxZnlrL08ySnhjQ3JKQ3RESHdRbWFUTWZMZ3ZkK2tM?=
 =?utf-8?B?RTRiaW1WS1BuVC92Vi9PM3ozd1BOZjNMMXZBMU5weUM4eXU1Uno0QUJoV05w?=
 =?utf-8?B?bFF5anZlNml5bjh5aGRBWXZ1NWpheE1ZdzRjTXpoVHpxVlcvR3FZamlmQS9z?=
 =?utf-8?B?Q1dMcUlSL2lqNTNySHVFdG1rMFUzODE0a2xJUmtMeHRpamIyTEh5emVHbURC?=
 =?utf-8?B?TEY5NHpPL0hyOG9aUXczejJZVDcyMUJib2x6MEF1OFJGQTlTeVJnNi9UY25P?=
 =?utf-8?B?clUwVldSaUk1QTFLMUw0dzg4eWM2VWxzMVVCTThhQzZPaysyRFNucVFQVmQ0?=
 =?utf-8?B?S1ppYlJxZ0h6TVdLNDE4eG9nRzdVMU1ZNDQxczFtK1BzZ1RsdWp4Mlc2RmlV?=
 =?utf-8?B?eFdkejAza2pjOUVHc1loa2NQN1BHM3JFRGVxdXRObW52MURBVGZ6dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33eea3df-84f6-436f-cff1-08de796aac7d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:20:20.2449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gPBsq+n9NoAQLOPCtXrfGHi8Fwoy5yUVfZzgKsjluh2KbkL0DboWWld0TkOrtcbWiyMxP4gBKn/eo7un6fY2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-OriginatorOrg: intel.com

On 3/3/2026 7:51 AM, Dave Hansen wrote:
> On 2/19/26 15:35, Sohil Mehta wrote:
>> With LASS, these accesses are intercepted before the paging structures
>> are traversed triggering a #GP instead of a #PF. The #GP doesn't provide
>> much information in terms of the error code.
> 
> It's the error code and the address from CR2, right?
> 

Yes.

> I _think_ this is trying to make the point that "emulate" mode is hard
> with LASS. It's hard because it needs to be able to tell the difference
> between a read of the vsyscall page and an instruction fetch from the
> vsyscall page.
> 
> But, the "xonly" mode is far easier because reads are simply disallowed.
> Any time userspace has an RIP pointing to the vsyscall page (with LASS
> enabled), it's assumed to be a vsyscall. Any normal memory reads of the
> vsyscall page get normal #GP handling.
> 
> Is that right?

That is correct.

> 
> BTW, reading it back now, I think the subject is really unfortunate. It
> would be quite easy to read it and infer that this "adds
> vsyscall=emulate for #GP".
> 
> It should probably be:
> 
> 	x86/vsyscall: Restore vsyscall=xonly mode under LASS
> 

Yeah, I realize now that the "vsyscall emulation" support and EMULATE
mode of the support can easily cause confusion. Will use your proposed
title.

> Maybe this structure would help, based around explaining the three
> vsyscall= modes:
> 

Sure, combining things from the cover letter and what you suggested
here. How about?


"The vsyscall page is located in the high/kernel part of the address
space. LASS prevents access to this page from userspace. The current
kernel only enables LASS when all vsyscall modes are disabled.

Now add support for LASS when vsyscall=xonly (default) is configured.
With LASS, vsyscall page accesses trigger a #GP instead of a #PF. In
XONLY (execute-only) mode, directly reading the vsyscall page is
disallowed. So, the faulting RIP can be easily used to determine if the
#GP was triggered due to a vsyscall access.

Reuse the #PF emulation code during a #GP and emulate the vsyscall
access in XONLY mode. As multiple fault handlers are now using the
emulation code, add a sanity check to ensure that the fault truly
happened in 64-bit user mode.

In contrast, when vsyscall=emulate (deprecated) is configured, it maps
the vsyscall page as readable. Supporting EMULATE mode with LASS is much
harder because the #GP doesn't provide enough error information (such as
PFEC and CR2 in case of #PF). So, complex instruction decoding would be
required in the #GP handler which isn't worth the effort. LASS and
vsyscall=emulate will be kept mutually exclusive for simplicity."



