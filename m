Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF4D28DA1;
	Mon, 23 Dec 2024 19:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734982386; cv=fail; b=rP1mKc37PdcgoPKgvGkq5575Njei3sa288zTWObGiYnnEJmoGSBHKagaacp5junSW6zpeOEiMb3UUJeg/zBZO/jukfpyfuJ6eNq4G1LzI5re7iJLQHWd2IYjHwMgtnHqnkBH6BpxAGxWrNHMnZTpIXVj/XR16QBumZz2yv7Bmts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734982386; c=relaxed/simple;
	bh=J1DaqpvSl1HXkSjQuY6vYkov7Lhl30ZkFKqkFhWV/Zs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tVhCZBxNgqbv3YBgU7snthHcbnsw4KvYvGwTKmtdfiIgX+Mlng5ME4qP6PSosctAb0AFq9ZaVXYxzoM4w17HDN1ZT3bJFQQ3w6V9tsj65zbIY32jo/Z4JFaajllm0bxmKcC1Mwreyui+Bx9MUuZTHXqkcqd6Qqv4WdWl+Rb0VgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGmlfYrS; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGmlfYrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734982384; x=1766518384;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J1DaqpvSl1HXkSjQuY6vYkov7Lhl30ZkFKqkFhWV/Zs=;
  b=NGmlfYrSSZvIVt/DI1F8LjiwtMtrA5TUZ7M19jSIT82K4IfBVMpUv6u6
   m3OkrZ1qhTPXZ8wJkWsZbf/Z88iSsX9S0dHTdp7lDiHsey104evPw+Yfv
   Y5U/NOZdurWKumxHrVrMyLMxMYrPqEzjc3c+R5DA/JRK+QGuztFYDHZSa
   o5bxScOCX1PCVSMlitEnwZnq3tiIwNob+9i1TGQTEUuK9PqTNnlBWdf8M
   2QYJ+K6iW+39Sd/a9s1wZBOO05E1crOSWLb9xCClsSxyxT5dK49aIxgtv
   OXfCiKAYvKqLa9psW5sm237Lv/mbNNqr/keKEifKp+wHEewGJOHDI0C9B
   w==;
X-CSE-ConnectionGUID: 1fHP4IsMTh2ybvrojU+fXQ==
X-CSE-MsgGUID: URsX8a+3R2CNKjUOlLgquw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="38295326"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="38295326"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 11:33:03 -0800
X-CSE-ConnectionGUID: 4/6+mNIKTdO371S1aAeq6Q==
X-CSE-MsgGUID: VgcgF2cDSbu+LgsLTMZT2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103901686"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Dec 2024 11:33:03 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 11:33:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 11:33:02 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 11:33:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erUDj157U6kW6heGaP8bRvV4cLzK98FVKn+tF/d+rVDbtWSu6eGK4V0mk6b+4T8QqYddkHtQZY90jnAIFcHYEUh+iz8hdarh2hHaRYNGLUD4DOOrrn+1b47wVrT+A4Pltk7c9utL17csgKAVNet1ay1zFxHvDVuL6n2W/+RedkM+YbNNGm9OGIIDCT645XmJnvmwAKVct58FxAp7KqmVK2j7NVN7fV7LbDNNlgcEEgxnGBAHk1CmSLA039VlcR+AzeUyJbcPidJM5t1oxF+GLju31DIpzYyYPZRfvfKLr8YX/94gWarfWG9mlc1FGqudKsZLMTffHvcNGnXFwN85MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCYlVOLWKyCL/7aN1HcTb7gywnUS2sAQ9JdiLyN8Dbo=;
 b=p61R3M+Q0qdMMjpRnl7jrsB0dVcSJxGboUaBPRY30M8bYLxLcdoKDOkstHicbmR5WkvksVOFQJ532JwybxCJ2xrIlXjLMrwTZL/LqHAuUe+rumIhmy39nxeAI3WCiLm51oj3EXjFv14K5V4/S4Rbr0JImu48abTOKXp2NvhV/s/WhlnphVdQQR8I1uRliYXyx6bnWqr/YyYNmBteHbigZrFkQLROmiMrg0spcyJaqVWe2UaiXkFJAGFg8JZwYZL5OZ3fAyULpMaF7SEvNL1jp3BVpsaIPjm9mXYE1+yQcFYwgeSplnkk+T9UQFvSfqpzgdgLaSaokz6BzZ+/N4V8NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 19:32:54 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 19:32:54 +0000
