Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE92A2594A6;
	Fri, 20 Dec 2024 03:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734663854; cv=fail; b=Vtho0borWaWnTUlYVOJdzPq1Wd/jbRW121FwZLI2ug3RoVD9ylHYYeEFFOvqV/7DZJNG+R/KsuKySJsWncy2Msz85doggkZMvC0BBZxMNcskKyGPWTlKxeWaFjqUoUlnCojlHhGka4Px6z/DbONRtPa7ahHNzcKj2DBeK05cLzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734663854; c=relaxed/simple;
	bh=6VVn73s+/XTdrmvTLruWiBN8l/nYg2ZRDJEIdOj+wJo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HYqy9615zsWzp1I8/GxmNLbXTLYUnFD/0Y+q3HKKAgxdQSs+r6AlRsF2XrV1JwEL28jUKmHPUnGLCpugf/e0gUHiteduUNRgOeAUpLo9g6jQJhKm6/P7m1piNcYavcyrYZrOuQSuf0k5019g5kK61cbT5zqxpvdbD+AJPFqzF3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3zsbNey; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3zsbNey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734663852; x=1766199852;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6VVn73s+/XTdrmvTLruWiBN8l/nYg2ZRDJEIdOj+wJo=;
  b=h3zsbNeykq2GTTTm3gta/UDp1Cuu/wAfEED7aMkPxQGG01aHaG1Yq3lw
   tigXBx/xmMAt320sAGutDnQejgL8L1Qo6d3TxSjQoJQ/m6WiPP3m/Nk1V
   NBbOvZ5vFQDLtveh/RiRHOvDCjO0KghvAvJoBwJ6aovWHovNBaLMetVa7
   HtBKiNEnPcNogl+rG3nipAtsn3IL9tOkc0fngyDqt20FamHGNY23dEH08
   3yj2lz0eCcazO8IfVHG5ISWCZF6Q7GejnKqjf2ZVhmw4dMMYLPM8SUQdk
   7O1TLd25jrA/f9V6r4vO8TXgu2wEj5NDqYJ01vdXGbMP5OZ5Zaf3vCJ8G
   A==;
