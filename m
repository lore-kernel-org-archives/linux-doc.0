Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498F91D0143;
	Thu, 19 Dec 2024 22:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734645616; cv=fail; b=awldDVZQhHOaJdDF1gmNtCTMAu8rjnKS++OzDnzrCG1m+Znnl3fuKdO4rHmUbASo3wkw7NAfixa7oz0hSwFLby2MgwLhdAAB6d4IEcZyN1WWYHbX64CvsXYhCCT8rSflmy6T4zSDKDMLWJWKAIL9JVQ/BVn71so7O1zJc2d1Iv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734645616; c=relaxed/simple;
	bh=0iw1yBJDNwaPHHT5F4rB+jQdn5J/fazXdY/nKAcLiFM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uwdsH3Hw84bQJQkR6mH8e39+UVGTD+u3Ep58tq/00Lqb9ZqYXDuyjbL80MYIyqEM1U+TpLl/M99VB0SNWugaRmSVn3/FKIxUWjgD+w8/U4jqSMT/rD9kMCfoJ1yP8ERLbuIME7t5yCX0AJS3NYG0rMfUVefq0WpNVCh8G1/k0E0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEhr1E+2; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEhr1E+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734645615; x=1766181615;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0iw1yBJDNwaPHHT5F4rB+jQdn5J/fazXdY/nKAcLiFM=;
  b=jEhr1E+2I9Mxt7cKZ1rtM7z8JuPjlVLlZmHSlwqIrni6IyrkQD1BDxB7
   pcGSsb3VEJ+NJizyGqbyM/Or2TkzOscpIup+SGwZdGdxW8Ro0d9MGeyHD
   948dIfcjAFsGkspWSvtBB7FoYwKspC+AZNydTj9iFrMh0Ct6iVkzJr70Q
   MbosfttZA/YYxW5ANX72JBAGaL06Bkf8DS5+W7+w8X7DKDLrE8xMh6cCT
   u4g14QkuxCeunqG0VTn+2BuDLehzzdobzU2r4pjb+fiSAxwun3h1RsOh1
   kjvLVv/NMEnhMR3qQHLSG0tEWAclRT+WxNNdgSNE9TcoRCQHMLmJrzZS4
   A==;
X-CSE-ConnectionGUID: TnNpY7n+Q4uqYyZsTupuGA==
X-CSE-MsgGUID: UnWauUEIThigWC+xtVCaJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45785419"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="45785419"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 14:00:13 -0800
X-CSE-ConnectionGUID: IO95b3BBSuWrhLttZ+NJLA==
X-CSE-MsgGUID: hmNcA5jrR8KCzWOS8WntJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="103307624"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 14:00:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 14:00:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 14:00:12 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 14:00:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzezwG4LjEm0ZFMNiNtvNp2MyLMpkjPqhWvPoTYaC/g3yg2L82TQmEBjDcXQVftVsAKPu+uINTRWvVvsJWwEyiNzPyX+SYptlacyPIwi5OuWA9YiR5J4dEHdJ1tRM1EeVI7IV5nQKQ4EvCIt/Hchohf3j9z0SjV13nTtwEsrX2q4xGhMFsAP87Vdu0J/2ePqQ/ZKVG0A3Lpq552VTVmGJkRT3sjX0gCMdFk+h5G4AQi+8Qh8G+KWmUFetjAld4eVszbL2XrgQI4VED1jf/W+f+XXm0/m3GOnVsH9e5OCxtVD4qOxCcVAultkQhd+RftTLunENmqNCrINwt9iVr1S2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kICzfuVy/p56jWDJFKzk26dYU64pmUvvMcDmtIeGxPg=;
 b=GJ6z4KzPpBhPiYYbD4nJ3gXaPUmrk5WKCqOz6RZH+mApcp4eMCEUZIdIseUNLuWRcgbP+lhKwahK208LEwZjF44x53P+x2QFZ0qIQeAci70P2lPXaiGmwQFHxOz3SEc3MSZzrJI8Zz0f3OiOcTXpaFTeRlhTRtamc3HOEB7OdruS3DNlAn+6p9XQuT51kxkMO2PG0hjUHFgNTtjmTsu7iSxNjjzQRVAGh15B8mVM+xypsSjRpQV4PTn1y58nr2z1WIxli6Cp0+EenEdxGU/cSFWsfL/Ni6DEMCfYYKeRyKxrthMquKSQbu1xemxvn4vrkUXQOM3nVxMSXxMEwnb3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Thu, 19 Dec
 2024 21:59:55 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 21:59:55 +0000
