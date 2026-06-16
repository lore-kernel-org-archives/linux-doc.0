Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9942853E9;
	Tue, 16 Jun 2026 23:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781652928; cv=fail; b=qrEDQ91KE8hpf4kCia89t3IrvTicxeLetrtBpXCPr5c/02R57IdNJI20s04H3UMkpVFTV7sifRZixt712Wg36B2WD4gRS7ZDt2EsqSjXggF8BZXP4SYVrKzeYC8yQGrEE+Z4x0+lBczKBol4xJqeKsvb+eVxGFqW4iWhTz3upCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781652928; c=relaxed/simple;
	bh=CmhpYV98M5tCieBZ5Pqb6u/KNQSRXd01Dqi5jbCNYgE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=id0iTDdQCACR6A2gs+YdOBEaZ387PpCNz/go1g98BpkQ9eiUgwKqWnwlUz7doGZ7wII0FqUmZKcfZLJps75WeFe+V0sR8qXSac97hjD3H+gWGogcs6iN7O/J2kagK7eGqHHfj+KEDmc4HInxi8g82Lrx5TotAJ2ROEsNXq0Apok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6FQgsEG; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6FQgsEG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781652927; x=1813188927;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CmhpYV98M5tCieBZ5Pqb6u/KNQSRXd01Dqi5jbCNYgE=;
  b=W6FQgsEGlDzf5tSNphK+PemN9mjsjc7EDbAXU53KiYOLedT1SrZlw+y5
   7kHxtSigqhf1980Lnzc/u1C4r49BMaJnjvpnMS0sbuPHknXxa3VhON9rl
   1Ng5BqNjd2hdpdT8fgfsRozuMt4NBrXdSQlRTSOWLRkv5FysY2Gg8yEPt
   rtweIY21ZwqYm0AumaRZr0afgPOX4+K+dNsAfspOJX9rbBZYxFqqMavei
   /Y41BgTMNUcTOynzCpjHuJhV3uyOukRVjAAS0lGpSBIjkZhdVyAzdu5nu
   ebokFsfmQ2eY1yCFypWlTVcM7ENNmged9IJkaKPltGnwRQhP88a6pT/8b
   A==;
X-CSE-ConnectionGUID: 9h4k+0OzTw6GqRxs26CuYA==
X-CSE-MsgGUID: juHm6mICRzKCB7vV9yayjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93105626"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="93105626"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:35:26 -0700
X-CSE-ConnectionGUID: IkHsMiQATHuw+qDQPHRqKw==
X-CSE-MsgGUID: u3eyWWb8QMy3nu3aWlrV6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="286019699"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:35:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:35:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 16:35:24 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:35:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stdIs0mEfz4Q1sunI+t2N9vPIt5gfwuzOoBcxeR+IQe95BU1YVj+R3JPsybEerTKs81R0NOrVCGhorPYq/49Svz0/ol4R6arCj7aa50Fo0oxB6dYLSescY3FotT/e8pqnJEjKFGHF3FXbvK4UeTHWe1+AZV2KNuPLe/0kxNLeFmOotWrbKb7nGj3/q7qWpEjHYlX7Dc0YsZpf1/AP9nmVK4wbshLAGPY+TLzq2bUdt8/CqcWuWsijIUwXKkqBpnkZqT8cGudbYlSewnqg4L1aRiDapEe8BlMSrishao5pJA7hAh84olP8JLTZb8L0+1cTLT+jr+iG8iJELmpTsKpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+44l27hKUvnUctPpW6uLoo5nEil/MKGVDsPV+MF5sCE=;
 b=hJlHKbEgNWLpo7Fu70Iy7lqO2kGxsqc4ZBqCgo09gb/EeBbWy9hqIgTMHi1xhmyRtwb+geDHv5JrsCuzEoM8b9xxjUhjnnqmYFEaJSrYurvMYn6TLGVvW5QZ/cqDpA1evF0vZDyOG6QS8Dz33MWkoTntsQDwF28JfejkwDeN78KSPpQKgJ4kibaUvQCItsYsyuiiIa7CpZY4Lqp/ZH6Mhss+ET9bVrOuh3PxK8RFusPipnN3expNQgOLa5t36Qzqx0urYEpFUxTfK8cNExOn8k4GCyhItXQl2dsn4mLaq5AxLS+4uMf4AGi4BO0yBuXs/Z+InkaDtY+wg438coAu2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ5PPFC35D45AFD.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::853) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 23:35:15 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.017; Tue, 16 Jun 2026
 23:35:15 +0000
