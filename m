Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442F213AD26;
	Thu, 20 Nov 2025 22:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763676110; cv=fail; b=o+h7C4EmQcwzb/ddd0CutQqf/4Y7wfialJaQt6VD1Y33iwCB5n2OGqu86iXwZWCTi2dvoN7ioI+9WeijtYqViJWteqvdpdPY60xgEvwfkqYMhqudFRJzdo0RFTnc6w+j4kfUiv1DhVCkJO/zyglKuh2FsBIileyVcQVmcrISd3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763676110; c=relaxed/simple;
	bh=TWE1IAHlhPkS28eex+oPvI0+lLugaoajWhfKQlZlSWg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pNLWR7rXTU1AuhNo0INgevsj+3g1by+c9r9HejSMKisqhCTwBU8+t3DTpUKbIdNNuR2blbuXbPYRxbqA7y6x4X27K83xXKI+UNMTlGZfq5n+fAWENpgtnIJDn2Ytin0C5xPEnIGho4P41BLGxVhEjzYCC2FRh/yBtpcUonqaRzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibLgFtJ0; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibLgFtJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763676108; x=1795212108;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TWE1IAHlhPkS28eex+oPvI0+lLugaoajWhfKQlZlSWg=;
  b=ibLgFtJ0+0+2Eihq3cWH16f3+Dn9EXq8N/wRHVUGlxwtnPrvwFS2iwQh
   /E3Kd2xQjHd5O0obSRTn3rZecoj4gsy9pCugVIa+2n/kjH+ao0cE/PdxJ
   bGVuUL7Vy0sUQkYOdYPmYRj6y4sBgut/T9nlhOgaVXOfs/dBndH4WrxRO
   SGWX/UUoK+kPr0UT4kSA2/l4+C2XPfIYTyPw4+WqaWF4LrlWe2JJxsILa
   uzMPXbvOx4EqvqHwgQu5LwQMzf5x2otPslXFKZ8b4MpTyMXMxCwRfWwVj
   G/HNrYALjZINGzUSLxBHxwFu9xlrb354emhpGUszmXRLMEzoMuO1F8Fim
   Q==;
X-CSE-ConnectionGUID: 5Gl4+sj7R1S26SmfJT8N4w==
X-CSE-MsgGUID: vxIAyXi5Rv6+fNnKsP62nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65655757"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="65655757"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 14:01:45 -0800
X-CSE-ConnectionGUID: VsUJg18LQsSK1LFghACa8Q==
X-CSE-MsgGUID: yyG6c4a1QeqBbimCOexDeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="190725160"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 14:01:44 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 14:01:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 14:01:44 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 14:01:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zf9X+ZNwcS8RveP/jJB+07ypGfFfmFr5Y10TGAeVu9B7RtAzQ/ZTJ2i228gSPkX5wuA6HyM3+lB88pPHosQJQwS8YuLkme55bbendr/BklvEaAGYucavEsS7PdZGDSBLvc3tDGwmRhtyX9dPtHyqkMYYpTg43nYjIVHAjqBEd1zTGI81BhB6BPsfjygDtMiXScX1qIVu1cQKYoGTim3HtoDQ2bSJMQWbid403+YOB5SXlAzTuhX2iVC2OYPxktkCjnfLgL9LeXriiPFnz9hRNbzZlEOpbPcNY4sSLqi9FOTRYTM9rxCzWD9s3FmDnj3Cv6UUBZVvwRpw4obtVJKIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D05+elU1/atrAmRu+Ezo50FU8b7/+Hf4Ff+yqzbGqAk=;
 b=YkNzmIIqHjuT446WU/mE3Ky2EAb5t/J6IoRqcQp42SlBTYgiujd0CWELibWnKrxBWAfJkYp9YFDj4Wl3JyeMWzBVr6RbaL7wLTxCMD5dOoguXjvyC2daNP9Qgcwiakjp44m4IJ5nzxENYPuyimymoBc1GeI43fCvv7wb+h+R1C9SfAdWC06eR2Q4JVKVyOMVB05Hiq6qGVjoc883tAMuGiNHXUY9JHGUnA7pEawhekGFDBZyaok17ySr9FZT/BjVC9OosaM804qBSfc7Hq8KSMw8vSE8Klkml3q+DFKCkXvu+AE0p32ZkuDGBGnPiOv5HYQp99ZMgHb9EKneWeAbhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA2PR11MB5180.namprd11.prod.outlook.com (2603:10b6:806:fb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 22:01:39 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 22:01:39 +0000
Message-ID: <0131dd9a-327c-4f3f-a9ca-a5126c464e79@intel.com>
Date: Thu, 20 Nov 2025 14:01:36 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86,fs/resctrl: Factor MBA parse-time conversion to be
 per-arch
To: Dave Martin <Dave.Martin@arm.com>
CC: <linux-kernel@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, "James
 Morse" <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>
References: <20251031154225.14799-1-Dave.Martin@arm.com>
 <45b96e99-ac5e-4546-b58b-f4d062d2f823@intel.com>
 <aR9TBNAJqQNpGjMh@e133380.arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <aR9TBNAJqQNpGjMh@e133380.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:303:6a::21) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA2PR11MB5180:EE_
