Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C862C36B921;
	Thu, 13 Aug 2026 18:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786645447; cv=fail; b=duL52vttihdntqmzRSr0MkTasaqJlt9VRRbvXv3sBOcylagPTK/MrfEgqCvfoloSY98kdhnOSsnaEaPa8gaXiRXQzKOPdf+Pw81XCmp02YxY7+niUpZ2PB3q65IZCSnItSsrHW8TTp93qYdfeFYwoRyFfq+GRVDV9MwM+JQ0JiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786645447; c=relaxed/simple;
	bh=R2HBlM3zQoBYjO7p92aCb4rOhe5vRu8O4aHAGdAiSXg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ln5Q/plzLj4qdNP6ChabnFNa9iixvdrsu5j1Apm2zZC8HDdEJa0WdL7U+HSnZM/THx3qHY/4BP439j3b1AxESCwTP3k03b7HFLuv0qNobkU0ANfewnTEmM6pc3RwfusO9mR7jcbjiZ1q6o2QIcxDzqoXgWRVOZDIQcMbiNYFZk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TL2ykwlX; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TL2ykwlX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786645445; x=1818181445;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R2HBlM3zQoBYjO7p92aCb4rOhe5vRu8O4aHAGdAiSXg=;
  b=TL2ykwlX1z0pDm4efAG3Nr6vEveGBUWNukTf+X1Srkh9NSmfX/y+Yjfu
   vHnD3cP5gxaWZhAG4EfCTpx0+LtAqzTpM9xpI88qCrSZ02M++dP0VDt7v
   Ndz8YvYsjbNTQ6l+ADXUJ1eI2eXiKewZpdeH0kn8pMLv7vcrBsK3NTJ1q
   s62hyJ6vPbJY4720VLET83+u7Jgvjq+c73qN/dorMuxM9DJ70dq4Kf1Y/
   jVE6TgW8h0fDdXC35KB1GAS/5UzPreNeqPTLdiMNzqTkt20bBaG+sIzUf
   enCUKYqe7CUAmTXLl2cinzNtlvdkzWI2AbcT7ECYzc7lPCRky5lY78sC2
   Q==;
X-CSE-ConnectionGUID: l195cJ5cTH6g8Q3gZgGtqA==
X-CSE-MsgGUID: Qq0NEElbRzySTWwEiroUXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87444354"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87444354"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 11:24:04 -0700
X-CSE-ConnectionGUID: D+j5BRT+QeKuWZPMLcaaAQ==
X-CSE-MsgGUID: 22yh2OPtSSat503frvHxeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="264042237"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 11:24:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:24:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 11:24:03 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:24:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWLuW06MX7gtKZ3RnMaDxfuCdeKcsn3tiXXPsQ7GlxU/p8CA0ne+5jIM7P0pMKZs7bfnM9b+Cx4SUQ2zij0Q5RLQ4Z6TXYDbARkYvYCNJC0UcrmBfAq9nsO4nRKFsfwjlTBlLMSh41z/JF2BBkd3+aNj4yeBvGK53z+eDWCko82oz70VuQCux6xqBkHuvilcd8gfKOgS2JXQgTotkA+daEjQKzuH69BFntgvyI70cZwZvp9cVzJCrIizrg6hbSHCu2vqtDyjd/86y6K8zTiMg59knnnSxddL7PPtghXbJnUdomUOFzm7cBlMh9o8IdNg2JuB/rNaSvs20DYaOS05xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jnuxba/h6oZZwY4SLD/vFCQwuo5aTb2qGVkNbep7xZs=;
 b=xQrm+Kqxmh3oMR/NAM1zn9L9KR7Vu/QZh4Lo/RwEldHr6OU7spyuPDeGh3P8f6jDkefCMNL5lo0ojl7nP4W8BTugT3DAS701CvEvtVe34IPLuTfcksm8yYjJQHWEvLNFTQbEbuuJonZfold+hD3VdMX7dIg07+n3zMH9ujWep0VRZW7B5jTF+mDGMQ11soFC/Q42Vvm5UwHabnHExo/KMJYSyX7SjIHQugVCC/MX0+RMeDD9ZFbBWxxBjDP2yuWqIr2LYipQjzos5hceP7095uSGPqa5Ve/sVGuDgxKbkO2hla1aoE53nJWCTe/KIxWf33+619K/VIfev2ujgM+y5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MN2PR11MB4584.namprd11.prod.outlook.com (2603:10b6:208:264::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Thu, 13 Aug
 2026 18:23:59 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 18:23:58 +0000
Message-ID: <2d467216-db52-47a0-baaa-b6d4f9c99268@intel.com>
Date: Thu, 13 Aug 2026 11:23:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 08/15] fs/resctrl: Add interface to display
 supported and active kernel-mode policy
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
 <c86c7a64f25171b773077ec47a20850b44f73ada.1783461016.git.babu.moger@amd.com>
 <328e237e-3d26-47c0-8167-8ffe5d765daf@intel.com>
 <924aedc6-c2dc-4c09-84d5-2bdf1370ab36@amd.com>
 <24adc700-2062-44d1-92f3-4bc18d134b8d@intel.com>
 <f85e440c-8de5-444d-a7aa-8f9c2a58bcff@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <f85e440c-8de5-444d-a7aa-8f9c2a58bcff@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0378.namprd04.prod.outlook.com
 (2603:10b6:303:81::23) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|MN2PR11MB4584:EE_