Message-ID: <283777e6-679f-4f02-8342-47b0349e92db@intel.com>
Date: Tue, 16 Jun 2026 16:35:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] x86/resctrl: Initialize supported kernel modes
 for PLZA
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <mingo@redhat.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <rdunlap@infradead.org>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<lirongqing@baidu.com>, <paulmck@kernel.org>, <bhelgaas@google.com>,
	<seanjc@google.com>, <alexandre.chartre@oracle.com>, <yazen.ghannam@amd.com>,
	<peterz@infradead.org>, <chang.seok.bae@intel.com>, <kim.phillips@amd.com>,
	<xin@zytor.com>, <naveen@kernel.org>, <thomas.lendacky@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <cover.1777591496.git.babu.moger@amd.com>
 <95188117225c9235be89753edcace115cf5c2e5f.1777591497.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <95188117225c9235be89753edcace115cf5c2e5f.1777591497.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0191.namprd04.prod.outlook.com
 (2603:10b6:303:86::16) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ5PPFC35D45AFD:EE_
X-MS-Office365-Filtering-Correlation-Id: a98e8a3b-94a7-4e22-ff90-08decbffeb3c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: fmW+LtJKTyFWl5jpr8YMvM3lRE3kwwn3fAMBzxOzC+AFKTN9M+MwiI0M5FYAtsohjF1HJ10Hf5K3RGuDXxEqTk3fdN2w1pKuTauzNa3FnzgC9f49odxUEPx376HWIeJp6z3TzMDHqEtN4fX1xM9PUX7oEFxvMJ0w2gKyN9DrLPic7SDJea3+qjswPv9lH8kE/8DQUD7GM2aCA5tTgmvwEtCR6ao4jAD5uDpOO1tWyuymXXDr86mZbgjYVXdECeAzLX5LkCXodRl5x9+Acjm/0fUvZGmZvqBwwkVcIOHYyoGzNmlJtvlUsMzd7QzaacbmD+KD7XFx2/qW2yoRs89AtyEA+wrhC2cMIhCVtQGZSKJCvaxzaH6SP5iPCw/AnmY0cFVhOO71SdpRou4rmwdKqw+KOvp5mYcpsylabt+25GldPZzC7yh4La6lWwmZisXzXFR9+5wfxDA2O583Bnk2JALHpiSJca5LjnYrMtJRV7i9mWfWJe0CAxjEVSfFJ3GyilB4vTYOP8cePbxdNKuriTNrJM79jxRfKRh1bjaoS5BFW6vxKBkDWShvcf7TtQLvHrrK9BMXzxcmXFJ8ag31/3JIPBDBuQ9CiPX/PGNT6a9KvKNB12V9iDnWc/TCz6mn4BPdry0zl/KDziYOdLc/NUx1VQ2/Og1P1/8jyXsZbTizvLovfBkCJSDFzfULcjVD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0VhYUJ2T1ZycWZqVDNscUVKcHlOSTNrQ0V1Ync0QWhHRVFHVUU3V25nYmRp?=
 =?utf-8?B?ZXo5SzlES3RCUzhwTER2OXMza1AySFBpK2VQVElpM0lkWG9FbU8xV2F6aFFH?=
 =?utf-8?B?eXJ1d2ZaY2R0RUp1amw3YU56SzM1VkdIQ0lhL2xmS2tRdDE4anpLM0pVVVIx?=
 =?utf-8?B?RUl4VDExUWlhQ01LOTBrU0duTG0xZStuOXIyUnhWdDlPaElVVFZzZmZOYmp4?=
 =?utf-8?B?VVJVMC9GSVR6elYrTzRxRDhyYnUyY2FiK0NESEpwOFAzeVh0ZU5zL3dXajRk?=
 =?utf-8?B?NW14ZGpjWjJKWUdSdFQ5UlZUWFRCRnI3aXJlK3NqcVFkTXR3a0N5OE8wYk41?=
 =?utf-8?B?R3h2ZWNlTGEvMk16YzNzczFxdFk2OU5UQk1wa2pVckJGaGpnc1hvcWQ3ZHhG?=
 =?utf-8?B?cDdJam5iN2NmQ2NnMnZVOUJ5NkdMY3ZLY3NuSE9JV1pMNEh2V2lHZmxzSnpw?=
 =?utf-8?B?aU8zYnRlMWVMd3o5SGFKVm5reXhtc2ttbkRZejlVQ09aTC9MVk1yLzNRcXIz?=
 =?utf-8?B?am9ZRWtoMmZhOWZJY1VuRzU5aEloTEl4Vm00RnUzK09RQkwzWFlzUWNPSENC?=
 =?utf-8?B?VXN3WldUand6UlZZL1JDUjJxVGxwWDJFQWJ4d3RJT24zdXo4STZ4eVc0a2NZ?=
 =?utf-8?B?UEIzOHFyMGNWa1RHWHhmTUZmTWhaVjR5bjdTakZmR3VheEdPTUs5eFk1VUtx?=
 =?utf-8?B?aEsxSWZiMG0wMTZNZFpXOEJGYjZqNkdzRk1oNVY4MHlnVitFUU9MdGdua2NC?=
 =?utf-8?B?ZnEyT2Qwb29mcEcyZVkrUmRjbWVKdkdBdmJ0RW1CbzlrMTBueWxmMy9MODVT?=
 =?utf-8?B?c0d0aTc0bFZNb2E3SWpxUTJaOWhVRy9WZURFb21ka0piRTZpTjB0U0ZGOXlv?=
 =?utf-8?B?SElqOGdaN2JvQVBTMUc0WWVFUGdhWkZMcW1CTmo3UE5tQVBEdVJHL1loMXZn?=
 =?utf-8?B?Tk53ZFVBOFBoS3JjaXJWTFBnU2dydHR5ZEhSL3FSU09SL29QOTdKUDMzTjJE?=
 =?utf-8?B?d2Q5K1k2MU1LVjh4ckdIcDN0YWVmV1ZvSW9Fa3MyRG5abFJMR0VUSlR4dE9h?=
 =?utf-8?B?NlRpSW9oUk9yWC9pSC83S2RVemNmSzBaalVRSTRYRkk3M0NYalJ1RVphL1pF?=
 =?utf-8?B?UGpQbFhSSkJmcjA5RVFzbUJJQkJHdS9PMHRKSStBb2tUb3QxRDlxb3FKdVZ0?=
 =?utf-8?B?VnBGb2R0clZYWlRGL21JMmxSL1hxdGJzVmkvSUF0TWFPNjREYzFHT0V5ZUJN?=
 =?utf-8?B?bGtFN3UyU2NrSXZnVzB2Y2Q5S2pSUXNhNFdjT3pwWmpYUVp1K2N5STFSaUZG?=
 =?utf-8?B?V0dLRnE2T2FWUGFxSHNoR2daWTZmOWhZS1l1dGdId3NHL2d0ZUlUUzNHZ1Zm?=
 =?utf-8?B?TUZIdjJwc0M5L01yYUM1dndtRXFKZTFUa0p5UXFkc0RUV2ZPa2d0WFJlL3R0?=
 =?utf-8?B?YnVvazZrR1orVzc3b2NBTUJOVmlkWCtRaEpzY1J4WC9sVWxGcndqYlJoWDlG?=
 =?utf-8?B?aGtIQ1RuOVFNWFdyYUhSQVJFZkRuSEhSZlZDUlBtamVubFhSZEtLRXF1ekZS?=
 =?utf-8?B?SlpKekFlSFNNd01UVnJXSDJJbkJISjFYUU5admR5U0ZEMlVEZ0RzV244bHpM?=
 =?utf-8?B?WUpkVEdXOXYxa1d4ZHFjRU5mZ1ppSGNRT1ArSWl2bmR2a1pydzBRcUVzMnZh?=
 =?utf-8?B?R2doYnBKMkR4RTRHZlN5cFd0d2wzZ0hZMjNoTTUyNFRMMUFpa2RkaTVqcXZE?=
 =?utf-8?B?UUN0eWt5UUg4Z1pVTFNWNEppSFVkT2xOeTY2QXdUR01RMWx2Ykd0QjRWaTNW?=
 =?utf-8?B?N0tUVkxCbXk5TDljMWNtbFVrY09iZmY1am9JS3NwTWVsN0EzOVJmc3o1L08w?=
 =?utf-8?B?YUhMUDZHOTR6T1c0MC9QVjQ4aVl1YWtnOUJBU0RLOFN1OUxhcDJTNzNaRHVz?=
 =?utf-8?B?QlBmbkJFN2RNdVNLWVV3UWszOEdDODRGaDBWcEpkZFBjSk1mTUNSWHl6SWY2?=
 =?utf-8?B?Y1JtdHg5dmRSUUJYd1dLVlVkZ1FYWnBjSE9EQ0NkdGJOV3lkb1RReEdOMGg5?=
 =?utf-8?B?TDFqbTRBYnZHK0hjUmVWa29MSzRiUmZnWkFWK3VFWkRXNExoV01XWmJoNzBs?=
 =?utf-8?B?QlRXL0lJcU9USWwwVThLS2lsNXJSYU42UWt0VWhDcjRJOUkwenFhZHEvY1dM?=
 =?utf-8?B?aEdJamNhQnZrSVdKSUlCWkFlNEdRTEo3NjgrRnEwaDJEVjQrN2czS2ZlUkRJ?=
 =?utf-8?B?NC9LTmtBMkxJN3RBWDM2WWJTM3B2bldkN1Fya1JRY1B1U2kxRjFYSDRIT1pV?=
 =?utf-8?B?dDJHRkhuTXJqKzRaWjRrVHdHbFZLakZ5Qm4xUDF5S01Fem5HVUZIODU2NzFG?=
 =?utf-8?Q?xM7tGuX9p+XghhLo=3D?=
