Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795456314;
	b=W5E0b5mDoKlTySeyTnw7sqHVnRRqA/69K/YktLDTGh2MxUMB2/uhdH2fkQBJ5Gl83W1y
	 sz41wt10M1lL2X5b+rIK14weQqBNlHdP+Q2gqdGQzuifQkVIe6kuqKprrfo0101lQk5yw
	 L2TNxe9aVBNGH+T97n//r511jIDxbjnIedhRGW4dM8nMBG5Adh0M9jE7MJ8Cd9zclNxU+
	 00TlkLTpyJ0Gwks+ISncwfvW6DkGfda4dv+YV8WRpWY8B7F6TZ4UypkFl0xYefNgX8P1S
	 NExePZKK9hqFn5JLAJyFZ6NlvpitYKe29+jMGQI9moJtgu0+eCQwHdvWsQ8wRu6SJvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456314;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=FdK1MDJfvp7LwebfNrWRIjJ12sBs/Z70O4mymCOFeAk=;
	b=Zpfh2T7NWDXPwvW89zIKueHK8W2vXQKOsweQLM46LQ1m3rNhXeFSR76RpVzsudrNbCVR
	 xTmmAQieyKzmxdRbjnAPyP4G7RMEe5qsLp+zJZxaiVKlpo8TBAUM/aujctaFPzzaVECa/
	 tCKuuyf5h+hdS6ZiwWOe0CLs3dwNE/lmpDJ/G1chg4YNWTh6XbZdv7IuZoVhWwHr07H7J
	 cNidkpSEyxfttstmoMznMzYY8tSvdW4VF7COcwGA2q+jUMdLEkyDJWeQgZfUx1YC2br6S
	 f2c8JdQCD3j4ZQ4B4hd/1Yb5gWP/AhYwhqWOGIbExfJc8hqg0grGSOn5Bz8tBFRaZ0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cYh1HzZZ;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="d7gtT/eX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41815606A31F;
	Mon, 23 Nov 2026 17:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41815606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cYh1HzZZ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=d7gtT/eX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795456314; x=1826992314;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=eqkTxoLLWE7bvAhz7+HAOVsPYciKVwqHQ2rBImYWhKg=;
  b=cYh1HzZZWG4bdbKYr0Toma8QCCWRBQ6CoEw0rwLvxMfIsijfXb3k0n45
   ynSQg3bYWtPvv06koN7JKEVWz3RCiIgx5KSo2hhdN9J5z8+7NdyXZF9eq
   QF5lcuPegePx4Xa1TUoBVirLjvMpocxDdvm2zPaKnoymqu/dBo5fqvaVL
   tPVpZeKVBB6v6kHdvEU2b165qOMuogHbJyX4wA83EJqfaLuFPP0kFc3E+
   fwJAEOGHbpL7Y3WJadi68dL4fl8k/IN8QvozwY1yAjaNZqaTTavENEe7J
   PlmHp0baplwZawbBwWcf2cVKnaqjhh8xccp+crIH2QsyLM5F8O64JX7T5
   Q==;
