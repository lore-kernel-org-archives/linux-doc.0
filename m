Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE552D0C70;
	Fri, 21 Nov 2025 04:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763700074; cv=fail; b=iVB56ovbSyvv6W67fFRF6D7x3wScXTog4hm9iYVsU5Hk8E4s5dYLEwKX3E7N6k/77/M4Q3DTzC+ap2O8LwnbuGtA3ZnCIIL+mSlw7HWYLn/OHlpdTPsVV44E4nbvC5llgB1JRhnaWZFtdiM/Q6UCtphUVqAWszxYr8XyO5fbTWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763700074; c=relaxed/simple;
	bh=rytUNX2PTUIvGOESms/Jw5ydwzPDBJVo2chIeGQOJOY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y8DHfdmveCpitZ1s55J3lbUqyT5BJ9FyztQLogOeOoaaQx8kY0p5WG7mk97dnZdVW53/Uf8b4dXCfdCTlfUfvgdGD7j5C/fhkz6QGqGcl09xH6nqno4cy7SZnppMJeeOAbXeLoCcqcr2qC8SDdghTO4yjYvCA2az+zMUS8ECCWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8TE7DL6; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8TE7DL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763700071; x=1795236071;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rytUNX2PTUIvGOESms/Jw5ydwzPDBJVo2chIeGQOJOY=;
  b=E8TE7DL6qjgMPy6jxFJuUHts7l/9SrcCnefJMShSFoAUBWpYjsAF6vro
   yfIieqF44RGPrpryzMVlRYgP1AOhWT8U9/my3q5xwSphCCG4yBLxFCsk1
   C5z/R7AZZKhvqbfvyZkcmTvLk4IOfqYcWK6Oi3cEPAgdKFCK1L8XiWxnO
   ePDQQIvufIvviCJENDUKDHm7nwg0FGVeqVs61qTSUk+IxRZxwQbjSxi7Y
   UtkCCLQnhQc74elwKGD9erAjY9ZPT8RjphJGuLVDPBS+rPROfsQJwrTB9
   ifKDv1i7lAO+CC3MotPiT+Bky0fBCeua5h3zKs0b6drJC617zsSdK8A5T
   g==;
X-CSE-ConnectionGUID: 5RKbO1AmQwWbL+nSKt5KWw==
X-CSE-MsgGUID: 4MbtKFmDQ3iTJjGIzdokEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76400612"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="76400612"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 20:41:10 -0800
X-CSE-ConnectionGUID: gTgm/ZaLR6mPMbPSk8LpLw==
X-CSE-MsgGUID: xQgfqfxrTvqkV4uPXZH56g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="190799104"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 20:41:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 20:41:09 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 20:41:09 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 20:41:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4Qrch5jkweqJ1GxsXN6nOM7dT6HVzMmW4MWfuWtb1FoM7cd0FR3xJiRAfyRoBSYX7LYmsHw7Rjtu/XNMpMz6mPCWywjAhneWWGPkUoDyT5L/A/hRoReB7SqPCNyVih4nmMcOCx8eba2HkUcEFAwqqltn2G1YqndGtl0bniUvJqXrBKOSGo11FVgMwmDZENti81GAVOYEwv+Qe/FsqgS0j03qHTovrQaSZM1GEoHcKq1MUZCaW0n7ww4CUaFxu0ncuFkoOD93RZ37i7FlDcsBv9vejGIKCaBUuhexJ+cHON5/4widovqciR14pFYcfRoXoSinppkrRHBsalNabYSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHbvkSsFzASk2Bhdkl0l5lzIfQGLpwTjjcMpJEwUEcI=;
 b=emBVCXAD5lx5FqEM4PfiP5PVgPa62IrInHRe5l6+t0oRvN7HS8Ct+m73BVQwaSsYl8iYxcSUJ03brm27lA91Y8fGUGEkN5AS1Wyg6VoJYJHleVM+5qQMoWyFZUibIPr3UZIT2+eBm9k11LgSgNm/xyNoW9yYwF/Z83MjaMBEWwk/x/Kz9P6Hm9YzZaEd5zKL4MqwWZWwFmjxY/CX5F70FdS4bGO0YNjxs92B6AiHgqGaGocj1uwrfG5jMpv4vGwpdB/Y+U1hU0eNQhFWO6kwiXs9lwKSA9iW/mIjotioOrdDhY0mgPv5csczLqrJGD8mdGe6A4Bg11EBfxRAHd2RRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MW4PR11MB6863.namprd11.prod.outlook.com (2603:10b6:303:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 04:41:01 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 04:41:01 +0000
Message-ID: <65f94330-bd8f-436b-b02c-654f87e4bb29@intel.com>
Date: Thu, 20 Nov 2025 20:40:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 06/10] fs/resctrl: Add user interface to
 enable/disable io_alloc feature
