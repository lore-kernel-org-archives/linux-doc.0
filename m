Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC0B1F190E;
	Thu, 19 Dec 2024 22:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734648677; cv=fail; b=OAj5zkuYKHLuO0CHEN8NqOaSR2nHQ7c3Lq9XZ7ZqbrXMX0YDkTk7sCBj1HEuHn98wKpZizE+/zBY/D/FxGFBciLqYm2vEzOT0RzZ84s5mWRCv0SC28QN6+uuiWv+TFiKK0wB7AkdxGrVjYHOUIv8l5QR+fKDac+q7uUB8ReDMuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734648677; c=relaxed/simple;
	bh=NWckqXNZ43HBggDDTZJ0/4+69ctXt1BFpubj/O9kz1w=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pNCesHh+LCFvP9FhmiBmQLoamRPdmr8ekRHRf8NoyVDLPDQ4WVRLrlkbeJLnab1QD3PgGMiA7AcP0iUCDy3tE7Jd2sCVrZ9g7rmWJfqM69FyJ0NSdg5uNEhxEGLq9CU72xw0niq5aoYOWusRlUVK349MzjHJ4vTZbFcV9QJp64Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5NHatRW; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5NHatRW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734648675; x=1766184675;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NWckqXNZ43HBggDDTZJ0/4+69ctXt1BFpubj/O9kz1w=;
  b=R5NHatRWml0ogsB5ZPv4yCC/OA6H7CiYWCMkIXLfyi8X0UY0lROA7Wow
   YTrwbytBUKtdUdEPg07S54NAwfpgkeMsdneii9xecVRUQTS+wqtfhFOJJ
   yaIodKuv2WzbAQglOds7ijDcQhhU1/xyC2H65WNk+174ZY7Y6hznh4N66
   o2WBsE9bCHLpW0ClBspcIL3rGOAFNr22JvRngb3I+VnR+1EnA7cg6IrqD
   bc18Nwvnbh2p7/lZWFER3nKpYynoEG6lvdQuCttjfk3b7+xZ9f3Cbw82H
   4aE2WsmO5iPMIhvTQlMqEnv942oNHQaHvNd87tmxMz9eziHDYo6KHnoFQ
   Q==;
X-CSE-ConnectionGUID: mzeKL0eYSI2pkmwQRv+V8Q==
X-CSE-MsgGUID: l4RMTHA3RnilLAIYqVPP/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="60571510"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="60571510"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 14:51:09 -0800
X-CSE-ConnectionGUID: JkLM44kHQbCK/W2fPJPRGA==
X-CSE-MsgGUID: BLk/dLzERTOo3+iH0XGewg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98164138"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 14:51:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 14:51:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 14:51:09 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 14:51:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCMKV64o9jcNstk75V+g3vloQWmgGBnz/MRKYQGAaPfqwxjQqgF7hsUdXVSmTbPBCrReUtnUKtsrgAFBFeEiw9f9GmMi/l7BINnRq9BQ8pAMsCXle5Huj4ZFNiKNaA1Ro8JvcY+dQ4b1hi671JRxa3/+hUIkjLVyLjEGBgX09cB9KBLkXXcwCdHpYbtcz61/qS9CTO1pzwz7tPIc9weI2qSOkJVd6zvHfuzXddtlI61YLehg2ruhYq8CTUKTxm7vbX0Q1VT/0sEuoRgmm2bljga+gd99FTYE+3QpP8M42CX4Pfs5wBVb7DidiP94AMmF5DuKGPMxVnWi7iSmSTcqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIi18BsQdzE6B9rI1eeJU8PkeYg8bQuLyYYYBJrzYCI=;
 b=WRVTpaJWApI+jDPPPTJzDWogKhUtIoDuntcehQfB4tW2a0gAdcv8vGuaJpaBIIe5EWF3aFOPfqZfMwAhduDMEfmPs7/Gs/3l5JGPrmL+GVEaIPmI4MvVaZboH3LScDpCAVu7btL74E+ZeHjT7hcUXK3T5IAIbLHbplYA6ORhk5SSxTuVXHQB0zabuW93qslyXR/x6wRPYg3I+r5l2ZagLd6ln02s+LgE6kSBKSNSozb662AG8Hj+MwjNW1tV7yWOcbOs5HSl4o5Z1Fv8AXxJY0XaUqP85g8Rd3tnmBnb5DXfQiMfCha6tXZr1ht9WGM02IHMOtJaRf3HlIcYimi1wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 22:50:39 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 22:50:39 +0000
