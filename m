Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A113F58C6;
	Mon,  6 Jul 2026 21:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783373616; cv=fail; b=JzuEao7qyI1w5qz0knFLfYBD08JaIlSZMhJaNT5I70iOMuXg7LSKBolkG9EjVX8jxexM7ZKITD58hZvq9yjofEbycuOdv0GfPjNldPNK95b6Zo7Gzt7CDXNLaiAdmMTNIocy8AYlxHgiaTZR2Qb92G1fnNel9/h8njPbhvKjuJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783373616; c=relaxed/simple;
	bh=D4fEVN/KeliWUZurR2xD/BB81l1M80prDV/wytM9vYo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GqvH85A2I7I5FZkWpBb3wM7Y7JIQTZ+JSjl0jVIJvwBhdMoVB4EH2RfyR/bqfbL+YosJZQzdlRLmLE/Kd+pz9pa9EIsgSwPh6K1pD8LK5e+yWGXfOT+h2o47j9QLcLjdlKryvOriwfWODO9E8/WCS0ryF/Qr4zWT4nqNmiM7NdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/y8M+xC; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/y8M+xC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783373614; x=1814909614;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D4fEVN/KeliWUZurR2xD/BB81l1M80prDV/wytM9vYo=;
  b=K/y8M+xCR9yGWVZpxFth/mvXI5bK0kRExjCoI8IO+k8AHaoDWR9x5LH7
   QcWch5s/0n0oseZ4S1pYpPNE1tJ+Xn7r3AYiPp8H3yV+WSjSM6aIsRelH
   dhlNyHVHYMpcx+Pz5kAZhwRn/UXcy8KJTPCsyVKZGdj7fl1PlpJr/weGN
   3z/qvHKXCdVyQ/nrCWrK29E2Rj64EtcBfKIjZ8rHB8jqqHMEkRjWfs2n9
   3APtoKsWwMGaOUfc0A47SVCK++OePgSgXomL3sSPe1PmKABjOHs7OAjVd
   fT7uEc+WfF79Ffqhn/V0QUiQsr1A1Td5nvRUSLxsW7H9ZQjLaUpEwtuA1
   w==;
