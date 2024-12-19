Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3681CCB21;
	Thu, 19 Dec 2024 23:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734651571; cv=fail; b=AP3OBtsjUjnS4ea70qVmS1Xskgo0z1yz1uMaoaDH8SKmZZ/WMM8teh1bR0a2/bSEZVwkFk9IeKMiPawCsyRaDi3rVRVVGVRKxWkaoVYruFV5bli/HV3qKy11/8H7i5Fj23N/Fch4QE+QjTNJPyC4dfpZR/917zC7EQNGipuf2kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734651571; c=relaxed/simple;
	bh=S3C7C25/4WNioasbiIkC3w1C65tLF5hTcTuXwDTlcD0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dQv5VVonpC3X9ZE42QMPSCMm5Rsbejs6x3TA268DL6ogHtUTcI4R3hNu4R0gLW7voOmSrWhqYja4kz/1bI7TSOgAPmVjrr2LxTTY/Xnw7ZJIEiJFe8GieC5eEDacvDhYIIXT1s6edWgLBOFP4YbAXIuEid5tAEPqiQDFyteHOMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKb4RAPl; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKb4RAPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734651569; x=1766187569;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S3C7C25/4WNioasbiIkC3w1C65tLF5hTcTuXwDTlcD0=;
  b=kKb4RAPlIQBmHu65g0RzmuH9vruVyhkRjql8SiULzpz4Ke/NDMu77hlm
   Vp0ZxqxPVH/NHMT/YJFFUd3GbhCLaN/Gptl66K5+PZBsUjHGJEfUrXQGp
   6N8Zh/FO3cO8jL5VCRLGPrYr8egf3ypeLwww39XL0uEboMBCubQmoESWL
   zOBkwEkppYR5hQa1JgVgzUC8qHSxS8E0umH6dY4DwAc6vRGuPmQk78Law
   bYKiMj7gvIChQTnSNqwZSMCg01GtWABOKOT8gqQqp7n423evgMjrOMsXx
   saYzNc8lDxndcnl1RiX8wFXM28ZmZRQvXpAoA3AcR9ggdHWSIMncsoXNv
   g==;
X-CSE-ConnectionGUID: ivsZL2gnS3+DDAn1+FNalQ==
X-CSE-MsgGUID: EP+4tDSbTmCR3FDaPYpCow==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="22783930"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="22783930"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 15:39:27 -0800
X-CSE-ConnectionGUID: dKSwfzneTtOhf5PaI3LrPQ==
X-CSE-MsgGUID: 7tw6JgIwRK6XB0lBIjUWtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135670318"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 15:39:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 15:39:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 15:39:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 15:39:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IggJQsVq1vsB3tfUh4fg7+tZzAGM7fPLLSKigsdDpBkSATKeD6SyYG5kpFJkwmK2WAvJ3TesSsntCHwYCW5YG/OVYZw1RzqGejzaBMdft6rGZXJaUtMYURtITMY3j2ehPWf0mRyZqLqI6GedWRaD4CdRtKNX7BegnZ2sXhNeWHTAleb1W8fbzLZ5x3ZLq5ShXpNgz9dFhst5yBUbSfxjGWPAkTzBbVeMxDbtofhRBRGwzXZ4uEO4LTPyOQTWM9xgFvz8VO+Ub9TsOh3mTnmD9pbrj5Wf5xo6ykW5xYfbCIIu5me58DocOWNdSW6Wha2FLf+4L2Mu88oPyMjXizZj7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNch71mBMeBNG44ZE8a0Gsm9vaPtZGudkOCzc+dn+H4=;
 b=AAK2kSQzW51oCY1uN/btfNSedbdhrfqhL3oG4V0ymH2Oe+nFh0QjXuyGhBseylNBBp9PugpttkbI+2sHmHl/L+a+NtCVAgoXmUiqHdmV17d2LbqOGtF3QV4fLFtGTiwAGpKxi/6DPkG8LWCTiSZ9ik4ffRfhvLDbAwBgC4zRT6gInpYycNoScLoCCxyjGbRbUjfM0+Es16rV5S9jkk3UkS7jFRDRH0TBkS7MYUKBf/5OFW7PY2agjtOSEAdNYxEaxhGjdJ7VasFfPgKGRc0EIkB0QI62sviH83ObvxdVfb7Cm4CijuxCWxbPwFQ0R6aoyQtUFbKLoyTtoFC41qWMhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ0PR11MB6575.namprd11.prod.outlook.com (2603:10b6:a03:477::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 23:39:23 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 23:39:23 +0000
Message-ID: <6bc0816c-d926-45de-ba97-459fb0fca9ff@intel.com>
Date: Thu, 19 Dec 2024 15:39:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 18/24] x86/resctrl: Auto assign/unassign counters when
 mbm_cntr_assign is enabled
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
 <35e1b0915fe08bb0ef093e23ca3d520fc6aa32ab.1734034524.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <35e1b0915fe08bb0ef093e23ca3d520fc6aa32ab.1734034524.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:303:b5::24) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ0PR11MB6575:EE_
