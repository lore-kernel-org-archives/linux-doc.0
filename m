Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8B21C57B2;
	Thu, 19 Dec 2024 23:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734652792; cv=fail; b=ULlcp+oaTJ5y5m536erj3TD8DPoxbspmR6vrSVpQRG5T66UiWpDX+YQ8M1d3lEGV46/m16BSsR+LjOoo6kNVvNN7QsLtpAHp5L2qQojEbIOGHQVVnBsdOmbXUbCFZx9bOKtm46CN0IHMjnsOcwvfQNAkZOAlrykhnXfFYTPAm6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734652792; c=relaxed/simple;
	bh=4NLdoTeh+xGwxKdHuUJHMGRfBrSnEHKinZ4W6yqCuxo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SIoOYJkCdC62WBzRa3bH4UfsLCrp+eFSKcdm1LGyb+Ahzumhh/AnQvAbCLSm6NqKUjfRk6VEZglH4qYu8zQhPKLff+C0TMRNvWopR17//kMJepeyS1ZtQh5EJ3q3usv8eXgX5c5FA0SnALLKOO6yJ9rcAWFoUwWFOcxQbpQ9pUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckBxJg4m; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckBxJg4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734652790; x=1766188790;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4NLdoTeh+xGwxKdHuUJHMGRfBrSnEHKinZ4W6yqCuxo=;
  b=ckBxJg4mYeW5GBN2w4RDNgGxRa5NRBJr8dHf4O+HXCvibsgVDkXKdZHT
   cNCXj+4+xrHtrGbj+0pnwi8v4EoAJiZJ1JRTEDFqipCsSkwMeTxKcCtA1
   H6G/7yR82mcrR6MzHE2cFamx2iwrkvZtHzA3wXI/5U8MRIW5lAET+kSS2
   PbjR7teBanbDH21BKDPTVsoiN6JIM1nlUbN1aJxj2rUOeqqWBr8HacDTG
   04C10B1neIx73JRa08pv6ESvulsbzYn1BjG0qXf6R9B1KqT6/3FJRTI+B
   glG71X4slW/ulxSgmaGYvWdG/F9LsRE34hK8jKMtjlLI6IgYO2Klq5fEA
   A==;