Message-ID: <609f0d7c-55bf-4cde-a1ec-2314e353a0f6@intel.com>
Date: Thu, 19 Dec 2024 13:59:52 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/24] x86/resctrl: Introduce the interface to display
 monitor mode
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
 <28399c9a82b771695181e8cb69d9c21847ff4c9c.1734034524.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <28399c9a82b771695181e8cb69d9c21847ff4c9c.1734034524.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::30) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH7PR11MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2514f8-f5dd-4ac7-bec1-08dd207878c6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mll4LzFwWmdjQVpSUU82dlgwYXo1RWEya1IvV2RqVmM3dVBjU2ZWdlNTVm0w?=
 =?utf-8?B?S0xrMWZ6b1RlMGh5dmNTZUFzU3FJclhDWjR2NVJZQjRud0ErOThtZXQwa2Uz?=
 =?utf-8?B?bGFNUGE0LytsVm5GK1hOdlRxTndOaDBPNEdhMWxKbUkyc091UldBSHBzM09P?=
 =?utf-8?B?dWhNQmlMZTN4MDR5Y1R6enMxT0FnNHdvWmx2N3huako0alhNNk1TWXh2amxn?=
 =?utf-8?B?eVFBc2JENFdXNm1laHF2bThJbW9ibU5BZGZyL1dJRVJRS0p4UHlzY3ljMmJu?=
 =?utf-8?B?UU0wUlQwYlBUY2xsSXFsMVVQZEd2Qk0xSHFlSXo2ZVJPZXdpUVhNT2c2KzZK?=
 =?utf-8?B?TkpEbjh6cktjbTRBcFQ5VWV3TjVJUUg3Z0J0dzZlZjBlemI3a3h1aGxPcEp4?=
 =?utf-8?B?cy9jSlRwREFORmJ6b3U1a05xek5pUkVUY0E3UmFXbnNQSHR6NWtzYktlT20y?=
 =?utf-8?B?VGxtY1VSaGxRR3ZBRzJUeUxVSG5xMVZ0bGEvQk9Tb1VSR2tEeEpoZkoyY3Fk?=
 =?utf-8?B?bStKa3JjbVV1SXZ6SVk1aURBRklrakhJcUhaMVZBbzNNOEJwdlFtMW1EMWQ3?=
 =?utf-8?B?NGg3ZnkxSnNxNkQ2eFZ2d3hYZUxVWSs4V1NsNkxRQUU2dTVLaDRQcGl3ZlpT?=
 =?utf-8?B?dUxVN095MzdXd05FZCtwWUpodWZuU0x5a1B3dE1mYnBTeUF1TzNOVlVTNUJP?=
 =?utf-8?B?enBGUUxPM2VxK0o2SmUvT3J2VG9XRy8zbUpYVHZNSE1pQldadkVNc0FHRnlx?=
 =?utf-8?B?bGFtQStCWFVkMUc5dkVVaWFZRE5lY2xDK01PUmI1RmpUUFQyNzNqem9jcE45?=
 =?utf-8?B?clMzVXg2YllFcnQvaS90Y2w1K2NUWnZJemxtMXVkVmhhdU1WTXhuVWVxb1Ju?=
 =?utf-8?B?L3JmRUNzQVpReWkvelNkMkdZSndtaUdtYXl5aTJHMkFyUUlTdUVQRUR1aEVm?=
 =?utf-8?B?TXRSanArQXZvQStNT0lqbjVjY2xTa1lkM3ExZFlxWncwSEtzd2piSWhjcG1I?=
 =?utf-8?B?Q04rWmxTK1k5Rmg1bDV1anMzMWpPeXh1b2R2Qmo4SFVwRnVjUUQ1NmpXN1Bu?=
 =?utf-8?B?Ris3MGlyNE5iZ3k4N3p1N1poSW1oVkhHd0NMbUR5bGh1RFpSVVVyQ2FxeHor?=
 =?utf-8?B?YzZEc2FPdUNoQXJMYU1qTndZdmxmVTEvTHZGNXRlaUZPUi9JQjRUWFlnVVRI?=
 =?utf-8?B?ekkxcW9EV2ZNcCtvMlFqY1ZXMnBLN3lIUjEzbWpZWU52cVR1bHFyVVZvMVpl?=
 =?utf-8?B?NXZiTjhicmp6QlAzbXl0YTdWSGJGd3Q0UnpNWjJRcTVhOE11RjRtNUxlYnB5?=
 =?utf-8?B?VEd0ejZYaXRLb1dyaTRtV2RNcGdwS1h5b1ZPY1MzZUgrOUdrUDE3THc1Zmdx?=
 =?utf-8?B?QWU0aW9WRGxaa3Z0UkV4dXh5TEVhbTFnNDRwS2NUZTBsaXlUWi96WGNnYkJP?=
 =?utf-8?B?T2ZXeEZFV2tET0dlY0RENUZZakdrbm8vc3QxbFF2VEZLMnpOUTlEUGZxSmVU?=
 =?utf-8?B?aEg2N3hwOXdqV2NpZU9keGhSZzh6MElnTGJ3Y1E4Rlk2YlIyWk45djdCSG1q?=
 =?utf-8?B?Q1pZRjE4cXNmQmxqQjdsR09jSlhTWnMwdTVLRk9HcjZhWFNVZzNVK0pndDZ4?=
 =?utf-8?B?aHF5RFJNZGduUHZyc0Q5M1ZoQ3EzN1JNTEdaYzJnR3dFejFEQUtDd0h2N3Nw?=
 =?utf-8?B?OVhZN3VDTjNVd0JCb0hNWDVUNFdWM2JRWm9HYWZIZFFIWmptRzczQ0FaYnZD?=
 =?utf-8?B?NkdyaS9abS8zelIxZzluNnZsQkE4bGsrRDB1VkdEVVBiMWJNU2tFMm10aDlW?=
 =?utf-8?B?cTNTQUtYZGFYY2c5RFdPKzBLenFRcnEwY250bDNJWmpBTDRwYjFFNkpYNGN1?=
 =?utf-8?Q?t2doIRYbmlbo3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkIvMnR3S0pUSytDL09sc0p4WmtFSWRkWmkxUjVmV084WlFTTExGZm5sVDE5?=
 =?utf-8?B?YWxaNFMvQ0kxbkFqRDR6ZWJMNTNzZ2FiaVRYSWZ3dVcxRUVPSmpCeFdCcmRl?=
 =?utf-8?B?Q0ZuTDRleHNoVEpCbjljSzcwRVFjajlsMDNaSmFrNHJzTnhmb2s2SGRCWXpB?=
 =?utf-8?B?di90cVc4d25aUHZFaUpCYmVIU1UxanZyNjlzeVIyOWU1L0tBazBIV2p1V3do?=
 =?utf-8?B?NWsvbkMxUGxFbWNaSW5tYk04ZDRRNm9KMXBFdmh2V2FhdEh6ZGFxaXM2TTBr?=
 =?utf-8?B?eG5FU0NqMEdDTy9jL2k1MVVsMmgxK2Ivd1RTUWlrdThaMTBRNDZZZHBteXcv?=
 =?utf-8?B?czVGbkQyY3RkWUxsM3JieFlhSkZRVG43YkhhMnRqK05wMm5MdWhKd1FOTGc4?=
 =?utf-8?B?MFh6WXhuZXcvM2JObFhlTG9zd0kyNEhyb2lkZFJBYTNNandUUGY2TTBqcXFz?=
 =?utf-8?B?Zmp5cDluV1dYcFN4RU03YndjVHZzSnY5bTJPVXN2aTdBY2djczhmMW9ibWxh?=
 =?utf-8?B?RE5MNTIxK1ZjK2VWakFlbUtLRnd1NmNlaUhkZ1pqTVFhMzFRN2JQaEVzSkdy?=
 =?utf-8?B?SHJ5bFRpU3R2YkEwdXI0Z2tYUk9jTTFEVlptTEhkRFgxajBERFYwZlVIZDV2?=
 =?utf-8?B?TGU1YVJoc3VlUlpmd2ZZTXlRbHRZbDJ0VG5nOEJNUTJES1lVQmdvNWYwejkw?=
 =?utf-8?B?V1ZlK3Z3V1ZxRGk0VW4xb0pTT1N0SDRnV2syZGdNc3h0N0VkYVZZallEYVRv?=
 =?utf-8?B?MWowakdEZzlVeXlVRnpuOVlRWU9yeTEyRklFemM3YW11aUl2a2NQdmFENE9L?=
 =?utf-8?B?VkkvbGlxNlVTUWlTWnZXMlpNSFJnbmJURmJOQmUxbHpjWHBnbG1RMCtxMzhu?=
 =?utf-8?B?Ui9WNkhzM1R5QmJwUTJIMUN4S1VmNlpzYmRjMTZjQWZxQkZKWklTazdRMUNF?=
 =?utf-8?B?b2t6azcvZUg5d2crY0hGWHZ6WjZqWDBqMkw0TEJMd0FaN1lna2NyTmVvMCth?=
 =?utf-8?B?ejVTRkw1aEx2Z0RXbVpiMHlIOG45ZndHaUF0UzIvVloyYmgwd2d4RXc2YTh2?=
 =?utf-8?B?OUlHcSt4bnZnc0IxQUtQUDJkcnNMbldZRUZWSVdHcmNBa2pDa085bjVtK2tU?=
 =?utf-8?B?N09xNXRHN2ZuZWgvSXNIanpsbTQ5aTdKeE44UURTUU9NUmlaeS9NRHlhbklM?=
 =?utf-8?B?SXo5ZnRoMEhvQ1Nld2xmVW40aWlabHdPdHRBRHJQTXdDaDhiMlh3UEVuSkhT?=
 =?utf-8?B?UWlIenhoS1Y4K2RjNFc1WG1RUlFkbWxKWWVKZ0NQWGhyZ3hpQnBXTktGL1VK?=
 =?utf-8?B?YkpFN2x6eWdJeWxFZS82K2xyK29YSGV1UVBBemF3eDFJYUJHeXNUQllhOGNH?=
 =?utf-8?B?UWxMNGcrYUMzaEtmZlB5YVFCVE1jYVpVYUZnaGZqQkhpQ2hlSktwMTJaSXdx?=
 =?utf-8?B?S1hMdVRRbmtuOWFsTml5bitwMEh0eUd2d0J4ZXYrNERKbWc2RjBOY3NDQ1FW?=
 =?utf-8?B?cndQNTdHdFYzTjgvZE00UysyVlZPc1R1LzZGVTZFa05aQlR0NllFNVhxM0l2?=
 =?utf-8?B?UnpyNyt6SFVGam9maVFtNy8zYXBlQnI1ckJ2eXJzRnRUWGYzaXR1N1IyZzU4?=
 =?utf-8?B?MTNyNFFnNE5RSTRObElrL0xBZStqNGNZcWV2VjZtZkQxRTI2QUNtcmNvenF6?=
 =?utf-8?B?aFN2akVuVlhHbnJrYm80WjRZVzU5clhtSUxmbTNzc0IxcE5FaWpIa1JvbTFD?=
 =?utf-8?B?V2Vxd2hLVTErYnhBTWQyM3FUMjVKYlZzeU1MOXNzWUo5Um5TcHBFWXdSZWI5?=
 =?utf-8?B?MUtmZmFybnZWaUFJajU2UnFZc0o2UEJUalp1TE4wekVoSkdqeC9lZTlidHdm?=
 =?utf-8?B?ZmkzeTFpWlJLSW1rTXJQem1QUHJHNS9SbHowK0thWlk3K0kwcDE4QVpMQ0Ix?=
 =?utf-8?B?RzMxVmszTy94UWtKcVR4Q0llQzNWTWpleVBTSk91MUtoVURaZWtSOVFaWWhz?=
 =?utf-8?B?SHBPR0RySXhoS0dtNGowVjd0TVZiZUFmdlJPWGI4Z2ZyeUZ1a1ZIcjJseEdC?=
 =?utf-8?B?d0krWmJ5WDVoUVpReWVVWGhkTlZlQUFaRmxGZS9rUUV1ZS85bWRDVnJ4WEM3?=
 =?utf-8?B?TDhwL2ZsVWgrcTBReDU5aEpENG9qTWR0WTVML1Z1Q2FWU01MYzQvMC8zWmh2?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2514f8-f5dd-4ac7-bec1-08dd207878c6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 21:59:55.1905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAwKrJgGJ1qIBkQVi3Loa9VR/uZJXlM1qtwQDu+1uKrMK54DQxOwHvMycwoh3tCR9neIiR4kxCE871wYiz30+0LDUbru6QhJ4T/RTfxMomU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6978