X-CSE-ConnectionGUID: +XNpUEhISp+jnjBvD6W8jg==
X-CSE-MsgGUID: Kl8p+YyCTfKPA02QYroW4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4114473"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4114473"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 09:51:52 -0800
X-CSE-ConnectionGUID: kGGhNZoXThSyEXQdAZ+jww==
X-CSE-MsgGUID: gwJxo69zRpCZe+R5pwIqyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11384486"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 09:51:51 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 09:51:50 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 09:51:50 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 09:51:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYV/WL5ZqLdVFn0uxCjAJ2yaq8ptqFSQMZ1qmIzSRNaj3qQxTtdaEiOuNuZj9kuTsg5MQJ3Txqu0gYDqS69VPamD0u6v2VgK8pMrwZ9k10XWv2Byuq0h5rukiKGj62LjLmsn2UpgVgd1VLzD04Uib39o+KPvmA+YlNBpaWFwBRQ4NlnYnAr3uzIQ9GgXPcLTyI8ej0MquB3e6IXZc42duGqAJWsS1AMkqzKM3xrVhByJwJrc99MlayUUVCcJrf39PwPb676jztlQEWUZZvStLxfzsBPvu7nq779ABifLHW9gSJkBtsaRPaa81qzBGL7FAho6ffyJ8eDUnZXvM6warg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdK1MDJfvp7LwebfNrWRIjJ12sBs/Z70O4mymCOFeAk=;
 b=a7lQURsVKpX4eBlX1Sk3HA5pV+NNKclf0f9YmYSDv58HTMRZJLeWRt5xQD1fz4yYU3WgZ4Mmc2/m0zDPQbdQrw52lmbcq+INfz+zGY42jVFSxJE3Vc18siae7Yj1+2WP5qR9z9KK3y1niGcqWGl7TQKtzYc5x6+nmPQH7yXm2pIJDDiHo+BmgEYQVzQnkBpQ3nGIuBVM6/e4u2tagg1wPygvgyFT0FV0D+iJHeUtW5aIk6MspeqSDcD+/p95DE/ThR/r0tMHloYEeM/BShAUFTqNUQKAXC1AJw8TBOLyeHmITJY94xNen9yrq+9GrQMYABuP8jP6cut9YRdH/NEpJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdK1MDJfvp7LwebfNrWRIjJ12sBs/Z70O4mymCOFeAk=;
 b=d7gtT/eXPKFxbcLLQrl2GWZApxfArcARjIZ7ph/OGJhMZ4LHAHKnSvIJR5J5vdHjf7CjVbNJNubv1SpyIsWOQ2gTtEXVyFjSEywjOaXbGEp7n8A6zlX6f4ehGcF+qcEal/eTEFF4jjM1knHuDaXlZsgBwIsiWqH0kq8Ccp9egEk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by BL3PR11MB6387.namprd11.prod.outlook.com (2603:10b6:208:3b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:51:38 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0615.009; Mon, 23 Nov 2026
 17:51:38 +0000
Message-ID: <0e51dda0-8be0-439c-91f0-ce292fb0c13b@intel.com>
Date: Mon, 23 Nov 2026 09:51:35 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 7/7] fs/resctrl: Add info/moveable_mon_group
To: Ben Horgan <ben.horgan@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
	<tony.luck@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tglx@kernel.org>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<gshan@redhat.com>, <zengheng4@huawei.com>, <jic23@kernel.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-8-ruanjinjie@huawei.com>
 <efd9c3d5-a732-47bf-bca1-50a8650fd0ef@intel.com>
 <7d27b172-d186-4b7a-87af-d0d25554b964@huawei.com>
 <7ce15dbf-d4d7-4fb3-ad50-f47f782a7440@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <7ce15dbf-d4d7-4fb3-ad50-f47f782a7440@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:303:b6::32) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|BL3PR11MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: 04cf66f8-2c93-4c7c-ec29-08df498a6c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|921020|260925021911599003|260925022911599003|260925021311599003|10067099003|56012099006|11063799006|261026140227099003|4143699003|261026121527099003|261021121427099003|261022105027099003|261021123027099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: S5yXf4Lqa5cGqblYUSznkn8u6dPPv4lLR+cSbZQktYL8UOe3HZVAY6T7riMlhnVVtGROmR5DTxa4Mo3jEPw06h/ATflEliMw+OsFs0Azn/pv5VI00bQuxlmcqpXQbjFBINAsAB3rN5ZU3XbCbwXvm4wQurhoZ1nIJYcixxw+jAp//ZTJ4TELmfnbr2fiY/5ZHqIhZ49enOuztVy2iDMhy48A8pGkVCPjnJQUqZnuddMLWHg57JxlwA68ySiMnz62LaHtUAHTQwqDGuqzklQl0OumnfBBidaAwZsc+Nh9FbxclfGUGV/KzQLqPUrT0eLMegWKnFq0JIrdkHb1R5uMDStaPl/DEEALy2JBO2PolaemlmxjPp7B3B/jrhdRYsFfnXMRU1w+/q5Kr5yUCsG5EFdQTiqDsEr5b4lPfROy4EP2nzapHbqG2SNBhJTvo+MQ5CRlTXCmDBUQhXownIzo4H1hfXXRGMywB+BoI+Kqcv0xVao8u8WT8OMRHoCEMcxCc+vjMvNOsyqs5jAF9yLBCpLcfH84tn/a/9dMU6bVYkkkGRsnAkcocXAsD6bvt9YAN1kSu6iYQdfYTR/brAEk7oLCYQ9j1F3kd6mT/4I2WucXeZ3a/y3SdPSnNP0/yuRLQz89LApMtqb1I0lqiDtTzaf6eJH2f97dRXZalt6Q3BI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(921020)(260925021911599003)(260925022911599003)(260925021311599003)(10067099003)(56012099006)(11063799006)(261026140227099003)(4143699003)(261026121527099003)(261021121427099003)(261022105027099003)(261021123027099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3RackFDdXEvNGtSRG11MXdBMU1GVUJyemo2UmNUUTM1VTE4OGJwVU10WXJB?=
 =?utf-8?B?cm1tVjd2bndpZjVYQWZUa0Nob0hvcFF2ejB0ZlJDRld2Q3lsSS82YUxGYkVB?=
 =?utf-8?B?VGJCYUlPS2xnYlVsZ1Z5Wk9jK3lMTmNHcUlIT1ZkUzJqTnZWK25XQ2piRzVU?=
 =?utf-8?B?TWhRSkwwVmsrUEVjWWt4cHBtM0VNenAwRzVjYVBRK29hVkxDb0l0enZjZUxC?=
 =?utf-8?B?OFZVZmYrUy80Uy83cVBja0xMdWc5NDVWUTA0T3E2TVRJL0dadmhLd1pjUUxP?=
 =?utf-8?B?elh0YTFqcVcxc2p5ZlNzRVNmTklaN2szNnJVckE2T2pmLzB2OVB5SVNFVXNs?=
 =?utf-8?B?WkgraXNHSE0rajZvV3pQam1UZFhUdmFNbWthd0d5QVFiNTcweUM1UjF2SXBR?=
 =?utf-8?B?WXdLSmZUN3ZYR3Y4RE9HMkRsdkVYODNabUZiclBsZlZPbkE3Wld0UG92anRX?=
 =?utf-8?B?U2VTMVdIOXpOWlBpdmkzWXU5WVJMOHNvMWlkdGRhR2pYQmpvZDNrdmx4MXpn?=
 =?utf-8?B?V29reGtyR2JxN1hjWFRpTGZFTHNrZzNKMTRFVTNhNG82MS9KRE1sbmNBaGxh?=
 =?utf-8?B?bXVES3d6NXpadDdIbHIzS1RMTTl3OGk3U1h1MmcyVFI5Sy9uMVA2R2NIdEpQ?=
 =?utf-8?B?KzZrTWhlZnZwVWhEMXdXQmJ0emt6OVJzcDBvRkUzclZCcUxCYVliUTVjR2pn?=
 =?utf-8?B?NXpKTUlsNXd1eG81aXJRcVVyK3d0U3dxUTVUT3AxR2FSb2lDTXUrUVgxd0I3?=
 =?utf-8?B?M2duY2srYUNOdCtMT3FhRVdBYVVrNFFFVGttRFVHV3B4a0E0WTEzSFhLYm9L?=
 =?utf-8?B?NWFyaS9lQUk5KzEzak0wK2ZYQUpPTzNZS1JHWHdtd0ZzcVNJUlozUVNnOGRx?=
 =?utf-8?B?MTB6cVVzblJHZjNnZ2xCcVNVZzdIUHdLekNna0hOSEhoRno1WHlGYjVsM0lC?=
 =?utf-8?B?N21pdmozd3J1S0VZUWk2VUdReUd5TFduUTI2R0IvT0NrS0RNRUF3WDJQeW9J?=
 =?utf-8?B?VFRNWldjaVZaNUNrNGxnUlRIK0s0WC83QVdyQ1FyMDNRTXpoQUVyTEdCMTAr?=
 =?utf-8?B?L1B6RFJMNUNBK1FGVHA1WWEwUkhMaWVBWnlpWDJSaGk3RTZMZU1yeVBZRWhG?=
 =?utf-8?B?V0NiRXhVUFg2ZWZFSEhFK0xrRmU3K0cxMEtSZDRpQWZmRk53TVdYZmpuN2Qw?=
 =?utf-8?B?RDNWTzBBS2Y5cFdDdzFnNmN6UVBMNEhYb0JHeVhkM0ZiK240NGVrNG1OTXlR?=
 =?utf-8?B?L3U3eitXVlBFZnpRaDNCT1FKMkdteS80d1dKdS9uYXNQejhqamluQXVSQnUv?=
 =?utf-8?B?dWJ3dkRVbzNLVURRUmt0Zi9HRmU4QnNubm5qUXh3U1lITkFCa1hwM1grMm1M?=
 =?utf-8?B?VWNxbVFYQXJGTHptSFFZT1MxSkhJZnNYSHdVWG81NDlXTEtKa3l3SXRBMVNF?=
 =?utf-8?B?enBZQ0h5N2UwTHp0N1NXSW5XQjZtVTh0QTNVL0w5TFpNUmxjK0I1eE5KdS9Y?=
 =?utf-8?B?VnJLMWoyeXJxMDVsT0kwVmJDQTRoTlo2RTM4ZEhsUitFdkpmbjNVblpyTVV1?=
 =?utf-8?B?UFZtb0oyZ2szZUZUVHlxdThjTklzRTBYWllmMFNDbjIxOGRPVGs2Yzhwdjkx?=
 =?utf-8?B?S1NqaEh3KzdUQ0lLQTJMMlJHbGpkVjVnakVQZG1BNDVEWGROOWxOVEVTZzM4?=
 =?utf-8?B?dlVVSVM2TGRBazQ5Z3k3VG5WTTdkRG1ocW90WTNCb2h2OUgxMHgvR1cveU5x?=
 =?utf-8?B?UlVkbTMySWxEY0V1Mm4zQkdNWmJlTjJIUjVoZFdVRXowU2I1Q2E2alZUZHh0?=
 =?utf-8?B?dXc3QkFCa3dTUm9SV2cxc0dra2tZNWNLMG01QXk5aCtTdkVxeU9JL3BZemxx?=
 =?utf-8?B?Y005ZGNQbUlCS1pjdW1PcEY0SmhCR01SSlFaa1RWOTNpZ3lQeWNjTnlEak5C?=
 =?utf-8?B?d0NXZ0liaGJxcXhhVFJ1QUpBZ0JqNjA4UlNNM243MjdVUXhXT1dhckFvSDJK?=
 =?utf-8?B?VG1Ya2pvMDFtZkJEN2xIY1NtcnE0V3NTc2czdXN2TldRbFpPV1JtZDllditW?=
 =?utf-8?B?ZUdxZTZEU3pBTXRzc1RVQXdsMFE1NWd1RzFPd0VVMFUzbGJaaXZBMGtuTHNR?=
 =?utf-8?B?ZDd0NHZmb2trUHdKQnkzWWFzSDlOSkxFOHViMjhPVWtCeHk1ODIzVWN2eXJI?=
 =?utf-8?B?ZkdjeEgvSFBmZ0M4NkVDMzlJcTkveGRVZXVVYzdwSjRqNjYvbmUyajNXb3ZM?=
 =?utf-8?B?czVyS2tvNXcxekQzQkpYcmV0L1d0V0U4ODlvMkkwbmh5K1J5U2tZRm5kSk5J?=
 =?utf-8?B?ZlljSnlkL2xoMjlMRXFLemwrVUZaZTRsRVRLR3ZJRmhMZ0RGZWlIZ0pESWVy?=
 =?utf-8?Q?/HoRWSbUatVEhbgE=3D?=