To: Babu Moger <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<tony.luck@intel.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <corbet@lwn.net>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <rdunlap@infradead.org>, <pmladek@suse.com>,
	<kees@kernel.org>, <arnd@arndb.de>, <fvdl@google.com>, <seanjc@google.com>,
	<pawan.kumar.gupta@linux.intel.com>, <xin@zytor.com>,
	<thomas.lendacky@amd.com>, <sohil.mehta@intel.com>, <jarkko@kernel.org>,
	<chang.seok.bae@intel.com>, <ebiggers@google.com>,
	<elena.reshetova@intel.com>, <ak@linux.intel.com>,
	<mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <feng.tang@linux.alibaba.com>
References: <cover.1762995456.git.babu.moger@amd.com>
 <c7d3037795e653e22b02d8fc73ca80d9b075031c.1762995456.git.babu.moger@amd.com>
 <312511a1-ee7c-47da-b351-ee7d9adfe306@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <312511a1-ee7c-47da-b351-ee7d9adfe306@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0252.namprd04.prod.outlook.com
 (2603:10b6:303:88::17) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MW4PR11MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 73ddf79e-d6b3-4810-6f3a-08de28b82c4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M24vMWNPaVRhMDRaVzB5NldiMEhaMlE3NHZyNmJJNlpmSmF6Z0M5S1ZlSUxG?=
 =?utf-8?B?MGdtMlM3eG16Q25NY3JaMXhtWGdiQWVrTGlCNlFMMlprL0ttM21ZVG9iYnlJ?=
 =?utf-8?B?bHNjUWxDUXU4SzdicEYyOGhCdnFxY0dRVnJHWTR0a0NpYmlsdjRWY3B5aUVq?=
 =?utf-8?B?RTF3a09WL2VFSXBSVTd3czZ1ZEl2eWRITEZOMXlXQkdJSEQyTmhmSHFTWkx4?=
 =?utf-8?B?bVRuOWhhWEl5WktwUHowNlYvVzlLc21IeXhReTJiUFh4ako2YVFReXA4RlhR?=
 =?utf-8?B?a2tWbHlONnIwWDlGUmRCNUh0ZDhqL0hZdytHUmltTmowTTFuaWR4RnZ2Sml1?=
 =?utf-8?B?MURoVkM2U3VDTkZITnNYdXlTS3JqNHVZY1JCaXlubmJPL1hkSGZzUEo0alg1?=
 =?utf-8?B?ZlhOanBWaFVKbmp4Mms4bVhvbzROWXVhdEJQWVlBcDlEMksyTUduZ0R1NVhX?=
 =?utf-8?B?YStpVVJ1VDljR2xDTzcyOTd3OG10WkpCQ2xHWGhCZFZtRDFtZjJJa05VN0dz?=
 =?utf-8?B?V2IycXpNb3hqK3FLVmJ1d2N1QnZZS2VJWkJldHpJWGFBbDFVV2I4WXlTUVQ2?=
 =?utf-8?B?SzhXM29JZzA1Z1d5cktlRzd0cncyeGhjNjl0QnRWNW9rdjNHNXFDQTlVN3lL?=
 =?utf-8?B?WmZ5VEZkWC85WjZZTThGeWVjTGxxanhvSTB6QXh2cnVZTk9KS3lJS09DcEFE?=
 =?utf-8?B?VG1ROEc5S0dNYlBnVkw2OGZNN2Q1d0ltdDJWckF2U2FvOW9MTzh5ZjZwM0pZ?=
 =?utf-8?B?OTRtNUYxVGlHY3ZuQUJBelJ4eWtzTmhzeXB0SlliYi8rbnJvVGpESDVMMlI1?=
 =?utf-8?B?aWdpRlVtVm95a3pkckM3WC9uSXJFREQ3QWFZUUIyMW02eGJMQzVaWkxGUWZk?=
 =?utf-8?B?NXRuMEV2QXZ3a3JRWWF2WnFvc2hma01Obk9uT3dlcU0rM3QxOWtJaGdGdkZM?=
 =?utf-8?B?TVN2WVVTa3NvTGlMTFNVWUJ2Y3RPZURHM0huZExGY2hPT3Y3bXc3WVM2dTNv?=
 =?utf-8?B?RXlSWi9HQzFvZ3QzUHNYemlzR0Uyd083ZFFadWRWN21WbFBlMS9VR1VvcHVq?=
 =?utf-8?B?N2pLTktWd0dvWmxhMEZ0czlvSHB2NHE2ZzU2blJNWS9zd1FmVkE2cXNJTDFZ?=
 =?utf-8?B?WVJLeExSRFc5VWt3cFQ2ZG4ycmZHYXUwMllzY0p4VGZrQm9QUkJ4VmRrS0w3?=
 =?utf-8?B?RldLWDZVNDNNNjRtU0I0dnYydnZBS3IyMFF4dGY5ZjBxMzZ2RnUweEZvNlBM?=
 =?utf-8?B?cXFwNE9KcS9oOG5wRUM4VVFwN1BFZVArZ3VlUW9MaGdjdjZ3c29oRjRjMEdi?=
 =?utf-8?B?ai9QTmErYkluM1BJbHQ1dzlZR0lCa0xwVEY1OTROK3lrRWdwOGg2RFNkblJW?=
 =?utf-8?B?eDBDSy9KM1V3QnJaRnJzbTM0NmQvTlRJTVpnT3pyRFRtTTdacW5RTmhvdWxH?=
 =?utf-8?B?OWQzZ2xxYXFvREVzNW91cTV0T3NDTndYTFdZRjJWYmczZW5NeGFucXdONHFC?=
 =?utf-8?B?R0Fhbm1aMkwrYVdDMFFDRGwra3BxMXF3UjhINzdET0dwQ1B2T0IyZWo2cW4x?=
 =?utf-8?B?UFAvZFpCVlZGMnJzTW9jR2xBVWhtbXhDVUJHNWtROVM2UzNaREpzazEvcFB2?=
 =?utf-8?B?Y1IvSVJCN2M2akUzYWx1d3dacHhUWFgzSVpmZzBCQnBNdUh4cFQwMUx0SERR?=
 =?utf-8?B?ZE9tZC8zUCtzL2RsTWNQTExIZGtRUTNPT3k4ZnJ1cDRwalRYKzV0ekhvQ1pG?=
 =?utf-8?B?WW1hdzd5ZDZDS2FrK3pmL1NSVU1uOE5XekdjWkk0OERWRE1pUFp5U0pMcWRD?=
 =?utf-8?B?Q0NhckFmTjc0c1FFdmdWbzBjOTR0TDg5b1dPcENYV1dFMjdNYmZpOU1NWjlE?=
 =?utf-8?B?OEg4Y2VtclNVdTNNSEp6Y1V1eHpZTFFPTXc2MFJ2SlJWdlkyYmYwdXdhcmg5?=
 =?utf-8?Q?Y2mDGVn/gMjm9LEI1Spxi5Cn4486Mw9O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmdqd1M0aDZpSDdhd3p0QzBKYVJoT2NOdk83d1hUUG44Wmc1elROR3VrSTMr?=
 =?utf-8?B?ckoxRDJ1bWhOUEprclN2NDE2RXZLRTFzTytSUlY5aEFTVFlFWkUrb25YZDF6?=
 =?utf-8?B?aC82OVM1Sis2enJwcTFtZ1FkNnVvUVBJNVZ2NWZGYUt6ekE0ZzFyUkhuVjdP?=
 =?utf-8?B?NElHWlFRNUtmWGFUc09sY01UMTljNlUvZUJUblRkRlFkMzJGNUNtOTlJYVMw?=
 =?utf-8?B?eDhCTVNFK1BKejJaaVoveEJvK0VxZUNMNmRZZkc4L1JpKzQyVkJwUFpjZ3Va?=
 =?utf-8?B?azY0NnlWUTNKVDBOS1NZREJNYnEyck5vb3MxYmVBZkQyYnAveHVDUmNONzVH?=
 =?utf-8?B?NS96c25tdVQ2bGVIaE5tMkdxUjkwemQ4a0RzenVwdGo2Nk1peTZueGs3ZFRD?=
 =?utf-8?B?cTVzNG11WFhSdjZOeXZaTE9uTFBWVW05S1dMWjFqYjBmVnFpaHJZN2g2bk1y?=
 =?utf-8?B?MVhQYjVTa1luSmxHWndDcmc1RThtMUxsb2lMN05VeDk5a3pOTDZzUmxmSjUv?=
 =?utf-8?B?K1BiUVNxdVpteE9rWmpiUVNxd3crekJZVC9taVIxRHQyd013UmR4NGYrb3Iz?=
 =?utf-8?B?bWZneHFtaEV0UlRCV3R2emxsS0ZNZmY0VFA3YTl2L1l5MjQxeVVSWkxPbUFF?=
 =?utf-8?B?UGhzditFWVJYK1pZcXdNN2tKeWMzKzdna01rTWR2TkwveWI0endWN1FKN1k1?=
 =?utf-8?B?eHYxcWs3Rmhmcy9WYWxrQTNYd0hwUUhDVnhUS3Y5RGZlbVcrTDdSdmZFMnF2?=
 =?utf-8?B?NUsraWNvTXBIVVpBd1ZDUHFDVE9mQUxlOXFIZk1FaGRZeXBSeHZjbmV2ako0?=
 =?utf-8?B?eERITzBmOFNoams0djB1WG5xZXNIWkZSWndsWEx6L1hKWjZZRDZWOERXSUlN?=
 =?utf-8?B?Y0pKUmJHaWRMTEdub1hIOXNSV3hmNkEwelQ4enJhQ0dPTnQxNnQrcmNjWVhC?=
 =?utf-8?B?bDJONjcrTHJkMUhwaG1JaUtlQ2E0cDlDdDREY2NuaDduNisvOEZxRUczN2cx?=
 =?utf-8?B?dnEzbEFRYlZRN2RhN05pRVRnc3Z1b1RBSEt4UjhaWlpRRFhrek9oZm5PTEM1?=
 =?utf-8?B?cGJCZjNZSmozT09leXpaVlJmeFpPNXMwY2ZvSTdEcmtCdzJrRzBpWEpPRGFE?=
 =?utf-8?B?aGhHWHhhU05VVFRENDBwcVAzZExJbVZCLzBSOTZoM0xBU0FlN05aNWwyNjFr?=
 =?utf-8?B?eUxoeGxZWml1MWtIUlBGakZXMVNMRmd4dndhWSt0RGU5b1NlUnFQRGdQd2NR?=
 =?utf-8?B?Mk1OTmNuSXBsUjdkKzBtbWw5czBUb281bi91b2VDdElaODZTc1dGck9Dc2pa?=
 =?utf-8?B?NnhsWmhIWVhDbFpBWXlON2pKZEFaQ2RHdk50ekg3b2NHRllNTSszUnZheGdH?=
 =?utf-8?B?OUc1OHJIOGVhSCtVaVcydWRFUURZZnJ5ZE52ZWt4dXhvbk1PbHVHZGFFb1BZ?=
 =?utf-8?B?cGZvRmFnUGR1ajJISGFkMld0dWhWYzNJcjIwVXphcHRDMEZ2aDdRR1FWeEJV?=
 =?utf-8?B?S0l5UFUwazRjWlF4QlRwcFVaNW82RlpHU2RYaVd6RkRBVXBEOU4zMkNEWmZL?=
 =?utf-8?B?aGFDeGp6MEZPWnZWUHR1NkZzWHVJWHFvSEFaOEEyc1JCMlZ6eXJrU09XWDNR?=
 =?utf-8?B?QnQycE1VMjJMckkxcHhBay9EN2huZnBaNlZuUTVvWWhBaUVnSndHNGlwYm1j?=
 =?utf-8?B?bGZHZE5EaHJwNHp4enIrdjR5K2pVTkVZQXhjVkNOdngvNjRLeE9uMDFOaU9o?=
 =?utf-8?B?VlBHZFBKUGl1Wm9TcDdrVDJadENIU1JpQ2VjYysrcU5MTXYxSWl0Z0UyOHhB?=
 =?utf-8?B?c2JmZThPY29aMEFQSlgwT01TOTc5WDIxTUdraVJiaDAzKzZGVWVSTytLRDUy?=
 =?utf-8?B?YzIrMHFKeHd5eDNpdndoQkZDenVMMGU5Tm04ZGprdHlMNGo4ZXpZMGkzS2xy?=
 =?utf-8?B?T20zVk1Cdy9kOFBnVDAxeXVtUU1xTmtZcGZiR1V1WFhxSE9LM2wyNlB1eWtw?=
 =?utf-8?B?U0kxNDM0OEd1SW84MXhUWEZLc1NnWWJ5aFlVU1dobnVFQ2lGODd4WGgzYkRT?=
 =?utf-8?B?aUxDb1hGcEtFWUN3WFdPUFFhQmRYSkxpVXpiOWk3cDBxaktGWkZmdnkxOGda?=
 =?utf-8?B?Q28vZ0paN3NaVEZTRWNITElzL1RvUWlBTjJIcDNKeWloZEk2SHEzR3NUQm55?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ddf79e-d6b3-4810-6f3a-08de28b82c4d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 04:41:01.7325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzPygV1Z5ejaIxaytfqk8xl2pNXqgp+izbuXRSQnqLzGhZwWfFw+VeLY4aKfl4pbE/+v/jzIyY0VEh7PY6zHgpPLZM62BS2ibUzYyLc7jRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6863