X-OriginatorOrg: intel.com

Hi Babu,

On 12/12/24 12:15 PM, Babu Moger wrote:
> Introduce the interface file "mbm_assign_mode" to list monitor modes
> supported.
> 
> The "mbm_cntr_assign" mode provides the option to assign a counter to
> an RMID, event pair and monitor the bandwidth as long as it is assigned.
> 
> On AMD systems "mbm_cntr_assign" is backed by the ABMC (Assignable
> Bandwidth Monitoring Counters) hardware feature and is enabled by default.
> 
> The "default" mode is the existing monitoring mode that works without the
> explicit counter assignment, instead relying on dynamic counter assignment
> by hardware that may result in hardware not dedicating a counter resulting
> in monitoring data reads returning "Unavailable".
> 
> Provide an interface to display the monitor mode on the system.
> $ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> [mbm_cntr_assign]
> default
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v10: Added few more text to user documentation clarify on the default mode.
> 
> v9: Updated user documentation based on comments.
> 
> v8: Commit message update.
> 
> v7: Updated the descriptions/commit log in resctrl.rst to generic text.
>     Thanks to James and Reinette.
>     Rename mbm_mode to mbm_assign_mode.
>     Introduced mutex lock in rdtgroup_mbm_mode_show().
> 
> v6: Added documentation for mbm_cntr_assign and legacy mode.
>     Moved mbm_mode fflags initialization to static initialization.
> 
> v5: Changed interface name to mbm_mode.
>     It will be always available even if ABMC feature is not supported.
>     Added description in resctrl.rst about ABMC mode.
>     Fixed display abmc and legacy consistantly.
> 
> v4: Fixed the checks for legacy and abmc mode. Default it ABMC.
> 
> v3: New patch to display ABMC capability.
> ---
>  Documentation/arch/x86/resctrl.rst     | 33 ++++++++++++++++++++++++++
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 31 ++++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index 30586728a4cd..1e4a1f615496 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -257,6 +257,39 @@ with the following files:
>  	    # cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config
>  	    0=0x30;1=0x30;3=0x15;4=0x15
>  
> +"mbm_assign_mode":
> +	Reports the list of monitoring modes supported. The enclosed brackets
> +	indicate which mode is enabled.
> +	::
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> +	  [mbm_cntr_assign]
> +	  default
> +
> +	"mbm_cntr_assign":
> +

