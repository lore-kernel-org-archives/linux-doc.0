Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E94F175A76;
	Tue, 11 Aug 2026 03:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786419054; cv=fail; b=rZa/HYLQhUoBztAODwD6So0aIa4PPQ3948ULeMq5SbOqeB/906CnMvrAdm+6L0Kvoh+jJvIbVaeOm4k4Le6f8ECv++dFoPyt/HYB/zySHqVKnGAv+zHpFnEPeeiRoXXqH2vbpmd6pbJrVj5gkcuoUEhc54DyJ7dFq32/S0f6/kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786419054; c=relaxed/simple;
	bh=5hWh9MDygGyF3ieMojClc/Qjl+iZrUbM8lY0T+LvGdA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IFVXzw3Uj4y2swrsnqR4EJ9BIKW+ojPaLsFPhHChyprXjlDbMH47ioq5uBXhFg0cOu0GtkdERl5zzW8u3RHfyDIc7nY+QGN+QP8hGfvWbIrq7GZKl7GSjChXgsJE/8eWAoK2zf3tLkL4lc+q+qbk9TpgDKseUQ8BBW8vTJLXPCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1wo7Wb4; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1wo7Wb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786419052; x=1817955052;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5hWh9MDygGyF3ieMojClc/Qjl+iZrUbM8lY0T+LvGdA=;
  b=J1wo7Wb4nShv5WcsguPHRnDMYCAs4jftKJywVz+5CqrmL1ytOEmChTMp
   +eITpFD+q+I6639Ufqk/njyue9NMigxyAVEJa5CLXbBb8sPr+OgPW9A1j
   quwHCKa8VZ9d20SHYg1MnoDAe6xBEYbjTD1o+EVp+jwI23LkVMtaLJKhq
   LCaglG81rSrhe5gRLultOC/PiP6yIzjsiTTkhuMFWWVkgyg3fe+gzx45p
   tAQSq//LwVFaKhEwwGHPDd4HujlG6td0L27h3JJqBlzraFnxWZRIxvr+n
   xE6ymS1Xi1defH7kUsRxnFTuUzHJm67QODD66ZOds0gntPO/Zh7bq//82
   A==;