X-MS-Office365-Filtering-Correlation-Id: 00070bb8-7aac-415a-d70c-08dd20865dee
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFg5VnBZUHowN0QxdGVuTk9LUWVGRy9aNDNhL0thbGUxRElNK2FHNWVOVC9S?=
 =?utf-8?B?ZUYvYjE5NkppRU16dVQrMHdURDZIYWhhOXZHa1hiUFJZNXkrd1UwT2Fvb21P?=
 =?utf-8?B?Q0xFUjJ1WUJvRml6UWY2cVV6cUFURm5PdnlUS08zQmZDRGtQMkFGVkpqbjhR?=
 =?utf-8?B?Y3NJbnBIbHdrYnNDL0NmT3F0VlNBN0VSR1dHV2ozU1J5d3dtVWtCZDMxY0dh?=
 =?utf-8?B?WmJSN09kYURTVE9DdWV1U21Fa1cyNGJGZWZTTVRnTFczQnBVY3hjTXFKTE82?=
 =?utf-8?B?cCtQVWZKMDgweGRvQzZiQlBka2RVUFNnY0plNTcxZ3M5cTZEREN3RmlhVWll?=
 =?utf-8?B?eUNzS0JNRDZrSTlUY1hON3VhMitlVHBxT0g3aExMeE9FcUlmSDI1UUpZalRJ?=
 =?utf-8?B?VEk4a0U0cXpseDZLVnlicjdxUmlQM2syT1ByeDZ1aVkvRklIT3RoVHBPc3RJ?=
 =?utf-8?B?OUI4S253cWdZUS9uLzlLTnlTTlZpSm5YdjhYOUV5RThxemJ2TmxBZHA4c25x?=
 =?utf-8?B?YTNBSWZrRWN4WGxiUWcvYmdrZlRzQWxkUXZCUWNQQTdxRFhWeUp3Rm95Rm1D?=
 =?utf-8?B?YU9jcDhOdThDeU9HdUJtVG9lN3JIQ0R6OEZZb0F3OExoOWRrVkU5cjdIRkxN?=
 =?utf-8?B?NnVLUkN0a1hnQjV5MDgzR3BXb2hHb3lNY3pZVHNpcnp5K2hrWGVFSGJqSXhT?=
 =?utf-8?B?a1p0V3FCeGdhNXp5SVprOEoyNlp2R0F5ZTlsMm5RWXlpQXgzSlViUVRKN1Q1?=
 =?utf-8?B?REZYclZCNjVGTnVWN1ZzWC9EOTJGa0l2cVZUVlpiK0RIOTNKaEw3Y3ZiWEhs?=
 =?utf-8?B?QlFQaVp1UXdoOEJPdnp6d2RlVHNFc0xmVzh0Tm1VOHNTNElKRTlrM0VrM0tm?=
 =?utf-8?B?Q2I3aVJNUWZVd1A3eFpwb2pYQncyaFRYUDBFOFFYZFFqNGRBeFd5dDREcy9r?=
 =?utf-8?B?cDVyb0FHT2F1cE9NQzczVk9nKzNienI3QnB5NnJwTWRtWUZ0NkhsVlN1QTVM?=
 =?utf-8?B?UGxnRkIyRE5IbFZiOWhvbzZmWWFaQVdFbGxId0wrbFJDdXpoN2lnMnlsZHBF?=
 =?utf-8?B?Zlg3bGg0dCtTVG51dnFwQ01TK2cybTZSZHRNeFUra24wRVU4T1BkSzcxK1hj?=
 =?utf-8?B?WmxKQkJ5L0MxMjhoMnhWT2VPQ3pCb1FsL3d0TUVTOVRHT01aNGlJL0xoMmRk?=
 =?utf-8?B?NUVBY0I0UGdHRy9RYVhwTHVicW9NK3d6VTlyWU0xL1ZHM1NTN0JrMnJrY2pS?=
 =?utf-8?B?bVhiZHRpZ29Ebzh6Nms3VktybjgvZlkrT0pkQ080cVBMYjBrQUJHaXVZTkRI?=
 =?utf-8?B?Qit1S01OOWl4MmJ4cUsyV1ZLdW9wZVUyT3VhbVNMQ3ZWTEUveUlXZVMxRk1r?=
 =?utf-8?B?VktxV05NQXJadEdEaGorSExqc2kraDh1Sk5aL2RHNFV1cDc4NlJjRU52VVky?=
 =?utf-8?B?R2hCcFVQTmY1MzF4eWZCT3BjamEyc29uZUFoMkxNTVVBdlpmS1o5Wm44OEc3?=
 =?utf-8?B?ZWJkWlBoVFY5TFNYSWloblRPZkxhYm5XRTZ4RVY4M2hLNFJyU05USFVKWk93?=
 =?utf-8?B?b1Q5TFU1N2JZd1EyY240S3dNeTRyeTlycEdSRmJjQUZYMnljM1RNck9XdWY5?=
 =?utf-8?B?dnE3OHFBeEJhQXpQcENRWUFQVHJ2OFp3OE1kMXR2SnNsR3lJSWtxckIzaDdL?=
 =?utf-8?B?a0tlMytJWFlicG9TZ0RxcVZLeE15ODROVmk5UldMY0ZWOUs2VlNHa0NuSlJP?=
 =?utf-8?B?TmxQd1FrczdFMm5xSXRHTlJnM1B5NE5BOFduSmEycXRNbkpmUFdWWGRSdkNq?=
 =?utf-8?B?K3pBRUVINzFCZmladDd6WjZXUlZXSktMbGVPTGJaUzRqbDRhUW5WMVUyVklk?=
 =?utf-8?Q?eoJkfvT9eAGW8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3p2M2k0Q0J0RXlQMmtKMEZSdlVhSHAydmE2MWVBUnF2enVIamR0azdnSFJN?=
 =?utf-8?B?cUR3RS92SWY3eFNEVTQxenlSY0dPWHhRbXJVaW8rdkJXR3RFTVZTVWE0Vi9a?=
 =?utf-8?B?ZlI2c1diaDNmZUJNMWl6VHlPWElBRlQrZzQ4THZjeVFsd09tRWtLQTNBVDF3?=
 =?utf-8?B?eTdobldZYTIyV2xaa1BQUko1WjhyenlBWGlaOHBKbWkwV2hBczZ3Y0VJY21r?=
 =?utf-8?B?STJJcXN4SDB5SjJWcmFoWWJJaTFucTJZYTBrUDNMaGhtUVRuNExxTXdUYnhq?=
 =?utf-8?B?U29RZnM4QmFZRy9jYlpXK2NZNzUwL21SM2src0dmVlRNcjBNdk1XMzZZK0VX?=
 =?utf-8?B?MnRuQlM1V2c5NEJaWnhKWUhZT3V2bzQ5QnlVbk50a1JLT1BhM2owaWFrSWZX?=
 =?utf-8?B?NDR1eTcycW83MWlZUm54bW85enJOZFA2V2h3L3ZKVXJOSWNmMDU5MGI0WmIr?=
 =?utf-8?B?aFcxVEw4QmhoNU1QYm9PQjM5U2xyeCtpVEIrampXRUhOcGNDSHBWazhXVEpF?=
 =?utf-8?B?aFJUc3oyTXFtaUJQeDJReGs2bHRabjVPMzlhRnozWDNrRGJDWVplV2Myc1pL?=
 =?utf-8?B?ck8vaUZFU0ovRFhYVHVtNGpEUWl4QjNqbHN0aG9kSkYxMEZ2bURJcm1FWW5z?=
 =?utf-8?B?cUdTNjJQREExK1ZscHlNWUlNZUdiZEdiZmozRjB1ZEtVa25jQURkRjF0YjFU?=
 =?utf-8?B?Ni9HY2xQTzBPb0dhY3d4bEhyR3B6ckNPWHhoUDJSaE9vS1YwTkIzZUNnY00w?=
 =?utf-8?B?dFJRZ1g0emxicy82M1hNdEhQWHhFLzdqdDk5VnB5NHFBQ1pQL2tBM0RVVEdq?=
 =?utf-8?B?SDdjWVFOZXV5N2EwRE05Qlh3WTBoVFRXZjhOS2RzdCtNbXdsQVFzd3RQRnRH?=
 =?utf-8?B?Tmt6T091SktQY1Z4L2VmZWdKb2ptSGZsT1ZralpxYlA1MDdadVkzK3F3TEZZ?=
 =?utf-8?B?VG9VcG1vZXpUUy9Db2tNcTdYN20xTDN1aWVtOFJoU2J3cU1QRzJUeGRTQkZR?=
 =?utf-8?B?R1ViVnVQdXRYOG9jcHdwSko3QVc0SGIzK3RuQ3Y5ajNsNFhEcDdieEo5aGZ2?=
 =?utf-8?B?MmhTUVFIbnZVNWo2cHZOY2pKUUwzZ1hyTkx6a0lFQTFLNWZ4dHgxYkRJVkl6?=
 =?utf-8?B?NnhkbHUwcWF5T2czaktQaTlYMWxYSGlpYlU4TGIvZWRXaW0vTzVncWdlWmNM?=
 =?utf-8?B?YjMxZ0tJT2lBNFovMFlCYlBHaDRqdHJST3RYNk1jTHV2bmZJOTFQaFNLdFkr?=
 =?utf-8?B?ZGxYbndDQ3FYL0J5WU1XN01MYVovKzRiajBic3YyTHVPZ1JZemF1ZXhjeFBj?=
 =?utf-8?B?UFJQMXdxUHEvOXFleEJuS0tCeDBvMVhZOHRrZUlTZUtDNERYOGt3OFJOOWdz?=
 =?utf-8?B?bUwzMkZOSXB0WlpvMTRFNHljNmE4SjFIWVFKWlVBajM3QnhIZ2JRbS81azlQ?=
 =?utf-8?B?bVUyNUx5UDk2Ty9pVk1vUGJpNTEvR1Rwd0hBQVFRdUNsTnQxaHV1ZUM3VUdr?=
 =?utf-8?B?Y0w3Zm42TjA3TVdlUnpFYlFoWDQ3UXVjaDJyQ1JOcGVZUURaT3p0ejQ5NjRl?=
 =?utf-8?B?cUtLODRGSVFKZE96M0trYVdoNWx4S3BSN0g1dCtTeFY4aEFOMXNGZjNqN3dl?=
 =?utf-8?B?cjF4by9PUE1HOXJSdC8xWjVDRG8rYnYrcG11TDZyUVRPcUtOc3lHbloyTXAv?=
 =?utf-8?B?SnErWW5CYVB3SGxwTnBnejVSTWtpbXJJdzdXSzY1UThYVWtEQis2TURhTUEy?=
 =?utf-8?B?SzMzemFFOEcwTGJKTG1sU05DZEtyUHZoK0F5Q0R4bnlXLzEwcGdSamlKdGpx?=
 =?utf-8?B?MVBucjFLdmZkQlg3QjNxbTFBYUYwMkp0ak9wSnMrdlB2REZxUG4xMlNaL0xq?=
 =?utf-8?B?RkF1RWZTbFlOZ0xMeEhPOHhXcWlVL3AyTjZaUHhxVUZzMlFOR2FRZkxySkdH?=
 =?utf-8?B?ZStzd3plaWlPQ1hKSnpNL29mMTZvTGF6MG9OZTJqa0wyNThxM1pkZ0tldFkv?=
 =?utf-8?B?OGFkME1rSzh6NUc2OTRTaTVLTnZDL05QM2JEY1ZvRFFQa25SaGU4MnBDRU0w?=
 =?utf-8?B?Yjc5WkYzODVaNkRkYXcxekZ4Zjh3ZnZBZEIycU9Ob2NCZi9vVVpjdnRub1Fk?=
 =?utf-8?B?VGFqSGNvalhnbzgyN3N4WU12S1ZlVGZqMFJKUG84Y1JLRkxlRTlwVGtUVG9Q?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00070bb8-7aac-415a-d70c-08dd20865dee
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 23:39:23.1617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyJAhj847euPvcAg5SoAYKTpz/Q9FVwFUjdKV+Wdo3s/Zl8ZW52OPOlHSv6rwcqbHKcd1aEFLypJIf7BvshoR0ysOQ2RbtzwxC9AkcNhJ7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6575
X-OriginatorOrg: intel.com

