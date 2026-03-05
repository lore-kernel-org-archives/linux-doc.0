Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0735D3385B2;
	Thu,  5 Mar 2026 07:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697385; cv=fail; b=XH+hPs3lIG/dZftTTL+mOx0fr1t7+h+9FRGI0Hf3Jvo7nYxriQLGonM8YJsVJEUfTdcna+aSKrRJq0npweNYqis0Adpy8k6XF30zBnNUIPuzkqS/CU98mVD1H+2UD7eAcFQ53cvvu/uuU92sK6XE4VuZZtTJRxJmyPSa6Gf0rB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697385; c=relaxed/simple;
	bh=7XEIIxdsDWXPDm252/BPbaovx0/bvkN7xwj9m5PGw5Y=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZyIg+qWfVMggqk9bq2yHf1HSwlXHthmqgMmdAkzHJeOk/9gvGIx7O/5wfJqSBT6CAsdEgvmXSZcFY3KZhNMDpTWBA/GxcfOmaW11NrtjgfWB1eBuu+j3OOGbAhA1yA9AtZzwBSjXKVNEYljvKjoYG2LiALsMKNmIo83scQ+cf6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MN1O4BVZ; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MN1O4BVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772697384; x=1804233384;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7XEIIxdsDWXPDm252/BPbaovx0/bvkN7xwj9m5PGw5Y=;
  b=MN1O4BVZjhPS/U7gKLfQIyLgIT3tho0/1DzFxUZAtnO/IFCRSox2w5j7
   S21BsJmRahK5zO8AK+YT0cDLtfFBlbPJdhEApYZ24yni77kBwioqJB9XF
   /hku8F/T/pAGMcoUlhSoT+HsyGwxbSiIvfA5qznush7JTZZh3vAyq8Wkh
   kkQEwFm3365DIAYtyHCuufjdhh1eaVxPm7lQrMCjsk6PJZBXR8jMBjJcs
   flvgZ1zNhKBErVXEo13hkTEOpNVOXLtjUkj5W6yaixUWFARAEPumV+n1E
   RtG0eCpb7DhrDhAbduGsx1k/lUNxC/pNipQhS/mEZBEZ/bv2GFyz3yhlJ
   A==;
X-CSE-ConnectionGUID: U1HWabQJTE2Gc9EB6+Jjag==
X-CSE-MsgGUID: 4CRIbujzRsW/iPJmPbYcIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77379016"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="77379016"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 23:56:24 -0800
X-CSE-ConnectionGUID: gmHmcSMlSoiiItki/3dbYA==
X-CSE-MsgGUID: 1cY+P1YjQfKCwndH3QFDyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="222754905"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 23:56:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 23:56:22 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 23:56:22 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 23:56:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGcWOEdwWkQB9MzpqlUv30Pw48BZhGByVzMz9EW7oe7Jirmlt1bWjuCB7uA/5rRN+xn4o3JjshcdsHpro1Snj148QuxksSyYElHSZy0+bgiy04veByqFfmpClfjpDKwlzgw3tgdIE7nH90FrFXdAR8pa8qqTuLo8oxwW50NqqccRUIV/Wc70ku+F8u3V24Yy//bAEGdw3VBCVRu/0JKfXW7zxqKboTuxuyTid8rBDffI6/+ufIYCOqeMDb4eJjOymbS/DrJhrScpS8Yn29t+otyYtoebHmD0GP4C/kkGh9H1h2qsmKnRUhxyHAG8kh8a00owfYSKuF8dnwNVY0xP9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XEIIxdsDWXPDm252/BPbaovx0/bvkN7xwj9m5PGw5Y=;
 b=q4QPjHJmqc03XRnK8lTYCI2d1oXCaTAk3aCU/PqkeqxoxHKWUyurw/ee6I0VDMsRHkfQw6ga4VbvEt0Zy6Y1QBlBa1QnRtHiUNBq5T2Vx6RtbcG/1Q9aJ8ZVf4U+0YO2kZVXp/OQsbis22bwydOJi/Y2hgleolHfUZBedww8Y5p8x983E/Nng53TfXkY0C8mCET71CpFLIc8Pn40Gc/35Ww0VdLr+pbHUcmKbTgatZLM/3hVG1JS/W8amYhVZrU0C6145dj+7nsm4oKj2aSbf+D5YTIGzd0pfU+RAffRj7C+W0f0S//weir4XQ4D3gIRNHUrpTAu3LePruCksGIM1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by IA3PR11MB8894.namprd11.prod.outlook.com (2603:10b6:208:574::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 07:56:20 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 07:56:20 +0000