X-CSE-ConnectionGUID: xIaiuOVTRvm/pfK/x66c+w==
X-CSE-MsgGUID: MVNRZ4BVRwatpSktQZxpWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="90758201"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="90758201"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:30:50 -0700
X-CSE-ConnectionGUID: 5pJjJLRaS8CuGEDWts68nQ==
X-CSE-MsgGUID: BhLzc1sVR+C5HKQSqlR1tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="293158344"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:30:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:30:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 20:30:49 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:30:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mc+06xFpQa16GGjKxviZuNVVEvx6/0FAX4fcRlE8oVfHQygmUjs6aIfgeja96SRVto5zOW829mqWuNsF72ZlYs8KAKjGCaArYIOW833VGsomLkdo+ikPcUMfsdxXWfhjWt5+PMxqAfWj771GG9QclA39Z66/jTDSI13xr64G2uZ1FYYS3gHV5PT98j3KenBmHbswZ8IP+SUwYUV3hOX5f8QwAU9oAC3p0tuIXji05Wd0ljxqi9z6BFbwb/Ut/PsjVQoiKzzJKt1al8VDLgefm10gQpSsqQPh1Otu5HnyuA3o0xK0k4AD7jjoKET8eWsulVpQpPZ0njKmaJBU9itkdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRHFPCEY3fa7QfVjrDmKeQWuB94xlU6EabIWcLarDp4=;
 b=Qsh29SsgrKeYPEj3kkuh1Ymh+8c0u6P/lX1QU5o4Y7VeMB28Vtw0Hf4KLnillqdMy1eH1fmMApPN1ZXRAcbxmlarS3nz7P/R9qmTx11PgmI5v8BScpU3Cy9jmv13BR4itdPaqZrnDB98QfRMxa7TB+9mk5NZhyCM+C66taxSz9ska/LJ+QWRK1wOQfH+BDecv2fUBYrIXw2ixzlTIxwVeg8hXUeyFC+m7H54r/mIJDx0DRIXHrem/ZhpI1FkRASD13vFGI4xfDqmV7Xyfo2RSoeIvktsyuPqWgrO75peCcwsaRk8WSNJZe/DIjeNlzXzonCaQzJIJ61IVyulWbgH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA1PR11MB6919.namprd11.prod.outlook.com (2603:10b6:806:2bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 03:30:36 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 03:30:36 +0000
Message-ID: <0126a5e5-48cf-416f-a21b-c231a703c18b@intel.com>
Date: Mon, 10 Aug 2026 20:30:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 12/15] fs/resctrl: Hide kmode_cpus[_list] on
 groups not bound to kernel-mode
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
 <8cfc12d1f79cf649633de01c5878ce5ab777a58b.1783461016.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <8cfc12d1f79cf649633de01c5878ce5ab777a58b.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0271.namprd04.prod.outlook.com
 (2603:10b6:303:89::6) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA1PR11MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 4172bf4b-4a7a-4a89-e7d4-08def758e844
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|22082099003|18002099003|11063799006|5023799004|56012099006|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: DeBdJf5OhzedIxvWMP1qJ7Seb0F8uFJFnHOIlORGzmSAbncTH16NSP1P1kgM1qFXjChMqm4dtt5WFvuD4j6f1kAPsz5Or9CBQCt4aWsSHo0QZf47fHvu2n7YYltBSctG+rDO+f9St/ei7HXLY4PSRZWdmq5yZWXX22tyQo6dU6GgChShBRIxcYNsif2Li+FKTORQCQN1Pk93vhMzm27tNYL0kgJZ5SY8zqGB1SEwBoumOB7jFfn5n20Zjd6rL3QMj/2L2nfucuF6q7dQYIe2ESq6XVlhcZzI4msqeSpVxMTknXzS8eLo2rBtXf2pdpxfZiz/mF2TWPAdGidzD+hAruonPDC40C+oaqlt/a7HCiqAr+V53yyNBH1KznA+25xv80aekgu8mf1mhUJFH5GvxqSXAgkH+mpEOUJKLFu5dY7gB7WT9hrdt3lVvdTWCItrathHLnC3ijoI9lMzwJeaxBN8D6M00mC4kE7yW1eImAfKhnh72JZnkVIsZmPU800Ja/+l4V3DlcPdiKgwz9SUTJZ4GXrixVAZqxNkGvYwBgdmVxjbigpdrGZygeO6NKAxkSPJx7Pu8Ix37AyI+jWWGAWJCZ71AUIcX1tIsdkW2cEFyaIxPyCxpePJFxCF0ui/xbgVtLTx+u57QafEZtcYVJpMZ6J+tbj9cfFqsl0/b50=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(6133799003)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVdKbGdFeGpObVpXclhsL3VxK2p4WjFGN2ZuQXFDOXhTMDhqK1FxMWgyZW1S?=
 =?utf-8?B?QVNOS1ZKdWF4a3RPMWRyQi8raER4Z29HcWVKNVpZMjVoWmJONzh6eTVyZnhm?=
 =?utf-8?B?TmlCd01VVmllUTNMcU9tZkdKZFJsWjhKeG8rOGVVSzVlc3RrL1dpaTdSN3Fq?=
 =?utf-8?B?UFB2bnBwRkJucFljYmUxUU90L0VCNktVSHJVV29CY293VnAyaGlxWS80eUl4?=
 =?utf-8?B?cEliSUNCUjlJeC9Fb2NGdk0zK1RkV0UrUThhdEN1ZHQ2MXpkRG14c2RJM0du?=
 =?utf-8?B?Nlh2K2dUTm8rN1ZSRDAvNlN1Zklwb1VOV0pFMFlBb2JPL2FodDhzNHkvd3Js?=
 =?utf-8?B?Q21zY0hYK3c4L3hsazdXTkZydjRGQkFuZDA5Qi9IUEVlNzlvRHRMaGUySFZa?=
 =?utf-8?B?SjVsRitjT3JVdGhHZDFocXZrUkZxOHVFcE1wM3JmdkxXRDZXWVo4Smxza1Jv?=
 =?utf-8?B?b0hWclg1OFlmMmY1V3poRjRoZGJ5a2ZxUzkvNERqVk9tUkhJQU10dUdqL01n?=
 =?utf-8?B?NDVuczIxOC9TSHh6a2NFVUlHaEpIaTlkenByVFBJczMwMFZXOU1JcUNING1P?=
 =?utf-8?B?OStIRjh1S28vOWZpQmVJaVFEdUlmMG5lQTRYWjJIMmtrQm8xZEZYOGdtWWNi?=
 =?utf-8?B?OEpTd29zZlQxUmZxNmlnaVc1SkxkS2Y4bGs1M1ozbGozY1plZmxNeGl4bWt0?=
 =?utf-8?B?d29NSnlVVHhzNERDeVp1Y3FEOXU5eEx6RWZNUVFWSjJvdmUvKzBYL0puUWJT?=
 =?utf-8?B?MU9WeXZEdTRwL3pWRGtNNFZXU1dINmtFVXBtNWwrM1RJSkI3cllBeUZ5eHk4?=
 =?utf-8?B?c1M3aGhoRTRjUTNzT1phRGY2MXhNT1lySDhzWFJmYTNOM2tJYjRDMHF3NzAw?=
 =?utf-8?B?T0NCQUljM2hpNE80Y2dITzdSdGtRTDh2MkVGcnFDRVlTVlBXakZ1SkQ3K1hW?=
 =?utf-8?B?K2pOOFU1eG9RbW04U0xoVTZCclZmL0paR1NCUmlOL0R2Yk5oQjEvU29rQ0U4?=
 =?utf-8?B?N1ZLaDBBSENKVkU2cHlBS2U5dzBvVGVzVkpOMXMyNFRMaUI1bGRSZWVKWkNR?=
 =?utf-8?B?aWdUUTRqbVk1Rlp3Y1U5bzJEMkJCYlVrL0VubGsxMTZvS0p2VXR0YmVjbm1k?=
 =?utf-8?B?QmtrRGNEVzlTTVNKRGkxTnBocjFXbnNIWFR5alpNNWtxMkRiWHFSbWRHOUh6?=
 =?utf-8?B?UmZGUGlLcVFIV3psYnFsZ0lyNndDZFY2cWZXc3VwZkVBT3pVT2xwdlVZRTFJ?=
 =?utf-8?B?RnY4NGpMclNMeEJnUm9rbXdGUER6ZTJGRzg1cW9YUlJEUkc0eVZla00wems3?=
 =?utf-8?B?S3FOa3B3Q3k3aFBCekl2Q1cweXNWVXQvK216TXc4Rm5ITU5BZzR2QTRFZkdy?=
 =?utf-8?B?akgxa2dJRzBwd1JLS3RpamlGYVY5ckRmdzNQT0RFcGwxVXNtbER4UVdTdWRy?=
 =?utf-8?B?RTVtWk9jSzYvdTNwQVJQeXk5MEw4TTY4Q0tsd1Q3R3Z4TjNpeGJuazJRSTlE?=
 =?utf-8?B?S213d1MvdWMzTTJPbFZQZFp6Y0pVU3RNY2RvVHNPSGErOGhOWFpRSWUyZUkr?=
 =?utf-8?B?M3Z6a1AxblJKcDdpQ1c0U253UmI4dCthN2VDdzU0QUNyWS8vMjBPeC9OY3lU?=
 =?utf-8?B?bmNSRnY2R2k2TnJrbkk2Y1o5SlA3ZkIyS3hIb0F0dGNpNTBjcmdWczJlY2VI?=
 =?utf-8?B?ZWZlVnhLdXdTelhFWVU0a3ZZT2hZMURLczc5c3NVVXZhY1lUY01PZTRCOUZU?=
 =?utf-8?B?VURSeThoRU5YYXpyUVpSVm5IWWJGbGZkaDZJeWovM0VVUGl5eGhiaVZzZ3ls?=
 =?utf-8?B?Z2w3M0xKeVJrTnJEMnpIa09HUTdQSWlpcjZFaW9BMS9Pbzhqcm5LcWJJdWZl?=
 =?utf-8?B?M1cxcFRZTHVCSE43OHZHeEVmZ0FZcjk2dWo1SW1LMEl5QmZ3VG8rUHJMb0kr?=
 =?utf-8?B?VUJYc2NWbkc4NnZHbFFrdDhKTkhVeUxJOTBHZDlnL1dXMzQ5QzFaS2l3clBW?=
 =?utf-8?B?MnhRWjk0U3JEeSthY3NQNXN3RTdZeHVqeUJzYmFEYzRiTHVvTXZIUjA5ejM0?=
 =?utf-8?B?cnBsNlhZdGFvN1JOVHBEVTZhNGEzczZtV2duNVR5OFZBbFBITThaVmYrWm9K?=
 =?utf-8?B?L0dxaU5HKzNyQitvU1QzTS80S0FHcCsrSTZtNHBSNWEyUEJOUE1NMTgwTk04?=
 =?utf-8?B?QXBXSFA0ZCtSZ2lKKzk4S0g2bDhoUFhOT3M4UzdvblpPdFBKQ1VrYWxWZXA0?=
 =?utf-8?B?bHo1M1VkOUdhdWJYMmo4Wmx0cjVhbmtaVWt2bFpwb2VJdVZBMzU5SlptUHB1?=
 =?utf-8?B?MDA4TmhBZGEyRUdTdU82S1dJZE0zVCtScU82Z0Z4ZjU4SzZzcE9iZzVvM0xO?=
 =?utf-8?Q?9axU3PwS9ux1Fhlg=3D?=