X-CSE-ConnectionGUID: kE9HL5eMRxCCu1gcVjIgBg==
X-CSE-MsgGUID: mfTcRi5CSjm5P1WeMN09LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="52601470"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="52601470"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 15:59:48 -0800
X-CSE-ConnectionGUID: 3Ss5MT+LTqSDFIpJZgCvaw==
X-CSE-MsgGUID: WIxhiQNpSPuCyEDcz3+9lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102962506"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 15:59:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 15:59:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 15:59:46 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 15:59:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRPCLk0em3gbIcSZ+24z3XUYEd48B+ulYS8rJApzLUhcTZNGQ61UMdxeZ1qnc9PYm8ACpnS9reguPfXCwoD2ijKNAYgXTEeVYBrYHmDXbPN8V/J0D7sRgXZRTO/IXXlI5vDm2ku/vwe3ktP7SNYQnzEUvdHcQd4YseEz9PYt/pgBzK1Px3qWXKW9m52PXM65Q2ZyzdFuPhHBFrVGDpnyR3YT6VaodnpiAQ+YDJ2DIaAkuqkJNyAXS1NBAr5kJCFcWgiAJYNQkWk/e+b76b5I7oWW/UVstFkIPTh35/ZpjM5+n1AenKQlucBLJQ0LqUu9+DsdhOAla7I7OYm3EMkQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDbno8DD/XEyZpdh9lTKg8pm1Mk4zLTD+OkJbxV/Q5M=;
 b=snr7DN/9MvQLz0r52Je/F0LPOLau4veuU4cQC8HHwyHnJsr4JqprIm7kBLBsus67VqWd7zhDms0aodtwkHtSj6c+q29S8WgRJsfSO24cSE9wfixQhkszf0YyI0EWx0XCpezPrZz6V04t+O4Zsq713Wd1+qeJbng1cqXh6BsExUInAu7uPc+9nLklrEU++hlHVFlI18ieONBFQaqgDnvbdQ1IBu0Wqib6+7EUQONsLVMGzUzvcW/WgHHY2ZkeqdJIa1Vvxd/w3YwDPPHWWYaxxOcPivYt6lJbF6xmkulJqOHBXuu0Nl7Ru7IbbVY4iqOh4vOz3vV47UrzbQwOE/3iXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA1PR11MB6757.namprd11.prod.outlook.com (2603:10b6:806:25c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 23:59:44 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 23:59:44 +0000
Message-ID: <ec3c179b-87b1-4afc-b688-618f980584ab@intel.com>
Date: Thu, 19 Dec 2024 15:59:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 19/24] x86/resctrl: Report "Unassigned" for MBM events
 in mbm_cntr_assign mode
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
 <2b59ada547e0444755201f269fc99240b3195e1f.1734034524.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <2b59ada547e0444755201f269fc99240b3195e1f.1734034524.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:303:8e::7) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA1PR11MB6757:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f9244f-b0d4-4202-c1a0-08dd20893590
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHRqRGpvT1dkVzFzdmJ2dXZTNW1QZk5WVmZuUnZ5dkV1OG01ZzVXQ3g2UzdC?=
 =?utf-8?B?ZEN3Skk4dkFGcVo1R1l0SHE2VFFMRFM3YVhZZnVVNm1KbFJ5T1hsTGowVVla?=
 =?utf-8?B?blhjb3dMQzJLbHFrVTMvdm1iR0dIaUZPNWN0RlZlSUdMV3JKQ0FNNmZVbUg5?=
 =?utf-8?B?UmVnZ1REUXFTQzgzUHYzcGQrRElmTTNqZjVPemtqaUtCYndXZDdmNHp5Q2hq?=
 =?utf-8?B?VzMzWHZML2puVEMxcDhkVklrYVNiSHR4Vk1OR0Q5dzMwQmVSRVAwQnY4U0t3?=
 =?utf-8?B?anZaYWVjajVXK0hhRTFDU3Bybmd2K3l4djg3SGJCZCs0Tk5nZkFMbStRY1Iz?=
 =?utf-8?B?SjNZaVpyQk03M1BDRjNoa3dCdnp4c3pEM1hzWlpyQmdRcDdmcGphVHRlVThp?=
 =?utf-8?B?aUhrMmdJYlYvOUV1Q0dpSDRQcmxiNVNCMm1kRThmVC9uSEtXV21CaVBZRHJJ?=
 =?utf-8?B?UUJEQkJrSjN5WFViL0grZ09Cam93NWoyRTVqeFhna3I5bTFxVnM4WjZaYUo2?=
 =?utf-8?B?SUVUTi8vMEpaelFwdmhZcndxOFMzZXV6cFJpcXBRZkdPSHBsMXhzcEVHN01h?=
 =?utf-8?B?aTV3M3JtbTkzLzZybkJHZ21JcFlQb244SnlEWkxYSkdtYWpHbE5IUHp3Znlo?=
 =?utf-8?B?WGVvaVpBR2RVakhNdEJMQVZhRXRqODlLVVY0Qk9Wb3BabWh0MWtHZ2xEdExp?=
 =?utf-8?B?SVh6TEhjRm5HRXl6cXFaejduUVM5Y3p2SGdqL291emtrSzA1ZmtQVkFlUGRD?=
 =?utf-8?B?eDBrTzBGMFdqblZHY3VBcVltakJkWW5GcWlSTlVlcTFkUXNDd1I5R001cTFw?=
 =?utf-8?B?UzhPWWE3cGRwRkN6aHJJMi9Kd2o1Q3dxY1E3dU1vWC9MOElsajlUekpTbjdj?=
 =?utf-8?B?WmpJMVh1eXRPWi9vcW1yR2Z6Um5MdDMra29RZWlTZDZydTJMS2pVNEtGS28r?=
 =?utf-8?B?UWk1RTlwbGhqNlpVTnlhZXhZQVlzL2JwaHg2am5YbjdwdCtVTnlIYnJVcVBF?=
 =?utf-8?B?VXVveHhiK3E2RmxSSkJXc0NCZUZzRG9IV0dCRnN1eE5udFVOQ1NFNlhSa25G?=
 =?utf-8?B?NnhKbEFwaXZMTHhjbXN4dU16dHA3LzhmYzE0dWxudWxNQjlLdU1hQXZ4Y0Jl?=
 =?utf-8?B?RFc1cjEzcVZkdjBqU3BmN1grRjViVDBBVkd2TmRDbWd6M0Zmc0VPMm5wWC9o?=
 =?utf-8?B?V2JjdHlPR2QyRXZHMTNYVFIxMStsS0RLUzYrZVpkazlBUGpXRzFiVy9yRzU2?=
 =?utf-8?B?WDBaY3RISWtHOHV2cElIdVRYVEdHcXFlUmNqTW9ZVnJOdkMrZkMzdFBJTFpt?=
 =?utf-8?B?cEpSMXlqVVExY0RXYVczdDhUYmlqU00xdkVITkJUS3k4T1lXeGxoTHIyeTlk?=
 =?utf-8?B?dEFHT1JzbXAySThYVlBneFJIaWpiUjVSMHg4ZWYvNTAyL1kzNVpkeHZFcGR0?=
 =?utf-8?B?eVBXbnVUWmcrbWczY0J0V3N1RGg4SlpXMHhJeCtGYWQ5d2xCWldhZEc1T0hM?=
 =?utf-8?B?dHNuQWV5a1VMSkp6VDBOcys1OEI2NFVYcTgyTDJKbWozSFNHUmtZa0lGVEFn?=
 =?utf-8?B?VlFoN01VM0htUTg4L1FIWTBFUnk3V0l5eWZBV2xmQm0zYlprWGZSSzdOMXBq?=
 =?utf-8?B?WWpmSHFKVXlkalh1TFlocm1IQXpLcDJNL1VSVkdZdVBhSHJTNzVYQi9VcjZP?=
 =?utf-8?B?TlJxbVlKZTExN1h1azNNQXdoZk1xMVd3Y1FjNmwvRFF5U25tVW85RFlWUFVI?=
 =?utf-8?B?cVAvdnNtMExJRVhQemtoSHRMbXc0TTQwejVUdENqaDUvUVlmZytPRWJYd3Fa?=
 =?utf-8?B?L1JRU2pVam4rM1FnVFdkMlhkSUNEN09CREVYL2J1UlBiV2FBZHIrcGN1M1Bx?=
 =?utf-8?Q?uGtiZI7wx8mK4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0tWMlZobnRQM0t4ZEpUdnpFekI5WmN0VGVDYkZCdzgwTCtIRi9IZE9CWnNM?=
 =?utf-8?B?QzVhL0FBUmZTNGNUQk5PWlh2M1d5QUtSa1MwcjBqUVJFaGo1dFpKZ0hzRW9n?=
 =?utf-8?B?YmdlL0Q2eU5hcjBKUzk5S1V3R1pIYXd3RUFJSkZ3R2JXeGJ2Q0gxdGJyMDdS?=
 =?utf-8?B?VEs5MjN3MzdNSkNpQjJUYXN5Qy9HV0xPdEUvOEs0ZHBNemZKaHFXcDlESjFQ?=
 =?utf-8?B?RXI1aStzemcxYUIrOUU0STh3MFRtbmZmTmx4UGl2WiszUFQ0elIrYm5qejRm?=
 =?utf-8?B?NDBsVkdCQVNXL3Z6L1UvWjlsTFRRWnk0U04wRWVWN01Ia083QzVTSTA4cDQ5?=
 =?utf-8?B?d3c1M2UvQkNkYm9yeGo3OVBsRXk1RzE0V0VEekZ4RHMra1BHTGlTK3pZdUZ6?=
 =?utf-8?B?aXI5WVAyV25IY0NkdkxUTTd1MDJNUHB6SGM2djh6RHFSQ2NZUmE0YTRoTUUy?=
 =?utf-8?B?YWd5bS9YQW1nMWRYMjJwSllGc0xqYVcyR2NpRy81N2huNm42Tmg5b3pEdGpt?=
 =?utf-8?B?SFI2d1Z3ZmdFcjFEMkluUkxiY3RqN0VRM1ZyMCtSU3kwRC9KdHU1eGlHbWkw?=
 =?utf-8?B?V3JUSmNYNXRkOWZKRW44VjJQS2lCRVVQdEJOQVNRYyswZ0NkLzdtUWxCK25x?=
 =?utf-8?B?OW5xWFRWelBxN09vVzRON2xFSnJISFkrZ3ROanpKRG52REhhL0x3WlZtTlcr?=
 =?utf-8?B?NVNyQ0ZLMTdFR09sb1o4akdEbU8vdWxnc3pqZGhqN1Jqa1dXNS9QUjkxazBY?=
 =?utf-8?B?S3dhR1pCKzA2dUJIZTJKbWlJK0NnSHVBUmRuY3cySFozcE1IL2RJMFhrRW5r?=
 =?utf-8?B?S3F5OEN5MnA2ZlYxd3pCcUVVOXlYL0ZqMnJVT3YzOEJNbEVQWjBaY2F3WmNZ?=
 =?utf-8?B?aFpQbWZNMUhKOXY5QUFubVpLeE9wdWNXNWFrMC9md1Rpd0hFdVQvTkJhb1JF?=
 =?utf-8?B?YXg0WDdHTGhtUUxmQ0s5QXBPRWVibVlOenhFWHBRMCs1NGEvTDJKWGxlQ3Fx?=
 =?utf-8?B?ZzcyaGRsTzZrZjhDR2RJeVM3OE1KbmhDbXprV2pZTjJ3K1YrYVNDU3BkZEZP?=
 =?utf-8?B?RGE2ZWtJYWF2WkRXc0J0K2lXV3haZHZJcCtuQytRY0JzM2J3Vm15cmxMcXBP?=
 =?utf-8?B?Q3lWQ3dtTXcvUkNWWmVQOGlKbzlLQ3M1MUplazBzOXlYWG9WZXlVTDk3T1NL?=
 =?utf-8?B?VVJlRnNrY20zc0FvbEJHekdhMWxrYW5yZ0YxaVVWandVZUJzRDhFUEJqa0tE?=
 =?utf-8?B?ZVFFZVZRclZ6cUkxK2hOZENwOEVOSEV2M3JMdnR0OFRkOTRnMVc2MWgvajMx?=
 =?utf-8?B?d05CSFBOZmpzNDRmRVRYb2Ura3RFQUxUWUdhMEFlZzlIWi9zZ2tiMGEzOVdE?=
 =?utf-8?B?ZFNkVFVEVVd5eXdycCtyRDQxZ3dXWGhPVnN1YjJEVGpyd3pzTDFvZld5SWt4?=
 =?utf-8?B?cmFRMm1vczQ0OWE4eEZocFR6dlJvWnJ0Z1Q2RlVvbUE5NWM4OERaNTZ6RVNT?=
 =?utf-8?B?ejFhRER6emNCRDZZWjk2MC9GQUpQWjlpakNuSXFNQWQ4S1FmZXBMNUNXb3pE?=
 =?utf-8?B?KysvT0E4Z0xoRTdjOU51MFJGdVJJRTVkUlNBRGVZVXFtVUVraENYdXVxNEJa?=
 =?utf-8?B?V2dWbDQ3M203WjU3WFMraEF3ajk5UytBdUlESCthSXRoU2RLb0pidWtrN3Zr?=
 =?utf-8?B?cUZGdGM4RVM4Q29HV1RoaXM4Z1F3RXlTbVMwS1Y2OVRwUlQ0UkRqZDlUVkhl?=
 =?utf-8?B?Q2V0c2l4T0xBdUJmY3d5Qm9MNjFTTEJvdVZiNnpBR1ZkaEpJMVp1c3U0TFAz?=
 =?utf-8?B?aTE0MDBnaTlRSlhYTnNGcDFIeDlKRWNKN2VhWXFldTVvL1lJM3k5N1FmZWFq?=
 =?utf-8?B?anpIVEg0MUdxTTJBalFkR3I5RXRMb29VVnJWYmtWMko3Y285MEdSUjJueUlr?=
 =?utf-8?B?aCtCWllHUWZKMk0rRGZCY3RUWjBZN04wOUNhMkRoc3dOZ0FjZGNRRG44Y1R2?=
 =?utf-8?B?VWxMQWtLc3ppL0hvRm1kV0dHME41K2RSK1NFc1VKamkvVS84dDFiTjdHQXRQ?=
 =?utf-8?B?QktLZmZWdldHRTF2YTJCZndPeCtHQStZdENtVXJZK2I0OGlEaFZ1SjlBQXh1?=
 =?utf-8?B?SWMvWThFL2ZGdnU3dU1LdkZNVWttNnNpV2JPZjlHZXFGdjBVZURybWQ0RWc5?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f9244f-b0d4-4202-c1a0-08dd20893590
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 23:59:43.8988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfMCOdWYaYIjn+uOujIG+WnF/KZWLMB/0rdtfF05OB4cYUMQipoydSiNC+aNTmdcB5XpBylfj4SGdizPmZ2l/uXIt53ZV5WFea19yX0FKd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6757
X-OriginatorOrg: intel.com

