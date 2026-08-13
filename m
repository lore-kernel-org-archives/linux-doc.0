Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3113515DC;
	Thu, 13 Aug 2026 18:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786645101; cv=fail; b=M9Gy38U7KpWQqwe0NgHC/0ImQizUmrw9kIGxElfZ5TYihLsFcZ5Xo3DwFBmRpxHJV8l7aGJGObIHE84VEhPlseZHBlh5+DEEHuaXCjnJZdwuUXRaot/TZV4rrFQOAAvVLhwbHK/RcQZ1Of7R0mDtCjIVvjxgw1uLFRLe01MArO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786645101; c=relaxed/simple;
	bh=yY3PUXz2flAqmFloucYOxiYBhiuHgKmam+BC6Mrcj+4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZORDuG2AbhHCU6seQq54WkFW8A3xUB66KY6agsX9Vx/E4aUOJCrdnBOtAH6xsvmOFnTcJDYxen/OQHnOIMoq8RFizWEWF0ZnuDbAeOyjidNLyIi/gqlXK/V/jUkuCsVFr1k1UPXT29E8YBrJFPOJdFE3IKoihq1Hzyn/JrnUqNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2N9Il4X; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2N9Il4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786645099; x=1818181099;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yY3PUXz2flAqmFloucYOxiYBhiuHgKmam+BC6Mrcj+4=;
  b=O2N9Il4X/Xnkb+49Q/jin0UQ2gLwQKNOjRR4raLonegJLDddta7OA8u6
   YK2pDr5lpz+z/E2yUuRmfCHi5zlp/H44VefF5xhSDuagaBM/C61edT8O3
   lnhqAZ1dNF2aRjKrYH4nQiJnxX8wX+yVaytYM39CWmD4v88sfjPrrB5Fd
   wuYZpZ8KyC48Rs6mueil7iaJsVQRa2GpV2PCF4gH9TStcLjQjEFQOA4rn
   g5hVLkixQyLdko5TrQErnRxg1+e6B7IgJBCAp2whOM8MMCgxoi4zaxVH8
   olWCugkDFKwmKm2bFQkV5J36Pu57ZlWgWZPSlMBBZEmBr94+icuMLs6UK
   Q==;
X-CSE-ConnectionGUID: WbQ+E3C8TbmD6AHa7OT9yQ==
X-CSE-MsgGUID: zT1aBGJGQKG143YkZK1EUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87252065"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87252065"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 11:18:16 -0700
X-CSE-ConnectionGUID: /MyLIdISQLqkWv8+Tpv/BQ==
X-CSE-MsgGUID: R7D5CAU8TvqMNaD8mq5kMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="259768877"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 11:18:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:18:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 11:18:16 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:18:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oK7nwAsb0F0jP22hdXP5JPPRTbGTto4Iif9Db9StAP6iFnjYvEofqynrNOLGPuXduxGJT722ifszH/FnGudLWBdfDwLYzvmIie1+V6YlBGJGACRS21TqZHl7Ty4n23L+qtwLt/ZHnjIMv7qc2MVsjYGoV3Z4dEklHc/FPty26npQ7J4P8uLTymbxMz/Qg/JAvEesQ5y9k2fYTlx+Gwf+8htIPP3+TNJ2DdJmFtpMfuGgON0ka7W1hEuN7ygk+8/srJ0y2ymCoO0RI/D0r+S/FWyiGtWgAsdNsHD/YAyaD2J9bKuS2fymFzkKmtcc8TSGIwiuvHDTZyQ4NOX7nBipLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLyxzUSPcelxcGSF1Nz+Ck1Ll4yOsUF35BOXqPDnJjY=;
 b=aneD8786OiS703Dvlm0RlTDf2MfMgl63v/ouIYfnMqPEzwYhjM7m99DydIAB1UjT8nfRB7IAF5/V5XMQ6wgNxMzH4Rw9kh5um/VbMHP9D5WImwM6esOexT+N8TzlX0G8O7K9wlMEvN25Fq+3RH4PRflF4QTUp7Hr3L7rQZt2PWLQ4D3t7sdSxyQ+HC3+S706lvA8WRWdgX984MkIPjDXAZKLwPpheHQNbd2YgVF/pw0m7AmKb63dW8k/tZoDNtBTe5h8Z0g0qEIkmvwVh9C8O1c4IVdoonMkSx+DibX6UHIJ5gigHN+/8hkHRZI2ccDaUp7wFnICcRNoxIghBBtHBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by BY1PR11MB7982.namprd11.prod.outlook.com (2603:10b6:a03:530::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 18:18:10 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 18:18:10 +0000
Message-ID: <b4606050-277c-4a3f-9630-5453fa94df10@intel.com>
Date: Thu, 13 Aug 2026 11:18:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 04/15] fs/resctrl: Introduce kernel mode (kmode)
 data structures