X-CSE-ConnectionGUID: s8tNb1hxRbOrvfMhDXMOeA==
X-CSE-MsgGUID: XgcBosSsRq6V8FOeO0d3AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35353941"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="35353941"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 19:04:12 -0800
X-CSE-ConnectionGUID: y444PR1YQ6qfGVRq5sNZ+Q==
X-CSE-MsgGUID: 1hPCFSL1QtedWaN/fmoynw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="98290246"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 19:04:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 19:04:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 19:04:10 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 19:04:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNKzvD2dwDof5IB0JGXvUrPvCznr38VIOOgfvh8LiMnOKN3ISZp/W1vhTYW1FYPl4AQ1fxIaQv5wL6seo79pHkm7Z6BYUb+hKQKpLg+Exb9N1JCVgguDb8kJeFwzN2pT71hOH2SlfWwpLFRlLifcI7mA1JuNarfjcMquoNYlzAi4aDVyFxJ6qLwdivdTj1CTYTy2AOGVinVaH1B1kAWLASCCZ6gq2+XKXegNZdZILN78Jw1Q6t+8FlhDpxbLQ1vm3xAsVKt77g9duoRK+sCZcfH1CeFOP/qGmS4VjeZ7l45ORtmNEgf+sQ+vIn8LD29QQPj1xDbqU8boX77IdiiLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aqhoo2YcGsuBOS6uUaouumAUAu9YRlkWNUxqwK8qV0c=;
 b=s4OQFYb+tNXEuNWJdvts89492WtDFXuOTvbXlMmK/NLgV9FjCKgkzJQHiOgXgYXRzjN2y8HLfiyBa0cWG94fbjvOe814L1riVB4usyu2RZx3MLJRizeL0wFfKVwOI2hSYT3snFdS27CpeKNUHSmmMpMcMrsEiK4LEC4E6hPDfFlSbo6qBdmKY1RAhfkBKNj6QhLKEe6xGXD9fiX/tN5MUN80lS7QRgx34rVOJKxQdJkcRRnHiZq+plbfURBEG9qrVKDMpKKYOHwdeI6pJPH+SC6MgqDMs2LnbuLteTeCXt60hzUdYt6Hy8fhiqovpEiGV9fQwV183Xq9qb2iYHOkhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH7PR11MB8276.namprd11.prod.outlook.com (2603:10b6:510:1af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 03:03:53 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 03:03:53 +0000
Message-ID: <7537448f-d46d-402e-9f0c-6609f0626ff9@intel.com>
Date: Thu, 19 Dec 2024 19:03:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 21/24] x86/resctrl: Configure mbm_cntr_assign mode if
 supported
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
 <5ef497199a48c72a3a9100ca5e96f6a04ba94f30.1734034524.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <5ef497199a48c72a3a9100ca5e96f6a04ba94f30.1734034524.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:303:2a::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH7PR11MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: 37469f6b-327b-4b88-fa2d-08dd20a2ef4a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUg3VmZUd1RORjl0N3NjWDlOK2M5Ri9SdzBrUmtQTVdSQVBzUXhhUmJ2bWRr?=
 =?utf-8?B?czk1bCt5Z05JVFBvRkt4TXIyaXkxOSs1ZWg4VGtJQW1KYlZ0bnloSkRQb0xm?=
 =?utf-8?B?djh5UWorcFhhM0RVRjJYMEZON05Qb2JHMXpFZ2pIN21xTmlreGxIcXlXRDY1?=
 =?utf-8?B?ZVlvcGRXTDdiZEdqSWwwdVRUKzI4dEdHaWtQaFB0QTZTZ3djTWk4enhhKytn?=
 =?utf-8?B?S204WlRSQUlWRGs5RmE3U0kzNHFpTFRRODF1V3U4V3RaeTl3aHBZcWU1azJQ?=
 =?utf-8?B?MlFMcko4NHdiTFJrTVcrNTUyVVl2ZXVuQ0RJdFdQd29rZGwwdzVyeU1QWEN3?=
 =?utf-8?B?alNiQ3ZwMlg5TkpKRndKTHNTS09LbTZLMzJxaW5NNmY3Z1FKR010Y3BRalRa?=
 =?utf-8?B?RmYwYTVPcnZMaVFLbXliK2RldERwYVRvVHdzc284dnQxS2UwaWkwbEJSblV0?=
 =?utf-8?B?UklKZU9aY1RSckVVWnM2RmFuYmJVTHRvL0ROU2JnZmtmOTV0R09zcnNiMysw?=
 =?utf-8?B?M0E4QldTSWZ2UkRTV3pESWd4b1VXQ0pZM2tEdG1CYmdwMHVYeC95MTJQclg3?=
 =?utf-8?B?NXZJQkpEbStxNm5pMGlmV1A3WGk4aFdyeWR2ZElvNEI1N2JUMG5TK0pJMXla?=
 =?utf-8?B?dVhPakIxNU9qaXRoeDJpTVZFZ0Uwb2p3Y3ljMUpUQzgrZlp4Y09EZHhIYThS?=
 =?utf-8?B?b3dMTU1PSUZpeHczRmVsVUpOQTdWd3Q0TW12R3hNTzNhQm1sMWY0VWdNUlVP?=
 =?utf-8?B?c2xoMUJqaFE3YWZqT2xCVmxuazA0cDRWNGpGRjJlWm1IaEg4N3JUNEhRa3RO?=
 =?utf-8?B?MUxaRVpHODlvMzZhZXU1OWo1bnpEWjFvT29vamxlY29EaS9QK3FaUVdrTktZ?=
 =?utf-8?B?Y1V5RkZMdkFkd0hWMUxlMndLOFVpOEVuQnRiRTR3WmZQeC9CZWplQzgrT1RH?=
 =?utf-8?B?OWo4clZ6dUE1a01vdUYvV2VCUHUxa1lUOXpqaEZadTQ0YjVaTnFNMHc4bVk5?=
 =?utf-8?B?OUQzQzArcEtYRE9rK0JZbzBaRDBQaGV3SVAzZ3NRUEE5K0l3bjFOSC9GNWxH?=
 =?utf-8?B?ZjVIVktOeUI2QnQrTXN5bUFvV2o5eW52ank3UE4xY3g5bk5Oem1HaFBpZWhM?=
 =?utf-8?B?dlZSUEhmQStnWVQydVVTMXRYUnFxN0F3c3RpL3g4M3dCTFkySVdsdEUwT3JX?=
 =?utf-8?B?MWdGTlBvWGtVRGFYWVNtSVZHeGE5cVpDU0dIQlkxdUQ2emlENERCZWlFMGlh?=
 =?utf-8?B?Q09pWHN4Qk11S2RVVjZYaGpzdE5iMGJIU05vSFZhVHJDb0twVmczc2JmVDFP?=
 =?utf-8?B?M3ZkMlVMa3FXUUcxLzNsSm4zVWhzb1dqTDdGVTIvWFpmSDNLWlQwM2lCTFZp?=
 =?utf-8?B?VTlvUE1tSVRlcS94QlI4RWo1YVBzbjVyd25QdmhiYmljNUNjajZZNWFtOU1B?=
 =?utf-8?B?dk9rZVpmRW9pRGZDU1ZrK25jTThoS2xQeHhDWDNYQzNzL21wbUhxQ3BMWXc5?=
 =?utf-8?B?TzJ5bzFhWEV5RmIxNGZQRGsyUXY3Z0ZML3F4OTArOEtkaTVGQWV3aS9vamZr?=
 =?utf-8?B?UXlUdXVYSVoxV1JGUTE3VEt0YmIydVhFRXlySGQ3dmYwMzEyS1duVGczbW9B?=
 =?utf-8?B?Ny9SbkZqVFBxZHh1MkY3T0Vnck1hZWVuRWVHUTR0NVJkSnRUbm5rbWNWZ3JO?=
 =?utf-8?B?NWVJSVFodldibjVKM1NvN0JPZzA3MCtJY0l5RGMrVzduMXJzOEQxckJxUzdp?=
 =?utf-8?B?enRHbzhxemNNRG4vMDd6V1pWVlNtZCtxNEZtNlFRSTBQT3cxY3JXUkxkT0Ex?=
 =?utf-8?B?dWJqZ2t0ZGFJRkpxdXBXRlBzVmdjQlZ6VFF4cDNJVHhTM2tiYjZPMHpQLzM3?=
 =?utf-8?Q?OCvYMK10lV1Mb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFQ1d3RHT0ZRQ1RGR0tBNHZuUDhxMFJzR09EMWd5bktFQUZRWWVVeExTY1NP?=
 =?utf-8?B?cTBKWmEwU2tBeVVUNHJ0VlBTaFdlU0wwcVdnbEt1TUlJZzg0ZG9pT3A0WENE?=
 =?utf-8?B?aUt4bGVlTHAwejRoTTFwVW1jc3Z0Uy9Ob3k0VXJFa0tudGtHK0ltTXVjcFNO?=
 =?utf-8?B?c1d2VjZZKzVESUJFbHdMTHU4Umh1ZDU0VjgySGVuZUVxQjVqWUhFMERvN2pR?=
 =?utf-8?B?V0piMitkVVBHMDNRQThneFpBYWdBOXFuVDd1TGlGdVpnQjZzVHg0aFRJRmIz?=
 =?utf-8?B?VmNab0dqakxLMUwrVFR6eXdHZzdsU3pWUUxHM1EzeUdGRUt2Sm9GMkZTM1Rq?=
 =?utf-8?B?K1FFMk5WWnlTak5JMmNDR2hUeGw2b0k0RVQreWxDd0lHNXRuRGo4M0FhV3Zr?=
 =?utf-8?B?dHVXR21wd2RKYVBkN3MxSVpoWm9MbWRuaFJDcnZmVTBPMDBQWFI0dHpKbEcv?=
 =?utf-8?B?NWI2WTRzanZpSy94a1poVTFRbmQxTUxQSEsydW9ndFdpaWpYalQ4ZEVmQXV3?=
 =?utf-8?B?Njk2TmlKWTRvTG5OcVNYU0dHZDk4TTVZWklSV205WkxuYWx6YWw1ZFZXVjJR?=
 =?utf-8?B?eWU1clBKdURKSHlDazlIQTE2MDFrdmFNUGdSR1BjcktZaHlzSERhMnIySW5N?=
 =?utf-8?B?MXA0aEY4SjRFbjYwYU1wTmh3bVVON3VtMFJGb0ZZOVNBRE5LN0h0VkhWQ2Yx?=
 =?utf-8?B?MTZHbkZCbUt4Snl3K2ZCYW1XV1Z3OWlYNm9MWWU1NXRxVXY2eXBBYk9SdEQ5?=
 =?utf-8?B?QitycG8rOUVZb0V3NitadElzTjlBV1JmNzJqK21ZWGRVWmdYandZSk9HTE0w?=
 =?utf-8?B?L3pmNnJ5Vk5NcjkxZFkvYnJxTVpDekltSGV0bjBVc3dPZ0p3TkU2OXVXWTU4?=
 =?utf-8?B?eUlHd3FKME91a3UrZitLSlY0N2haSEtrNDIrVThaMGFVeFlQamJwS3pQT0M5?=
 =?utf-8?B?T3FXU3ZBRFUwbWZ0Mnd1aXloZHZqOCtwZ2FlYzRvUWJrNFVQeHpiVE0zNStC?=
 =?utf-8?B?ODA5MjNLU3VtRHVoZzgzT0NtUFhNZzZCbVhSaVdRc2ZvNmRrWmlzL0VtNFdj?=
 =?utf-8?B?RU9kYmllV3l4ejJPbnlRcmpwWVd0RHVscERab3NCTFZ0Nk9jeEVMN3hwNDZp?=
 =?utf-8?B?MlVRTWJicU5wUFNQMkxBd0NVTDFVb2tCSThZQ202YlJISTRFelAvNVBZNFpI?=
 =?utf-8?B?a0V0eHdlZ2tpb0Ftb2t3NW92UkZYMGRGMFRER0lyZ2ZDenUwY1R3R1VrNTVE?=
 =?utf-8?B?ZVMyMEhnYmIwZFVnaWlUb3lyMnIwRnU1Z1ZTOXdjSTZsT1krNFM2Y2lFK1U0?=
 =?utf-8?B?bnMrNE1qb0JCa0Q2anZVKyt6TklwekYzdTB5MTk3ZDBJUmNYMkoxVmU0WDF6?=
 =?utf-8?B?ZmZsK05QTDk0dkFpM3ZZTDV6SjE1UWlrZWJadXJEdVNkL3RDcjNVKzVxZ2dM?=
 =?utf-8?B?QUdpYWFacTRoL2ZVUXFwVmxHVG5YNithMHphYVpQcmg0OG43djdpampqRlIz?=
 =?utf-8?B?c3ZZZmFyZnNad1pWL1c0R0NETVBHZHdETDBzQ3RHdWU5eXlEcXM5T0p5Mlpk?=
 =?utf-8?B?Z0FONDlicC96cXJaWXNpNm5ncGc5Q2hDdXJjV2NoNGV0V2hwWGpLNURWckZR?=
 =?utf-8?B?dDRjYmZkRDRhNVpHWlI1SFgwY0x0MjZTTXNRb3R2S3hqVkZpQnpoVzNsM051?=
 =?utf-8?B?Y0NJNEJicTV6UmdJUGV2NXhKUmJYczlZSnVWWXBqWWxLb0xjdWoxYUVOUXh1?=
 =?utf-8?B?eUdSdVI5TjJLSVZXV2pnOHFzUUlZdjVJWkwwTGMyNEJzSXpyb3RESXozSDJa?=
 =?utf-8?B?V1dYZHZaMVI3WGt3dDl1azhJMkFtajBRK2lxcjliVm1qOGZaYm9zaUZ1UXpt?=
 =?utf-8?B?NVZXRjZHalFYSDlXN2RCYU1RTWNEenppL3llWURhTEEzM1NENXVMRXhHLytw?=
 =?utf-8?B?Y3Fud29VR3NOUGplMEUzcll2NjRaM3BuQlN3bVYvYm1LbFd6N3VWbXBYUDN1?=
 =?utf-8?B?ZXc0YlMxQlhkVkF3Ykh5NUZlcExQMTJZQXFSQWZNK2JYR0lldkZEbE1nZ1kx?=
 =?utf-8?B?cjl6ZUhyQUx4K3l4c0pFdGhNcFZPNnlSdmZDY0dKckV0NDhOREJxOHFTUnF2?=
 =?utf-8?B?NTBiK2h2Wkxtb3BMYy9rc0pNbi9GbFZscUg4Z0txZUExOEtOTXpScnJtbGNp?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37469f6b-327b-4b88-fa2d-08dd20a2ef4a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 03:03:52.9495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s02GM7jWoqRA+hisdMOo19JE3uY94EVY85Nl8Dg/MZhzCGC4jBKS/EUfQqlapNxmpwc1gr0TZLzAiX9t+lf9G+LREoFBoeVswjKJgjFHBSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8276
X-OriginatorOrg: intel.com

Hi Babu,

On 12/12/24 12:15 PM, Babu Moger wrote:
> Configure mbm_cntr_assign on AMD. 'mbm_cntr_assign' mode in AMD is ABMC
> (Assignable Bandwidth Monitoring Counters). It is enabled by default when
> supported on the system.

Needs imperative "Enable mbm_cntr_assign mode ..."

> 
> Ensure that the ABMC is updated on all logical processors in the resctrl
> domain.

Needs imperative (for example) "Update the assignable counter mode .."


Please distinguish how it is the architecture that decides what the
default mode should be. resctrl's part is to ensure that architecture
gets opportunity to configure every logical processor as it comes online.

Reinette