X-Exchange-RoutingPolicyChecked: ac4BMt3qDdDnm/Lh8cdSbfUvNXl6w+Za+FLNNif/o6I1fKhXRzNb6ZCIaGwJ2DP2kXJ9spW2i8HfrPd+EaOmkBcCkOLnOuA+Kbx770YKU2AG6D9tKEopincU/pb1X08xVWcnKRI/L8uGvLrpk2cB/ntyItChz/D+1htFJGuxhp9wAoPjhz9Hkpny+/jmSAbyfeTeb1uLH5gu6/35EN31sLPq8xOZIpmysbJ47PhNgB8WhXLoxLvlww6Kgt0GWJW9AHMtsRj20yXd30R8455bRfmRmkEscLL9eintP1h+Hk5P6T8a4CN3vV+ZdrClvyIHTENQ1/+fAMSEpNQ3c4+8xw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4172bf4b-4a7a-4a89-e7d4-08def758e844
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 03:30:36.0633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKy0x4poWL5SMsCN09uQziXDn0CXegOUvMZ+yaQBEHFN4YsTVeiE3dK/6Bd1vVZX9CP2KTh7nCh84E3hP3o02Fg5bHLvEABO6fQjnpIGb+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6919
X-OriginatorOrg: intel.com

Hi Babu,