To: Babu Moger <babu.moger@amd.com>, "Moger, Babu" <bmoger@amd.com>,
	<corbet@lwn.net>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<ben.horgan@arm.com>, <fenghuay@nvidia.com>
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
 <7191fbc2a339c830e7768d7fe5e7fa0f7d65da9f.1783461016.git.babu.moger@amd.com>
 <b84e5f4a-9743-41d8-b70f-e826d5afe4fe@intel.com>
 <5fad6e01-1052-4c1f-82f5-02c650ae1ffe@amd.com>
 <e4c95002-ae8a-48d0-bedd-772db58b937e@intel.com>
 <9a53023a-9d6f-434f-96d3-188a176a6cc2@amd.com>
 <0c4e5b4e-4846-45fb-bba9-ae4127393f0a@intel.com>
 <fdc8b919-bd3a-4794-bb3c-06ba3882e02f@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <fdc8b919-bd3a-4794-bb3c-06ba3882e02f@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0207.namprd03.prod.outlook.com
 (2603:10b6:303:b8::32) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|BY1PR11MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ec2018-bad2-4eaf-8e8b-08def9673b2d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|366016|11063799006|921020|6133799003|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xgNLgyjcygxGjtp3vw4audj3BoZlVODtmFXmwLZ/puTGD0g2ZOoYMNCyGRPTsmYK1oOWBm9S2sUxO/QH40dct/HTiyWQubeK+19lwgIMMe8753IKr2gsAtBoUlHpTwFtrvyorV9d+FFa113zlYDu+4AZbAVhG0Z+b41hRXNJJq1It+YnrOeqrZgV9fzvC0q1mXYj4i6WcwzG/ePwSdu3rUMbRHdt5mWFlVI1tmrpF/Rp5ZX26K6dC9/DOQHBtylFOvaBJIH6Pvqb3R1uzbzpJc3MzfFSAC0/rBg6iuNhGTgailzZ40iZ38Z1zNiAMtMVSThpjHWYnC4a6WM1mfjZGGhlmowThTDCBOT+rrhHgDXnMzoEQEzM0WnwnbioLuLWD0ExmqT2YRjdwe90go35F/luqciMMvRsLUa+ckL+YfsBKUsiYVmn2BsnmCgRnmm56aIi2Z0S/AxXpyUNdEuTqXN5ltp+09ckAbXjOs+FIdXAp2rX5uP4+dW25ZtZSxy0wSHF7P4EMOpeRzIvgLytUSDvgHuYidPpVb25rCh5SG7z2ZcokKAE1Gn9aA5dxe0JQwV+1MUI9PoU6JUc6raRckISx20u2F6x5zl7EKflLEml5UoUn6q+Tt0GoRLndNx+3veP9/mM75h1t4eI2iV6xODK79CK71sYO57/kYZiF4GnsgSutFR1NUE6aVKpIbtQLhjeucD/bDChQi666rQePQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(366016)(11063799006)(921020)(6133799003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXN6WThweDluYjM5QjlOUEVnOWN3dHRyYU1TSEtHMUE5K2h2WXNjZFRLNS9n?=
 =?utf-8?B?eStTNUZROHU4ajMvMHFObVlyS01Wdml2cjBRelZ3alNmK3BwUXBjaDU1WmFG?=
 =?utf-8?B?NHFSckZRb01YN1ZqbGtkbnZiOGQxSFFmSmhCVThpc2NtMVpKMXF2MjQyRlFB?=
 =?utf-8?B?SldYb3lsQVBXSktKcXB2eWFvUVFlWTBCVWJyeWdvbE1tNkE4YW9COVVFV201?=
 =?utf-8?B?S0pha3J6Y2xnaUYrc0lMMDk4YnNkU1pYRm81ZzFqeXJNOXByaVpaRXlwMG5r?=
 =?utf-8?B?bWxoSnQzUjJySDZWZkZLWXR0RkNXQ2RjaUtzN0V0SmQrb1JXbVRoSDhzc0Y0?=
 =?utf-8?B?MUIvUjArdXdSbUZWeTBUVFhoOTBSVldGdlpkZ0tyU3FHYytZNGlITlhQaEZx?=
 =?utf-8?B?NU5RczU5NllNRS9sUzJHVGZUVTA4WEdEbk9VWnZYNHlKT0hzWENjaDZKODhY?=
 =?utf-8?B?NVMxVGhXTkZaa0RuSjJzd2dMUjJ3cENQMWdzckUyb3Flcm1XYWZ5UURjSUdi?=
 =?utf-8?B?d0dCbXM4aWhzS3RrbzB6aC8xZzVqWDBJQXBVZVprTVFJcEkxOFR1TlZlRXAr?=
 =?utf-8?B?cUtIc2o3enJrNTNqclJSZUFldVBUZGtMK2dKOVZQZm92aTFkdGxJVHlRYlIz?=
 =?utf-8?B?bEJEWWVsQVF2L2Y4MGdlRThsVUQ0RnpQZTd5UjA3WDU0L2tMRk1JakFqRTBX?=
 =?utf-8?B?S202eU5JcUNwZS9LTXZCZXZmTU8rOVpEL2REZXhvZXhsdmFhMjlJdHVERnY2?=
 =?utf-8?B?bm5LVFJvQ0pMc0xWTUREVlhLUi8rUWMzbnlsZXJIVXZCSzBSaGlzYXFPdnpl?=
 =?utf-8?B?R2VwVEZWK2dhczhRU1BOWW1lTGZqNVE1OFJVR3ljajNZZjFQQUdtT0N3dXN5?=
 =?utf-8?B?aUR5Ukp6WjlFSzM0bnQ5U1hTdDNoaGVHNFV6ejhGaUNhNnl1bTF1c0o2a2Fv?=
 =?utf-8?B?T1Z6Z3FhNTFuMlZmUlFXOXBIa2VzdkJiS0ZlbGRCNnA3S0llckplODNtVnlP?=
 =?utf-8?B?UmRhcEVIb1FycnJEZENmL3BrWCs4WEJGTEVLVThsVGNsNnBBSGkybG5HRHI3?=
 =?utf-8?B?OWFLZFB6dlZDL3BmNStISzlMVlZqcVluTi84L3pFRGN3YUpiTEw5TWxrQ2o4?=
 =?utf-8?B?R25Icy8rQ01ZVlpxRytTdWlFWlUrQkZqeFptZE1UMnBadjZiNThERS9KODlr?=
 =?utf-8?B?YldHdHhFVGtSemdTbHVXTTFOcUU3Q01qSkN3RUxsUXplUnkzL25mWlBZSkMz?=
 =?utf-8?B?TzlmSHMzb1VYSHk1VWMwc1NtKzd5R3hVaFp0d2hBSDIyYi9JS20yTmNNTENz?=
 =?utf-8?B?RHJvdUNDanphUnI5MWIyMVdiQnF0QVVhR1FjelMrQjlJRTZQWm51NmZaQkp0?=
 =?utf-8?B?VjRZQnpVUW9tTEhoeFZqVGw3UzEycXNQMWdlZGd2enZETzEzUHIwT3VaUS9o?=
 =?utf-8?B?U1M4cUxEVFE2Q3Y5dEdVQ2xSdjBVL0xBRHdBUFE4WnNjV1dUMmhrUVkyYTBR?=
 =?utf-8?B?RVcxZy9OeHpBbENManhXMHV1NmlXRUhCZGtvK3dueThKeGxxWS9sTmpLd1py?=
 =?utf-8?B?RG1yRnZhUHZuN2doeE1YRFNrcWxJdzFvcWZROXFMcC9MVjhwVEFZTzhFUkpW?=
 =?utf-8?B?TmRzZWNKV0wzK2NINzRHMW13QkxaZEMyQ1d4NWcrV2dhcGJWN0FhZXF3S0M1?=
 =?utf-8?B?bkJaZEhhVHRaYlVwRlJuR0Y5QmdGcUJhRXBFWklGU3VTOFg4bUkvYVg3T2Np?=
 =?utf-8?B?dzVqV2VmTjJXNGdwbzY3Vm9TUTFLdDlHendlNUdqMEx2MEo1N3BQUGlmRWQr?=
 =?utf-8?B?akJzKzBxSTBPTzhJcEdPcUdYaFpWN0xRdUVGY0V5YkFLQ0MveHJVTi9YWXoz?=
 =?utf-8?B?T0RWL0hFV2tWdys2VUNiQ3FmOURvay82RWVvREdBbVBZU1BIdE5SRkFiajlw?=
 =?utf-8?B?ek1SUlY3Z0p1QS8wWWF6dnlrZ2N1QnJweis4R1YxUUZoQXRBQVU3SUFDRm9x?=
 =?utf-8?B?WmFvc0pZM21admY5dnZFQjJKQklkNTRnWDV0UXhqRDl3c1Bpa3hSS2xESFRk?=
 =?utf-8?B?L1ROSEVId1Z1U3k5YWQzUFhYWUVhVVg4UGtxemVXYjkvcEVjN0ZrMUFsalNq?=
 =?utf-8?B?eTNNem03QUo1WmlRcXYxeU5uVHk1dWFkYkZ5OHh6WGJxV2JPSHVCK3d4bThp?=
 =?utf-8?B?NzN1eU9Qc0VFVTBQbXlaOE03YjM2YnFmRm0zM2tBaXpmV2s5Tm9McCtjelZo?=
 =?utf-8?B?dkpWT3g4VElhcXh3d2NEUW10SnF2M3V4NmpVYkdhUTcwRVZ4MENLZGZ5ektL?=
 =?utf-8?B?aGN3UFN3WUp1QXRiMm9YR3p0amhoYm1FYnlFNXhnS0FjNm45OSt5MjRKd01i?=
 =?utf-8?Q?nweEpCAFIjfBehic=3D?=
X-Exchange-RoutingPolicyChecked: fS0WQ6CpT4ycFnq2e1UHY21LWBsZOjEYpttErmmITMDbmk0XQM7n637q8y+rzVv+g8nJBjeygoUUvUy35HbXWvnHfmfYs5PYpykgeuqm/xPIR7LG6nRf2VE7VHZMniEbQhUPK3Cog5zArM6zHwNiwqG+Ys2g6LTjrZUTon+g7YQIWm5mupb5M8w1Kaw1zqSWvFrK2buepX8pUM045U/XW+aRJgFa/WzcdN8R7felmADkckNLP9j941WiFHmT2QVhDmdGUQtLWGoPM8l/iFfsU6In6zlEjMj34IgiuEMVvfrr+CyqdEAtVndOUQetN6JYdT7suR8WAB9afNjcc96/kQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ec2018-bad2-4eaf-8e8b-08def9673b2d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 18:18:10.4867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqBqSQ4tTKaqhV3a0t3KgCAQY5QZ9fp9GWzzShnp5124Ncl+GN1wikZjgYYfvNjwpqBVcJ2dKNS8b13onzzNookIaNdnkW1BxZ1IortAM2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7982
X-OriginatorOrg: intel.com

Hi Babu,

On 8/13/26 10:12 AM, Babu Moger wrote:
> Hi Reinette,
> 
> On 8/13/26 10:55, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 8/13/26 8:17 AM, Babu Moger wrote:
>>> On 8/12/26 18:28, Reinette Chatre wrote:
>>
>>>> Please always keep in mind all the requirements and use cases we learned about
>>>> during and after RFC v1 of this work.
>>>>
>>>> For example, we already know that "per group" assignment is something resctrl
>>>> needs to be ready for. Consider the example in
>>>> https://lore.kernel.org/lkml/aYyxAPdTFejzsE42@e134344.arm.com/
>>>>
>>>> There may even be "per task" assignment in the future.
>>>
>>> Yes. That is correct.
>>>
>>>>
>>>> Constraining this feature to PLZA will make it harder to enable the capabilities
>>>> that we know resctrl need to support in the future.
>>>>
>>>> This is how we originally landed on the "global" assignment distinction
>>>> (https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/)
>>>> "global assignment" should be kept or replaced with a solution that continues to
>>>> prepare resctrl for these other capabilities.
>>>
>>> Yes. Makes sense.
>>>
>>>>
>>>> I am not able to see how resctrl could support "per group" assignment with the
>>>> interface you propose above. If I am missing this, please highlight the solution.
>>>>
>>>> resctrl may need to explicitly split kernel mode from kernel mode properties. For
>>>> example, below shows an "assign_global_enable_per_cpu" as the kernel mode, now with three
>>>> properties:
>>>> - "ctrl" - could be "assign" or "inherit"
>>>> - "mon" - could be "assign" or "inherit"
>>>> - "group" - required if "ctrl" or "mon" is set to "assign"
>>>
>>> ok.
>>>
>>>
>>>>
>>>>      # cat info/kernel_mode
>>>>      [inherit]
>>>>      assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=uninitialized
>>>
>>> Shouldn't this be like below when default is inherit?
>>>
>>> # cat info/kernel_mode
>>> [inherit]
>>> assign_global_enable_per_cpu
>>>
>>
>> I think it will be useful to let the interface:
>>   (a) show to user space which properties are available for each supported mode, and
>>   (b) show user space what the default value of those properties will be if they
>>       are not set when the associated mode is enabled.
> 
> The "inherit" is the default property if it is not explicitly set. Right?

"property" is different from "kernel mode"

Each "kernel mode" can have zero or more properties.
"inherit" is the default "kernel mode", but it could have a better/more descriptive name.
For example, "inherit_from_user" or ...?

> 
> # cat info/kernel_mode
> [inherit]
> assign_global_enable_per_cpu:ctrl=inherit;mon=inherit;group=uninitialized
> 
> 
> If the intention is to display all supported values for each
> property, then we should do so consistently for all properties. For
> example:

No. The intention is not to display all supported values for properties of the
different kernel modes. Just display which properties are supported and what value resctrl
would use if the user enables that mode without providing a value for a particular
property. There may be properties that could have values for which it will
be difficult to provide all supported values.

For example, if "kernel_mode" contains:
      # cat info/kernel_mode
      [inherit]
      assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=//

Then user space knows that if they enable "assign_global_enable_per_cpu" kernel mode
without providing any properties then all kernel work will use the default resource
group's allocation and monitoring. If that is not what user space wants then they
can change the value of only the properties they need to change.


> 
> # cat info/kernel_mode
> [inherit]
> assign_global_enable_per_cpu:ctrl=inherit,assign;mon=inherit,assign;group=uninitialized
> 
> 
>>
>> To (b), since the default resource group is used as default when the group
>> is not provided it may be better to use "//" (or just "/", depending on system
>> supporting just one of allocation or monitoring) instead of "uninitialized".
>>
> 
> To me, showing the default group would be confusing. It could give
> the impression that only the default group is associated with the
> [inherit] mode, even when multiple resource groups exist.

I do not see how default group is associated with the "inherit" mode since inherit mode
does not have a "group" property?

> 
> 
>>>
>>> When the default changes to assign_global_enable_per_cpu:
>>>
>>> # cat info/kernel_mode
>>> inherit [assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl_mon1//]
>>>
>>> Display the second mode with properties only when group is associated with it?
>>
>> Please consider this from user space side. The user needs to enable the mode.
>> How will the user know which properties are available and what the defaults are?
> 
> To me, this may not be necessary. This interface is primarily
> intended for administrators, who are expected to understand the
> feature and its configuration. The documentation already covers the
> available modes and their behavior.

This can only be true for a static interface of a feature that will never gain more
capabilities. We never have that luxury.

Reinette