X-OriginatorOrg: intel.com

Hi Babu,

On 11/20/25 10:35 AM, Babu Moger wrote:
> Hi Reinette,
> 
> On 11/12/25 18:57, Babu Moger wrote:
>> AMD's SDCIAE forces all SDCI lines to be placed into the L3 cache portions
>> identified by the highest-supported L3_MASK_n register, where n is the
>> maximum supported CLOSID.
>>
>> To support AMD's SDCIAE, when io_alloc resctrl feature is enabled, reserve
>> the highest CLOSID exclusively for I/O allocation traffic making it no
>> longer available for general CPU cache allocation.
>>
>> Introduce user interface to enable/disable io_alloc feature and encourage
>> users to enable io_alloc only when running workloads that can benefit from
>> this functionality. On enable, initialize the io_alloc CLOSID with all
>> usable CBMs across all the domains.
>>
>> Since CLOSIDs are managed by resctrl fs, it is least invasive to make
>> "io_alloc is supported by maximum supported CLOSID" part of the initial
>> resctrl fs support for io_alloc. Take care to minimally (only in error
>> messages) expose this use of CLOSID for io_alloc to user space so that this
>> is not required from other architectures that may support io_alloc
>> differently in the future.
>>
>> When resctrl is mounted with "-o cdp" to enable code/data prioritization,
>> there are two L3 resources that can support I/O allocation: L3CODE and
>> L3DATA.  From resctrl fs perspective the two resources share a CLOSID and
>> the architecture's available CLOSID are halved to support this.  The
>> architecture's underlying CLOSID used by SDCIAE when CDP is enabled is the
>> CLOSID associated with the CDP_CODE resource, but from resctrl's perspective
>> there is only one CLOSID for both CDP_CODE and CDP_DATA. CDP_DATA is thus
>> not usable for general (CPU) cache allocation nor I/O allocation. Keep the
>> CDP_CODE and CDP_DATA I/O alloc status in sync to avoid any confusion to
>> user space. That is, enabling io_alloc on CDP_CODE does so on CDP_DATA and
>> vice-versa, and keep the I/O allocation CBMs of CDP_CODE and CDP_DATA in
>> sync.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v12: Minor format fix in resctrl.rst.
>>       Added text about writable files in the info section.
>>       Removed Reviewed-by tag from Reinette as there are some new text changes from Dave.
> 
> Only this patch needs "Reviewed-by" tag.
> 
> Gentle reminder with upcoming holidays.

Thank you. I just added my "Reviewed-by" tag.

> 
> Hoping this series will be queued for next merge window.
> 

I think it is getting late for new things.

Reinette