X-MS-Office365-Filtering-Correlation-Id: a9276aa6-c94f-4f5d-d61a-08de288061a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDl5SW92eHJ3VlJJVW11Q1ZpT1ZBeUMyWTFaVTlOMXZPTzJ3U2sybHQvUWJO?=
 =?utf-8?B?TmM2SHBpb1AxU3JDTytrU0lSNnZpSVVBM1h3Ty83OGwrZGVOWXZhZG0vdCtE?=
 =?utf-8?B?UGpyREoxc3QvWnA1MDB6UEdIQ0R6SkcybEJxR1ZHdWFZVlROYW50UkdvK2No?=
 =?utf-8?B?S1FzdldPSUNwQm5SUm9xL1JyMDMrelFYN1ErOURJNzB1QkF4R2UzQ3VYaHZs?=
 =?utf-8?B?Q2ZXWDF6a0JQanp1alZBRnB3b2lMeEowZzhtdHJQa2NFRHhpNW9ucnVWZUNy?=
 =?utf-8?B?N0o1d2F3SlZFTHZXNTV1c3hhY2s1cDBXbVp3UUNxZUJnM1FlNlJEY25nMDAy?=
 =?utf-8?B?QWlkZCtkVENYUlNHTFlYOTlWUXJjZWZPeHVhZUNYekwxem1MQjFoODRPWUE0?=
 =?utf-8?B?emYxUU83M0Vrek9tSmJXMzBGZldzOHVJOTVXVTYxdWJXbXN2NUprK2RXcDVV?=
 =?utf-8?B?QzlPL3hPTDN3TmZZVm96VnV4TjVRSno4QXdINkN5M0M5R0U4d09BYVpYamJM?=
 =?utf-8?B?QkQ1cWJhNm9jYVRiOUJ3Sm44WkNURTFDQ0tFYzFyRklmbVU2R1VUcXRGb2pT?=
 =?utf-8?B?dkR5emNoY3kzdU5TR1RmT3FqM1hSQzJrYm9xWlpNTUZtVjRJMExyaW8vblJt?=
 =?utf-8?B?d003bjZWY2R5YUNOWllhVzQ3Wk9lbURNTitoL1lYY2RKaVZrSTZjTGlUaGJV?=
 =?utf-8?B?dmxmQjhSUklSRGRSV3Z4TG9ZZlBXSU9RTER2L1pueHdnemZWa2kwVEM4OXhz?=
 =?utf-8?B?Y3pYemljbWV6bTNNMkZkTmpPUmhLZ0wvb1pIb2dLWFNBMHV5QUd0Vlo0cm1y?=
 =?utf-8?B?czgzcnQxOUp3Yk50OVR6cnE1ako5Q1M0UmVyV3FLQUtLTFpBUFhwUFB4UFRV?=
 =?utf-8?B?OWFiMUJhdG9OSk5nNU00TXpMaWRVSVJpditML3R5TmVMdm1Zc1JlUEpKZnpj?=
 =?utf-8?B?NVFhQ1Q4QVdlMU91RlpOakdDTHR2M3Fva2NHV3Q0T0U1NE04V2YzcDRmT2dB?=
 =?utf-8?B?SXIwZVYyTWpOb3huSUY3WVFBS24yZ3FMTUN6cWRLRHpUMVVrdU5vQndUV3Rh?=
 =?utf-8?B?SGh6VlRnRUpVK0ZiUFNpa0V6WGI1ckMyWElURjZwZ0VVTy9IK2NST3FXUkd2?=
 =?utf-8?B?WmRTU0R0RndFUFE2V2NrTGRHSkU0eERnSXE5MCtzT2plalNhTnRNWStoczZ5?=
 =?utf-8?B?bXBwTGZVWG45NCt4bXkrZ3d3TWxQLzhibTNhZnplSnN1cWw4RDd0MGo0Skcy?=
 =?utf-8?B?UVlnMjBpNC8wR0ZiVE5vNjM4MGMzZkhSeitrWjR0SFM1L2kvVGFyeGdpMWht?=
 =?utf-8?B?OGNOZTZkQ2tVRGNkOWo2bld4TEF1K21QOXVoUXR2clU0S3FjZDlMalEzbWhP?=
 =?utf-8?B?M3RWTzlMdHI5aDV6dSsyTHBLVm42YnZLdkF1WnBrenNUUGc3VTdQS2xHaWhu?=
 =?utf-8?B?RFIwQmszMDB5S1Nja0o2ODN4Q3dUUzJXQ1VPKzcvbG0yTFM2M2NNZmUxYUp6?=
 =?utf-8?B?dVhYUWNvZWZBcHhZbmEzOUg2U0pSdGpjUjV4THN4NW1lV3N3ZGtxZkpqcHVm?=
 =?utf-8?B?VjFITzQ0WjNWN240Rmt6YldlcVZNQ2JxbW5WaUhvV0FsV1hYeVd5ZlR5N0Jl?=
 =?utf-8?B?SVdHOHV5dXN0aGxkTmFoTFhucC9vdHdjOWJlQmt2NGtFVG1QTUExN211ZzVi?=
 =?utf-8?B?a01vRlNrbC9XTTFQR1p3c0hSMW5ka1dHVmpQRlNDQ1c5ZlpQbGk2am00WVNm?=
 =?utf-8?B?VUxtdE9ObFFrNnJadWxOcExFT3RJMmlIUmIzYTZkQ29oNVhyc0V0YWRVWEo0?=
 =?utf-8?B?cFpiZTE2YXFZWThZQlNlSFdybzVQSmlqZ0lqbXNhajF5Uk55anF3MFBybXJU?=
 =?utf-8?B?MzRlQ1RDdVJtUXJoK25UWHFSSlplZDM0ZXBKcGMxTVBMTEYwaVpBTC8yckw5?=
 =?utf-8?B?ZVNXeHpkZXc2OGxLMUlhOEhNbW1hUFBVUk5Vb3hjSEdqbWFBVlAvNUFFTjFz?=
 =?utf-8?B?MW03elZvSTVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFRSV3RKbGExWmhaZ1BXUzBTNW5oZjFIRzdiYWRKdGdpWGgvbkYrTHp5YlZT?=
 =?utf-8?B?SEFhUVFxTS9rR2F1bmN5UjV1Wkk0UW1zaHNZU3FxRFVZV0xqbi9JQXpHY21o?=
 =?utf-8?B?UUFEakw2N29BcThhVmJDOStwbnlzdDBoRW8zOUNlQkppQ1VRNy9ab0haV3hT?=
 =?utf-8?B?N1JiMmo0QzltcXdmVnFvSklNK3RUM2VBeEFpZERScEp5OEZ0V3VsbHBwUHRZ?=
 =?utf-8?B?cU84V0x6N1c1ZWt6YUZqc1pneS93eVQ0Z0xyZVZFdUtXSUNUV1pqSDdqbnd0?=
 =?utf-8?B?Ri9WWjB3K0dndUM3OWpid25Fek9KaGhlNUhaMitxVjRSK01rVHpSaUYrcytm?=
 =?utf-8?B?L0YzZWhLaktnRUhaa3BLWnIvKzRYdUFIaDN2T0JwS29vN05RNzhQWWtDcHJI?=
 =?utf-8?B?RGNDeW5TaWpyYjRGd2VscjNIU2d0UXJVU0NKOThKS0ZZMUNwVUk0M09LeVFI?=
 =?utf-8?B?RVdqZGp4VkV4eWJ2MHlER1lZTTQ2UmFJRk5FRmpUVkcwVng1d1dqN1FJekVx?=
 =?utf-8?B?K0UvVTFvcU82K2hNVHk1NTQ1NWpVNEdWRmRFWEZmVFpsMGdSWFFXRFpYVjVI?=
 =?utf-8?B?THFobHhlSTBIbkFsTDNtQVNLa0xUbklJT2VpYlQzczE1a2xod2tvME5oNHoz?=
 =?utf-8?B?bzhQOS9VbFdBdnhkbFROelQxRktRb2drckpSMXFsR2pnMHJEeUU1RVZQTmsz?=
 =?utf-8?B?Rkd5T0FYbVBpOUZYNjdJTU1TUlRHM25IZnFudVpib2VGZWFKTHJLVStEQ2Rr?=
 =?utf-8?B?VDc0RlZxTmg4NUNocXA0VzdYY3huYk10bXBoeFJ1cXFGdW0wRG9FNnR1TWFO?=
 =?utf-8?B?N2lnNUdoQWNEZ2JUSzdLcytjSFVPdFJqd2pJYTl3bWh0aUlxS1ZDdXpoY243?=
 =?utf-8?B?Q0ZrdFdGOVJWeFhTV3E3WnlHNkRsM3pFL083bFdOMnRGYUFidmtGQjM1bm5I?=
 =?utf-8?B?K1l5SFhXRXlweDFtK25VTUF5WSt2aGZzZVI2Wmg3K1VtL2pXa2FEa21naGJX?=
 =?utf-8?B?MUdMNkRSYUxWR2E1OFNXTnVnTkFzY1ZrTlczV0VTMHdCSmZlSEp3Y05pM1Jj?=
 =?utf-8?B?eElvYjRRYVNMdXFsM3VOVS9oaWdkQ05iU0grcVNrOGVXSmN2TWVrdWJWenMy?=
 =?utf-8?B?OWZ6SytxYXR5NWNpc2p1dGVGcS9LNjE0NHpxWGhMWDRnZ0oyQWtJOVdPb2FM?=
 =?utf-8?B?TGcwYWo2OFR4V0RrZjU3Q0tWYkhrRVN0djk4Nnlsa0Z2aGJzRWVKQ0pPbXRB?=
 =?utf-8?B?UEk4MGhBeEV3T0VIejhQbW0rQ2lVQUdkMnpmRFZHSnNMdTB3K3FtTHFRV0Nn?=
 =?utf-8?B?ZjZHZjZkYWJuN0krZW9VVFcxSUhPM0grY3FOQ0pGbWgrYTYyRC9Gd3BtdjEy?=
 =?utf-8?B?WUVYNzBUVmhlMEFBWENQVXFHWlFaR21hL1RRQThOQTJwaGl6Q3NHSXZxdmZq?=
 =?utf-8?B?M2Z6c1luU3UwRi9oSitvU015RkRnckFDTWNRWEFYTVkzZE16emtySXlQY245?=
 =?utf-8?B?RTJqWmFrQzRFRUczKzZmdnFzMWxjV2ZaeENwSXZnREMvSmRONnNwTC95Sy81?=
 =?utf-8?B?WGxZZUpGVWJOT0ZCRmdQaXlvVkRwWnliejl6aFpQQWFOODd0QUNmR1MxcEJN?=
 =?utf-8?B?K21QYXcxUUwwR2txOHQ1QUR2cTk0WDdjU3VrRmQvc0FMeHRxOE12bUdndnJY?=
 =?utf-8?B?RkJBcGEzU0lESlkxeUxkT2JRa3JzaGt0L242MTNKN1ZpbVV6aGJjWW5Qa3Vh?=
 =?utf-8?B?aVNYNTN1THBLcnZPdEJXbWtmR2huU2xWMXFxdk9kU0xZRHRaalJaemlqVFVr?=
 =?utf-8?B?NkFaZkZPY3dBL0RtbXJMOHFPSklDZWFQQldqTkFWZHFyd0RXNUYrbUdlSnpG?=
 =?utf-8?B?QWNOZXlNOWhVQWhQaEdaeG5ISkNJWG9VN0h4SlBJTWZFTXVxNkpzTStySXA0?=
 =?utf-8?B?U1NIajBxT1g3VzRYRHhtNUxxZWNqWndNSjFiOStHUEYwSzZvU0tad0Rtc1dm?=
 =?utf-8?B?NytoSDY1T1VsVDg4MGMxM0E3S0krZDZ5dGE1T0VwV3hneXpnOFJPYWRPS1c3?=
 =?utf-8?B?VlNjODdCcE5YYzQ2amJuMm00T2dnUTdlblc4cHdHNUM1VXEyUnMrVXR4M3A2?=
 =?utf-8?B?V0xkUzYrcUZ4c21zR1lja0RaUmZ5anlPTXdYV0dqdTVDZGVLY04vVndhdE85?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9276aa6-c94f-4f5d-d61a-08de288061a0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 22:01:39.6193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8yB/wNmMQT/vaLgTpt4V4ZGk7ZIZrhw+sBguUQp0zBBcP5xR4gNVgdEFiINnPUxCE2b7lKYwuCinzsDiJAaMHAFQ7N8uYWpVo+wkYbQQB1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5180