The text below jumps into usage with assumption that user space already
understands the feature. How about starting with some context? Something like
"A monitoring event can only accumulate data while it is backed by a hardware
counter."

> +	In mbm_cntr_assign mode user-space is able to specify which of the
> +	events in CTRL_MON or MON groups should have a counter assigned using the
> +	"mbm_assign_control" file. The number of counters available is described
> +	in the "num_mbm_cntrs" file. Changing the mode may cause all counters on
> +	a resource to reset.
> +
> +	The mode is useful on AMD platforms which support more CTRL_MON and MON
> +	groups than hardware counters, meaning 'unassigned' events on CTRL_MON or
> +	MON groups will report 'Unavailable'.

The "meaning 'unassigned'" is not clear to me since in "mbm_cntr_assign" mode
these events will (at end of this series) actually return "Unassigned", no? Perhaps
this portion can be dropped for now and the text found in patch #20 about returning
"Unassigned" can be placed here instead ... but this should probably be done in
patch #19 that adds that capability.

> +
> +	AMD Platforms with ABMC (Assignable Bandwidth Monitoring Counters) feature
> +	enable this mode by default so that counters remain assigned even when the
> +	corresponding RMID is not in use by any processor.
> +
> +	"default":
> +
> +	In default mode, resctrl assumes there is a hardware counter for each
> +	event within every CTRL_MON and MON group. On AMD platforms, it is
> +	recommended to use mbm_cntr_assign mode if supported, because reading
> +	"mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable' if
> +	there is no counter associated with that event.
> +
>  "max_threshold_occupancy":
>  		Read/write file provides the largest value (in
>  		bytes) at which a previously used LLC_occupancy
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index d54c2701c09c..f25ff1430014 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -845,6 +845,30 @@ static int rdtgroup_rmid_show(struct kernfs_open_file *of,
>  	return ret;
>  }
>  
> +static int rdtgroup_mbm_assign_mode_show(struct kernfs_open_file *of,
> +					 struct seq_file *s, void *v)