On 7/7/26 2:50 PM, Babu Moger wrote:
> kmode_cpus and kmode_cpus_list describe the CPU scope for the rdtgroup that
> owns the active kernel-mode binding. They are meaningful only for
> resctrl_kcfg.k_rdtgrp.
> 
> On groups that do not own the kernel-mode binding, they appear as inactive
> stubs and can let user space inspect or update state that does not apply to
> that group.
> 
> Hide kmode_cpus and kmode_cpus_list on groups that are not bound to
> kernel-mode. Keep the files hidden when groups are created, show them when
> rdtgroup_config_kmode() binds the group, and hide them again when the
> binding is released.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: Updated the changelog and code comments.
> 
> v3: New patch to hide/show "kmode_cpus" and "kmode_cpus_list" when kernel
>     modes binding changes.
> ---
>  fs/resctrl/rdtgroup.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 413d3ff14546..c537846d9264 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1127,6 +1127,35 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
>  	return ret;
>  }
>  
> +/**
> + * resctrl_kmode_files_set_visible() - Toggle visibility of the per-group
> + *		kernel-mode CPU files under @rdtgrp.
> + * @rdtgrp:	Resctrl group whose "kmode_cpus" / "kmode_cpus_list" files
> + *		should be hidden or shown.
> + * @visible:	%true to expose the files, %false to hide them via
> + *		kernfs_show().
> + *
> + * Each file is resolved independently as a sibling under @rdtgrp->kn.
> + * Failures from kernfs_find_and_get() are deliberately ignored, allowing
> + * callers to invoke this before activation, during group creation, or when
> + * the kernel-mode binding is updated.
> + */
> +static void resctrl_kmode_files_set_visible(struct rdtgroup *rdtgrp, bool visible)
> +{
> +	/* Keep in sync with res_common_files[] entries for these files. */
> +	static const char * const files[] = { "kmode_cpus", "kmode_cpus_list" };
> +	struct kernfs_node *kn;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(files); i++) {
> +		kn = kernfs_find_and_get(rdtgrp->kn, files[i]);
> +		if (!kn)
> +			continue;
> +		kernfs_show(kn, visible);
> +		kernfs_put(kn);
> +	}
> +}
> +
>  /**
>   * rdtgroup_config_kmode_reset() - Tear down the kernel-mode binding on @rdtgrp
>   * @rdtgrp:	Resctrl group whose kernel-mode binding is being released.
> @@ -1155,6 +1184,7 @@ static void rdtgroup_config_kmode_reset(struct rdtgroup *rdtgrp,
>  
>  out_clear:
>  	cpumask_clear(&rdtgrp->kmode_cpu_mask);
> +	resctrl_kmode_files_set_visible(rdtgrp, false);
>  	rdtgrp->kmode = false;
>  }
>  
> @@ -3068,6 +3098,7 @@ static int rdt_get_tree(struct fs_context *fc)
>  	if (ret)
>  		goto out_closid_exit;
>  
> +	resctrl_kmode_files_set_visible(&rdtgroup_default, false);
>  	kernfs_activate(rdtgroup_default.kn);
>  
>  	ret = rdtgroup_create_info_dir(rdtgroup_default.kn);
> @@ -4098,6 +4129,7 @@ static int rdtgroup_mkdir_mon(struct kernfs_node *parent_kn,
>  		goto out_unlock;
>  	}
>  
> +	resctrl_kmode_files_set_visible(rdtgrp, false);
>  	kernfs_activate(rdtgrp->kn);
>  
>  	/*
> @@ -4142,6 +4174,7 @@ static int rdtgroup_mkdir_ctrl_mon(struct kernfs_node *parent_kn,
>  	if (ret)
>  		goto out_closid_free;
>  
> +	resctrl_kmode_files_set_visible(rdtgrp, false);
>  	kernfs_activate(rdtgrp->kn);
>  
>  	ret = rdtgroup_init_alloc(rdtgrp);

Sprinkling these resctrl_kmode_files_set_visible() in every path that creates these files
seem error prone. Could this be simplified with a new, for example, rftype::create_hidden that
will instruct the file to be created hidden. This would just create the file correctly from the
beginning and eliminate these calls that go back and "fix things up" for kernel mode use. This may
also eliminate the need to ignore errors in resctrl_kmode_files_set_visible() making this
more robust while making it obvious how the file visibility is actually connected to the
kernel mode since that would be the only points where the file visibility is changed.

Reinette