Message-ID: <bd18ea99-5126-4eef-8906-d90115f4c225@intel.com>
Date: Thu, 19 Dec 2024 14:50:36 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 13/24] x86/resctrl: Introduce interface to display
 number of free counters
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
 <0376bcf61650e619b3f39ea8c2e59b6807de28b1.1734034524.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <0376bcf61650e619b3f39ea8c2e59b6807de28b1.1734034524.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:303:b6::33) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: d6637721-b901-4834-e648-08dd207f8f50
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkdKelNEOGlBaERIUVNCbTRNTVJuTmNKWGxvZVB6Ym5MWnFuTWgvdEdJYUlJ?=
 =?utf-8?B?TnlXdm5sM0RYN1FNd2JwdTh3Z3g0bUpqM1h2SlBJWUlOMVkxaFdCN3hDZDJD?=
 =?utf-8?B?eEhIdGdpZEdGRkZHZVRHcFNIcUFidHgyZmh0aU5UTTdqb1g4Z1Z1Sm1idXp5?=
 =?utf-8?B?NnZNeDRzMUVYOG9GU29SYkFDcFAvY3VjMVRoYmk5ODY3WHNOM1l4NWkwVHRj?=
 =?utf-8?B?ekhES3Z5ek1pakJiNjdoa1JuMFZ5RWRPcURJK1d1VEVWNEtKcG0xSUxPWUhl?=
 =?utf-8?B?elA2OTdMczFDVmw4WTdyVm9Qc1U0MndyT1ZKNVRNOEk4aTB5cENWZGs2Ly9x?=
 =?utf-8?B?OGRaSWhiczJrN1pwWFdITHJHeVlZRVNpdGJ6YUZ6K1lLNnVzTGpDNUZyY0pQ?=
 =?utf-8?B?MmlLSnZ2ZGkyWjYyRTVxQ042WVdpRm9lbDJLV0NBNm1GakxEbHBvc0tPclFM?=
 =?utf-8?B?MDJoWlFMM2JiQWwrTmZCV0NRN0NIU2NHVlFWZTJWaWF0UWtBZENWNlhyZ2FE?=
 =?utf-8?B?VG9JWThEOFJKcUJJTU0vNmhuRXZOS3lvTlRYTU0rODBqWWNZQmFvTVlFajE0?=
 =?utf-8?B?VjhkWDdmT3ZNQU9rNGFWZHBydWFQMUhqeXVhTmx4RDRpTGgzakFyZUlQQmFW?=
 =?utf-8?B?K1ZId1JpWDR1Kzl0Sk1YNzdXbnQ0bVI3VU5lZjh6Y1lrNC9xMTlGOFl6VEsy?=
 =?utf-8?B?VUhiMWZweXdJcHVkOGRId3hjbFdPSStGczlOdVlaQ3BaclZoUm9FSlpUYmJw?=
 =?utf-8?B?S0ErVWlDZFEvbzBSZkhXN052Mytkb2RCajRuaFd6K2E5eWErcnJUckVOcS9M?=
 =?utf-8?B?TGt1MDdzUndqTWZhYVgrNkxPaFJnYjJiNURzeXBQT3FDZjVIanBMeG1ocG9D?=
 =?utf-8?B?SzNYY1V6R0xIMUJETzU2RVlTMkZWRzN2czZHNUJGK1hiSmVxMUQzUEJYUGhN?=
 =?utf-8?B?NWxDOE5TV2pSQ0pON2JRTkx0aTFQZnJ1T21xYVlGOFMveTRHMGJXQmU3OGZs?=
 =?utf-8?B?QlpQU0xlc21xeVBycVl6NG14VGZSNUwwamYvTDZ0V2lCQ2xFK0VMaUR2LzVP?=
 =?utf-8?B?L1o0K1ZuZzBtc09JODdaSFVHRlNUU1NYZDl6V1VxemJzbWl0akZFL2NqYVNl?=
 =?utf-8?B?ZlJlQkhHamZHRFdjSFRndmk5eEZEK2hEN2ZmaXR0ZTQ1QnNHVTJqMXdIQmIz?=
 =?utf-8?B?bmdXN3Y0bmhSOFRzcGZIZDkrWHBnbDlBeC9NV3ZVS2VqUWpVL3Q2OUxSMnhx?=
 =?utf-8?B?bGxBdGFqYjRTU0tjYmRYSFM3MndCMzFJR1NhdzM4VlpzNlpxd29MWXNZeUVj?=
 =?utf-8?B?WUlsOWNacUVHanc5blN4WGtvVUVxelQ5TTkyK1E3dllWN2xXcC9rZ3QycmYy?=
 =?utf-8?B?VmxZUFhJb2R1cDVOU0daZURHU2c3US9MWnBNckdsTDVXS0lqKzNQbndrTmZu?=
 =?utf-8?B?SWhEbGo5NVo2cVBWQWFaT1hOcFJybGVhQlFjbHVVTnVFcm12YmZPa0pBaDMy?=
 =?utf-8?B?RFUxL3lQS2MwSzZraDlOQ2szdnRwQWVkeStaTGNJZmFhM3l2T2JlS3puK1Nj?=
 =?utf-8?B?cjRUMTZwVm1LYkNvVUpoNmlqMmVJWkN6QUxPQjFCdXBjNTFuRXNqUXk2S21p?=
 =?utf-8?B?ajJzbjd1bFNMZnVvZzlPWEhWYlZhVFhZai96NzUrKzBQRy9lSXVJK3pZeDNT?=
 =?utf-8?B?OFpyZlpxWHF5Q2c2ZHVzL0FwZ2k1alNFMVFQNEErMmpDcjlvcHlOL3RoRVVX?=
 =?utf-8?B?RzVSM1JXN3NiazBNV3lRRlkvNHloSE1IdEszWjhsQjFLUUlicDZxbjUvakll?=
 =?utf-8?B?bUVIMlp1dURpT3NZZmEvQlZMU3ZwdGRYRzNQMno2dExZWkdNcXZIOW1hOGg3?=
 =?utf-8?Q?PJX6cezcXQmxc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlM4SjI2TmVGTlNZVnVUL2hhREZpQlBmRksxYkgwMVBMakJzL0RHN2VTRW5R?=
 =?utf-8?B?eE5NRGFRQmp2R0RJS3p5bEE0cUV3OG4yZllIU3ZaMFYvcnJIMGsyaEdCSzR1?=
 =?utf-8?B?SkZ3ZE1jRXU5NERLS05kVXhaR1ZaR25Fa0w1dFRCWEJselRzalhUbjZFRnY1?=
 =?utf-8?B?MlZEZStmMVA5WEpubVBPMWlocll2UTcvMVBPZDhmT3cwMWdHU2JUbmFONlJT?=
 =?utf-8?B?NVpRTHdZOEJwSUVpNGdyNjN5OWJYTk0vSXVSM25JdnBCaWNLdWh1N2ZlV2Q1?=
 =?utf-8?B?ZVRrMHRjUW9DMkgxUHNVYWpQWXdSOVc2Q0E0Tm52TDdRVTB2YkV5ZmRzOGZH?=
 =?utf-8?B?VlNPeTNieTlIclJ2MkEyalNnQTQ1WkNhUnIxcUgxMFAwc05yaXR0R0VERmhy?=
 =?utf-8?B?YW15dG1WMGZBbHJtd1piS0xSNnZGNGRUSGt0eFoxSzIrbUY3T01aN0wrN0l3?=
 =?utf-8?B?Lzk4cHc5dHY0M0dvaG54K2ZYNFE1RjZqd3V3Z3JmZ0JnV0VHcVRnU0FpUkN3?=
 =?utf-8?B?ZzhERk1IR2swQ3Fwckt0Y2x0M1RaT0FjVi9BK3VRK1ZFMXlZN0lKbFgyZGlp?=
 =?utf-8?B?N3pYcWVYeTBqNFIrYU1naTV3UHhTeGNtd2ZsZUhaME1aaFQ4aVF6OU52b2Rt?=
 =?utf-8?B?RnpNSFVZTGRzc3VPa3dPZHlMMS9XRVhwekhYSUpYOVlUYmJYUWg1MHhjYWt2?=
 =?utf-8?B?Z29ORlhIWURDYWMxb1c3YldiZ25KZnRtOG9LNnFGT3V3dmtnYW40S2hZWDlJ?=
 =?utf-8?B?SjNENjJZWHJ1ejVtcjkybUsyWGZhL2tyV01leWw0QmlEU0RTZkRDY2wwb3o4?=
 =?utf-8?B?VUNXeDh0azZqVWtYSEdOOUovamphR3JDb2MwZVhOcU1BRFB6enVSc3NGVlp2?=
 =?utf-8?B?WTdYMXRCenU4dXk2RDBSUnQweko3aUoxcTZPc0l5YXY1THZ6NDZqUXVUdTdL?=
 =?utf-8?B?cGFOdGhTY0ltQ1V3NjErTkRPUzFqSjl5bW80My80NHV1Rm5oVUx6L2I1dkN1?=
 =?utf-8?B?c3lubXVNL0xWS2h6VXlkNzJsK3k1MkFvYWd3TjhLUnFmdFdLVkVCeG9PMTYx?=
 =?utf-8?B?S1BZRC9neEltK1doMFJ0TXUyMDR1cEZKQ0FReVhRYUIxYksyZm9PcnJKbEdF?=
 =?utf-8?B?ekxiQkkyTy9qMC9Rc0FCZGVocEo5eVYxejFBZlFxWC82WG5BS1M2V0xHbmlP?=
 =?utf-8?B?SW1odDdncFZwTzRBN3V0RERWWUxtN1c3TkhITTQvcVMvdXJDSmc5R2VzckVV?=
 =?utf-8?B?STZrOGpWVlJBVjJwTlhxd002QzJJamtYYU0wc1d3RFc1NmVYMXVXYWF0QXRE?=
 =?utf-8?B?UXE5UWkvb1UyNDVvNGtlQ21EM001WGhUTldGeG5TN0xDY242dnZzUW1lc045?=
 =?utf-8?B?QjRpZCs1eVh0WFpSSS9paDRKNFFMY1pVcHN5Z1VlWXFDUmJzcUtSeEZ4dk9w?=
 =?utf-8?B?bkxJWjBLSGtHbzlFaHFrcTRlbERvRXZOdW1QQUlPUXd4UEZYeXAzZkZEdVJB?=
 =?utf-8?B?UnI3T3dud3JHaXJsaWFIYTRzL2JpSXZFQk9LbzFUNlAzZkJGeEU4djdPMS9J?=
 =?utf-8?B?aHlLWjlIRnhpelY5TEdFck1udFR4UlZrSC9lQUF4cm1Cc2VqK1hhYVNncWlk?=
 =?utf-8?B?MlA2dUFkdnVXZksrWUFzaDhPS1FBU29uZUJ4Tm9SM2NCY0J5VmFGeHJsWE9M?=
 =?utf-8?B?cDRNaTNYakMzTmJlc0VWWlZ6NldhRVlaWjd4dWFNWG9KSlJvTVk1OHdWMG02?=
 =?utf-8?B?OUYyMFF6bUoybWVYSDhLRXNoY2V2M2ljNUFydllzSjNFT3ZTVWU4ajE3MTFC?=
 =?utf-8?B?QnYyKzYrYTdFWkxvSFZmaC84UGhzR0VKamxRVW1CY0d0NEpwZnNrYjc0dU9H?=
 =?utf-8?B?eVUzOHZjbUZVdFpzZzRLSldwVTB2ZkVHVzNDOHVNTFBBUXVTaitHazNBZERY?=
 =?utf-8?B?N2g5K0c3ZDh1SWtRUnNIcVFJV0NNb1J1U0FDUGlCYUxpd2Q1VVBydE8zdGY0?=
 =?utf-8?B?NDdlRG1sMzlqeTJVckJrQUIzT1RyOVpPMkpmckpsUW1EMHRCZlZXV0ZzTnZw?=
 =?utf-8?B?dE9RZ3Q0M1JwOUJLc01RSkVsU0Z2T0lKTlZZVFBadjZaMDlzaitGUmNLWm9D?=
 =?utf-8?B?SkhuckxsbUxKQmg5TW1uVUVIRjkrWXJlTXZ4VVQ3N2dLbU9HNjRJblpnaU9U?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6637721-b901-4834-e648-08dd207f8f50
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 22:50:39.5482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXp/tslswZtanKyhdfcZeyqi1bm3wLXxnGg2gVtKcNq6Ll1yPPd2zbQSX7V6j2CgKI4b/QZu/G7qzMEWwBePGRygpJczs5O8Euf+9e0xwrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
X-OriginatorOrg: intel.com

