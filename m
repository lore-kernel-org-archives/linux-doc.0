Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E0133EB1B;
	Tue, 11 Aug 2026 03:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786420183; cv=fail; b=qsH5IPgzMeXG5jxaMEH29Pz0RAF3bKrlu6tswijHhpuEZBk4773INkZMUjQExmCTmOcvy4THH14MiygsfF0dl0xcTVHyBEshBB3eR20TA0Dj/wYriRWBkYpbtuEogTnzibEL/w5HX2Qb7gxse10V3MSkmC+XJe5wBlfraUlzszo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786420183; c=relaxed/simple;
	bh=h4Wp4ejAEjqOsfn13baWaJpWH4yILw7jneTmy0q/AKk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vo/yVbCuQhtUPatNpAfIW70xXETgGQwCXEZQKLA+WnBSeqonMBXAptt0NXPB7iEf59gMqdnnPr7WrTJLD9ebItlRCNfknIlg96+7IOcioSD4RfhGPDOirhE6YNkwiZjbdbaq+2XQYFO9FC7Ez9r/793ui9ONgtY5fQv/qcLXxxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvL5qVYR; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvL5qVYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786420181; x=1817956181;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h4Wp4ejAEjqOsfn13baWaJpWH4yILw7jneTmy0q/AKk=;
  b=dvL5qVYRI4QBzfgOjxvHYhRFUerHjrsokPkMpG+rHOHUCdwR8J/9mUMX
   43Y2LLa0r6lm3GPIDaSzCs2be0glMnEI8vX7GHnaRiEmCdxj6s1s4Br4l
   dOV+/raWEx44L3zPWSUsPxEsSKQD6Zlri3AiIn0xqNyZ+7arpO0EcoB1b
   hmb/vBdZQVrBs0YsdKTZ4MAfmqA66ea9OHK/KfTcEcvC+eflBYwaRYbcq
   mAtRCWwhGwsu2fhYcsh3GuHmDFSwuqw56D4AwffWOUoJg9xpTW44myF+0
   omXF6q24Lg4BJgrS1NSM+EqJQyf2tdHOyvkzOaNP3JB1Dhc5WOSz1Lr71
   Q==;
X-CSE-ConnectionGUID: djiaw6i+RV6teAL8tMdicg==
X-CSE-MsgGUID: y776BWRUQKaAvhW7/Lz1Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="90759202"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="90759202"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:49:40 -0700
X-CSE-ConnectionGUID: HS4DRiTaTqCZst4OQd9aIg==
X-CSE-MsgGUID: PQoEtIvQRKmMGaVSnUcJhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="293162855"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:49:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:49:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 20:49:39 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:49:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFbds5weHyM22awNWIAF34L6pIW8NbYyRT0eSHTMvrsqqZcLASOZfBhMrfXuhGV2oGPciBq8fhwa8jtzZor/r4RGN5FozqXXk5nTv27qu2gpo9/Rn4M9JsO2H3Y64wQv1LoUXR716dGKwj2FBmgoq4SgWtxnPIUtLpNMueWnGVF/hJAi+oD6kyMJSKFMoO0JZ7QL464M+78gkITL6sr+wf/Pt2doMgbAXhkTdWhchPcuqvSU2wQjYgMmeK/LdyR+8kDZr00ymTi2/AeR63HBhZEXUPaVymBhuml6IBdjufF0QQEx6ncA1YI0xKQCRM7JgY+YaT50r4frWHByN2ehDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dpzv7T4T07KzPZ5gZRP2gwl0kfVXHnybUHExM7ocx4=;
 b=c8G96H3j8B3h1KyWj8dICRGc7Na4IEgI2ql+NctMfV2sW2Du/b7d6mAF9T3s77d48lreGKoVI4do9EAbKiMkJPLDvUxyWT6/5E0X7WIPXxytwtiLmv4aJSCzrJP1XVEFQMIoZ8m8wj51wNOJttuLx7qwmsURSzk8HB/ZRjWAXhHp/H54OytxZaKamkN8p2IqE7vApgk+B3PICZ9MPw0VV6BMLhl9oYKPyccn0UaG2EpnFRvERCxaUQUXnbPGn65onIZQaVGbZNQaYeWpQCkg9x8lpHKhvZCCaTmIFejAN9K35zo774iYBtGV5SEgfSFjEP80CNZWIcOjIbN7Ak2o0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 03:49:30 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 03:49:30 +0000