X-OriginatorOrg: intel.com

Hi Dave,

On 11/20/25 9:42 AM, Dave Martin wrote:
> On Thu, Nov 20, 2025 at 08:46:24AM -0800, Reinette Chatre wrote:
>> Hi Dave,
>>
>> On 10/31/25 8:41 AM, Dave Martin wrote:
>>> The control value parser for the MB resource currently coerces the
>>> memory bandwidth percentage value from userspace to be an exact
>>> multiple of the rdt_resource::resctrl_membw::bw_gran parameter.
>>>
>>> On MPAM systems, this results in somewhat worse-than-worst-case
>>> rounding, since the bandwidth granularity advertised to resctrl by the
>>> MPAM driver is in general only an approximation to the actual hardware
>>> granularity on these systems, and the hardware bandwidth allocation
>>> control value is not natively a percentage -- necessitating a further
>>> conversion in the resctrl_arch_update_domains() path, regardless of the
>>> conversion done at parse time.
>>>
>>> Allow the arch to provide its own parse-time conversion that is
>>> appropriate for the hardware, and move the existing conversion to x86.
>>> This will avoid accumulated error from rounding the value twice on MPAM
>>> systems.
>>>
>>> Clarify the documentation, but avoid overly exact promises.
>>>
>>> Clamping to bw_min and bw_max still feels generic: leave it in the core
>>> code, for now.
>>>
>>> No functional change.
>>
>> Please use max line length available. Changelogs have to conform before merge
>> and having patch ready saves this work.
> 
> Fixed.  Sorry, old habits die hard.
> 
> I won't bother with the tearoff text, though, it that's OK -- that
> won't go into git.