(andipan.das@amd.com -> sandipan.das@amd.com to stop sending undeliverable emails)

Hi Babu,

On 12/12/24 12:15 PM, Babu Moger wrote:
> Provide the interface to display the number of monitoring counters
> available for assignment in each domain when mbm_cntr_assign is supported.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v10: Patch changed to handle the counters at domain level.
>      https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
>      So, display logic also changed now.
> 
> v9: New patch
> ---
>  Documentation/arch/x86/resctrl.rst     |  4 +++
>  arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 47 ++++++++++++++++++++++++++
>  3 files changed, 52 insertions(+)
> 
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index 43a861adeada..c075fcee96b7 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -302,6 +302,10 @@ with the following files:
>  	memory bandwidth tracking to a single memory bandwidth event per
>  	monitoring group.
>  
> +"available_mbm_cntrs":
> +	The number of monitoring counters available for assignment in each
> +	domain when the architecture supports mbm_cntr_assign mode.

"architecture supports" -> "system supports"

It looks to me as though more than just support is required, the mode
is also required to be enabled?

> +
>  "max_threshold_occupancy":
>  		Read/write file provides the largest value (in
>  		bytes) at which a previously used LLC_occupancy
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index b07d60fabf1c..f857af361af1 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -1238,6 +1238,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>  			cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
>  			r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
>  			resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
> +			resctrl_file_fflags_init("available_mbm_cntrs", RFTYPE_MON_INFO);
>  		}
>  	}
>  
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 1ee008a63d8b..72518e0ec2ec 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -879,6 +879,47 @@ static int rdtgroup_num_mbm_cntrs_show(struct kernfs_open_file *of,
>  	return 0;
>  }
>  
> +static int rdtgroup_available_mbm_cntrs_show(struct kernfs_open_file *of,
> +					     struct seq_file *s, void *v)