X-CSE-ConnectionGUID: izd0p3WaQ+OztrXDjXCusw==
X-CSE-MsgGUID: BF6pNXcqSKGMmc2CwblXUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="87696893"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="87696893"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 14:33:34 -0700
X-CSE-ConnectionGUID: FiECwVLMQ+ejxmCDxrCDCw==
X-CSE-MsgGUID: 8zbEh2/XSEKEUFPryb1sxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="249828835"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 14:33:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 14:33:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 14:33:33 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 14:33:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dx8SaQyVuiioznKYW+ZWAeuJ0U5TOfdz5wgeWOGp0e/KEFlVP4vtDdB5xDl+Qc5Z+4OeIikEE0PUFCJnluAfT+Q57PqwbcjH1oRAgJJ4D6Cdsj9Q1BTEDdkEBQ9GYyBuiuj0ftSum6OU90z4W9mWdHXY7Tmv9NzyKd0DPOopmd9LgiEoF3ENoBS6Ky1vXudSn9HQ/q2XmeEWZYHKp6iMdtvvZfMgvSeEeYOLYMXFmPuK99aqPApRP5JHFHbiMBIarO6WOG1bBtRSwWExSCcVscIoGlzx12UCXx+WVYeMO8+llv7lxE3E06ZeAcyaGNW7M8dHQ/nDIqHquKPHq2Fmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfitGOsUZyC1sEeeo+s0ufB1ngEzWJL14+auf643IxM=;
 b=fPII5JYZf2lZvxwSf2/p0hufvIPfqNwGeHQSVK18GCpa8MRvLSvj0POiDJeEBSZTvGj6ExiaBu6cbxMY3tU2ao5aDGzrs2zVnaNomZV/epRju1umEm+jJOANUXrE8JJEhqaUbQtVvFURnoNXtRDguSdAw88eWgJCgvj9LshwSexGfz1hpWN/xgoP6geWVQU7bXLt+x5kp0d8MIiL8lIXlEbjDU5nNSp0zrtuMzhtrYPa5K/KPpu0xFtV6ocx8/IA5Hzp1F5fuAsZj3sCAFkXSsZp8H/Slqcv1WIZ1zc4NvFtA4Q1LymbCJUFdO4iItW4SK+6MbWD99Oo6fd6qT+NIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by BL1PR11MB5317.namprd11.prod.outlook.com (2603:10b6:208:309::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 21:33:30 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0159.018; Mon, 6 Jul 2026
 21:33:30 +0000
Message-ID: <4c520a28-9a72-4abd-8e5b-654a312c92fd@intel.com>
Date: Mon, 6 Jul 2026 14:33:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm_mpam: resctrl: Add pass-through
 resctrl_arch_preconvert_bw()
To: Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <corbet@lwn.net>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>, <dave.martin@arm.com>
References: <20260706160639.2136674-1-ben.horgan@arm.com>
 <20260706160639.2136674-3-ben.horgan@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260706160639.2136674-3-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:303:b8::27) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|BL1PR11MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: 83f5763c-e980-4509-39a9-08dedba6394c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|3023799007|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: EUBkjwESRE2sqKpv99Eci8G2fxsa7K0irS4OnJM2BTWEclDic3NdWTvpRB4aMMFIivzo/16JSlC9h1omZYAf1q94qU+j09zDv5TO/1dPzPefO9Q/EkkkN5e/tiazhm2W55nqXzunL0SIhOqO82CJOnvUO3Vmd1AwLqi28QbzPJzU21pMr6wFz+4QHxhjQy7YvInvGxmAU6kOBVoYZ9Bl6Tidz8OhKnsG0Krhgudn2Jxc6S8F7m742Zyzd3Q17iy4vnEzBAOpF8IpoX1RjbY7uAVDFGK0kOrMw1uq+JLC53DqCKzfh65XawhN7dElS9T9EO91axaDbOOEhG9IC7yMOpmXqkHyWh2g++PtZ6QQI2T90Y/5AHbTY7uMXDYFPuB+/VniAs98A00qaEuAbUwqrF+czvVQP48pnHGUzQB8OJE+teJGWXYa++5+h3DJD1jSsqPBEFUK+ddQhuswfJIbiW4JzbnaUf7becVQ8L7SbfPaHJ2uu2RwvdkjW1W54XGcBagwenFL23gwiijC3qJqq99goGoqTi7NCHPG7qZ1gyhG+NltxStl7co0elF0JcKZ+a0V+/MzvrYRRtB1uNMnhTjCQykef8AOC6cT2VDROoJlUeSqAK3sYzac0/qJ33UliteBByY7SpBH96hSzp2JSDnzHQBWXdcjvZSYXavX5r0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(3023799007)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDhDLzBFMXp5Ui9aUHl3ME5vV1REeGlFVDVwTHc3ektTYWpmUVR0U3BkTlg1?=
 =?utf-8?B?Nko3VGQ2emQ0T2syaWRKWFNwQjdBU3lBOTh5NXdjdlhobzg5ZHdmM2RxM09h?=
 =?utf-8?B?UHZZa1NpcWtycTZ4K0JwRGx5RllsNHQzejRUNnQ2NnpsOVl3bHFrZ3dWZ2Ev?=
 =?utf-8?B?YzVrM3F2WlNDT1BacHhCcDFUTlNMaHZBWGFITjE1bnk1WDdMbU9uT2ZFaGRa?=
 =?utf-8?B?WUNYbEhRMjUvc29yN3R0ZGdYU1dLQ0ovdE9ObTdlL2ZvUEFkRisvY0tMaFRH?=
 =?utf-8?B?WCthZGg2Qndydnp1VEE1UHI0b2x0azByeUtzYlN2UjZPdFl1UGRnT3p3UFNi?=
 =?utf-8?B?ZExUNzhrSkIwdmRGSUlaNXROY3JGN0lXWUxRSnJDa0dsSG9odzRFQUtXL2F5?=
 =?utf-8?B?MEJYK0JVanpUNTJsNFpEdkJ2cm9oeFVGZlA2Q0hRdDhyOGw5cUUwZVVjaUVC?=
 =?utf-8?B?UmZQOUFpVG12VGlScWVFanJId1doSWdrQ0MwV0ozVnlQZ2p1K0luOFNBZXhW?=
 =?utf-8?B?a0RJVENQYTlXS3ZZMGVVb1hEMmtaRWhkVFBFdzJCUitKOCt3MUdpOXFGdE9t?=
 =?utf-8?B?YmxBL3hqNnByQVJDZ2JnT3hBNGoyMVdvL3h1Y0EzQmJJN3RUMnl5MTcvRitM?=
 =?utf-8?B?UytvcGRyOWdFaWYvaTFYTXp0RXpkTzBlWWdaWExYNWh1YkFGT29zSnR4bXBC?=
 =?utf-8?B?WkpCbTEvZjl3d2tqUVdiYkVBbFVrcy9YaUtoK0VRcHFrUmlXVERtc1IzdHMz?=
 =?utf-8?B?T2J4cnd6Sm1zUnJXQzEvNnJaRjRSYUJLNUhNSkEvMklod3N2QWE4c1Z0Z2dV?=
 =?utf-8?B?SXRHQXBVcmRkMjJvRXlPcUNReE9rbzhpTWJWaWZNK0FJcHA1aE42Ulcxa2dz?=
 =?utf-8?B?OEZaMFBkZkRGaXZwdzd2YzV0YnB6aWhFcXBsaCtUOFZWUFhKK2hza25RZVBO?=
 =?utf-8?B?djQrUTdsSEZUNFNKNFJxMXV4MHgxNlg3bXk5YVVoYmxZT1pqNEdJemgyS1NF?=
 =?utf-8?B?eDFBWjVSWnI4TGhKK2U2YTZvSGszcHNhcC84N3IxZTd4Mk5HTXg5UmcyMlhQ?=
 =?utf-8?B?dUtFaDVHN1FyOFV5NDVIRGJCNXVlaWJtVXM1am50OU40QTlRMHkzNmhqYVdV?=
 =?utf-8?B?aGNCNVIwQTFNQllsekRsRU0zbzYwTEYxeXp0Ym9IVU5CQksyVVJYeS9Xazk3?=
 =?utf-8?B?UjFWQVY4dHpJbGxyZDZWL1RsMVJNMHY3Y1Y0cmdqOWo3dlBtSVF5T1JScVps?=
 =?utf-8?B?eElJRnltTlJiaHhIaEQ5R1l0bEpMQXBNa0hVS0R5dkVlWlVNa2tOVmFZUVZI?=
 =?utf-8?B?dFlGcC9rKzltS2Vldmh3VFJQbHdBVDlTZFRUZDRDREpzOEx6U084RXpsbjg1?=
 =?utf-8?B?TEV3NG5LV1dMK2pEczlUM2owSno2ZkZBOEFtSTkzYTVDRlQxNHgxUUUrY1FZ?=
 =?utf-8?B?TmE4Q1liMytoUGR6djhESGYyaXY5dEFJR2s0QnpwT3k4ZWVPemt4OU9yZmln?=
 =?utf-8?B?WndTYTZuYXVxN3M1QUlLTk1OdEQxSjVaSkVIcmdsQk5uc0QvTWZNUUczOWI4?=
 =?utf-8?B?QzhEU1FkWDFyNFJaOW9RY3pUZFZoZlg3a0M2bUFodWFSeVVuNU1PQTI1eWJt?=
 =?utf-8?B?cFJMZ2VMRUF2b25ubStVRnNBU0NhVUN1TG1ZUUkybWIya2x1L05JNW8wRnJX?=
 =?utf-8?B?WE9qZm9RYW5sU09DR0RsK00zTENrZDN1eGVsTW15TVV1dTRMTVNZLzNlenFR?=
 =?utf-8?B?ejc2cERFREJHTmNOT2JGTnlmWHFVUnBhU1hxdDU3eWdaSzYzOXJHT28wd1B5?=
 =?utf-8?B?emVDUy96YTU3RFVnVWQ4eHpJMUkzTGorQUx5UjZEemtvVVlYZ2dHZVNLVXIr?=
 =?utf-8?B?cU9aR0oyQVdPZTBLZjE0NE40dldjajFqS2tLRlp3UVB2U29lNS9DZVk4Z3ha?=
 =?utf-8?B?QWgwRnV5VUEvbEgvTlRoMkRmZDU3ODZyVGV2aHNKWUhBL1M3ZDJvYXEwTmVO?=
 =?utf-8?B?djhEb3BnaitDN0t0eG5TYkd4NTN2RjVoODZlUEgrMlA5R3daQ1VmSk5yejBi?=
 =?utf-8?B?ajB0MjV1MGJDd0dtMnpQNTJDTitYZDJhTmszd0JPYkk3eGJjaGpFZmxONkxX?=
 =?utf-8?B?NHBIalhWYml2Mm9oYnN4UU5IeVBwb2JkL0FmNDRxMFdNdkp2Yml4QWxidnhl?=
 =?utf-8?B?MGJoejVIdmF2TFZaK1VQTldRb3o4MG5jeVhWZ1Z4WDVkbTJSSDRzY1NLNFM0?=
 =?utf-8?B?R0ZzbWVaZnRTd1lxOTRna0FQUGNkbFdScG5mMGFSN2VSZ0JpQTFpd1VTc2J1?=
 =?utf-8?B?QzJYNjVVZ0hkblZuTzIxTTZQVGcrcVNrUXJRUTZKYVVEcHI1VWltenFIS04r?=
 =?utf-8?Q?n6FzPUuSqnZJ0q6s=3D?=