Message-ID: <d297bec3-4957-43d9-9bcf-43b4676b0235@intel.com>
Date: Mon, 10 Aug 2026 20:49:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 14/15] fs/resctrl: Allow user space to write
 kmode_cpus/kmode_cpus_list
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <lirongqing@baidu.com>, <seanjc@google.com>,
	<nikunj@amd.com>, <xin@zytor.com>, <pawan.kumar.gupta@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>, <kprateek.nayak@amd.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>, <naveen@kernel.org>,
	<darwi@linutronix.de>, <elena.reshetova@intel.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<thomas.lendacky@amd.com>, <eranian@google.com>, <peternewman@google.com>,
	<qinyuntan@linux.alibaba.com>
References: <cover.1783461016.git.babu.moger@amd.com>
 <e2deefce19f3cf087ea96a7aba3f6850812e3036.1783461016.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <e2deefce19f3cf087ea96a7aba3f6850812e3036.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0169.namprd04.prod.outlook.com
 (2603:10b6:303:85::24) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SN7PR11MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: eba5f864-2180-4b72-443e-08def75b8c42
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|366016|1800799024|376014|5023799004|10067099003|56012099006|11063799006|4143699003|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: T3Fz0O6IWbh2qq5YsguRWUtKKsTGj1sPDYIMnuwsixqtqS0FXuCM23Wt7Q4GyCZjoD4Xm33VYuDlyyRbd/IiwDjqjPc4eMCX16vMCDAVvc+JkfsBbBcjfipDOIoAuVZ+SbA3KEz4kgmNmlUq2NyLuDyYppn9/2priMa9laYhXirfg7nImqIldhEnfOk1Ba04i3yvyvaGumtFpAhAAxrSj8dc1u5QbYlOOBW+Rs+uNJ69pTpOtkxobdXShCnTwHlQLOdq5VwiYbHoNI5iFt/8r0w1HcdzpiFB8l6E8V3WmVqa/qZ7sM1qqQpzDrJvDWqXjNobRmyYneFTJiT2Ey4qrukxCbtQ9hr7Koip89/OSuc6UAlNoKDduvdWSZAhlVfMg7+kNuELorIDzCHpIiUG/6xA0jVZ5JioFdLc5bstByV6DQ09xE6dz8/BlW+g6CMrewFxdmNYu3Q5LOG8nFFO58Ra+gGmP+0BAikHAXoWzJSubDpxYOPlB9mm1jVVaxuuG09E+N+Ix41sI2psf0IxfvKTsiK5O1yTky7GMYPd70eLdiTxY/5jXRi/Zff7o4sFP6UUtbspyk1s5Od2WQa50kFUxc7GWoWWXT86Hfs7KzFo9+LpKJfTc3hkS7ie0EBsir05A3eidhvCHe5BcdGYhAa6ARQ69vQxrEGB3xj6xA0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(1800799024)(376014)(5023799004)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekZOTEl4SGlvb1RMbEttRVBNYXNDdi8rU0pZQXB1UitHMWVzSWF4RXBuOHk5?=
 =?utf-8?B?K3VzaUorU1NqdittLy94RUxtWkJvbFFOZUphc3pPQzZyVk4veWYvVFZxVVlq?=
 =?utf-8?B?MG11dk1lUVhFM3Q0dktud0pleFMyc0U1amxPY1FOeFRZQ3k1cHRjNVpoNkVn?=
 =?utf-8?B?UGc5WWgxRUdkdlFZcFhrRExNMU5GTzV5Qkl0MkJURW05akZQcml5c2JaSmNt?=
 =?utf-8?B?QWdYMHg0Skg4UUwxTENhbmxpVzZaMHJ1NHBHUlFraDRZa2dSMjZhT3ljTzJC?=
 =?utf-8?B?L3VGMVVqZUFCZzM0U1RzbzczaXdGRERpczNjbE9lSytENGE4ZDEyaXJyM2M2?=
 =?utf-8?B?YUdoeFpkZWt6OEdadVgwcTBiMUNURnNnNHVtZzd3MUZYUk1IbGJBcm01ZDR5?=
 =?utf-8?B?N0xzOGVSMzRnMWE3aHJiNmtlQTRQU0oreU9ITDRiS2p5bmt5YVBaak96TDhK?=
 =?utf-8?B?eDBCeFpCWW51bjZ5SFNsWllKMStWNWZ3VmNZM3dEY255SHJyd1ErSFRZV1Zl?=
 =?utf-8?B?d3RTL0hSaFlmZnRnemZmcGtSZjFubkpMUXNNakdjaHR1K0RsS1lvTkhHVDB3?=
 =?utf-8?B?cEJ6RGhBczJ4VXROVmE4MFpXTEZiSGtNUTJ2WTVSOEl3cnRuZEtuRERabzU4?=
 =?utf-8?B?Nk9MeFRHOU5USS9pV29qMDJiamJIcDUzMHh4WGN5N0FVdmc1czFuV21LY1Fo?=
 =?utf-8?B?bW1oK2lKTGdtVk5KUHdPRWM4MXFmYjNOSXBpTlRWM3VoMlVvMkttam1yNHBZ?=
 =?utf-8?B?Q2RqRFBVdklOclo5cjc2TktNN1g4K1pydDRlRFVSR2g5VVIwSTdLOGgvaDB6?=
 =?utf-8?B?OHdBZHR5a215TWoyMjh2YlF5L3F1aHdkU1g2VnBrem9MbHFEUHZUWTNVblc1?=
 =?utf-8?B?UGxkVlhSN3NudVY0UkNCTGJyM0JaRlFESkJqZkVWekpWVHFqeEovZUZJbmtM?=
 =?utf-8?B?ZkxmUDVjNXVEMWd1UGhNalI3d0hRSXRiWldiS3ptandxYUJ1cXg1Q0toVHN5?=
 =?utf-8?B?N2tCYnlnZEZ1WTRHOTI3bzNyVVlRMUw3S2ppY1Avdlo2QVVuS0pnUzlmb2tI?=
 =?utf-8?B?dU5nU3RBS1ZYSGF6WmNCZlRiWVVGSE5WZUdUczdTekg4MVJwT3NjOGF4L3hU?=
 =?utf-8?B?N1hKSDI2U3VMUVYyc3pmZUg3MGFGMGszaWJvVG80c205YnJXZGRsS0pRRlR6?=
 =?utf-8?B?cDlBU2p0QWZKZjhCZ1NXT0p4c1pubnhtc1J6UW1RMUVVcGkzeUEzL09HZi8x?=
 =?utf-8?B?eVhnWTdKUHpZalNSSWF0ditOWldLWDFFblNBM0lkcTFPR01QYTVNbzZQeC9z?=
 =?utf-8?B?QjhrU2N1QU9aSVdDYjRrNXlkZ3NaR2FyVjBvSytvNWxzQkdEcERaMStlZ3R1?=
 =?utf-8?B?UEFXdTRwSlNlM29STlpuOWxkaWQxVE8va2tobzVzM1B0bGl2djU5ZWRVNElL?=
 =?utf-8?B?YWd3LzZpMWkwb1ZKQmU0NmI0YnJzc0lVZ0gzcFNvYW44NFdwL2czUnNuVXpJ?=
 =?utf-8?B?T0w4RHRvSndENnBPQTJHYnZNUE5NL2lJc1dDdzc1Vk1NTjB1OThlOC8reEI0?=
 =?utf-8?B?d1Q5d1N6SkJUaHVOV28yZXVjT3FwQ3ZpSFZ5SndmRGJYZENsMEtYK3RXYURl?=
 =?utf-8?B?c0czbGNEMUpMUjgybTFXc1l4b0hRenNSNDhMRnpVa1E2RjU0djlVY3FlalE4?=
 =?utf-8?B?dUpHdkR1MHFQb0N2QjFGUGRWbzJnNXc3VzY0OE5uWE1EU0pPcTZkSUwva0Ew?=
 =?utf-8?B?QzZtZHd3a0s3Sy9aN2hvdEdEeG4vNm5MbHEzVnRWbEpwRWt1azBJZXRXcXVa?=
 =?utf-8?B?Z05MdWFLaHViMnEwMEc2KzlSRytBb1hJeGJZVGJ4cmpKQW1rRENudFpPK2py?=
 =?utf-8?B?cHlVbjE5OEhYd2xsZjEvcGN4R1FIVDFpTXpPYVREUGdJYWRXbEZObWFmUHdN?=
 =?utf-8?B?TXU0dkZwY0VFMThmVTl4QWhqZGpPbk5QOHg0bFJlSytCM0c1WnVkcWZHb3I0?=
 =?utf-8?B?ZVhVU2s2ZjdCUEZKRGVyU2MxU0Jwbzl2MnRoZVZDREpIdUxKK2lhMm1jamsz?=
 =?utf-8?B?c2pmeDcvWTJ0NzNmNEJXN3VWd2NGeTZmTVdyM1NIZ25XMkhDc1NRaWpUMjJH?=
 =?utf-8?B?SENoSEs0M053RS8xbWNJdVNWU2FDeS9nZStpMlNaY0duekcxV3BSRTQxbjNl?=
 =?utf-8?B?cVFjSk1xUStWd1REYmpOMFNwQkxkNXNUa1hyWVB1dCtTQkZEYXJzUE5pRjZD?=
 =?utf-8?B?ODlRZElORTJmOVhlaWJxaGsrcC9ZTzdOWWswRTJRcFRXUDdycHJPMXZhOUla?=
 =?utf-8?B?OVA4OEwxYzN4SXBsQ2dMNHNSaXZQYi9YVU1HbS80ZCsydEhPbENmTVJWK0Rh?=
 =?utf-8?Q?P3tT4eeXEi8Sr4QA=3D?=
