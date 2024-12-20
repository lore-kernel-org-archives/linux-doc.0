Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8F519F43B;
	Fri, 20 Dec 2024 20:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734728356; cv=fail; b=pp6fQngKqkpEHQ5tIbNSWyt3qndwgmZqSOK5zTpwyqsonJQTeE/jP9MeQQ00hKHBYecjdVPEg8IwqFDfXbSsbDFws72xRZP51upJEvWwSRMiIddRyxvwwCfqu1jAKlv3J7YMhEG/ShONh9X+atLntuoZjDCJv67WQ6uZoqOa4E0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734728356; c=relaxed/simple;
	bh=iBPLZCQvQrUjIMYhQAmGQf2xV+iDxlzY1xoaQmHE/qs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sdBBUL57w2ahnwcQMyvbU6VaBfsT80OAxi03YdCv3I+KoW5O0tqi4RqL2dfKUTne6eOQaV75OqS6sy02+nTk9kGUlYFmh0iqTM1MpShVje+a9hu0/a1NG8o+H7V6/+Voj160dfrOH+5uJZAMR3j5Wfbt/WWbaMBpniFNVjmjn44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZwMc+0i; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZwMc+0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734728355; x=1766264355;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iBPLZCQvQrUjIMYhQAmGQf2xV+iDxlzY1xoaQmHE/qs=;
  b=aZwMc+0ilTXblfifGacp+Xm5brlzd08Ig6JORA1E/Y3+Nn93GylsTJqi
   h3E+01ieIDwLNBpA/gh7pDL6V/qJpW69fyC42dbXazY5q5/izAnsYNbaR
   j8Orj5kPVHqZgeVWXidCXUapoiIsyZkeXVbyCwrMgKwX+osnZT4U4wDfu
   ujfCPGt0G89Sd3shZzReeF7XOkGX/dn41AfkcBNZc4vm9/8Asf1krV/dn
   Cqp9LM2iSYESVh1Ddl828//HuYDQY1BJh4RZq2pxxE71oEscs1g+2KuF/
   tuJluxOdJPOSgCc3zgpZrma0BTJxlX6wJs7qs6YZzELLOTb7n0q3Odals
   A==;