ok with me. I am not familiar with precedent in this regard to predict x86 maintainers'
preference. 

> 
> [...]
> 
>>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>>> index b7f35b07876a..fbbcf5421346 100644
>>> --- a/Documentation/filesystems/resctrl.rst
>>> +++ b/Documentation/filesystems/resctrl.rst
> 
> [...]
> 
>>> @@ -737,8 +736,10 @@ The minimum bandwidth percentage value for each cpu model is predefined
>>>  and can be looked up through "info/MB/min_bandwidth". The bandwidth
>>>  granularity that is allocated is also dependent on the cpu model and can
>>>  be looked up at "info/MB/bandwidth_gran". The available bandwidth
>>> -control steps are: min_bw + N * bw_gran. Intermediate values are rounded
>>> -to the next control step available on the hardware.
>>> +control steps are, approximately, min_bw + N * bw_gran.  The steps may
>>> +appear irregular due to rounding to an exact percentage: bw_gran is the
>>> +maximum interval between the percentage values corresponding to any two
>>> +adjacent steps in the hardware.
>>>  
>>>  The bandwidth throttling is a core specific mechanism on some of Intel
>>>  SKUs. Using a high bandwidth and a low bandwidth setting on two threads
>>
>> The documentation changes look good to me. Thank you.
> 
> OK, sounds good.
> 
> [...]
> 
>>> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
>>> index 0d0ef54fc4de..26e3f7c88c86 100644
>>> --- a/fs/resctrl/ctrlmondata.c
>>> +++ b/fs/resctrl/ctrlmondata.c
>>> @@ -35,8 +35,8 @@ typedef int (ctrlval_parser_t)(struct rdt_parse_data *data,
>>>  /*
>>>   * Check whether MBA bandwidth percentage value is correct. The value is
>>>   * checked against the minimum and max bandwidth values specified by the
>>> - * hardware. The allocated bandwidth percentage is rounded to the next
>>> - * control step available on the hardware.
>>> + * hardware. The allocated bandwidth percentage is converted as
>>> + * appropriate for consumption by the specific hardware driver.
>>
>> The text looks good but adjusting the right margin mid-paragraph seems unnecessary?
>>
> 
> I was trying to follow the prevailing line length; but I guess the
> lines existing lines were already shortened by flowing the text, so I
> misjudged it.
> 
> Fixed locally.
> 
> Is there a view on how to flow new text? (not so applicable here)
> 
> Keeping the lines a bit short (say, 72 chars) means that minor edits
> and typo fixes can be applied without extraneous diff noise most of the
> time.  I find reviewing an entire re-flowed paragraph annoying when
> there is really just a one-word change buried in the middle of it
> somewhere.
> 
> Equally, I try to avoid reflowing text for minor edits unless
> absolutely necessary; poking a few chars over 80 seems tolerable in
> that situation, but I prefer it not to go too far...

80 is not a strict rule. Latest comment from Boris in this regard can be
found in link below (made after he went through and reformatted most changelogs
in that resctrl series):
https://lore.kernel.org/lkml/20250916105447.GCaMlB976WLxHHeNMD@fat_crate.local/

> 
>>>   */
>>>  static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r)
>>>  {
>>> @@ -69,7 +69,7 @@ static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r)
>>>  		return false;
>>>  	}
>>>  
>>> -	*data = roundup(bw, (unsigned long)r->membw.bw_gran);
>>> +	*data = resctrl_arch_preconvert_bw(bw, r);
>>>  	return true;
>>>  }
>>>  
>>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>>> index a7d92718b653..1fb6e2118b61 100644
>>> --- a/include/linux/resctrl.h
>>> +++ b/include/linux/resctrl.h
>>> @@ -485,6 +485,20 @@ bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
>>>   */
>>>  int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
>>>  
>>> +/*
>>> + * Convert a bandwidth control value to the appropriate form for
>>> + * consumption by the hardware driver for resource r.
>>
>> When being as descriptive, please switch to proper kernel-doc instead. There are
>> a couple of examples for reference in this header file.
> 
> This comment was pretty trivial to begin with, but grew.
> 
>>> + *
>>> + * For example, it simplifies the x86 RDT implementation to round the
>>> + * value to a suitable step here and then treat the resulting value as
>>> + * opaque when programming the hardware MSRs later on.
>>
>> This "For example" can be dropped.
> 
> Done.
> 
>>> + *
>>> + * Architectures for which this pre-conversion hook is not useful
>>> + * should supply an implementation of this function that just returns
>>> + * val unmodified.
>>> + */
> 
> I've fleshed this out a little, as follows:
> 
> --8<--
> 
> /**
>  * resctrl_arch_preconvert_bw() - Convert a bandwidth control value to the
>  *				  appropriate form for consumption by the
>  *				  hardware driver for resource r.

This should be a short description. For example: "Prepare bandwidth value for arch use"
Longer description follows the argument descriptions.

>  * @val:	Control value written to the schemata file by userspace.

This can be more specific with: "Bandwidth control value ..."

>  * @r:		Resource whose schema was written.

This is where longer description is expected. For more details you can refer to
Documentation/doc-guide/kernel-doc.rst

>  *
>  * Return:	The converted value.
>  *
>  * It simplifies the x86 RDT implementation to round the value to a suitable
>  * step at parse time and then treat the resulting value as opaque when
>  * programming the hardware MSRs later on.  In this situation, this hook is the
>  * correct place to perform the conversion.

My apologies for not being specific. I meant that the entire x86 specific "For example"
paragraph can be dropped. Unless there are some quirks the architecture should watch out for
(which should be avoided) the focus should just be on what is expected from
architecture and/or insight to architecture how resctrl interacts with the call.
For example (using some of your text from other thread),

   Convert the user provided bandwidth control value to an appropriate form for
   consumption by the hardware driver for resource @r. Converted value is stored in
   rdt_ctrl_domain::staged_config[] for later consumption by resctrl_arch_update_domains().
   Is not called when MBA software controller is enabled.

>  *
>  * Architectures for which this pre-conversion hook is not useful should supply
>  * an implementation of this function that just returns @val unmodified.
>  */
> u32 resctrl_arch_preconvert_bw(u32 val, const struct rdt_resource *r);
> 
> -->8--
> 

Reinette