X-Exchange-RoutingPolicyChecked: CvBxqixWSOPj/DiJetTYKeQpC8eS0sJZM0Yaw7oZBb+DnkLZswc9NhTYWUZacZ0rsaSOK+KR5Ugy1ZCBta12R27pGChb5IAEmLt3mrb6c+4qMyB/xUvIgwR9UD4eRkK3LhbcGOCiUWZZeixkok07W0CuqbDfnDUL4lw7gUz5f4HN4uy6m8kYRlonnBm1buVbm+SM3ndJWjyCjnez8/meNVqRaEuhF01qqnRx5XS6lDwj4ezF709zIgPUxw/DIAJPLH2et2C20A/3KkT5QHjWj8mqXO4cf88i7SMAPxhjb2htjSa1DUpoRGtHdre5GR3BNL6eEZxWytrjW5Wp29KR6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: a98e8a3b-94a7-4e22-ff90-08decbffeb3c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 23:35:15.8416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNfVSsxgB1hXDnyn78FgvzhPK1sTNijvq3W5KRB8AoQSwOucO3i9rU3ivyqM7ShISSGn1Z0XW7dBsdgNOGiexEtJTa8Kt4SO+Ewlfd0oE4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC35D45AFD
X-OriginatorOrg: intel.com

Hi Babu,