X-CSE-ConnectionGUID: RPIDZo6aRdSKNmBmC81XmQ==
X-CSE-MsgGUID: +jX51sMURbC1Y3ahKulWnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35314248"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35314248"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 12:59:13 -0800
X-CSE-ConnectionGUID: 2t63w58SSySwwoQOO+uuZw==
X-CSE-MsgGUID: DV02fWMGR0mlKyXEknM7qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102726687"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Dec 2024 12:59:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 12:59:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 12:59:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 12:59:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ah2T/OtTa9+0JyqX+tpDk119EF6MnmRkaXlRVjSSCmbaXp6prBVFqiNaeyflmDptve1OSAbzKP+V6m7VFI9v1+D/BoXBWZJAYDMxOECUa4p4v67S4u4r96JfYRrYVtiKa0itcVq3UNIHhqAmzA0gPlaaoeyF1dKpuhEBqgrVgyNo5qCJHgY2NQe9dOMVgiDK3jB3CMuuo8Ge3GZ3/BRVUImOtG5+iY3sTbwQ0h/YYp9697BLlPvFtB+IV5cR96IVDUosJMuV922hyyUgq0rVpQ7cLQAU0h+I3GJfgZRiMFJfcmGDsIHfhEUpG1La8A7oK7F1kmwtw1AV3gz+z/6uOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bn78CEpwR3kAP/DgCLcpKM55+/YwWu8cVV+blI+g+qc=;
 b=bM+2/yvnsitj09passIiMWrK2fzbrOhIpN4/EA7haprJy/09jn5pd+Ql1vAZsh1bc0SGg9YcRt9Wheu6Xvab/Y32ag21T1KX/HNtouaYiCLzi0+7wVghMw4QBfPTPbdsFIfq5MgWYEjY+3EZz87ITbkMv1Bt7nJLu7orOdrvjj/QlpeKB5CVhxyBWSRGA4CGElzMuruV/wmOdEPe5uchENCa6x4ymTZtITYFbQUWGH9c2MDfT+qUmRVYWJciz9LewXVXO39sIab9zXGenx4iCx8VMq7SyMVG4KmFj0zKV55a3MwqqkYu/FZM6/fvoD6CrvoYLzvshM40ERKmHJM24g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH8PR11MB8063.namprd11.prod.outlook.com (2603:10b6:510:252::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Fri, 20 Dec
 2024 20:58:36 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 20:58:36 +0000
Message-ID: <b992c216-0eba-4ad5-9cde-5e6b29e960bb@intel.com>
Date: Fri, 20 Dec 2024 12:58:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 12/24] x86/resctrl: Introduce cntr_cfg to track
 assignable counters at domain
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
CC: <fenghua.yu@intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<paulmck@kernel.org>, <akpm@linux-foundation.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1734034524.git.babu.moger@amd.com>
 <5abf8affeaade3e7b08e9509d11bc78143935800.1734034524.git.babu.moger@amd.com>
 <9a8a0e45-82fd-4126-86d7-a4f7b2d583c3@intel.com>
 <5b02cab6-d539-41a9-af1a-e0fee1b9a74d@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <5b02cab6-d539-41a9-af1a-e0fee1b9a74d@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0238.namprd04.prod.outlook.com
 (2603:10b6:303:87::33) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH8PR11MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: ea84169b-2fb1-4e79-13ce-08dd21391230
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDZjand0bmlMQ3Z5L3NOclhzUE5YdHhjQmhnMmlFdEYxQVJsaTY5S0dhWEdS?=
 =?utf-8?B?akZlNmpiampXSVorTkdXYUxkQ2Rjai9FZVBFSStVR1lHS2Z2NTZTUlllTTg1?=
 =?utf-8?B?WnJFbDNmZnNOeVdoNVp4YlJHR2hZSW1KdG5qK216U3plRkN2Q3FhT3VDRmVP?=
 =?utf-8?B?U3V3d2ZCMno3Y3h4eWdXNTh1MDRodTdsdkYyK2VNN0srb3I5b0JqOHZEeEVC?=
 =?utf-8?B?Q0JKN1VIYWNuV0xpNGgzb25qU3ZPczRIaU9oS3VubVVkbmlia1ZnWFJCaXhJ?=
 =?utf-8?B?bnB4NmZTZmpwN0d4WkI1Z05KWXErVDNxaUpXdTBiUFdGQ1FQQ0Z1Y0ZiNngr?=
 =?utf-8?B?SEFIZGJhckpPZmxNRGVoN3hOOFpKZU5qZDFuc1Jic0g0UFd1dzE1bno0ZVk3?=
 =?utf-8?B?azlLVmdLVnlROU1VSlJHNm8xYU5HTUZRZDB3VlgyL1FBa3dWa3h5d1pweCth?=
 =?utf-8?B?dEE2Wmp3alhBNDYvdXdpcDh5RDRZR2p4Ujl2dWNTbUtqS1NiZlV0UFpmdS84?=
 =?utf-8?B?R1J2Z3JyN3JvMXpaSFhTR1RsVFhKSlhCZzIrRDRLTFFBdnN4WHV4b3pxMmNW?=
 =?utf-8?B?SXA4MHZrZUVLNk1TNXVMQlFzWlhLcjhhWjFTdE9XelFCcGY4REUvcFdvT09R?=
 =?utf-8?B?b3hYVDRyN1ZTa3NpNkJERjJjci9scjZxaEV6VEJPM3pucmNUWEV4dHUwbTJR?=
 =?utf-8?B?YVE5SFhmcEI4RWNXRy9WbVNYaVJSWm5GZEx3MFJFQ3JzbCt3eUVOYjVEVUpq?=
 =?utf-8?B?dzJPcG1mM3I0N3MvbCtEQTB6Mnh0dEozd3BHWWpacVFIa3dUdHRmVW9EOC92?=
 =?utf-8?B?WjZWT0RWWXFjOWhSK3dOL1RWNVkyTStxa0hiYjdFaXZUZ0dDZ2prS1E3cmcy?=
 =?utf-8?B?YjFBbXdYaHpIWDdWUGtzUFo4aFFOQW1TVWo0QUh0bDBPcm1GRHNRN1FlVjFp?=
 =?utf-8?B?RmRJN2xpK3pGZHJYQlI2ZjFxUndLWEdtL0Y2VHdSNk5ZcUZQTnpoTWt4WFRR?=
 =?utf-8?B?ZXkzQXJUVHJNSlEvVTZ1SU9BTnFrQkc0emg5OVUxaXdERkhBQmZmZFhBMlFj?=
 =?utf-8?B?QktGczVDR3NqL0JjQjlxdCtYRjZkY2JVVjZhekZ0eWFDakErWWJIYXhKRmtO?=
 =?utf-8?B?OUlWeWdqb084WkhsQjdvWWk3aHY2M0ZxOFR0amNVMWNNa1hmdklYUUF0aDdY?=
 =?utf-8?B?SkQ5cVlrSmdjVUMydEp6MmtkVENzUkI1UzJHbVArbm01bUFMWGo2c0ZQWXBa?=
 =?utf-8?B?R0RNcGlOQlBsQlU3WnZ6L1FUdTBOSC9JOEYxQzlybVdwaVJUODErcHc4SWxU?=
 =?utf-8?B?N3ZHNll0eEY5b2R0S0g5NEUzbEtDM2h3QUswbFAwWncwU3c3T0tCUkt5R1Js?=
 =?utf-8?B?RjlSMGpVTENKMWE2cGtZTk9ldFg1aFpZTEJpeWpoVzZoQmxhS2NMMVNySHc1?=
 =?utf-8?B?MGFhUVdscmw1UmhsRC8vMlNwcjE3VmVQRlpTZTJ4S2pQSThHNU4reE1rMFhl?=
 =?utf-8?B?YVRqZlhjdXN2eFduN25FbnB2b0VGR1NQZEFZZHA4aXRkeUU3cHBxRmdBd1lZ?=
 =?utf-8?B?NWphVS93eGZXcWd3UndaQWg5WkQzSjIzMlJaUVBZT3lFQXBTaVZvMmRPOG5a?=
 =?utf-8?B?VysrSC9HTi9uWDRxb3JkbXdJUXk4M0RVanhTc0RGdm9QejcvMnltV09jWWVP?=
 =?utf-8?B?enZpQTZ3eTN4dlMxWHZMMG5MZkxHeHJIWit1aDFqNzNnMThESGM5QjhBa0Mr?=
 =?utf-8?B?b0hYQldDam5NTGNyRG41TVJQL2diSzZnUkFxSDlkVTFnMzRjRUU3V0Q0U0FO?=
 =?utf-8?B?ZUxQTzU2V0h2RjRWVG91aGVOenVDdHJBZlJXb1llWUdybTFMdFhQejBqSXJZ?=
 =?utf-8?B?S3owLzFGclNoQXlYTnF0UWlQb3ZyZ0R2SHBwempkRmVkSTdSR1NoaXRackJX?=
 =?utf-8?Q?QaesZKYjIbM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGVSTlpseWlCTGlLVXZnZG56MmlZZUNhRkRvVVlCdmpVSTRWeEVrWnFjUFFn?=
 =?utf-8?B?Y3lpa3o1NGxUT0o4c3ZwWW84Uy9QaVQ5Vldsc1p5T0JneVVTYXdrUi8zTUZl?=
 =?utf-8?B?NVJYZStWeks1M21iSVhFcmFBaVc4UndtNGRvMU5VRXVtaUlsamNvUTBqN0Zk?=
 =?utf-8?B?OTdIdmtvalp3eTQweHRpdk1kU1dkZVBaNmNXbnhiMEl0ZUI2cDMyS25BZW04?=
 =?utf-8?B?c2xzN1duck1SYXRHcEl1VHVzZDlNL24xemVoTWhuQWQ2b2dlZDdNTG1kN0lX?=
 =?utf-8?B?UGFmbkdIdVNKdVRTVzBLODQvcHd3K1pYSTZET3ppRjRReitnTkN3cWV2clUy?=
 =?utf-8?B?SFZoTUxXVlRIeGpoNVErVy94OWozWnZMSEgrUXJZeXZFamRGN3FxNzlITEUx?=
 =?utf-8?B?Y2JsWXh4RlJvdzBhWWhDa3Q4UGhHemRrZHNOaElidkNiSXphU1ViQ0ZXa09B?=
 =?utf-8?B?eHdqenZEbEYyQW1KUHJSMXQrZWtQM3FXODB5SSs0bHIwNFZvYUdibk5NdEJl?=
 =?utf-8?B?bDhBMjE5bHRhQStiSWN1T3I5WnJjVGZCV0JNWFUyWDJnZXkxazhkYkFnRyto?=
 =?utf-8?B?NS81SHpYTlNLd0FDVnVLUVdwZDFBWVlFcVluY1BSalNTSFZLQUd5cnc5M1dC?=
 =?utf-8?B?bjFBSUZwTCtjRytQMlhuUjVOYnBjTm1raWY2bVdGdzN3bElLWG9NY1RDVy9C?=
 =?utf-8?B?cG1VWTdkdkdTcGtJK2VhOGlYMFZ3Uk1JaGpOaHYvdDdsT3Iyb1N5eC9YMVA3?=
 =?utf-8?B?d0lpUkNkTG8vT0hSVkdMa1NMN2NMQ3hmYU05aUVpWFhlZUdneWg1ZFd0bHNW?=
 =?utf-8?B?RE9XQ0x5cjkyVS9DNjVtM3diNHA0T203UFZFWEszWFlTTTQxS2NzVXdXTkM2?=
 =?utf-8?B?bTVvTGZLMnIzV1QzOUpkZHhuYndWRERzZGM4dTBHVnBwbFBNb2RGa2hpZ1Rp?=
 =?utf-8?B?NWZRRmV3NDFCT3FLUFVzWkVLd1AvdEFaajI4am9FYWdkT0hrSkVaUThURHNm?=
 =?utf-8?B?UmhpTHVMVXh4M3ZJSUVMSnJ1VUFBUUFOY0d1SjB4RU53OHJIdHFZWnl2WVZX?=
 =?utf-8?B?VWlRQnlpVmpRYzhmL1VIYy81aUdnQlRFQzNwa2wvYlFwQkFuTTBOdnp2SzRP?=
 =?utf-8?B?SVlpTDk2NkZ6d2tuMTQyajcxZEcrMVMrVzhZbTNVWmxybWtkRjNLb0UxSWxi?=
 =?utf-8?B?MHdSWW1KSU9ZLzhCc1pSRjBZUE16RlNUdXNJMFdmbGl6ejZQbGpSRVFVanR6?=
 =?utf-8?B?M3J3VE4wQ3BRbzJ4TEl6MVgwSkxKUWw5VVU3TjlFSDR0bk82YUc0ajE5OTVJ?=
 =?utf-8?B?dUxwMlR0QjNtZGdNeTQxWkFKZEoyVDUzOGpZTlRJQXBTVDdVdStKVFJ3SytX?=
 =?utf-8?B?ZnpXY0J6dStzRmJ0VENiUjB2ZVN0S0RDa21BV1JPK0VCYlRYTmJ5OXF3a0w4?=
 =?utf-8?B?NGovVTNobDg5SnFoL3Y5cFViUFhzQTViOUdzMzZXOWxKemxMY01MeXhRNXFw?=
 =?utf-8?B?WGtIMlJqNmVkSDFCS1FrRXFhMElYM0NUeXZwMmlmc3lsZGtLR1A4UU51L2Zh?=
 =?utf-8?B?b2xjaTBKclhQNkRUWWpVeHg2MXN1TjEwdjMvTHBHZHFvdk5adVFabGdvWGlX?=
 =?utf-8?B?N2g3WWpGbWNIRU0rOERIVzFBdHFuVGkyem81Mkc5Q3lidVdpaHVZN2lEOTZj?=
 =?utf-8?B?K0I0NVhDWHhYbjkvS1AwemVZMEpqWEtJVUxpYW0vYkh6NklQRWQ1Z3pkUlUx?=
 =?utf-8?B?U0RQTjRNRUU1VTZUOExlMklQVU51ZFN2ZzNtYzljZkNxUTlpcmdzSlF6SEMy?=
 =?utf-8?B?bTMxeDBmeThqT0d3R1V4S1Z1eTFlVCsyc3E2LzRuR3FTYmhucGNIc01XU0Rx?=
 =?utf-8?B?RDU4dDk3UHdkY090cEtZK2ZDSXlDa0RFbThqa1hYR3p3cWZBTzlBSmZyaHV3?=
 =?utf-8?B?VkxqVXZLR3I3U3ZmK3VDanRvMW0wSDhBaVE4Q2xTbk5aUW5hckhCQUVxUFVt?=
 =?utf-8?B?SFd4a25jU0ZBRm00NXlHRWpXMFk5MERUK21kWEtqUUErZ2EyRWZTeHU3SnpT?=
 =?utf-8?B?YUVwOWtpU3Rzd1hES3Jnd3ZkK0xWRmJSNzNMUnY0NUtldWxQMEhpK1d1bE4y?=
 =?utf-8?B?ZlhsVzNvKzV6M2RpejZHWlNpamNvNjR3MDkvRHV1SGVLOHdWM1l5bEFFelBW?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea84169b-2fb1-4e79-13ce-08dd21391230
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 20:58:35.9982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5WjK6Co9rIxyHEwntjm4BjeOQV3UWVETWoyfL2UpmmzqqJQn5B7xHgAYojVXJYYKWRzKpw5Rx+OC5tYk1rGpyVl0LJMc2aMivIJ0BsJoVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8063
X-OriginatorOrg: intel.com