Message-ID: <6e91b689-3916-44d9-ac3a-35a36586bacb@intel.com>
Date: Wed, 4 Mar 2026 23:56:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/vsyscall: Add vsyscall emulation for #GP
Content-Language: en-US
To: "H. Peter Anvin" <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>, Andy Lutomirski
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
References: <20260219233600.154313-1-sohil.mehta@intel.com>
 <20260219233600.154313-4-sohil.mehta@intel.com>
 <1383b357-2a10-4b36-afb9-42e2724faa31@intel.com>
 <faf58379-36df-4535-8c17-bcfe838ae4c4@intel.com>
 <3212161f-64b2-4825-8bcc-c36201ab6589@zytor.com>
 <eeec4ac0-be05-4a4e-a9c7-8716de50cfbb@intel.com>
 <2e3b1765-ae56-4642-8a94-61805a64497e@intel.com>
 <FB1827F9-69C9-4E79-90E6-EABDD7F34445@zytor.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <FB1827F9-69C9-4E79-90E6-EABDD7F34445@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0144.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::29) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|IA3PR11MB8894:EE_
X-MS-Office365-Filtering-Correlation-Id: 888a04a4-b532-4f4e-9f28-08de7a8cafd0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: DCGipb5XL+6PltlKU8PoQhFfc0SZZewNzLKgoZiaLTRIuuYDOGjinwM3G3LxiaOK4bdV9E1t2OJOLgYyDdYBt4LxPrx3Xefc8yOevSgztQQGfASmj0yFEwXMGPHrPugH2r8YK9C8XxqD8WqQy4aXIWFlzDQw4lwwnVoXd1+YfGlA+8PX+Z3mJjKLwbF9zvSYsnaWOacVa7qma7evrmVcPlf3NfYKSmKWUjZr5xAMMKWGYN1AkvW1Xwfrlnq8er/YZ8CZOXo3/oGP4uyOytUGIBlSp6fV+VChHCy6/iy7JOXbGEeKOrF070qoh8D4cAkQpsZ9FWGvks+r6APZgOoMwRtUq/OXObI/FCCgJeFSAFF63xxUUtk9cG2LLxElXVPtG6e5PTLDk6FbhJ08d7R+bn8pCfgHlY61MOcIHATbqmzbip1IquqsvFck6/vATjVx1ipmGUrbkJrUdh4B3theba6QfMJ4QbV91H/QlAh/CZPPiNHWq0+01/pQ5YRsfvDPn7kQ2U9C1JOVUkxK/tAMqzdIUE/Ju2CdoXhdKRyKOPKvfgD2DwSZksyPEt3K0kaHMhXzvquzBjS9Apy7/vSAsXxNIuhdGFY/+1Sf4ZnPzYf7nN8yfWQEmGZzH5g1yF7ByZTZtPz12HMSJRpPnoiIc63ARY0JwDhgvdZBTOUw5SXzQzOMSH8vWsvxLQNxcueBJq013N7y8Exsnw43n9pCtxu/p73CeRxJ+rf9ESPcBwk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmFhV2RjdUNabTFzVlh1TUV6b1FRSGp0aEt3NE9TY01STk5id1lMemxZZXlq?=
 =?utf-8?B?Qk9hczhDbHRsVStrTDg0Qmp2Sm1qZ1NzL29RQVVwa0w0YVBVci80VDc2VzZz?=
 =?utf-8?B?WldXeXhXS2dzS0tNS2xrN0drY01WQk50RDA0aGl3ZmkyY3lMRXljZW1TQkZ6?=
 =?utf-8?B?LzYxNVR5d3p4QUxzRXNVYVpLRkVRdHpjaGFuTTlERStRVlFvOUlJNVhTaDh5?=
 =?utf-8?B?ZEJDNFcxR3pneGVWMm1peEVxL2lOeTJFV1JrUWtLRUtqSlhjSHQ1UE0xbkdz?=
 =?utf-8?B?Q1NFeXM1OWk5cXZJKzJsYXQ3T0dPZi9KNHN2MklIM1UrRlhGcytwUzVxL2d1?=
 =?utf-8?B?YkZoVlNjN3diK21meDNoS0dzQW5rUFl1aHVZVk5qZUpFV3pqUm01UGxWRFVC?=
 =?utf-8?B?azhadGRhY1lpL0NVYjBuUGFheVIvRksxN2tRS1dzbk9HVXp1bHVOUDNjS3Zn?=
 =?utf-8?B?L2ExQmRsWTdrUkw0OTFHRWtSeFRwcW1CUm1WaFJ0cE1HeFB1b3N4aHlEZCtZ?=
 =?utf-8?B?dG4vZDB1NWt0cnd2dStxNG9jZzBRRE8vTDA4TVNPUXdhZmF0U0FEZWRiLzF1?=
 =?utf-8?B?WXJQT0Q1Q1JLZEdNQUcyYlRJdE5hZENOVzgxS3FNSEI2SFBvNU0zcW5hNTVQ?=
 =?utf-8?B?bWd2eERtTFZNUEd0NVcvTm9jNEwwaHFtcFNyTnhTNmZSeFgwWTUvU0FZTDQv?=
 =?utf-8?B?ZjE3NmxZdlRyQ3U0WWNaSUtLV2NSR1lMRUN1UVcyQnRqYkJpNWIzcm1mU2h2?=
 =?utf-8?B?N1pHa2ZNbmFsTHhMNlBNSUl6bEVFb01aNFJWZkVBclMvQjVmMGxxN3Q2MmtI?=
 =?utf-8?B?UzVYN01nZ0xQM1E2MUNQRFNzTTFnK3lsL3c4TkxpRUwvUkNheVFoekZnekM4?=
 =?utf-8?B?YktibnhEdndRR3QwNTNaeHZtaEFreFJUVHQ1SEpRcHZqakROSlcyV2VzaHM1?=
 =?utf-8?B?VUNESHY5U3A5R3UwSjNadXo2Ym10d2hRa0o1cjVITFJZVXdEVVlPdnFhK3F4?=
 =?utf-8?B?RHFhVzdWN3pHSFBsMFpoNTViRkZ5RE9jNDVWemJpamQ0L29LOW9oZjlLZEhU?=
 =?utf-8?B?QmgvalRjSEZUZEptck11S0FVWXczUkphNmN6QUpwdWFmcEZMYlVwaUFRUmlk?=
 =?utf-8?B?V3Urd2tBeVhyeVV5aWtJZzJYRHpNanJwVGFXSzlKUHpzckx6aElTRlhKT3BJ?=
 =?utf-8?B?WVdadTRXa3ZPZlBVVmxTTmFoQ3lJZ2RmUDZ6dnUzN1dLMG9hZUh1QkVBb0Zu?=
 =?utf-8?B?TGZqN29MU3lXZXhVWGVCUDY4cWxFaGMzdlh0WmNBc1BvOXhidll6TGJKKy9I?=
 =?utf-8?B?Wll6VnY2VGNlV1lGSmtKaGJ6clN6Zk4rTHNObWtKR21IbTZOcmhiSVh2VkNn?=
 =?utf-8?B?SlJaYmUwNGV5RTdsTDBqKzBSdXY5bWVtZUtxaGVSZEd5b1JyZkFaTGRuN1li?=
 =?utf-8?B?QlBlbHpyWHZYa05xTjhyejJycllWMHFlV1ZiTUM5S0Rkd1RUbi9PeVdVY241?=
 =?utf-8?B?NTYrWDhBV21aZlkvMTJRLzlZN1h0bnphMlNDTEtNa203TU1qZ2lSVWtmSFkv?=
 =?utf-8?B?QjR5a0tGQU4rMWl6NEwybHgxYW1IMEhybWJ2WklHUGN3QkZVcEpHT2xuam5C?=
 =?utf-8?B?YzlGS3Jud01DeWRDZjhsbnF3dVE0bEtSZ3BCUDFqTWh6d2VqS2xodkk1TUYv?=
 =?utf-8?B?T0lIajdYUGcvMDJsYytUQjNvVUkxRTZpM01TNndVVkhpRzdHSU91SzlaN2Nr?=
 =?utf-8?B?VStvcnVBeWJ1azBKUllLcGV4L3VsT3hrbk8zMFp1Q1crYUtTdHFLbmU5RVI0?=
 =?utf-8?B?M3BvZEc5SStoL2JqV3RMMTdodXFOeFVLNFpGRGxsRTRhbEszU1kveStkTmNZ?=
 =?utf-8?B?RG5XWjNLbTliZG45TWw4VEtndWJqa3FSSGNWdzh6Q1pndm4xM20wOEJYaHRS?=
 =?utf-8?B?MlZBWkdPWlM1RWVVUXdYNWlsMmRLLzBmeEdyR0dMaUdMYnlXckxodWlSNjFQ?=
 =?utf-8?B?NTMrbURwL0FXbUk4VmNDelNLMk0zeG1TYVJEdGVjZ3E5TnNFazlQV2lwenF0?=
 =?utf-8?B?K0N3YmIzOVlFdTI2dU13TW1NdWJiNEdydVZYYmpOQVFqcUhjN0hiVTVmWDk5?=
 =?utf-8?B?ZS8waDh0Mzc4c05HTnFKMW8rbGdTWS83dldOVE1xN2NLeU55bEUvMjJIQVc4?=
 =?utf-8?B?RFNnZkYvU05uRVZWVzVLMXNMYk5DbUdJSm4wblhxeTEzQzlieGFEUnE3cmly?=
 =?utf-8?B?aTJCR2YxZWxxWEpVTSswT1NmMmx2Q2FpeGJwZXBQb0RSV2tMbU9TTUFmUXMx?=
 =?utf-8?B?QUNtQW93RFV6eWhmTnVrRFNLdzNIQlc5bTdJTmtoMCtlaTFnM3d1UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 888a04a4-b532-4f4e-9f28-08de7a8cafd0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 07:56:19.8349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lV9ECpKI+Uz5V24Q3Tk9q4K3/UK17dpTwX7H5XxPcJn3EOFoSrso0zSnQ2do8q1I2ewXKQ5E7jUC1vuUqDRO6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8894