X-Exchange-RoutingPolicyChecked: ZmxSsnr0IUG+wR4Qgb9/bSZOAArmgHmuLOl+DYAAyU4FhkFZet+avTxizEJ9dkCuh3iJ19H9QP2nfvL550g7XePbi9mBYJrEnwRPlUsl3CGifp4QnMVSCyK3g6eEO+FJXfhWtWGvKy4IJAz1w4/Aklb8V9CBPdUdQyUQuG+FVUOxW+S8NgD6VpQidQQeIlCrVqIoTdnVPHlVy+nm9Ki0wmWJ4VXmZznka8uVyCMedtML0ivabHRoY6VG01fBBQl1KKOXhuoX0TytX/W2XQA90QOt7Utf8MjKLwf0OzGZVj8ltLpR8+lmYtB9VoQfymUZF+oMn1IGcnlPoAyRTb6DGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cf66f8-2c93-4c7c-ec29-08df498a6c19
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:51:37.9426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: reVnFgvZ3b4QAS+TFD2n7RqscyCg5hkDoAYx3CpRsc2UOt4SgzVR7tiCpMKbU3zw1hhBgdLGs5qRt8SwAkskAfYxLUzR1YVxvZnc2+Igumg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6387
X-OriginatorOrg: intel.com

Hi Ben,