Hi Babu,

On 12/12/24 12:15 PM, Babu Moger wrote:
> Assign/unassign counters on resctrl group creation/deletion. Two counters
> are required per group, one for MBM total event and one for MBM local
> event.
> 
> There are a limited number of counters available for assignment. If these
> counters are exhausted, the kernel will display the error message: "Out of
> MBM assignable counters". However, it is not necessary to fail the
> creation of a group due to assignment failures. Users have the flexibility
> to modify the assignments at a later time.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> ---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 81 +++++++++++++++++++++++++-
>  1 file changed, 79 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index a71a8389b649..5acae525881a 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -920,6 +920,25 @@ static int rdtgroup_available_mbm_cntrs_show(struct kernfs_open_file *of,
>  	return ret;
>  }
>  
> +static void mbm_cntr_reset(struct rdt_resource *r)
> +{
> +	struct rdt_mon_domain *dom;
> +
> +	/*
> +	 * Hardware counters will reset after switching the monitor mode.
> +	 * Reset the architectural state so that reading of hardware
> +	 * counter is not considered as an overflow in the next update.
> +	 * Also reset the domain counter bitmap.
> +	 */
> +	if (is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
> +		list_for_each_entry(dom, &r->mon_domains, hdr.list) {
> +			memset(dom->cntr_cfg, 0,
> +			       sizeof(*dom->cntr_cfg) * r->mon.num_mbm_cntrs);
> +			resctrl_arch_reset_rmid_all(r, dom);

This looks to be missing reset of resctrl monitor state (from get_mbm_state()).

...

>  static int rdt_get_tree(struct fs_context *fc)
>  {
>  	struct rdt_fs_context *ctx = rdt_fc2context(fc);
> @@ -3023,6 +3082,8 @@ static int rdt_get_tree(struct fs_context *fc)
>  		if (ret < 0)
>  			goto out_info;
>  
> +		rdtgroup_assign_cntrs(&rdtgroup_default);
> +
>  		ret = mkdir_mondata_all(rdtgroup_default.kn,
>  					&rdtgroup_default, &kn_mondata);
>  		if (ret < 0)

If this mkdir_mondata_all() fails it calls "goto out_mongrp" ...

> @@ -3058,8 +3119,10 @@ static int rdt_get_tree(struct fs_context *fc)
>  out_psl:
>  	rdt_pseudo_lock_release();
>  out_mondata:
> -	if (resctrl_arch_mon_capable())
> +	if (resctrl_arch_mon_capable()) {
>  		kernfs_remove(kn_mondata);
> +		rdtgroup_unassign_cntrs(&rdtgroup_default);
> +	}
>  out_mongrp:
>  	if (resctrl_arch_mon_capable())
>  		kernfs_remove(kn_mongrp);

Looks like this will miss counter cleanup on failure of mkdir_mondata_all().

> @@ -3238,6 +3301,7 @@ static void free_all_child_rdtgrp(struct rdtgroup *rdtgrp)
>  
>  	head = &rdtgrp->mon.crdtgrp_list;
>  	list_for_each_entry_safe(sentry, stmp, head, mon.crdtgrp_list) {
> +		rdtgroup_unassign_cntrs(sentry);
>  		free_rmid(sentry->closid, sentry->mon.rmid);
>  		list_del(&sentry->mon.crdtgrp_list);
>  
> @@ -3278,6 +3342,8 @@ static void rmdir_all_sub(void)
>  		cpumask_or(&rdtgroup_default.cpu_mask,
>  			   &rdtgroup_default.cpu_mask, &rdtgrp->cpu_mask);
>  
> +		rdtgroup_unassign_cntrs(rdtgrp);
> +
>  		free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
>  
>  		kernfs_remove(rdtgrp->kn);
> @@ -3309,6 +3375,8 @@ static void rdt_kill_sb(struct super_block *sb)
>  	for_each_alloc_capable_rdt_resource(r)
>  		reset_all_ctrls(r);
>  	rmdir_all_sub();
> +	rdtgroup_unassign_cntrs(&rdtgroup_default);
> +	mbm_cntr_reset(&rdt_resources_all[RDT_RESOURCE_L3].r_resctrl);
>  	rdt_pseudo_lock_release();
>  	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
>  	schemata_list_destroy();
> @@ -3772,6 +3840,8 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
>  	}
>  	rdtgrp->mon.rmid = ret;
>  
> +	rdtgroup_assign_cntrs(rdtgrp);
> +
>  	ret = mkdir_mondata_all(rdtgrp->kn, rdtgrp, &rdtgrp->mon.mon_data_kn);
>  	if (ret) {
>  		rdt_last_cmd_puts("kernfs subdir error\n");

Cleanup of assigned counters if mkdir_mondata_all() fails seems to be missing here also.

> @@ -3784,8 +3854,10 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
>  
>  static void mkdir_rdt_prepare_rmid_free(struct rdtgroup *rgrp)
>  {
> -	if (resctrl_arch_mon_capable())
> +	if (resctrl_arch_mon_capable()) {
> +		rdtgroup_unassign_cntrs(rgrp);
>  		free_rmid(rgrp->closid, rgrp->mon.rmid);
> +	}
>  }
>  
>  static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
> @@ -4044,6 +4116,9 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
>  	update_closid_rmid(tmpmask, NULL);
>  
>  	rdtgrp->flags = RDT_DELETED;
> +
> +	rdtgroup_unassign_cntrs(rdtgrp);
> +
>  	free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
>  
>  	/*
> @@ -4090,6 +4165,8 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
>  	cpumask_or(tmpmask, tmpmask, &rdtgrp->cpu_mask);
>  	update_closid_rmid(tmpmask, NULL);
>  
> +	rdtgroup_unassign_cntrs(rdtgrp);
> +
>  	free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
>  	closid_free(rdtgrp->closid);
>  

Reinette
