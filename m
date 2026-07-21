Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990923B6C06;
	Tue, 21 Jul 2026 20:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667288; cv=fail; b=b6Aqi2vshLG1WA5HSp+5uSdrUuP+1/YAkZx10GHRv6WeRMbazwbUZRwMd7v9+yBMolbgZ7B77m479GQxWk6+71102UnK5St1QjxPL5I+gfXuiI0TCrUGq5Zgn8apAxp/czbbn6EFFEPzy7/YyBMfffybOxPrugcQ3WW2tqweI7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667288; c=relaxed/simple;
	bh=RSGZqT+Pf/y2zaOnJn42HQET9WtE+Ak3SRjQqDXpFhU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mxSZgY93dJQQ9uT3vUQne59i8skD5FrSZ9+4GOWgwg8apO9gODqr6xJT4gapVxj+1LjYPhvl5Of4SIftkzHdl9pqERo6N9bz8yg0OkzeK5iyogZtVH4lgDoNeFiFN1WEC5Rujzw8K/cnCeZdI0Avjrq8Lu+Q5G88Tkp0YpERXAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m3Ur3Osn; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m3Ur3Osn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784667287; x=1816203287;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RSGZqT+Pf/y2zaOnJn42HQET9WtE+Ak3SRjQqDXpFhU=;
  b=m3Ur3OsnQEpplZs38CF0gwK+EGQgQp4I8I/OgFp7uCyv8dkCshmNY1eg
   7H4AuQjFnxEQkuC0gY747gXiD+b2m6rrdsSowKJ4XkDT7/VUGoEvOkp3C
   l9wbbS1KTA2PWIh5C0XegkWxKBX7MJ6aOqWpEKyo0mMUVgxaW6yjd7/Wu
   y4F08+HS4IsD7ZXrbLsJnSSuxRRY0Kiltd1bwbFVIdeqI5aR1O5BireDo
   zkkvlr5YA6PFmdKf7ZV+m6aeEe6DTPRdDn2yAaU7p32VX3s/LDFx6z3fW
   Zv95u2vkqfsq/rpwOq56Z6cNlQNLh9re4rqBG1AfZuFQ7ePdQLx34mVX3
   Q==;
