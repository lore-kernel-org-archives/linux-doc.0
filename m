Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C603F9F28;
	Tue,  4 Aug 2026 22:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785881439; cv=fail; b=s9Y92rAWjCeKOd8Egs49BpN4yy+HJ+ecNOQ2MgOFgB/AZbh7wh08GklY3+T70l3obCMLIUzo6g0Wr4P0iVVzENlASVY2e9qokbeTBwezXf2LtDR+0lzt22+dC/BnubqtdOVAaQpNSoqCQo8M+6PZrVnS/AymF88yFkPM2DriAMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785881439; c=relaxed/simple;
	bh=d3piyYiHTTd6weacRN7RrrOPLuWEx95dULyzG1Zw5bY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ngWB+REAX+iTnNq43THlsEFqD7QoFehrrU5Pefj/Es8ya7/a0Rv4Wl6DZNK7j1ZZmNOluIWzRcBe73eg2hqjUcCudhFxQjsd45ncSHzlWhJyhg/DIebLnYFdOJzR2vGSjgD2ZX69Ri55u7cHzOljEuUdAgYiBLY/G8DmL5O346c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B48Ne2dH; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B48Ne2dH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785881438; x=1817417438;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d3piyYiHTTd6weacRN7RrrOPLuWEx95dULyzG1Zw5bY=;
  b=B48Ne2dHKUaQktmQq7hZGXGEvBLETPtY/OyD3uFUkJiWK6MOYKQ6ahCn
   ONel/dpgHtUHHaE/A+PB7nYYmfJpRONaoJMcKaFOf5+V1vvGO5Ks0aX35
   3KwZ2+sLghhZm0NnIhTtmKX2ueJr5PSb+gCG9gIKcxvilAm7g/5TBqGJU
   DqUBW1MvePNaTisWwO14t+LYoU6P7fa0nAeS0HpMS+38m69laKpRwx7ME
   MA9X8OQ8lqNxfY4v8L1Uw0vEGCA0VCvCr3zEfPIufgHMeP4/JOOhkNjX6
   +K+hAG6EAPr8SDrUbyKVo7NVP04YJ5Sx8zvweKSxGvPR5/SMNwh4QVrtO
   A==;