X-Exchange-RoutingPolicyChecked: tJ59/yisWpuXUbIBeKUU1UlT+6ujj9vgW7g3FdNffKjOR58UP/aT3ucH5tBf4l/S0a0ubk9TSw0Esgv4enNf2btpzRzGjG+LM5P0PAtrUjg2BIpWd4kaM4BcR9YUaeecqEGQWSE22NYuvhZA8V4QfzdhWMJcHD3qc85k+Zqev790G4WjeH2KO2LwGn1mmvipSKYvAYjGmdzYZcXfq3GlCzgmLVzvuzuSRamZpxXtO0Wg/p948hihunE2WyeqE9k3DzaVyV9GBu2liD/Wx248TOwmqi8muEVK3jcZoIucudrAYPDKSpiX+Y9JlVfhnYT1/DqfWCr6fYdC7d+MusCjPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: eba5f864-2180-4b72-443e-08def75b8c42
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 03:49:30.2057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlxj/pDHBi7A8O2gtvntWRu3mhOOGX454WOsmKv4dOD/NQ3zh9a/wnNrXhi54ALSonWFv0QJT1UmfvYaXDgTmV9PSF/cEqIEdBFUqwhJ6BE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7705
X-OriginatorOrg: intel.com

Hi Babu,

On 7/7/26 2:50 PM, Babu Moger wrote:
> kmode_cpus and kmode_cpus_list expose the CPU scope for the rdtgroup bound
> to the active kernel-mode policy. They are currently read-only, so changing
> the scope requires rebinding through info/kernel_mode, which reprograms the
> whole binding instead of only the CPUs whose state changes.
> 
> Make kmode_cpus and kmode_cpus_list writable. Parse writes as a bitmap or
> CPU range list. Reject pseudo-locked and pseudo-lock-setup groups, writes
> to a group other than resctrl_kcfg.k_rdtgrp (including stale file
> descriptors left open across an info/kernel_mode change), malformed input,
> and masks that name offline CPUs.
> 
> Update the bound group's kmode_cpu_mask and reprogram hardware
> incrementally: disable kernel-mode association on CPUs in the old mask but
> not the new mask, and enable it on CPUs in the new mask but not the old
> mask.
> 
> Document the interface in Documentation/filesystems/resctrl.rst.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: Empty masks are now allowed and updated masks are in rdtgroup->kmode_cpu_mask.
>     Updated the changelog.
> 
> v3: New patch to add "kmode_cpus" and "kmode_cpus_list" to support
>     kernel_modes.
> ---
>  Documentation/filesystems/resctrl.rst |  30 +++++
>  fs/resctrl/rdtgroup.c                 | 151 +++++++++++++++++++++++++-
>  2 files changed, 179 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index 5a13814d1325..4a2bdd74d4aa 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -676,6 +676,36 @@ All groups contain the following files:
>  "cpus_list":
>  	Just like "cpus", only using ranges of CPUs instead of bitmasks.
>  
> +"kmode_cpus":
> +	Visible only on the rdtgroup currently bound to the active kernel