rdtgroup_

> +{
> +	struct rdt_resource *r = of->kn->parent->priv;
> +	struct rdt_mon_domain *dom;
> +	bool sep = false;
> +	u32 cntrs, i;
> +	int ret = 0;
> +
> +	cpus_read_lock();
> +	mutex_lock(&rdtgroup_mutex);
> +
> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
> +		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
> +		ret = -EINVAL;
> +		goto unlock_cntrs_show;
> +	}
> +
> +

unnecessary empty line

> +	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
> +		if (sep)
> +			seq_puts(s, ";");
> +
> +		cntrs = 0;
> +		for (i = 0; i < r->mon.num_mbm_cntrs; i++) {
> +			if (!dom->cntr_cfg[i].rdtgrp)
> +				cntrs++;
> +		}
> +
> +		seq_printf(s, "%d=%d", dom->hdr.id, cntrs);
> +		sep = true;
> +	}
> +	seq_puts(s, "\n");
> +
> +unlock_cntrs_show:
> +	mutex_unlock(&rdtgroup_mutex);
> +	cpus_read_unlock();
> +
> +	return ret;
> +}
> +
>  #ifdef CONFIG_PROC_CPU_RESCTRL
>  
>  /*
> @@ -1961,6 +2002,12 @@ static struct rftype res_common_files[] = {
>  		.kf_ops		= &rdtgroup_kf_single_ops,
>  		.seq_show	= rdtgroup_num_mbm_cntrs_show,
>  	},
> +	{
> +		.name		= "available_mbm_cntrs",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= rdtgroup_available_mbm_cntrs_show,
> +	},
>  	{
>  		.name		= "cpus_list",
>  		.mode		= 0644,

Reinette