X-CSE-ConnectionGUID: gr6zpTcwQIiM422Zs5iOkA==
X-CSE-MsgGUID: kR+VnAHCRmeLdny9RWhlKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97039968"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="97039968"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 15:10:37 -0700
X-CSE-ConnectionGUID: 6KFALTjNRl62lS1R5MF4VA==
X-CSE-MsgGUID: k7CanzhNSzubzeOWCxBpyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="265453470"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 15:10:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 15:10:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 15:10:35 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 15:10:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xot2b/byVfOaa47i+lJaWYbSr/4Qc1XJfAPeWMmQhtD22R0++BrV/UKJRaVbMTG8hxskY+EMS+2apsvbY9qgAIkoDs56ECxuBCzuPOLnIcj14z2cq4NYJUbdApPRXd0nVagaJEWsuSWP4k33ADElbQQ6PS9GjwQ+PiqALi8skmYHFTBiI41trAMRiQabbxMi8aZrZpdv7rqx3AganY6/wSpMo40vqoXU7zXXFowf1dN9o4ZvD4GqfXd7Mq90QI9OSAdCCvdJAgUKN0rp+i9RILERZL6IJxEOJCfFhiORBRNbb8k1PWI1G7pvN3z+WY8PT8BEjWPrItznvnwFaxvGqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mw6XR+kNH6HWa5Ob3PYTvvdwSs3JEF41oPmDZw9Aqjc=;
 b=Ka3ZRJRkcR/MOPGnyw4lMjWskEzR8XCF/bMDlhpcAuv6178Zbsx7hybBAdAFFcElhMgGXmMVFp0rSndLcwNq+PV5MGSBcTKRgVoJLu+Iu0KBiLQoOmdtQky7aVSfsRc9uWmqCQ8qvqCZqUNZiR1yZHfTFm1kDesYr0rdomMeektsfQ7q0hNlbmpAhVqpDf+tNsVPen88OjXOqv70kxwDNWjZRxktJv2pfGMZOSKpHDGc9L1hPAFr1VbKZ5MyThesSvg7y+FCqc+7BL8PN83lCwQBvyZEOncXPmegNZFgfrcCKBuiyRODJs5uOI0wcDqBUqDS3BttP+qfar270vhfFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM4PR11MB6215.namprd11.prod.outlook.com (2603:10b6:8:a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 22:10:20 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 22:10:20 +0000
Message-ID: <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
Date: Tue, 4 Aug 2026 15:10:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Borislav Petkov <bp@alien8.de>, Babu Moger <babu.moger@amd.com>
CC: "Luck, Tony" <tony.luck@intel.com>, "Moger, Babu" <bmoger@amd.com>,
	"x86@kernel.org" <x86@kernel.org>, "Dave.Martin@arm.com"
	<Dave.Martin@arm.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Eranian, Stephane"
	<eranian@google.com>, "peternewman@google.com" <peternewman@google.com>
References: <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
 <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
 <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
 <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:303:b9::30) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM4PR11MB6215:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a68f7f-161d-46d6-c637-08def2752c82
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vpR36ZfKt7vjUQxiYJ8OaZTQzO4xuZhxJpJjFClgbG8ScKFRgOb6sz9eVHsC9A5fEjLKg4DbQ9lY3MEeoYe2RJ/Lfx50aFAL6nlWHQIazHY3ViooHjsjNy1HCdX/OTv1IwkzM5NcTebx560KP4yyiW6/pafXYWzNGE2wBi1CTjzqvaCO+ywA1k0yGCAmTYNnqiRBky+yinK9JF9qm+eQnzpnbHga6CytaRihs0szzZz/e1uCCh3J4gDUfZ8zEowN61owBUVHIatGc7uJyTRKJ9o/CzVZlGtjaCCaytq0Q2VP+ZyDP7PzzhMigSCW8EYI22/oU/8maQab2MhecTVogmvYh1G++Oc5ApJ3WHX9h8O8a9XkyRlpoKlpKpNU0Rnx/p71++6vYL0UUz4YDXDSEMGVoSenuiuxxiSTbmORV4s6sduqYInrUb0JrKD+NHQ8kriIEl/tMxsz/2nLqZcy1W6n+eNcKya2AT9Xxb5gXNM9HlNidYmtds5dWXQ5BmykqSFRC9dZxS9RQKN0RDeSZLogURNfvI5XuUNJIuMdjVDleeIL+wSwRoRzgDJjMYrQHhI3Q+g1ivuc+r+X6e7kAGFAbjwbzJcdUjcFv9U2Rx/gZY/Zae1d4eZLbVkgHp0P1FHO5eBd3ALmbGEIUpGqO+bym1EwNAchMYn0AZhEpF4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1V3NUlDNXlnOEhZQkpNYUgvaEZBQ0FmMW1ISDg2Z1FSL0ZNTFo2ZkpJaVpD?=
 =?utf-8?B?L3Y0VDd2dEthRys3R3k2aEZ6N1VrSjZsancyeTNJakFrVmRvY1FHSlRJMmNi?=
 =?utf-8?B?S1JnZ2N0R0lxTGowVGZVNDVZMnVFVXhJd2QwN3c0WElqVitNRm1oRXJsSms3?=
 =?utf-8?B?ZVV2T2I1TTZhMjlQTS9FTGVRZEEzcTk3Mlp5bktUdXQ2aCs5c2VKUTl2MHdw?=
 =?utf-8?B?ZTk1Wnp6dmg5MW1IQ1ozeDVwcm1JYTVXNVdKTHEwNXNrRlBWREk4dERNMEkx?=
 =?utf-8?B?bHB2dlJBd1hvblErZGFTMUtaNWtkcjJFNWV1YXNpTk5UTjhKbTZiZitFVkVF?=
 =?utf-8?B?WktrekpZa0R5K2h2czYxcjBwU3Z0M1NoVTdTeVp1aDd3eGNUVmlvTVloYzNE?=
 =?utf-8?B?VmxKN2JaNFFyQ3oxOEFhTTRkMm8zWkZKTmZHeFNjL0VQaXN0TXljT0g1L29V?=
 =?utf-8?B?K282ZGJMeWlxSVpsVnoyNlhHYzlqWUhhN3hxaW53ajVxOHg3aFF0VDlKZUJ6?=
 =?utf-8?B?SU9KSHEyZVk3akRDTTJmVlNtdURqblVvMDQ0MkpvRkZ4T21IOS96K0FKT1Q0?=
 =?utf-8?B?ZG5BTWlGUDd5VDRMWHpVVEI0SlBPTEIrY0dvV1JodlpldlVoZVhCL3JpV1dH?=
 =?utf-8?B?bWhlRjFvUDZQTnN0d3RDRFFhL29LRHB4WnR5Y1A4VHZSdnhyd0pYTm9GdFJT?=
 =?utf-8?B?enR2YXc0Vks0bVZzVC9VQXhQTDIrLzJGRUIvY3pYcUNBWVFCV3FjdEhVYmc2?=
 =?utf-8?B?bkR2VFdHTmtaWnFQYzJnRDczVXd1WEVoTGsrZi9SMnc2WVl6Mndkb1FwRWwy?=
 =?utf-8?B?ajBhd2lDNkU2cGNlbHdobklUcm83UTc2QmJCa0FRZmlJN3g4VWtLcW41NUIz?=
 =?utf-8?B?SGhqeit4UUpNQklLalJMWFhlRjBIZ0VnRytjdzZIb1BOV0EvaVRSQUp1b0M1?=
 =?utf-8?B?U3lZZjRKOEpLVjArVW9tQXBhYUs5RE81QWE4bGpBVWFXK0tMcjFLNGc3aUFI?=
 =?utf-8?B?cFlHZmJOQlV3Q05BKzZvcHJ0WFZEZ1BSTVZhWjZ6cXRiTWxSQzBCTmsxR3NQ?=
 =?utf-8?B?alVRSUtTSlpnQU9xdDlWYUdHWTI0VzJPNlpPVytLa3U2WkpXaEV5UnhsQ2lN?=
 =?utf-8?B?NnlqczFBYmN6RGo0YW5FTzJSb0tZNXoyWjJ6ZWVaZGJOUnRUTzVRbjE2L2dO?=
 =?utf-8?B?dkI3OTBrd2dMeVVMTnhCbUpMSWpvMjd0bW1VY3g4ZjdFK1NRUVZHSU92S21p?=
 =?utf-8?B?U3dDTG1DNmFpcWdKRDNwS0IwSXhiM2d4RlF6cHVuS2ovVEtYaEUwZkQxR2lW?=
 =?utf-8?B?cnhMYUx6d0w2aVJ5KzNnSndHdGJBcFZEUkwybDdTNUg1akpISkV6YlIrY0dx?=
 =?utf-8?B?WmFxTkdEanE2Zmphd2xWSUpVdTB4eGhGN2xkTXhjNlk0VWhXQW1RcDcwb2lN?=
 =?utf-8?B?WkVCRnE0SHRQN0R3N0hLSXhpMGFxTkJiZmhtOStHcFdhSE5BQkVBTVNZZzNT?=
 =?utf-8?B?YUs1UGwrbmtBN2NHVXZXSlhJZFdYM2lqT001Y0x1bTJLa2VPa1VRbkEyejVD?=
 =?utf-8?B?OVlXMFVFL2pDb3FhUUxpWGhWcXdjdTBtU2ZudXdlT2JYM25qb2l6SWxQQWtD?=
 =?utf-8?B?a1Ird2llb0RFZGhSZ0RuaVErYzZiSmtQSi9qMTVvcFZiM2ptbFBXcjVQbjVH?=
 =?utf-8?B?ZkJlb2RzOGFHTXVXcDlVbExIbERockNWeFdyOHhMMEoyOHd5RGNYcmxnQTk2?=
 =?utf-8?B?T3diU1ZScWZDaHNpZTJUb0RuajRDMHFaS1IzQW9NREJEY0ZKMFl0c2U1ci9p?=
 =?utf-8?B?bm91VEh4c0NRd3FHakpxLzVNeXBGWHZqMDJ1dUxyWGh0QXQ1eno4Mk5GZmhr?=
 =?utf-8?B?TVQ1S0QxOXYzMk1aYmRsUFc5b1pBZ3FxMmh2MS9tQ0lDUHNmTll2dDh1aitP?=
 =?utf-8?B?QXJ2aFdTcGt5SFZ1UFBSYitnNzZsQkNZcVRPdDB1cDE0dWc2SHBPNi9NcWxu?=
 =?utf-8?B?MWxhdy9qSGRIQnJXbStnVDZJdVBmdXpkOVdIU3hOU2IrUGE0b21PbGxsSEc1?=
 =?utf-8?B?ZUVuRW5oSkUrZS90V01yamk2VXZVYVFLbnVrNjFnTGh4REVWaXE0dmZsTXBo?=
 =?utf-8?B?eGZtK09rRGd4dG9DdFkvR0cydVN3VURWb1VvWHlYU0V0a2lqbFVtV2FYVEtQ?=
 =?utf-8?B?Yko3UkN2czJzeE0xSWhtb0kxS2t6aXVBVXk1TS91OGNleWJwQXNpQWllZG5P?=
 =?utf-8?B?ay9HRUgrSm1kd0FoZlNlK21OUForVmVsR0xqUHJ2RitxNFpMTU5MUEtlU1k2?=
 =?utf-8?B?WEw3VVhrUnUrbHRxYXFtUnlJL0hIVUZsT2NIdkFVZWZRR2p0OHEvK1pBRG40?=
 =?utf-8?Q?cxdfkyEQlmq6FIzM=3D?=