X-OriginatorOrg: intel.com

On 3/4/2026 10:31 PM, H. Peter Anvin wrote:
> On March 4, 2026 5:45:48 PM PST, Dave Hansen <dave.hansen@intel.com> wrote:
>> On 3/4/26 16:10, Sohil Mehta wrote:
>>> Vsyscall emulation has two modes of operation, specified by the
>>> vsyscall={xonly, emulate} kernel command line option. The vsyscall page
>>> is marked as execute-only in XONLY mode or read-execute in EMULATE mode.
>>
>> Is it really "marked as execute only"? We don't have a real execute-only
>> paging permission on x86, the closest we've got is memory marked with a
>> pkey that's got the AccessDisable bit set.
>>
>> I think it's _called_ execute-only because the kernel makes it behave
>> like execute-only memory when it's handling the page fault. But I dobn't
>> think it is super accurate to say it is "marked" as execute-only.
>>

Sorry about the wording. I should have looked at map_vsyscall() more
carefully. As Peter said the page is not even present in XONLY mode and
in EMULATE mode the PTE is marked as _USR but __NX.

How about using "behaves" instead of marked? Or I could use "emulated"
if you prefer that.

So the above paragraph would be:

Vsyscall emulation has two modes of operation, specified by the
vsyscall={xonly, emulate} kernel command line option. The vsyscall page
behaves as execute-only in XONLY mode and as read-execute in EMULATE mode.