X-MS-Office365-Filtering-Correlation-Id: 843ec447-9615-4ecb-7a22-08def9680acc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|921020|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: BSNfrnknCtfFYmKY051rEBegzDDPrDk/PEmA/5TcAmorxARW4bSIwEpwdsk4LRa1JUFkxX/hKXoarA0vZoLn5E25w1CKOB0ft75/+KYfDXKnJnVZyu+tJiGRnYWcLKt7KWqwlEfd5S+vKWwIsaobAY4feGf7BC3h5TM0e0zQWe0ZTe2cirKoMN9JnReDoX6LWcnLnqiHUS12y4FWNAC3nuFkBJFlujgKJWEMfoDOTOqeo79esy61I8yBcDJnPURpAW4UL41sTiJpECFBk/xB/ojr8akh+p8dtj5Mg4jBXP55HztT19s/K6o8uSutxLNz4pdMCfkuJDn6lAB7R9x8g9vcSQXzYcjLEIoeUMsgXQNhpZAzLqVenrfYg3Wp7jHz8d5AmIeyy+ML3aSOuYhvsI1W1ugi14jaBJxx3ZMAZhh0ORR8HZ0fstQsdQuwzU3UCgLXy58S1aiLfcWi9+hgtctkgfhmqi5qstY4TuqiEk5p4Gy0dMoQKq863U4/Uc4lmF/AA+XCFPOpV70NyA9RJboqOFke9yK3TrZCSAPaZtktPFklhXXFR3b4mXNE2OJmpVV6ZhWx1AxdvgLmqaJBtDfw5sT1wYAGd9VURnz/pIROe5h04YUirPxuat94Lh78PogPwvZh2LvoSeWTtkqlHTOVyQnu8Tx7Q5yBX/RYAN/xMcoVsSmUXNUQrw7Rpa/4xe3CTDBnofmo23IxB8pFfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(921020)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnBiaC9TYXlNUGZORVJhcWttUWZVSVR6NGpzQTNHcGRwU3U5eXNSMjdLdDlX?=
 =?utf-8?B?UUk4NVRGYkxaODU0UEQ0ZmdGaktRMEZZMmJoQ3dkTjRidkFnOEo5a3U1R0JS?=
 =?utf-8?B?d09VUytHclZuaC9TeHo3U3lHYjU1anZUeXZjNW05NHRNaTY5S3d6bjUyTWZD?=
 =?utf-8?B?N3hGa00vL05RdXJFUXppWWx4RjMwTUV0Q1ZYa3V2R2JyQ0pBYldXTVdYaE5K?=
 =?utf-8?B?cWViVDU1ODJod1lVM2VtYVhxMm5LOWhGbFEyNnNHd1BrSDBhSjBHKzQxRVJi?=
 =?utf-8?B?ZHFUTG9wSXNFQXdIWFgzL3NERUZrNDB5aXZ4VE1ZZXB0VjQrTnVZY3BacW1V?=
 =?utf-8?B?NS9TdDhpRVlXSHFmLzkxMVR3TDNsU0o3d3Q5Wjdta1dDMXUyMmF5ajNGeWI2?=
 =?utf-8?B?eHcwWmdYQXlOWm9CajVxU1NVTHNIM2NRUXVGVTZrZlNKMHRVNlVwanVRdVdF?=
 =?utf-8?B?MVZ4OGdhZUVUeFFNU0RmWGEzbk8vVXM1SmdjSE4rRWxONWt5TnhzbThWTldM?=
 =?utf-8?B?OSs0K2txVFdOYkVwL3cwcnc0YXlSVXBYdlk3NUYzeEQ1KzROQ1ZqdHNDVHdX?=
 =?utf-8?B?YzhRZHVtS3R2MWYzeUpudmxMdXJ1eEw0NHR5cjZRSlRuakFIMjNSaWFmc0Ji?=
 =?utf-8?B?VVZ5MUdxeEgzNCs5cjVPL3JzS1Q4YnNPYmJlbS9KcDUwODlYM1lqdWpMR3NK?=
 =?utf-8?B?Um4vRFRHVno3M01rV2lhZEZMK1hjVU9yemxFTnpjNUpIaTlvSlNsQ2ptTm5y?=
 =?utf-8?B?SU1LdUVxcm1jSE5PTVhJOU83bGpWdDJ6RGYyYVFoVmlJYVhHVlg4bkRPN3hW?=
 =?utf-8?B?Vjk0Sm5kc3BtdlBRMm4zUmZyMHI4TjVFRjF2dG5ERXNrcllPTGdRK1VOL2dJ?=
 =?utf-8?B?WEp6MmNQUjVPUUZTdVlnSzUySktIRnFtSmFjN0xRTm5iZWtEWWJiSzZneFRt?=
 =?utf-8?B?SDVpY05sL2diY0VsVzJQOC9Kek9JUnJqRE5nL2NLaHhOZGRVZ3NJamV1ZU1s?=
 =?utf-8?B?MDlUKzRreEZGcjVNU1dpMUFOTnRmeGp1ZW83ejJ5UGtwbnRRMFk2ZzBnUFlk?=
 =?utf-8?B?RGNqYmhXL05nRXY4RC9tNzNOeUpzVjE3YzgwWTU1L042LzduaWtlMmdUY1V6?=
 =?utf-8?B?TkVaWXh4MG15clgrSFlXSG9SUTVkQkg2VGlMckVZVFVmcUpPdS82eHF6Q3Yv?=
 =?utf-8?B?dmxURS9PeXUzUitHWWV5UGhidmtIRGMzVFhRendnTXVsQlNmMzdEendPYVdW?=
 =?utf-8?B?ZzJjWWtZUWtyU29FelhiU1VRZGlMNW9zNzNYdzBFSUdaQjJBc1NKZTN3WWFN?=
 =?utf-8?B?RnY5b0RjVk1MWnFGNmdGSEh5eG1SclcrZkhYeVN3c25ZdUdvMCtsM0Mvc3dE?=
 =?utf-8?B?dUN2cEJPZ09waWE0RER1a0dpR0I1UmxnSDhUZWk4akhPdmJ0QzV1eUJTN3VH?=
 =?utf-8?B?OVhVaG0rclI2OHIwWElaN0R5bnl3Zk5iK0RGVW9Hay9EMjdwMmFyVytNeEFN?=
 =?utf-8?B?bUhrb1N6TnlWalBuLzRoUVo2aHliTVYyNkhVZGpwR0tZUlNUUDVtZHcyK1pF?=
 =?utf-8?B?UjJpbFJ5dzBLdXFJdEsrYVlnbzZ0V21USFdwd2FjUllidnJoWnMzUHZYWVFx?=
 =?utf-8?B?Y3RwdWw1UnhMZVlwYWxyaUZmei81bXNoaTd5ekkvZUxjeU1uQlVDM08weE0y?=
 =?utf-8?B?Y2Q3S1BDZHZKQzIrWm1Ed3ppdnZYUTNZaU56RldYajVzRG5US2RPdTJobGRZ?=
 =?utf-8?B?OFc2RzRJRlA1SnNreEpTK0JEZFlrcCs0OFRjcktvdjBObTRQT0x0MHBSdjYy?=
 =?utf-8?B?c1pQSTFiTUMyVk80Vko1Q2UvOVduenFnMEdwWXBZbVNTSjY4WFRxemhwQkhJ?=
 =?utf-8?B?d0lpN1VzZmZ5TEE1eVBqNXZ0U3dLRHlnMHJzNWkzR0VJcmJqS3dZL01wVUFy?=
 =?utf-8?B?REpGb0ZmMXBYZzQ5YmhOMWo0cU1GWVJUcU5JL1EyWXl2UnR4Z01sWWc0R3lH?=
 =?utf-8?B?aVlzcDNubTRUWklveDhSVHpVSlBGdzc0Sy9HczYzaEtWZnI0TlhvU0U2OU1T?=
 =?utf-8?B?NDBGTi8xSWl3ei9jTExhMXduRWxIMTN3RkFlV1FDa1Y3czB6RzY2WWI3cU02?=
 =?utf-8?B?c0drMlQySVhEbmdVZHVKWWxMazcvZ2I3Y0g4bnhiOXBNdkpqd2I3bDRidGxM?=
 =?utf-8?B?MzdKZHFCZjM5Vmk2MGN2MEpWUW5pSGoreTRWTGhaZFltWjZId2xNL3RTN2w3?=
 =?utf-8?B?WjRSKzl1NFpubCtXSkRhWWZneWI3VDN3b2ZvK0hLRFh5K3RoRmNOYmxoSnAy?=
 =?utf-8?B?bTc5Y3MzZHhZVzJQK3VCdG1ESlN5RXNaZC9odUVscmkyRTc3N2hZVC9GK011?=
 =?utf-8?Q?yj/tPEyjncVdVUzU=3D?=