On 4/30/26 4:24 PM, Babu Moger wrote:
> Resctrl subsystem tracks which kernel-mode CLOSID/RMID policies the
> platform can offer via struct resctrl_kmode_cfg and
> resctrl_arch_get_kmode_support(). AMD PLZA (Privilege Level Zero
> Association) is the x86 feature that allows kernel traffic to use an
> assigned CLOSID alone or CLOSID and RMID together.
> 
> Report the available kernel-modes when x86 PLZA is enabled.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v3: New patch to report all the supported kernel mode by arch.
> ---
>  arch/x86/kernel/cpu/resctrl/core.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 4a8717157e3e..699d8bb82875 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -894,6 +894,21 @@ bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
>  	}
>  }
>  
> +/**
> + * resctrl_arch_get_kmode_support() - x86: record which kernel-mode policies hardware supports
> + * @kcfg:	Cumulative snapshot; OR bits into @kcfg->kmode (see &struct resctrl_kmode_cfg).

If this is intended to be a cumulative snapshot this is a very subtle requirement
for architectures to "do the right thing" here. To make this more robust I think it will be
simpler if resctrl fs boots with resctrl_kcfg initialized to expected defaults. 
Instead of this callback resctrl can add resctrl_set_kmode_support(u32 kmodes)
that the architecture *may* use to further initialize the kmodes supported by it. This
function is implemented by resctrl fs, instead of architecture, and it can fail if
architecture does not support INHERIT_CTRL_AND_MON. This will help to keep
struct resctrl_kmode_cfg private to resctrl fs while enforcing any assumptions about
which modes are required to be supported.

> + *
> + * When PLZA is present (CPUID X86_FEATURE_PLZA), the kernel may assign a CLOSID
> + * for kernel work alone or assign CLOSID and RMID together.  Advertise both
> + * assign-style modes in @kcfg->kmode using &enum resctrl_kernel_modes indices.
> + */
> +void resctrl_arch_get_kmode_support(struct resctrl_kmode_cfg *kcfg)
> +{
> +	if (rdt_cpu_has(X86_FEATURE_PLZA))
> +		kcfg->kmode |= BIT(GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU) |
> +				BIT(GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
> +}
> +
>  static __init bool get_mem_config(void)
>  {
>  	struct rdt_hw_resource *hw_res = &rdt_resources_all[RDT_RESOURCE_MBA];

Reinette