Hi Babu,

On 12/12/24 12:15 PM, Babu Moger wrote:
> In mbm_cntr_assign mode, the hardware counter should be assigned to read
> the MBM events.
> 
> Report 'Unassigned' in case the user attempts to read the events without
> assigning the counter.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

..

> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index c075fcee96b7..3ec14c314606 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -430,6 +430,16 @@ When monitoring is enabled all MON groups will also contain:
>  	for the L3 cache they occupy). These are named "mon_sub_L3_YY"
>  	where "YY" is the node number.
>  
> +	When supported the mbm_cntr_assign mode allows users to assign a

"When supported" -> "When enabled"? Or perhaps just drop that and start with
"mbm_cntr_assign mode allows users ..."


> +	counter to mon_hw_id, event pair enabling bandwidth monitoring for
> +	as long as the counter remains assigned. The hardware will continue
> +	tracking the assigned mon_hw_id until the user manually unassigns
> +	it, ensuring that counters are not reset during this period. With
> +	a limited number of counters, the system may run out of assignable
> +	counters. In that case, MBM event counters will return 'Unassigned'
> +	when the event is read. Users must manually assign a counter to read
> +	the events.
> +
>  "mon_hw_id":
>  	Available only with debug option. The identifier used by hardware
>  	for the monitor group. On x86 this is the RMID.
> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> index 200d89a64027..8e265a86e524 100644
> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> @@ -527,6 +527,12 @@ void mon_event_read(struct rmid_read *rr, struct rdt_resource *r,
>  	/* When picking a CPU from cpu_mask, ensure it can't race with cpuhp */
>  	lockdep_assert_cpus_held();
>  
> +	if (resctrl_arch_mbm_cntr_assign_enabled(r) && is_mbm_event(evtid) &&
> +	    !mbm_cntr_assigned(r, d, rdtgrp, evtid)) {
> +		rr->err = -ENOENT;
> +		return;
> +	}
> +

hmmm ... d can be NULL here after the SNC support. Since the file that needs a
sum is essentially software backed I do not think assigning counters would
apply to it (but it may theoretically apply to the domains it consists of).
I think it may be safer to just move this check into rdtgroup_mondata_show()
where it reads data for a single domain.

I am not sure if we need to change the documentation because of this. One option
could be a rewording to "MBM event counters may return 'Unassigned' or
'Unavailable' when the event is read".

Reinette