X-Exchange-RoutingPolicyChecked: OdBu9b5XSv/IgmETrVoIUXamsyTdR3G7hLOaswRaJqXEShqrPgBrpi43XbTwYoFM1836KAN13p6pCmcrt9KcLWInjIVbRbjQZSL83ULgFkc9adywpolcEXFOgeGtuceCAj0zCPXAkM5DLlQeaMvs8szGFcuOmSNpYohiyRM6oyKE+zOvoREsrB2YjU/D+dlb6gszM6CIil1u+3+5cVxk8zOqpr6sViaSfDckZ8Pn2IKde1bZmVIrVarO9/n/78qDxbIiSCKj2+UkirUTIfisIgtZ8bpbyGXeDSRmWRA5z4vkMbYSnSdcg5P5TTpXWHg5BRIQPsOXt+b1XFJH5iioBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f5763c-e980-4509-39a9-08dedba6394c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 21:33:30.6509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E52P+IUuUjYWEvYED5OoxnGY+Zf/p30ssTGO6QjubRpY8KHg73M1uiysIAT4a7TAMHV4zfF1YujHtWOpFF3dxo6rq9C462ql++Nmrz67wYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5317
X-OriginatorOrg: intel.com

Hi Ben,

On 7/6/26 9:06 AM, Ben Horgan wrote:
> resctrl rounds up the percentage value of the MBA based on the bw_gran. As
> MPAM uses a binary fixed point fraction format for MBA rather than a
> decimal percentage, this introduces rounding errors.
> 
> Without this additional rounding, if the user reads the value in an MB
> schema and then writes it back to the schema, the value in hardware won't
> change. However, with this additional rounding, this guarantee is broken
> for systems with mbw_wd < 7.
> 
> resctrl is introducing resctrl_arch_preconvert_bw() to allow the arch code
> to specify the conversion resctrl does to the user-provided bandwidth
> value. Add the MPAM version of resctrl_arch_preconvert_bw(). This does no
> conversion.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> 

Unfortunately the "---" separator is missing here.

> Changes since v3:
> Parameter order switch (Reinette)
> Add Reinette's R-b
> ---
Reinette