Hi Babu,

On 12/20/24 9:33 AM, Moger, Babu wrote:
> On 12/19/2024 4:33 PM, Reinette Chatre wrote:
>> On 12/12/24 12:15 PM, Babu Moger wrote:
>>> In mbm_assign_mode, the MBM counters are assigned/unassigned to an RMID,
>>> event pair in a resctrl group and monitor the bandwidth as long as it is
>>> assigned. Counters are assigned/unassigned at domain level and needs to
>>> be tracked at domain level.
>>>
>>> Add the mbm_assign_cntr_cfg data structure to struct rdt_ctrl_domain to
>>
>> "mbm_assign_cntr_cfg" -> "mbm_cntr_cfg"
> 
> Sure.
> 
>>
>>> manage and track MBM counter assignments at the domain level.
>>
>> This can really use some more information about this data structure. I think
>> it will be helpful to provide more information about how the data structure
>> looks ... for example, that it is an array indexed by counter ID where the
>> assignment details of each counter is stored. I also think it will be helpful
>> to describe how interactions with  this data structure works, that a NULL
>> rdtgrp means that the counter is free and that it is not possible to find
>> a counter from a resource group and arrays need to be searched instead and doing
>> so is ok for $REASON (when considering the number of RMID and domain combinations
>> possible on AMD). A lot is left for the reader to figure out.
> 
> How about this?
> 
> 
> In mbm_assign_mode, the MBM counters are assigned/unassigned to an RMID,
> event pair in a resctrl group and monitor the bandwidth as long as it is
> assigned. Counters are assigned/unassigned at domain level and needs to
> be tracked at domain level.
> 
> Add the mbm_cntr_cfg data structure to struct rdt_ctrl_domain to
> manage and track MBM counter assignments at the domain level.
> 
> Each domain will contain num_mbm_cntrs entries, indexed by cntr_id. During initialization, all entries will be set to zero. When a counter is allocated, its corresponding entry will be populated with the assigned struct rdtgroup and enum resctrl_event_id. When the counter is released, its entry will be reset to zero.

It will be better if you take a step back and create a coherent changelog
instead of appending independent text snippets. What you present has the
same mistake as before (mbm_assign_mode vs mbm_cntr_assign mode) and does
not address all the points raised.
Consider something like below (please check, improve, and complete):

	In mbm_cntr_assign mode hardware counters are assigned/unassigned
	to an MBM event of a monitor group. Hardware counters are
	assigned/unassigned at monitoring domain level.

	Manage a monitoring domain's hardware counters using a per monitoring
	domain array of struct mbm_cntr_cfg that is indexed by the hardware
	counter	ID. A hardware counter's configuration contains the MBM event
	ID and points to the monitoring group that it is assigned to, with a
	NULL pointer meaning that the hardware counter is available for assignment.

	There is no direct way to determine which hardware counters are	assigned
	to a particular monitoring group. Check every entry of every hardware
	counter	configuration array in every monitoring domain to query which
	MBM events of a monitoring group is tracked by hardware. Such queries
	are acceptable because <insert reason here>.

                                                                                
Please work on creating good changelogs. The requirements should be clear to you. 

Reinette