Message-ID: <dfc63874-9150-41de-959e-cb782257e580@intel.com>
Date: Mon, 23 Dec 2024 11:32:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] x86/resctrl: Add interface to enable/disable
 io_alloc feature
To: "Luck, Tony" <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "Yu, Fenghua" <fenghua.yu@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "paulmck@kernel.org" <paulmck@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>, "rostedt@goodmis.org"
	<rostedt@goodmis.org>, "xiongwei.song@windriver.com"
	<xiongwei.song@windriver.com>, "pawan.kumar.gupta@linux.intel.com"
	<pawan.kumar.gupta@linux.intel.com>, "jpoimboe@kernel.org"
	<jpoimboe@kernel.org>, "daniel.sneddon@linux.intel.com"
	<daniel.sneddon@linux.intel.com>, "thomas.lendacky@amd.com"
	<thomas.lendacky@amd.com>, "perry.yuan@amd.com" <perry.yuan@amd.com>,
	"sandipan.das@amd.com" <sandipan.das@amd.com>, "Huang, Kai"
	<kai.huang@intel.com>, "seanjc@google.com" <seanjc@google.com>, "Li, Xin3"
	<xin3.li@intel.com>, "ebiggers@google.com" <ebiggers@google.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"mario.limonciello@amd.com" <mario.limonciello@amd.com>,
	"tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>, "james.morse@arm.com"
	<james.morse@arm.com>, "peternewman@google.com" <peternewman@google.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Eranian,
 Stephane" <eranian@google.com>, "corbet@lwn.net" <corbet@lwn.net>