I remember this topic from earlier version yet I still see many instances
of the "rdtgroup_" namespace used for functions that do not interact with
resource groups. Could you please check this series and fix this?

> +{
> +	struct rdt_resource *r = of->kn->parent->priv;
> +
> +	mutex_lock(&rdtgroup_mutex);
> +
> +	if (r->mon.mbm_cntr_assignable) {
> +		if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
> +			seq_puts(s, "[mbm_cntr_assign]\n");
> +			seq_puts(s, "default\n");
> +		} else {
> +			seq_puts(s, "mbm_cntr_assign\n");
> +			seq_puts(s, "[default]\n");
> +		}
> +	} else {
> +		seq_puts(s, "[default]\n");
> +	}
> +
> +	mutex_unlock(&rdtgroup_mutex);
> +
> +	return 0;
> +}
> +
>  #ifdef CONFIG_PROC_CPU_RESCTRL
>  
>  /*
> @@ -1901,6 +1925,13 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= mbm_local_bytes_config_show,
>  		.write		= mbm_local_bytes_config_write,
>  	},
> +	{
> +		.name		= "mbm_assign_mode",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= rdtgroup_mbm_assign_mode_show,
> +		.fflags		= RFTYPE_MON_INFO,
> +	},
>  	{
>  		.name		= "cpus",
>  		.mode		= 0644,


Reinette