X-Exchange-RoutingPolicyChecked: HKdRZxfLgyReu7UvqmZzaMygPK/aq4hT5HIXX1KnNxS/BCxV+1EY+nSNghj23BSabUpD/y5kYPKGlmrmWqvx+Z6hHeHChbpaDoklTjk741hIqFH4CEe5JpStc5ysbnARYSEcItJ/fO8l7LVGZswbTmNT3Ov5SpECtdCqxfL6dIxOeTWbgOKtiVw1xMNRqF9SHkInXAt5vbUKV1c7UjUxfwl2t2SnOYwUeYCR7nyd2H7qG6VnRkNGTFwuYW12CUrqj8CfDD/XYf2FcvABPzRXjIMG25wv7+SV6L9Z8CRKiIZydHZZw98pBPdsE00j8gAz++ntrOLbfmk0xeLMZxNLmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a68f7f-161d-46d6-c637-08def2752c82
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 22:10:20.7009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dppJbtzZuLxOzcsKNnTDgqaK+RgI8ygkCYW35rxv55iVs4gyErTR2kZQDcIkScFYDFBZb5jvm1pX4P9IhBOLE2lbV2ZeznYtTTdmrbOMM9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6215
X-OriginatorOrg: intel.com

Hi Boris and Babu,

On 8/4/26 12:16 PM, Borislav Petkov wrote:
> On Sat, Aug 01, 2026 at 04:47:01PM -0700, Reinette Chatre wrote:
>> ...
>> On Intel the RMIDs are always counting. Please keep in mind that these RMID do not
>> actually return raw counts that are verbatim passed on to user space but instead
>> the returned value is "upscaled" using a hardware provided scaling factor to obtain the
>> value that is returned to user space. This is done on AMD (with and without ABMC)
>> and Intel.
> 
> So, long story short - and I appreciate the explaining - we should switch
> AMD's default behavior back to RMID + 64 counters - exactly like it is on
> Intel - and the ABMC thing will be explicitly selectable by the user.

nit: s/exactly like it is on Intel//

ok. 

> This way there are no surprises when running any tools on either vendor and if
> one wants something special, one selects it.
This patch, once minimized for easier backporting and marked for stable, would
accomplish this.  

Two nitpicks:
* "no surprises" should be "no surprises (as long as AMD hardware does not return
  "Unavailable")".
   There is the known issue with the default mode on AMD where return of "Unavailable"
   is treated as wraparound by pqos.
* "one wants something special" should be "one wants accurate data".
   Caveat: User does not know how inaccurate data is in default mode. Users need to learn
   about existence of accurate data from outside resctrl via external sources, possibly
   leaving it up to the tools considered here.

What is the plan with https://github.com/intel/intel-cmt-cat/issues/311 ?

sidenote:
Separate from this I again would like to propose that AMD work with pqos folks on
how pqos should handle the various text return values to fix the wraparound
issue. For example, is the preference for counting to stall at a number until the
hardware reports data again (so that user space always just sees numbers and not
be surprised by text) or should the text value (for example "Unavailable") be passed
on to user space or ...? The current wraparound issue should be fixed but it is
difficult for me to gauge what solution users would find least surprising. My
expectations from users do seem to be on the high side.

Reinette