References: <cover.1734556832.git.babu.moger@amd.com>
 <467077e6fcf2ffeb9f20204671b6902b85974820.1734556832.git.babu.moger@amd.com>
 <SJ1PR11MB6083741B72BDBD509F9BD2D3FC052@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <SJ1PR11MB6083741B72BDBD509F9BD2D3FC052@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:303:dc::32) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|PH0PR11MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: 6babfcb4-00bf-4a0c-98c4-08dd2388989f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVlUdFplK09OOExWdklZUU5Fa3NBNjVpemFFeHpOR0FYdE1UYlpIbi9MZjB4?=
 =?utf-8?B?ZkNOWURzVGhtSFBvUUNicFYvTXBOanpreUNCYmpabVB5YXAxajJwdjJDZTM3?=
 =?utf-8?B?bVB6NFdOVXNzWFhBSTZBQk1WclVORWFzN09VVEpRSVliZGY5dEI3ZllDZzNn?=
 =?utf-8?B?enQ1Mm9NbFYrbTFFTHFDRVVhdGl5Z3lwRVQ3a052dXBNbVdlczlIWVdyRnkv?=
 =?utf-8?B?TzJ6VDFsQjdPM1N3UkYxbjM4L3JhYzg2YnhlZUxlSWQxdmw1dmVkeTVOdGRI?=
 =?utf-8?B?TWtXK2dQSVBVb2ZMS1BMN3BXNGFOY3FVcFVkK2swSlJBWXBiMG11ZXluWGU5?=
 =?utf-8?B?Z09jdkhyZnZGMFU4M2lyekEzbjIraHNQRmVKSEw3bDNQdURtdGttYkpUbnB1?=
 =?utf-8?B?V2NKd3IvTWJOeE5zZUVEM3ROU0pENFhjbms5dXRNeGZUL3c2OG1VZjFqTEtO?=
 =?utf-8?B?OUpwb1B4T1ZkTXZSSGQyNE8yZzVKR2ppOW1teXdsT0VEeVNOMk5saG1ZbTBW?=
 =?utf-8?B?VDRyK2NHNTBGd3dvZk1BYUkrdDIvL2lsSkVKWmVoQk9KK3EyTVRhTWdweU5C?=
 =?utf-8?B?TWhXMlJIaXRuSTVLY2ZKRXVzMXNsbjJDNVZNY25SWTBZcWVSSHgzYkFlSTRt?=
 =?utf-8?B?bUt4YkhzeURRYWdEdjZLL2ZGTURsb2cxS1krSFVmR3RNZERKTjMzWmdjTFpF?=
 =?utf-8?B?QkpWNWFNZURNVis4V29kdlRCc0ZxQTdxT2VPcDU1ZzM3WG82RHlWSjZ5Nk9t?=
 =?utf-8?B?c0ROanZZc2JiemJYNlNmZzI4YmRBM2RsT3dzTVZ3Qno3Z1loNWlGY2JWMlJF?=
 =?utf-8?B?d0duS1YwRzZjbDErUXVRRllENjNEQ3J4ODYwUTBHU2FoNmp2TEErQTc4RFRP?=
 =?utf-8?B?aWt6WTYyVnNSTTgyMkRCQ3BJU0JtVEZrVEZrMmxPME9iSkN6L2FqN0pCc1dv?=
 =?utf-8?B?WTlhQWZIcVBYSDBsZGc3bUNHQm84ZkhyNWNhNlkwSGFhcnJaNW9YNjcweTZj?=
 =?utf-8?B?cjNFQk1LTFFKeXdtUTQxK3Z5MHJYY3VTcGhHQUZQbzc0eFZqejFwT2xXM3BK?=
 =?utf-8?B?RjFvYTRUcGJ5alZ1alozeGVDUGdvdjlORGFMR2ZCSkNOa2hUaTl3M1FZV2Na?=
 =?utf-8?B?SEhURVhRc082dVVteVEvb2JIMjVGaEtNa1BWY0hvWDlmOHF5SVhKOUtaNkZq?=
 =?utf-8?B?aU1pcXRYU2RGNGR3TEh0dUp3dXgxMFlRQ0lmV2tBYnpGbTNCc1FUNlNDMnBt?=
 =?utf-8?B?QUtXU3k5NWM0TjdZYzN2YS9QWkNTdW9QNVFDdFJXRmpSbUFsYXR4WnZGdGFB?=
 =?utf-8?B?TXFxWEJ1S09aeEExWk9jWlRuS1NLU25YRkhTY1krWDA2Ny9rUHFaZ1p3a3hh?=
 =?utf-8?B?WkNyTW0rK25aeDQ2eXhvdk1OTUp1TUZTbzBVSHlSRGZHVmJmUitHZzBHSnJJ?=
 =?utf-8?B?RGZoT25qZWVzVStoTHJvblA2Yk85Y2tDL1dFeDZ0cS9QRmN4ZVlESGFhQzlU?=
 =?utf-8?B?Rytrdk9JL1BkRksvMzZpbWcwSitmT1BhODIvUzVSVGJFc2F3OEhSTVlCNENQ?=
 =?utf-8?B?dlZaRVFVWVg3c0dYaHVha2NMQjdnMWFpaFJwb0twMlNTZ0ZTaUFpUWJZQk8w?=
 =?utf-8?B?KzVJenQvK1I4SHcvOXpxUVpYejMzWExxSVBIZWZoU01kOVdVUGl3ODJPMmRt?=
 =?utf-8?B?T213M1FCTzVxd1A4d1pjRkcxeEN1ZkdUTW5zOTh2VUpOYms2dmx1cklUVXV5?=
 =?utf-8?B?OGxyRmozbjlheE5nZm5relE0UXROUVA2cnlnRExkNFhlVlMvUGk2RUMyR0Ru?=
 =?utf-8?B?SVd2OSt5WkdHRGxDZHlTRnNYem1YaGRnWXA1bm1YUU5CRnIzdkNDYXpyS0ZV?=
 =?utf-8?Q?HuSCY6OPnPOqe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RklKZ2ltd3ZIMkZHKzJpbWlMSzQ1TnArWXdPNWZ5R3RYdDBycnF4UTNBQldK?=
 =?utf-8?B?MFEwU3JaUjBkUWN0T2c0cDRsdFduYXVhSTR4QzVVcHFqVVpGd3hsMkpzQjRC?=
 =?utf-8?B?c0NHS2UvTjJLV3RHb1BzTGs3MHlGT1RPaWdOMkFhUDhRa0RkbXRWYkRlV09D?=
 =?utf-8?B?Q1NkYXYzb294aDZZVkFtZDNFODFvRFZGVFNKaFFsMGorditxSmxCQ2IrUFdY?=
 =?utf-8?B?c0kyZ05jTHhSRHlRM1Q0Y0JTYktPRGI2R08zSnlITTNscnhsZFhSVWVMYVlF?=
 =?utf-8?B?NnlBbS9yajNNaUxidnpBOFpQQXJiVmRhMFJlY3hsWEVRc1FZbnE0dE1MMlB1?=
 =?utf-8?B?aW16aHBFU0EzZkNMT0RuUEo3VGlWYUM0U3BWVzRjYjh1QkZGZ0oxRzFLWVhU?=
 =?utf-8?B?amR0STNzZm9JYTFWYXZuQVp3SnZsd1lWOXVSVHhqbTJEWklhV3FGQ05qS3Z4?=
 =?utf-8?B?N0pkQTRJVytYbElSdkx0a2dTS294dkhhQjZSZ3F2RG5KdXpFWW1PLzRLdkZK?=
 =?utf-8?B?VHhRQ1ZGU1lzcFc2Wm5nV0h0Y0pnejZla1NCb1JyMXI2aWRzaHJlUGt2VDhi?=
 =?utf-8?B?WE9SeUpTUTd2NmhXY0pwdXAwcGJEVDRpS0RTaHIzVHlGR2hORGZwdDFhTURw?=
 =?utf-8?B?U0tJODY0UXBCdlRZN0ZGRDJhWm03WEFJQ3VIUCtha0JaaVl4UHEzT0VCYnBm?=
 =?utf-8?B?eHVrMnc2eUIzZzZwZmdsdXBsNHRqekE4RlpuaHU0ZldPZVhEbVg1MGdGRzN3?=
 =?utf-8?B?ZGZHNEdOeFc5TkhIQm14bjlTZktVK2dUWmN4M0NhaWxBWXlMUGRDTDBZdkhI?=
 =?utf-8?B?SEhIT0RqM083amF5ZTBUS1MraitYaDJVZWRlS3pZMVB3L1A5MFRZUGVXQ2xE?=
 =?utf-8?B?ZWd2dWN6WnZKQ1lsU1lGRUhKQ0pOWnRhV1Z6b0dLUWppenRtVnJwZEExVzNB?=
 =?utf-8?B?YmpLK2Mzb3VuRmZyY2ZHVVV3TkxRWXZQM0p3N1ZBWnZpcmZKaXJCTmphWWd1?=
 =?utf-8?B?YmQvTnhJT1lwSllHTFVTcDMzMmNLSEErVzg1UklOaDVFWG90MmcycTJ2V1Mv?=
 =?utf-8?B?b0k1eWRMQ3NFVUY1bHdHc3BCME43K1diekhORkp5NzYyRU5mRWRlcXVuTU8w?=
 =?utf-8?B?OG9ReEpyMnZyc2FZanArRHNua1U0UnppenY4UHVxY0wwc2Q0NDNJZkp3SllC?=
 =?utf-8?B?QWVpeC96MVIzV2NUZmwyZTFFNmlnd1VvYlNoekxaTHhRdmh0bkUyakd0OTd4?=
 =?utf-8?B?TnFWa29GL1Z4ZStxYktpd3F2VHdNUnk1NjVxQ05Gb3Z6R201bDB3UEdKNDJr?=
 =?utf-8?B?SlBoSDU3RlZzRFh0K0ovYVlhd0RsNUhHZXAzSG51ZTc4NS84MExXOENPR0xm?=
 =?utf-8?B?MStEN1RTU3R5a0J2TEZlenRnaE5HejY2TERmekVGU2F1VXIvOUg5Q1hVZlNs?=
 =?utf-8?B?TkVnRHhYbHRrYUxyNjdaZWkvcW5hMWs1Rkl3bldOMzBtaEpoRXMwUlp3eEdK?=
 =?utf-8?B?ZnRIcW02eDJMTG13bGpvdzdQTEMyeExuVDVldFZaVDJlS1JaUUJyYTR4cjhT?=
 =?utf-8?B?MlhubHhyaTR1R0RBY3MxdjRQV2lIR1JiU1haZ1lJRng3d1E0VnlWR1JsWkc1?=
 =?utf-8?B?SXNPZXRBT0s1SmIrYmNnVGhHVTZ4YUI2VzQ1ekV1R1VIZGFPSlMrQ1BLdDVL?=
 =?utf-8?B?MTZHOVBEdkF0WnR5NFo2THB2bUFheWhOSWpoZ2hCQmFiSGxGVlhPOXhGL3E0?=
 =?utf-8?B?bGxsOTFDUys0bGFqT1Exb1VUUWQ5eEN2c3Y2Zi9ZRy9lVUNCRURzSTFnWTNh?=
 =?utf-8?B?b2I0YUEwZHhhNjhnb3VyMTFKTytVWHMxQ1R2eTFYVC9QS0RTdFJ2bGxoekZY?=
 =?utf-8?B?RmV3eHdXSTZoY2NIejNjcjdWUk5zTWY1YytlTzgrc2QrL1Y0U1lIMTl1UGJF?=
 =?utf-8?B?UnpkQ3RyMDBZaEZkU0xaQjZIZGkwNm1JMmNXVGlrOFRNd0dic1YwRzBkNkFx?=
 =?utf-8?B?UXZDRkVlQnlSTXVNazZlNWptOCs1dVNCRVE0azBkdDh2SVY4VUovWm9iQnRu?=
 =?utf-8?B?WXhmTVduYkppam1rdTBRVTVlbjZzbm5PSk5wV2ovNm5zNjRwUmNDdHdSZnBB?=
 =?utf-8?B?L1BrTFZtSWVuZkV2VlpNdlRMYlBFc3g3SXZZSnVkL3E4M0VqcW13YjJoeWVT?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6babfcb4-00bf-4a0c-98c4-08dd2388989f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 19:32:54.0976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ka2PaFfKzr0KWQCSCtCOxuwDwRMfnJOqGQnNtQX07ORzVZ3eB+BmIpeTfIXcmO9WiwxwgX+w0zsBmF2e0kYB+JtSCvcmbGfWGyflWiRjiQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5832
X-OriginatorOrg: intel.com

Hi Tony,

On 12/18/24 3:34 PM, Luck, Tony wrote:
>> static void rdt_get_sdciae_alloc_cfg(struct rdt_resource *r)
>>  {
>>       r->cache.io_alloc_capable = true;
>> +     resctrl_file_fflags_init("io_alloc",
>> +                              RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
>>  }
> 
> I think those fflags will make this file appear in all info cache directories
> (L2 and L3).
> 
> Presumably you only want this file (and "io_alloc_cbm" added by next
> patch) in the L3 directory.

Could you please elaborate why this file should only be in L3 directory? I do not see
the problem with having it in L2. "io_alloc" communicates to user space if this I/O alloc
feature is supported and does so with its content as opposed to its existence. For L2
it will indicate that the feature is not supported.

Reinette