X-CSE-ConnectionGUID: 9vUmdnBbQqi+Sq5Gmb0o6w==
X-CSE-MsgGUID: 9oKFwl+DQuOlIiet4K183Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95938293"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="95938293"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 13:54:46 -0700
X-CSE-ConnectionGUID: dqODVnx8RSC4TgkLsaLclg==
X-CSE-MsgGUID: BM3igsCMR1aGepNmF08G3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="251555059"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 13:54:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 13:54:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 13:54:44 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 13:54:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EolcwsSv+V6Mby2BhsMyxjdSP6sHDmnU/3buXt9+2JsN82GIipYpvZa/8qDXpKLAu0KFwav+WSlraqSEsi14Nop7x4QhHatUt8bgBjCBt7FPyINrXyHvmY4naZWsZt6AB9Dj0ryzBohQ+qVEVWYdLSTwQY/xFk5CLV4X0mXfEx2irvhbdkPZJ128M5niFSVrI5XTPQy9HOaO/yrGa7do7ecSyRmV1bh8qWNjLB1SAuC/suSbqarmKNSkDWDPERqZ7V88AQamYk2fFGN3xJ6/RTbPCKRrKFQzldE8OSpeKLxMqNJlJaVZIafaDsbIGLI0gFErKCYPQninRx1aNgRSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4vuGCbg+Dny3JX012EHqItqwOJekzfC24DvJw69cLE=;
 b=ugv7P5HBDhIVHlZuARiWE0hwMSncEfWsq4edj0S8YykQyO13UodlsW1xB5tydFJkJpvG2LAG01q8+U0T0GTHC1Un6/dNmFAaW0BA/nRFf/PEtcwuLmZ2ZKFJ2wJ7KnyaPqzGUTG5gnyqPkF3i+f4M1H05/t5WBSzOz/siUkyn37tJAkPwjkaw/diU8Gj9NoFxKBHHvK+bMzOcAHLLIwG5IOvyyy0haektDL+N4M1wQrin5vu4Y8FoDwS99CvFD0hVDK+gnYlt7HWfr2x/v9IC8RbEKGHW7j/0FWmpdsvrQvZ51RuoFjmL001PevWFRjFw5ZNBKI4M0rkhWWQ/5Cmlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SN7PR11MB7417.namprd11.prod.outlook.com (2603:10b6:806:345::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 20:54:39 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 20:54:39 +0000
Message-ID: <dbbe2eac-bb0a-4655-9d0e-6e8feb702717@intel.com>
Date: Tue, 21 Jul 2026 13:54:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>, <bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
 <d337915a-ef4c-43b2-a915-e97381b7dca0@intel.com>
 <b0dc49dc-ac35-457b-90c6-842a3cfcf8e1@amd.com>
 <f3fd774d-0662-4094-90b6-f0c5a4bc5d26@intel.com>
 <78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0237.namprd04.prod.outlook.com
 (2603:10b6:303:87::32) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SN7PR11MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aa8b039-f263-4f0b-0209-08dee76a47a0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|6133799003|5023799004|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: PVv2eXgIMus+jDtay6LLhCLmXvh66wscvREwrBq40KFW3qOYtGf8GwJSeiyYhWseca9WgVCurpIaFyxzlO4JAc49sOLS+siwwBm3QHTP6VCJIducf5mo7KcpGsHC/U42UQPJXaDtPVH4OznXPSrsMKzg853tmFLJLo/Jl1PNhyrE6TpXsbhQEcHRKbvpZX4yv6zohVCfEXwSc/ZhVjbimPlX+XYacAFtcY45bTj3FNUSCFJsccyC54GnXIIzIaaSBSSL2eDdbNfW3U9svC0rJxv5ozkGTlvtASS+qAau+YAYbw8mWCUv/m0zCmYi9xOgJrIe2ORxRWFg/gkQg0v8bkqVpRgbxfxmzk9QjrDxpMIIS821QdCGQ4433XnGSVecvuy5ugZG9aBZVIeSrEI6EcYMVPRuokYTqjDvUntVzcBGPdysZ1uSGrPS4/YaIfqjxm34NjjwSVCHflpbpeGzibplHqDRk5oT/cPRYhxTj20uwkAIkfNiVHktnvTSbnPPP36DREpwzOAJwvHkWsmKeiI4E4AFpYcKAbDJzgVl4QsoGV5LEpdlptGtm0sWN+XmHaSsG5m5TZDQ2GbXJLoH4knjF2tuqmq/TUDcUovo3IGd8djHHSXJ+A82QXM3Z629lL9nu9ZU7yLq0bErdXs6ik6eEYsev9xAY17wfkl+hL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(6133799003)(5023799004)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnZBVUtmek94M0NtQXoxMHJRbFRVSnlZeHZ4SDlQaXdGS0xSSVBkNWJsNFZB?=
 =?utf-8?B?dFArUGllZFA5b0ZpUVo0S3FHNFFJK1VTZGptQUl0NVFNVC9PQmN1cm9TZEYr?=
 =?utf-8?B?VVZJMXd6S2tuU2NWRE5wU3ZuSExwRnNsaUFBc3BWT0I0VGREMHZCcklZQit4?=
 =?utf-8?B?SUhIbHZxSTBBNXIyVkxVbzRGQnh4WTNoZ2hkZjZFbGRmOGtMampJV1A2TFJm?=
 =?utf-8?B?bnI1MUhzVmJYMVhUZ0dWS1prcjZSUEdSdFYyZnQvT0hYU1VVanBVekdMZHhl?=
 =?utf-8?B?cmhJSUpEYnNDV2JYSURBdVVVbTczRFRuVVZSZUxTYXRuWkI2cGpCTEc1c1Fo?=
 =?utf-8?B?a2xNdHA0MWNKcTRCVlUyeHJwNHY2d2FxVFdwRFpad2RNdnhjMHc2elhlc3VL?=
 =?utf-8?B?RmhEM0g1WElrL1YvTFREU2hOTXB1MTZBSzR6L0NsdUFScjVEZVJzbXU5SjN2?=
 =?utf-8?B?T0NFUTl2Rk4ya3BaalcvTU1yLzM3M2cvdlhpRnduM1I4VjRNMGU4WGFWMG9X?=
 =?utf-8?B?VWo4UEcxS0xsb3RuQkxBbERuWGszeDFKb214TEcwbk1qUGtoUHc0NkpyOWxS?=
 =?utf-8?B?Wnlvdm12ZVRQRGdvUnZVbEdUU0VvSUVlbU9aRk85Vkh1RTZOWjY2eXIyaHBH?=
 =?utf-8?B?aUpvend2ZkVVUWdpWUxzREQxRm1YZDJnU1pweElGWnVCTVdYU2YwTjkvSXlR?=
 =?utf-8?B?cjBXN1dLRmJuZlV6MXIyejFHY0JuY2lYQVhBNVhWVzNseGhCTWF3Q1RkKzJz?=
 =?utf-8?B?c0tFSVZTZkx2bXhDZGVWZjJXOXp2dWJRNEdCRFBLVmt6Y3J1Q0p6SURrTk9h?=
 =?utf-8?B?elJHUXZhZk1SSE9Ialk3YUZ1K0ZWZlhOOXRad0Q0aGlGYTBWM0FiMHBROXYy?=
 =?utf-8?B?L2l6cTQxS3U5STUzMmxNT3lNTmZVVVR2ZWZENlNDcE0weThkd2dtczh0aVJn?=
 =?utf-8?B?V21BNEFhNm1qZ0RxT1czRVdiLzI0ZlU5bWQxbkNua2owMEtoYjI4akkyY2VQ?=
 =?utf-8?B?RktTclhtUHl0bjd0NWQySm9yNjVvQjhkVkRsOE1UYnFQZUFVMzcyYjNkTk9r?=
 =?utf-8?B?K1ZTL2FZVmh1NGd6eWZTTi9INUJSSHBqVG1WZ0w5UHc3c1pidUVMMWI1YUQ3?=
 =?utf-8?B?eFZUcWJQV3Q0M29GTGZyeVBMMElDUW91RUNsYnFvYThlVEtCaUVNYWRCSWFw?=
 =?utf-8?B?dHR4Q09jQTRWT09nSlhRZHUxejFuT3ZrME9neW16YksvcHQ3bHhrSlVzZDN6?=
 =?utf-8?B?NmM0azN5Q3d2QWM5Nlp0UENVWDgzWFdwMER4U3BRZUovbVBzOUoxcno0QzQy?=
 =?utf-8?B?ajRtb3VVQ1hFenlsTXJFMFJhZ3E5VDF4SzNCdVM1K3N5R0diWmNmc1l0NmZk?=
 =?utf-8?B?UVFtK0llcWVMNkJvM1hza0JxRHFtODZsSThkNDFIUS9jZkhDSVJnaUFVam9V?=
 =?utf-8?B?VlF5RmFWQ0V5emdzMVRnQUVraFAzUXVndUVuWkZuTlhKbEZtWFJBalorV1pp?=
 =?utf-8?B?ZGU0UWliM3Y5Q0N3VWtJWkhkWFcvRGRsWlJQWFMxSy9xZkJKY3NMWmd4bjRM?=
 =?utf-8?B?QlhwTFUrUlpkVjRyQy9LZVI2VFRwZm5ERHI3N1A0cmduWFNIY3hRLzVZWmhy?=
 =?utf-8?B?ZnpzTmd6bnpxOHNMSExBdmhUTGQ5ZVNHUVhZZ01uL1c0Z2hMSkVxZWtsamh3?=
 =?utf-8?B?T2Y4ZlBObEljekZwTUFFcVlsYUxRL05vbXlDaXFYbzNJUmV1Qy91UFA3Y1lx?=
 =?utf-8?B?T1R3UkRyUGRTVDkxN0I4bEs0WU0xQnBHdHlpRlBycVEvYlRUTTFNTmNmRGtq?=
 =?utf-8?B?am9CRTJlOTJFUUpheFJBa0hablNJdjYvYm1QS3NLY2NQQmVMOFFCOEdudG9n?=
 =?utf-8?B?S25hNFdaRC9obTk4MW9lS2VaN1FFcG0yeUpFM1U2T3ZsaFVjZWFnbEcwSkVR?=
 =?utf-8?B?Rlo4UU9vb3ZNOWljOGNOSjlwZ3BzSEx2dmYxQkZHS2JRaHpZbE9pK0JUUlBh?=
 =?utf-8?B?SjBQM3ozQ2w4aXN1dzN2UDU2TFpKcFV4UHBsdlZGYlJDWXlTSkY1ZCszLzJp?=
 =?utf-8?B?dlU4V0lGUHJjaTI3eW9NZnZmaHJxb09abWVGTjJ6RnVWekFnY01zOEJZMUov?=
 =?utf-8?B?R3E1YkZvUUVSYWp5NGc2elltRzM0YkRzWEtCODMreVV6QUU0TnV3VGtsN3lx?=
 =?utf-8?B?YmtnNFptS1ZrU2hZVWFaVU85SndEd2ZSZGRtanI0aHRlN05tT2lJRzZLMVZh?=
 =?utf-8?B?REdQblhua3R6V0V1WDh1MEtDbjRUWHkwU1VGSlRIYTc3eXFuZ0JkRHRWZzBu?=
 =?utf-8?B?eVo1emhETW95YWNOOWE1U09Xd25jZWl0Qnd0YTZ3MkYvVXVSYUZRcmlqUEsz?=
 =?utf-8?Q?cJlPkOq5MzUBzrEI=3D?=
X-Exchange-RoutingPolicyChecked: K2JMoEXQdW0YfBC9Y+mmBR3nh5rJZJKBpj4hMmths+F8TKUly6epfGqCeEFjHAJydbaX2W/oaWraZELHuwToqRZbVuuH2N+b94bk+SucOgTU9n68w3cYF8uevMm3/jF6+777PIcZq89nkMuLZT/HItXbM8VtdyZRIsFlZ/dKcSSnl6RcXH6gWSXoP4qzxhiXMC4l5msE6cnL73qfVh27bircFTSdwMgMRqcFbUR1uH+1BzZYqiIln3hCkfQXYe0G8w3LPMg7SXTo9cOMYmpzQsj+CF/ZhgxaCkaYRcICAQPjUyUQ/LTvGjdtDmC17uciIQNm25HRmvfJyXf5mVDqhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa8b039-f263-4f0b-0209-08dee76a47a0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 20:54:38.8753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozwxj77XsWPSgws7KH/HYWS7DL1JjSdUPfxQiqSJ8i1e0rn1FvEeJES7t17TDKRCYt5m8XSplwOxFuO4HrtUhMZPpeuDNtdof3onJTDF3k4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7417
X-OriginatorOrg: intel.com

Hi Babu,

On 7/20/26 12:15 PM, Babu Moger wrote:
> On 7/20/26 13:27, Reinette Chatre wrote:
>> On 7/20/26 10:00 AM, Babu Moger wrote:
>>> On 7/17/26 17:56, Reinette Chatre wrote:
>>>> On 7/17/26 2:13 PM, Babu Moger wrote:
>>>>> The kernel currently enables the ABMC-based "mbm_event" mode by default on
>>>>> hardware that supports it. However, this can cause bandwidth monitoring
>>>>> failures with existing userspace tools such as pqos.
>>>>>
>>>>> The pqos tool mounts the resctrl filesystem and creates 16 or more resctrl
>>>>> groups by default. On systems with 32 or fewer ABMC counters, this default
>>>>> configuration can consume all available counters, since each group requires
>>>>> one counter for local MBM and another for total MBM. If additional
>>>>> monitoring groups are created, counter resources are exhausted and pqos
>>>>> tool reports memory bandwidth counters as zero for those groups.
>>>>
>>>> It is not obvious to me that this is a problem. If I understand correctly
>>>> there are two scenarios possible with this pqos behavior:
>>>>
>>>> - ABMC is not in use ("mbm_assign_mode" is set to "default")
>>>>     - pqos can create 16 or more monitor groups
>>>>     - hardware still supports a limited number of counters with consequence that
>>>>       underlying counters reset at any time as the different monitoring groups
>>>>       need to be tracked.
>>>>     - pqos can read monitoring data of all 16 monitor groups, sometimes reading the
>>>>       events would return "Unavailable", sometimes reading the events return data.
>>>>     - *None* of the monitoring numbers returned are guaranteed to be accurate.
>>>>
>>>> - ABMC is in use ("mbm_assign_mode" is set to "mbm_event"):
>>>>     - pqos can create 16 or more monitor groups
>>>>     - only a subset of monitoring groups have counters assigned and these counters
>>>>       are guaranteed to only track the monitor groups/events they are assigned to
>>>>     - pqos can read monitoring data of all 16 monitor groups with two possibilities:
>>>>       - monitor group/event has counter assigned: monitoring numbers are guaranteed to be accurate
>>>>       - monitor group/event does not have counter assigned: monitoring numbers return 0
>>>>
>>>> If my understanding is correct then the preference is to rather have wrong data than
>>>> see 0? This does not sound right. What am I missing?
>>>
>>>
>>> This hardware can monitor up to 64 RMIDs without any counter resets.
>>
>> How many RMIDs does the hardware claim to support via CPUID that ends up being shown to user
>> space via "num_rmids"?
> 
> #cat /sys/fs/resctrl/info/L3_MON/num_rmids
> 4096
> 
>>
>> I understood from original ABMC enabling that the underlying hardware counters of "default"
>> and "mbm_event" mode on AMD are the same. That is, in "default" mode the hardware does a
>> "best effort" assignment of hardware counters to events while "mbm_event" mode lets the user
>> control the assignment. It instead sounds like this is not the case and there are actually
>> two distinct underlying hardware counter mechanisms?
> 
> That is correct. They are two different counters.
> 
>>
>>
>>> As you know, the pqos tool creates COS1 through COS15 regardless of
>>> the command-line options used, resulting in a total of 16 groups
>>> including the default group. With ABMC enabled, this consumes all
>>> available ABMC counters(32 counters, 2 counters for each group).
>>
>>>
>>> When pqos is invoked with the -m option, it creates additional monitoring groups. For example:
>>>
>>> pqos -m all:0     -> creates 1 monitoring group
>>> pqos -m all:0,1   -> creates 2 monitoring groups
>>>
>>>
>>> Since all ABMC counters have already been allocated to the default
>>> set of groups, no counters remain for these additional monitoring
>>> groups. As a result, the monitoring commands report zero values,
>>> effectively making monitoring unusable.
>>>
>>> In contrast, the default monitoring mode can still support up to 48
>>> additional monitoring groups (64 total RMIDs minus the 16 default
>>> groups created by pqos).
>>>
>>> For this reason, I still believe keeping the default monitoring mode as the default is the better option.
>>
>> It is not clear to me where the "64" number comes from. Even if resctrl sets the "default"
> 
> The count of 64 is known from internal information. It can also be determined by allocating monitoring counters in a loop until the hardware starts returning an "unavailable" response, which occurs after all 64 counters have been assigned. This information is not documented.
> 
>> mode as default, what will happen to the scenario you describe and 49, instead of 48,
>> additional groups are created? From what I understand the moment the 65th group is created user will
>> transition from "accurate per monitor group monitoring data for all 64 monitoring groups" to "inaccurate
>> per monitor group monitoring data for all 65 monitoring groups" with no indication that this is happening?
> 
> Yes. That is correct.
> 
>>
>> I believe AMD supports more than 64 RMIDs and in this case there seems to be three ranges:
>> [supported by ABMC, depends on events but lets say RMID 0 to 16] < [RMID 17 to 64] < [RMID 65 to total number of RMIDs supported]
>>
>> Current default "mbm_event" mode uses ABMC so as you state this always results in:
>> - accurate counts for 16 monitor groups
>> - zero for all other monitor groups up to total number of RMIDs supported
> 
> That is correct. With ABMC, there are 32 available counters, allowing up to 32 monitoring events to be tracked simultaneously. Since each monitoring group requires two counters—one for local MBM and one for total MBM—the system can support only 16 monitoring groups at a time.
> 
>>
>> As I see it switching to the "default" mode would result in:
>> Scenario 1, 64 or fewer monitor groups are created:
>> - accurate counts for all monitor groups
>> Scenario 2, 65 or more monitor groups are created:
>> - inaccurate counts for all monitor groups
> 
> That is true.
> 
>>
>> I do not believe there is any way for user space to know when or if system switches from "scenario 1" to
>> "scenario 2" on these systems and this unpredictable behavior that results in wrong data does not
>> sound ideal to me.
>  I agree, it's not an ideal situation, but that's how it has always worked. At the moment, I'm not sure about a better alternative.
I see the current behavior (return accurate data when available and zero when no
accurate data available) as the "better alternative". Intentionally returning wrong
data when it can be avoided does not sound right to me.

The changelog states:
	The kernel currently enables the ABMC-based "mbm_event" mode by default on
	hardware that supports it. However, this can cause bandwidth monitoring
	failures with existing userspace tools such as pqos.

Could another view be that mbm_event mode is the *only* reliable accurate bandwidth
monitoring and any other mode (AMD hardware not supporting assignable counters or 
AMD hardware with assignable counters choosing to use "default" mode) can cause
bandwidth monitoring failures (with existing userspace tools such as pqos)?

Reinette