"Visible" -> "Accessible"?
"on" -> "within"?

rdtgroup -> "resource group"
bound -> "assigned"

> +	mode (see "info/kernel_mode"); hidden on every other rdtgroup,
> +	including when "inherit_ctrl_and_mon" is active.

No need to mention that it is hidden in other groups.

> +
> +	Bitmask of the logical CPUs scoped for this group's kernel-mode

What does the "scoped" distinction mean?

> +	binding.  At bind time through info/kernel_mode, every currently

What is "bind time"? Could "bind time through" be replaced with "assigned via"?
Can "assign" be used instead of "bind" throughout this text?

> +	online CPU is included in the scope.  CPUs that come online later
> +	are automatically added to the scope and programmed with the binding.

I do not think "scope" is the right term here.

> +
> +	Writing a mask reprograms the binding incrementally: it enables on

I interpret "incrementally" as the write _adds_ the new CPUs to the mask, which
is not what the implementation does.

> +	the CPUs newly added by the write and disables on the CPUs dropped
> +	from the previous mask.  An empty mask disables the binding on all
> +	CPUs in the current scope.  The mask must contain only online CPUs;

"CPUs in the current scope" what does "in the current scope" refer to?

> +	masks naming offline CPUs are rejected.
> +	Errors are reported in "info/last_cmd_status".  Example::
> +
> +	  # mkdir ctrl1
> +	  # echo "global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//" \
> +	        > info/kernel_mode
> +	  # echo 0-3 > ctrl1/kmode_cpus_list
> +	  # cat ctrl1/kmode_cpus
> +	  f
> +	  # cat ctrl1/kmode_cpus_list
> +	  0-3
> +
> +"kmode_cpus_list":
> +	Just like "kmode_cpus", only using ranges of CPUs instead of bitmasks.
> +	Writable with the same semantics and restrictions as "kmode_cpus".
> +
>  
>  When control is enabled all CTRL_MON groups will also contain:
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 7b06c3b3f00e..8ecd107368b3 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -423,6 +423,151 @@ static int rdtgroup_kmode_cpus_show(struct kernfs_open_file *of,
>  	return ret;
>  }
>  
> +/**
> + * kmode_cpus_write() - Update @rdtgrp's kmode_cpu_mask from @newmask
> + * @rdtgrp:	Resctrl group whose kmode_cpu_mask is being updated.
> + * @kmode:	Kernel-mode policy currently active on @rdtgrp.
> + * @newmask:	Set of online CPUs scoped for @rdtgrp's kernel-mode binding.
> + * @tmpmask:	Caller-allocated scratch cpumask used to compute the
> + *		incremental enable/disable deltas; contents on entry are
> + *		ignored and on return are unspecified.

ah - this is where "incremental" comes from. I think this is an implementation
detail that should be invisible to user space.

> + *
> + * Compute the difference between @rdtgrp->kmode_cpu_mask and @newmask
> + * and call resctrl_arch_configure_kmode() only on the CPUs whose enable
> + * state actually changes:
> + *
> + *   - disable on (old & ~new)
> + *   - enable on (new & ~old)
> + *
> + * Then copy @newmask into @rdtgrp->kmode_cpu_mask so subsequent
> + * show/write operations reflect the updated scope.

This can be seen from the code.

> + */
> +static void kmode_cpus_write(struct rdtgroup *rdtgrp, enum resctrl_kernel_mode kmode,
> +			     cpumask_var_t newmask, cpumask_var_t tmpmask)
> +{
> +	bool assign_mon = (kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
> +	u32 closid, rmid;
> +
> +	closid = rdtgrp->closid;
> +	rmid = rdtgrp->mon.rmid;
> +
> +	/* CPUs dropped from this group: old & ~newmask. */
> +	cpumask_andnot(tmpmask, &rdtgrp->kmode_cpu_mask, newmask);
> +	if (!cpumask_empty(tmpmask))
> +		resctrl_arch_configure_kmode(tmpmask, closid, rmid, assign_mon, false);
> +
> +	/* CPUs newly added: newmask & ~old. */
> +	cpumask_andnot(tmpmask, newmask, &rdtgrp->kmode_cpu_mask);
> +	if (!cpumask_empty(tmpmask))
> +		resctrl_arch_configure_kmode(tmpmask, closid, rmid, assign_mon, true);
> +
> +	cpumask_copy(&rdtgrp->kmode_cpu_mask, newmask);
> +}
> +
> +/**
> + * rdtgroup_kmode_cpus_write() - Sysfs write handler for kmode_cpus[_list]
> + * @of:		kernfs open file (selects bitmap vs range-list parsing via
> + *		is_cpu_list()).
> + * @buf:	NUL-terminated input from userspace.
> + * @nbytes:	Length of @buf, returned on success.
> + * @off:	File offset (unused).
> + *
> + * Parses @buf into a cpumask and rejects:
> + *   - pseudo-locked / pseudo-lock-setup groups,
> + *   - writes when INHERIT_CTRL_AND_MON is active or to a group other than
> + *     resctrl_kcfg.k_rdtgrp (stale fds opened before an info/kernel_mode
> + *     change),
> + *   - malformed input,
> + *   - masks containing offline CPUs.

This just describes the code and seems unnecessarry.


> + *
> + * Validated masks are passed to kmode_cpus_write() to update
> + * @rdtgrp->kmode_cpu_mask and reprogram hardware incrementally.
> + * Errors are reported in last_cmd_status.
> + *
> + * Return: @nbytes on success, -ENOENT if the group has been deleted,
> + * -EINVAL for pseudo-locked or pseudo-lock-setup groups, malformed input, or
> + * offline CPUs in the requested mask, -EBUSY if INHERIT_CTRL_AND_MON is active
> + * or the group is not resctrl_kcfg.k_rdtgrp, and -ENOMEM if the scratch
> + * cpumasks cannot be allocated.
> + */
> +static ssize_t rdtgroup_kmode_cpus_write(struct kernfs_open_file *of,
> +					 char *buf, size_t nbytes, loff_t off)
> +{
> +	cpumask_var_t tmpmask, newmask;
> +	struct rdtgroup *rdtgrp;
> +	int ret;
> +
> +	if (!buf)
> +		return -EINVAL;
> +
> +	if (!zalloc_cpumask_var(&tmpmask, GFP_KERNEL))
> +		return -ENOMEM;
> +	if (!zalloc_cpumask_var(&newmask, GFP_KERNEL)) {
> +		free_cpumask_var(tmpmask);
> +		return -ENOMEM;
> +	}

Please see related recent changes to resctrl:
commit 242c0ab4d51d ("fs/resctrl: Change last_cmd_status custom during input parsing")

For comparison you can view latest
implementation of rdtgroup_cpus_write().

> +
> +	rdtgrp = rdtgroup_kn_lock_live(of->kn);
> +	if (!rdtgrp) {
> +		ret = -ENOENT;
> +		goto unlock;
> +	}
> +
> +	rdt_last_cmd_clear();

rdtgroup_kn_lock_live() now calls rdt_last_cmd_clear().

> +
> +	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
> +	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
> +		ret = -EINVAL;
> +		rdt_last_cmd_puts("Pseudo-locked group cannot host kernel-mode binding\n");
> +		goto unlock;
> +	}

Similar to previous comment I believe this sprinkling of pseudo-locked mode
checks can be avoided by ensuring that (a) a pseudo-locked/locksetup group
cannot be assigned to a kernel mode, and (b) a group assigned to a kernel mode
cannot have its mode changed.

In this case then resctrl_kmode_cfg::k_rdtgroup can never be a pseudo-locked group
and the if (resctrl_kcfg.k_rdtgrp != rdtgrp) check below would be sufficient?

> +
> +	if (resctrl_kcfg.kmode_cur == INHERIT_CTRL_AND_MON) {
> +		ret = -EBUSY;
> +		rdt_last_cmd_puts("No active kernel-mode binding\n");

I do not know where this "binding" term came from and all of a sudden it is
everywhere. The inconsistent constantly changing terms used in this series makes
it difficult to follow.

> +		goto unlock;
> +	}
> +
> +	/*
> +	 * The visibility layer (kernfs_show()) prevents fresh open() on a

Visibility layer? Another new term. After this introduction it is the only
instance of this term in all kernel source.

> +	 * non-bound group, but file descriptors opened while the group was
> +	 * bound stay valid across an info/kernel_mode change.  Reject those
> +	 * stale-fd writes so they cannot corrupt the now-active binding.
> +	 */
> +	if (resctrl_kcfg.k_rdtgrp != rdtgrp) {
> +		ret = -EBUSY;
> +		rdt_last_cmd_puts("Group is not the active kernel-mode binding\n");
> +		goto unlock;
> +	}
> +
> +	if (is_cpu_list(of))
> +		ret = cpulist_parse(buf, newmask);
> +	else
> +		ret = cpumask_parse(buf, newmask);
> +
> +	if (ret) {
> +		rdt_last_cmd_puts("Bad CPU list/mask\n");
> +		goto unlock;
> +	}
> +
> +	/* kernel-mode binding is only programmed on online CPUs. */
> +	cpumask_andnot(tmpmask, newmask, cpu_online_mask);
> +	if (!cpumask_empty(tmpmask)) {
> +		ret = -EINVAL;
> +		rdt_last_cmd_puts("Can only assign online CPUs\n");
> +		goto unlock;
> +	}
> +
> +	kmode_cpus_write(rdtgrp, resctrl_kcfg.kmode_cur, newmask, tmpmask);
> +
> +unlock:
> +	rdtgroup_kn_unlock(of->kn);
> +	free_cpumask_var(tmpmask);
> +	free_cpumask_var(newmask);
> +
> +	return ret ?: nbytes;
> +}
> +
>  /*
>   * Update the PGR_ASSOC MSR on all cpus in @cpu_mask,
>   *
> @@ -2531,15 +2676,17 @@ static struct rftype res_common_files[] = {
>  	},
>  	{
>  		.name		= "kmode_cpus",
> -		.mode		= 0444,
> +		.mode		= 0644,
>  		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.write		= rdtgroup_kmode_cpus_write,
>  		.seq_show	= rdtgroup_kmode_cpus_show,
>  		.fflags		= RFTYPE_BASE,
>  	},
>  	{
>  		.name		= "kmode_cpus_list",
> -		.mode		= 0444,
> +		.mode		= 0644,
>  		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.write		= rdtgroup_kmode_cpus_write,
>  		.seq_show	= rdtgroup_kmode_cpus_show,
>  		.flags		= RFTYPE_FLAGS_CPUS_LIST,
>  		.fflags		= RFTYPE_BASE,

Reinette