On 11/12/26 9:16 AM, Ben Horgan wrote:
> On 12/11/2026 01:42, Jinjie Ruan wrote:
>> 在 2026/11/12 2:34, Reinette Chatre 写道:
>>> On 11/10/26 5:39 AM, Jinjie Ruan wrote:
>>>> Moving a MON group into the mon_groups directory of another CTRL_MON
>>>> group changes the CLOSID of the group while its RMID stays the same.
>>>> Where the RMID is only meaningful together with the CLOSID, as on arm64
>>>> MPAM, the move changes the RMID index of the group and is rejected with
>>>> -EOPNOTSUPP.
>>>>
>>>> Userspace cannot tell whether the move is supported without trying it.
>>>> Add "info/moveable_mon_group", which reads 1 when a MON group can be
>>>> moved to another CTRL_MON group and 0 when the move is rejected, and
>>>> refer to it where resctrl.rst describes the move.
>>>>
>>>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>>
>>> Do you find that this binary "supported/unsupported" accurately captures
>>
>> I think this behavior is deterministic on MPAMv1, so that's enough for mpam.
>>
>>> everything that MPAM may ever want to do in this area? Could it be that, for
>>
>> That would be what the new version of MPAM does (such as v2 mentioned
>> below), the behavior of the mapmv1 version is already determined..
>>
>>> example, one day MPAM may be asked to support the move of a monitor group to
>>> support scenarios where the reset of monitor counts is acceptable to the customer
>>> and availability of PMG will be managed as part of the scenario needing support?
> 
> For such a destructive move I would have thought it would be better to
> forbid the move and just rely on the user deleting the existing monitor
> group and creating a new one at the new location. If we consider only
> llc_occupancy on MPAM, which isn't affected by any requirement to be
> free running as effectively the hardware re-measures the cache occupancy
> on each read, then allowing monitor groups to be moved still gives a
> misleading impression to the users. The actual cache occupancy of the
> tasks in the moved monitor group stays the same but only the cache lines
> allocated after the move with the new (PARTID, PMG) association are
> accounted for in llc_occupancy. The tasks still get cache hits for the
> lines allocated previous to the monitor group move.
> 
> Having said that, one problem with relying on deleting and creating a
> new monitor group is that you have to keep track of the associated tasks
> which isn't necessarily straight forward, e.g. when a child task is
> started after deleting the monitor group.
> 
> Any relaxation of expectations of what happens when a monitor group is
> moved would need explicit buy-in from the user as otherwise they could
> rightly expect the established resctrl behaviour.

Exactly. Hence the idea of this potentially needing support via a resctrl
interface. This is hypothetical. I am not advocating for adding this
support but instead advocating that this feature keeps extensibility in mind.

All the caveats you list are valid. Even so, consider, for example, your
point about the impact on LLC occupancy: When I look at a feature like PLZA
that supports a customer request [1] that only seems to consider memory bandwidth
it does not seem as though LLC occupancy is always of concern since PLZA
assigns a global CLOSID for _all_ kernel mode work, including cache allocation. 

> 
> I haven't understood the reason why groups that monitor cpus can't be
> moved. Is this impossible to implement even on an x86 system? Why can't
> the cpus move move between control groups in the way that tasks do?

resctrl has a contract that MON groups may only include CPUs that belong to
its parent CTRL_MON group. Simply moving the MON group with its CPU will thus
break that contract, unless its CPUs are moved with it to the new control group.
The implementation of the feature stopped short of making such a significant change
for which I do not think there was a use case at the time.

Reinette

[1] https://lore.kernel.org/lkml/3c3029e61d4602476b7836d82614ba4ec71b3a99.1769029977.git.babu.moger@amd.com/