X-Exchange-RoutingPolicyChecked: CtDABr57vsZAcSK9LBr3GZpQ+ni+Nqtr3XndS178oiIK9b2GO0ey/i+O5B1xVK/DFLs5DDhrsfBJwWVETzEKbSru8ntnT5EwsJamoLcc4VN0EqDqTSp4WtproT98F5Qrlv5c10/aa1yx2RN5y4XSDS94kcvaEwQZy92vFbQnRDRetRgl1Pic5Feu9AZsyv9WsBongDzXOUIHrusQQ/SzWAixJLry7wgbKptFoC1IhTuYnggTFkOOV0PAk/xA45CP/YVwlQdGr0raMd7o2PxwtM97/kcQ4ux2qf8Zlafpq84THssLvSHKbEcWlT8dgM79D3c2D7mJpj6BsvmJh8VrpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 843ec447-9615-4ecb-7a22-08def9680acc
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 18:23:58.8199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zhjccCogTqPVebiiUxykbfHMy2FRfMtbe9stKp9fan/AxhzgBpKEKw64narHOdhPLNMFmyuSOjWv2D2XUEwh1plMDHu7sms+FGDNfOEutM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4584
X-OriginatorOrg: intel.com

Hi Babu,

On 8/13/26 9:04 AM, Babu Moger wrote:
> Hi Reinette,
> 
> On 8/12/26 18:38, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 8/12/26 3:57 PM, Moger, Babu wrote:
>>> On 8/10/2026 10:18 PM, Reinette Chatre wrote:
>>>> On 7/7/26 2:50 PM, Babu Moger wrote:
>>
>> ...
>>
>>>>> +         */
>>>>> +        rdtgrp = resctrl_kcfg.k_rdtgrp;
>>>>> +        if (!rdtgrp) {
>>>>> +            ret = -ENOENT;
>>>>> +            goto out_unlock;
>>>>
>>>> If this fails there needs to be content in last_cmd_status. Otherwise this
>>>> fails and then last_cmd_status reads "ok" or worse .. an old failure message.
>>>
>>> if (WARN_ON(!rdtgrp)) {
>>>      rdt_last_cmd_puts("Invalid kernel mode group\n");
>>>      ret = -ENOENT;
>>>      goto out_unlock;
>>> }
>> It is not clear to me why the WARN_ON() was added. Is the resource group not being
>> associated with kernel mode not a legitimate scenario if the kernel mode group was
>> re-assigned while the reader of this file was blocked on the mutex?
>>
> A valid group is required whenever any global mode is enabled.
> Reaching this condition without one is unexpected and should be
> treated as a bug.
> 
> To help catch this, I added a WARN_ON() to log the issue. I think
> updating last_cmd_status is reasonable as well and should provide
> the necessary user-visible error indication.

ah - thanks. I misread this snippet as an interaction with a resource group's
files.

Reinette
