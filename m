Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A120018052;
	Mon, 23 Dec 2024 21:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734988484; cv=fail; b=tiv6ejpu6hNdvJYhi6hvLDlAr9f/SMgHP1IBfRCCTPOsLDlNzHXWa+3i+eZUa5qstcBMaV9tog/PiVDL+hiftv10fELPWg0lkyfFlF+u8L5WKC8Xudb4Kd+r6+ue8Q0LfkFndbpPXz/4gIeUHUI1/fsCeYiJfOnaEecWG1GlSk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734988484; c=relaxed/simple;
	bh=ZMZvK9Lkaqcdew3XRNgLV+Yoz3/qYnHhawVHt+TDWd8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aE74mxhLStgb6lsfG/ETHBM3babH58MVDDJYcTGiPahHvGP85/tVzfoO+Ibh051uo3ohkWNSPqncLvvSjGThKfv4tZDNTpkoppo1AIKMWUk+x6xQKTY+iftoYREbMcS102ukPVG+H/3YWvRUB1rMMfPnyK0/F7hVf1O2V8YCYNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGRqNgz1; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGRqNgz1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734988483; x=1766524483;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZMZvK9Lkaqcdew3XRNgLV+Yoz3/qYnHhawVHt+TDWd8=;
  b=CGRqNgz1k29OdONnyDRDUcJgjgtCTElTFv1znJV2XRmGOQiZi9KxZh5n
   j1g4gU0pcJ2EUUVsvi/0Ok0np8Pz4HVpncF5jxCo1iTGrD7g1eGtEHWiF
   bsF+yi+/T3DK9k84NAZ2XbnRg/VxKBnrdBh9FRzjvYEKU8CmRcXvIxEpK
   7nxDw4nmSt0ds2GEfMmViycE/nz1H15Nl4KUGNDoQ0FUBKHsax6hNmKge
   swgkKDCrPIjb/3/KN14J1xLBoTF8yAZeZYUgcTzfFZvWZlTdboZWcX2J3
   MGxG+V1tPf6gDTP7fmfuxT5Km4kGma+/vxmljb7Gf3J4Q5iIc1N+XRV/E
   A==;
X-CSE-ConnectionGUID: jN1cQVXiQrK7b7fLUWiubA==
X-CSE-MsgGUID: Bz4r+K0kTLa6d9bk/29zSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="57923040"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="57923040"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 13:14:42 -0800
X-CSE-ConnectionGUID: l+V/TAiwRZiYjTb2mWZVCQ==
X-CSE-MsgGUID: Cu7LjHRYQLmoYW3agvNE2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103391439"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Dec 2024 13:14:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 13:14:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 13:14:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 13:14:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StKIqrsUmkmZAHmlRcchP+yoW5EZO6JkqOHoIZbpAxQoMO0mVwLAOlQHtAdc5A4Ygx/rucj2ThF+vSPVpO41FAhPbpFfzJ/UXRLzLjdVbaMlkPfa/D03Blz+Fy2ikcMq5jNbUBTA8Crid+6+mgMk9CPfrhHkAxW1EnCo5lZ/75/JGeFeGBAJG4scDra8cqNnaCligrq2DTeI01/ETHo+QeBL6ay9odFcqzv4GsfmkRfMZG1CSOXew9OITDR2fZM5zix6BF4TZ3I7t+3KK84J9tMR3elsnTbqfzxVJptBX97X/Taa7amOYnRZ8WIyZ/nw/cmokhEllrf1PdX+eL8D1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/ysJzLnY2xVaybiGnwHHxGcsED10+F0vNQGWOHCpGU=;
 b=vsf/vR3SdUL/qhbu/foORxZw4+j3iFcTvzXZ6DsswSWbq7v5Shu1/FsbSdfMQG/SRb03W0n9/jgZBnTo0XEw0fmx3W4RiMRKjvHez+vAAksrEpOAzx2W22ppBQSYmRhIumGfHgN+JPr/DkzUuQUP5mm704/UKclaCqJK1xZ7YhxD06mFfGwsosAgh6LdZHgBE2XzXGrYB6IUZHSYG9v8iXlMM+2jJMjAOXolro3Bq4HnHbrgJDzRbfS5z/AWrIKH5qBEsic6EuJYmUYHG3QTk4txu1sk3M7iBgwoNXVPdHFEBda2X5Ll428QhC7/es73ufrvAwBIGtmD8jEA3gVWKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 21:14:32 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 21:14:32 +0000
Message-ID: <af906265-a341-4a00-bfd8-7aa9acd53b8f@intel.com>
Date: Mon, 23 Dec 2024 13:14:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] x86/resctrl: Implement "io_alloc" enable/disable
 handlers
To: Babu Moger <babu.moger@amd.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <fenghua.yu@intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <jpoimboe@kernel.org>,
	<daniel.sneddon@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<seanjc@google.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<tan.shaopeng@fujitsu.com>, <james.morse@arm.com>, <tony.luck@intel.com>,
	<peternewman@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>, <corbet@lwn.net>
References: <cover.1734556832.git.babu.moger@amd.com>
 <2049de4cc86740fe525468347836e00025f53c83.1734556832.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <2049de4cc86740fe525468347836e00025f53c83.1734556832.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:303:b9::20) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|MW6PR11MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4ee383-64f7-4ed6-cf84-08dd2396cb90
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ektQVEJNZjkzQ2tISXozRXV5ekVnQm5DZU93UlpJN2ZkT1ZiWFV6dy9TZU12?=
 =?utf-8?B?QUttblFFSGNQRXY2SlNkaDJHZXFETVhxTjhyaXJKUlV3YXFBelYyc2VLcUQ3?=
 =?utf-8?B?eWJMNTU3Y1VUSzFiY0F6ekdZNjRkVHJJQTR3bXBIM1Z4OEwwV1VWdEVROGN3?=
 =?utf-8?B?S2VTaWdQTWlJdzlBajRWN0xHY3lRK3dxWUdJVThMS1FuaUVQYXBjampra3hG?=
 =?utf-8?B?RGxhd1dZQTRoUEcwRnhqeGNhcllCNFkzTUVTazNOU1pmR1JvaUZzWldDQnZv?=
 =?utf-8?B?QjFrb2JBMENJMDVHMUg0VVY2VTUyZS9EZHJqN0RKY0l1TW9Hak80MmNPZU5X?=
 =?utf-8?B?bjZ5MjFucjVQcEpaaWMwbWt6cmp2SnkrSFFabkxuRVBIU3hLWTZnaEtNclgv?=
 =?utf-8?B?Q3JjZndHL3RaRHc3c0VWdHJESlBRMmIwMWYxRkVvVEVZeXJPYVl0MXNkVDVn?=
 =?utf-8?B?YUw4ZHpXOU11SVI3dmRNN01GZnRWR2hOZStXWjJSQXVaTWJsV0VRY1pVOE9a?=
 =?utf-8?B?NTZWQ1JXOXVHdWlXN09YQTBVcm9vdHBKOXpmZzBib3RVaHBMMElvcklJaW5t?=
 =?utf-8?B?cTU3V3g2S1hXZURDMEc4azlBdUlsSms3bVR5QkdHcStkTis2bldndjlmNDlB?=
 =?utf-8?B?VUtqMFdtZVdjWWs1NDJja0ErVnpaa1hBM29jUm1ZRjV2OE95U2ZhRnlNZ1Zp?=
 =?utf-8?B?UFlSTG9NekhiZGNwTVl4YXRNY3NxbHBFT3RXSWRuR3NqMDVjeFpPVnZ4bjlz?=
 =?utf-8?B?WnVJMWtreUVHaC9pRmhPRERIUzgzQk5TekZSMS9xUzZRSHdGQlZWanJEMENx?=
 =?utf-8?B?L01yWnRhU2xHL2ZpVU5JY2NseHZncmZVb1ZEZlFhYXJQZkpac2pHR0ZhK0Nr?=
 =?utf-8?B?Z29vdTZsMDRTMm1GanlBbFhvWGpaTC9XVDdQQjhqNEFPWXpYR3lwNUFROEts?=
 =?utf-8?B?NXo0UGt0cGJyamU2VUUxMC9Ud0JXdlhXM0t4MlU4anZMRC9Jb3JML29WcUhL?=
 =?utf-8?B?a01McjJBT1JITWxpc3VoY1hBSkM5Z3U3SGdaRjZsQTBta0d3MXQ2R2lZa21C?=
 =?utf-8?B?UFFOU1JvYVB6Vi9yZ0c4U0VySEQrdExzSTRqcUNjVEhiei9acjY5QTBFU1hI?=
 =?utf-8?B?UTRuZnFJR0txcEh2MXNrVEZkQUhiQ2Q3elJ3WmcxWnJPQWUzejZiVkVEVkVP?=
 =?utf-8?B?eW5YWW1SZUdLL2htRGJPUlBNK21qL0dVdlU3NTdqN1VxWjBSU1A0c3c0UkVU?=
 =?utf-8?B?bHd2M2E5Tlc4Q0FhOWdiR29tMnNnVFdGZTBMZnlOK2tQTFZvK2hIWXlCQkw3?=
 =?utf-8?B?dFNVcEh6M2lqRGZpTjdORE1RR0o5eHUrRGxYRi9JL2tKZkRMQWRYMUQzbXhj?=
 =?utf-8?B?MThtUGdnNzUrQ2NsdjJyVzZ5VHZKcGVCMmhIY3RpQkprbG0wMlVjZU9JOGZO?=
 =?utf-8?B?eWNlb1VhQWo5Qy9lWWtrUExzOGtYODZnMWhQYVhKTTNaSnJtSVFlNW92d1NR?=
 =?utf-8?B?TnVicE15MUNtWklMMVVOM3Ztd2ZsUjB3Q0J0elBacGRDUDBGd1ZlZVE0TkRt?=
 =?utf-8?B?VHUzbDRTUmtIV0VnVlhLb0pMZUk5dVdhNGFPeDJNUVAxdXlGRzhCdmNyR244?=
 =?utf-8?B?eWh0ejJnZ1FoQm51dDFndm5wdUdOMDhMdzRORnoxYjZDTnNLcldRbWRCSUxD?=
 =?utf-8?B?dUg0K040MExBSHFFUWVkazc0UjdqMmFQVWZ3VjlJTWNvZ21hZkN0T2VxbDR2?=
 =?utf-8?B?VGdHWmQ0QlZjRXdld29iTjcwc0NiUmVtTUxWaWtFOFpraFVhVndCd3RpUjN3?=
 =?utf-8?B?YW56UDJvVGhYNUk5Uldha2RHSzlMcjdXQ0lNRWpZbnlMK2tqVkhIRnhTeXJ3?=
 =?utf-8?Q?NiR9a7WeUM+4m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2NZWWx5UG53aUN5aVpkNjN3MDlya3hzZzZhZVhjMm5zczNoaW9EN2RkNk52?=
 =?utf-8?B?MVg1UFJxTkptdEpkU0NDdm1nK25JSUpLMHg4cVNabGVEZy9wcjlHL1lkdHl2?=
 =?utf-8?B?aTdhZDhaZmE2dnFiUTlqaTNLeEhkL2NJZEQ4Q0phY052cFdjcUZuWmxKNE9O?=
 =?utf-8?B?RncvWFNvemNlbm1aUzNzYmxJVzNIcXprRHEzSlg5Z2hYcDdZdUFKNzFZeEl5?=
 =?utf-8?B?K0tHL2I2bk1QYy9ESS9YVmtmQ0RxSSt2KzhmOHptVmo1UTMxK1pXRTZldFdE?=
 =?utf-8?B?eDRLZjZGMGhENWRvc3Q4OTdQV05KYit0VlZsRVhMWXZ5d3dKWXAxWm9tUnJ2?=
 =?utf-8?B?cnB6dXR5NGc0cERXL25SLzdlcDNVdFBjWDVHTWQzQzBKakROSndvcE8vMHA0?=
 =?utf-8?B?YzZoYjlvS0xIMGlXc1pFeTlVS2ZxNkl2b0VFc2RvWmUrL01pZlEyTTVFbVhS?=
 =?utf-8?B?Ynh0RnJrY1Q3MmRmWFZuYVI1Nm5nMHdXT2F5QUhCRXl0NkVpRHBab0g5dHFr?=
 =?utf-8?B?empJRTFDNEMwL2o0SEwyR1B1NCs0RXpFTGJxZmlFOXJsTFhXWVlTY2dzQTBN?=
 =?utf-8?B?MDFxd2RnUVc2UzRvOUU0RCtRV3RHZ1hEdWYzV1FqQVBlS2dFc0dOb0ZRV2wr?=
 =?utf-8?B?NW50ZFVHaGNsR2dNVDlCMnVtWnYrNmJuWVVYTHhVc2V1M1J5NFpESDdmUVRI?=
 =?utf-8?B?MHJvd3NPSFJpVlBwZkJwZmowaFJhOUhYdDY2amRJSjJyU2pRbzY1M09GYmpQ?=
 =?utf-8?B?Z2h2TThwNVVlRGsySGM0MUFSYzlpbkN1dFJrOVRBOXB6NlN1eFJYZ1Znejh1?=
 =?utf-8?B?b3BjWTE4UzcreFZ5TC9CRitYck5LblB6S0Y0bWNRT2lPc1pBWm0rN09oRjFx?=
 =?utf-8?B?QUJKSVk5cGQwTVFsS2ptSkpJUTliWnY1VWhndTNrK2xrMXgycnNPWmpMdE16?=
 =?utf-8?B?enhEcnJCOTRma2RUMnVCMGV4UUY3cWxrMmJyMDNIWW5RTkRlQWVFZDhiQTFy?=
 =?utf-8?B?Wmd4R1I1QS9peXc0RkdxK0NYN0dtMDdsVHFUWWk0VDJLOTFOU0FGblQ3Vjla?=
 =?utf-8?B?N1R0THR1aFpsbzA2STc4ak4zckp3VnBMSnhoVW9xYitncFVTcjROSHB5R3NT?=
 =?utf-8?B?Q0k2dDU3U1JNbDRiZmx6TkZiL1NSS2F4ZE42dFcraUJDc203RGwrc0FnWXZS?=
 =?utf-8?B?NlhqdUZXRVlISVBXOUVkMzQxZmQ3bzBOYTN2dUg1M1FSZHBzb1Q0ZHQvNFZR?=
 =?utf-8?B?bUFzR0FMNE9RMjBDeFNCREVub2pLN1NiN3dKQUtHMnBDT1FuSGVGam02Wkhi?=
 =?utf-8?B?WGZRbVRRcFNDbUIrZTBVSGdVMHplc3VxTm1MeUJ0WUlhUHpkSXlFdGtmbm96?=
 =?utf-8?B?UjZIY2thNjUyS05RSWc3WWk2Tm1XUEd4czBVN0x1d2lYV0ljbUoyYVE5Ujdz?=
 =?utf-8?B?NnNnUy9ydEExNmJIRGtkUVRQVkc0YzhCbDZQWnl2bmI5Q0NiM1BtTHBXK2tk?=
 =?utf-8?B?eUxEVUltSzlub0V5N0FyOXV6b2tTT2dpdzR0YVlzY1BFSTRIaEMydlVaenBo?=
 =?utf-8?B?T0tWeHJPRk5BVUU3ZW5DSkJhUHlDaFRvMXVyTmU0Vm40OE53QWJuZmFPU0Nj?=
 =?utf-8?B?ME9jQUViZVVTTndFTmtpamIwT1NaSlNENnU3YXhjVTZJMGxPYmJ3c3FWNTRD?=
 =?utf-8?B?N1NGekFyN1BaZHpQK1dGZStrMTg1NWtrQjlRbTI4cXhranhpUGdsbyt6WkxS?=
 =?utf-8?B?TlJSMm00RnE5RTZZNEJlY1hEdFU1THpGYnRGcDErdTAvY2dMQmtMWlkxc2ZX?=
 =?utf-8?B?Y2xjMytLNGNXYUtrZG9CYXdwR3hzcHRFRHBzdEhHdTFVUmx2czd3azZ5UE5J?=
 =?utf-8?B?QWp5cTVkcVRocCtWWDd3VTNPSjdIRUtsMzZ4aTNDY2lSWFU2c2kycVF6KzRI?=
 =?utf-8?B?K3Q0bXlkR2ZwUUlETS9lbXk5M1JJaEhzV2NSdjR6b0lRekhRVXlXL3pHZVMr?=
 =?utf-8?B?Q1FRTVpNSTVqak9NNzZMREhpTkl3S1JQbGdhdTdNWExTRlZiUmFUNmI0NlpM?=
 =?utf-8?B?M2ExOS96cWhndy9Ha0NpU01rWGVyOEFpN1h5TE45c1ZhekUwVDVXcEU3cFZ0?=
 =?utf-8?B?RHpUNVVVNXdiOXpjWHhHR01ITWdSdjlDaEZJVk9taXFCQTg2dWVhMi9DZHJR?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4ee383-64f7-4ed6-cf84-08dd2396cb90
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 21:14:32.4987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9xAxDSu86fRIaMX/ml2ITIp5zzUNk499VeJ5WSBxMPEvDdwEJPysCuNMajBIAK6yo/+BSc+Cu91wtGAkFoT9iuTCKNzMYrwNPDXs/0NswQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
X-OriginatorOrg: intel.com

Hi Babu,

On 12/18/24 1:38 PM, Babu Moger wrote:
> Introduce architecture-specific2yy handlers to manage the detection and

"architecture-specific2yy"?

> enabling/disabling of this feature.

Please add more to the context. It just jumps in with a "this feature" without
any introduction.

> 
> SDCIAE feature can be enabled by setting bit 1 in MSR L3_QOS_EXT_CFG.
> When the state of SDCIAE is modified, the updated value must be applied
> across all logical processors within the QOS Domain. By default, the
> io_alloc feature is turned off.
> 
> The SDCIAE feature details are available in APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
> Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
> Injection Allocation Enforcement (SDCIAE)
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v2: Renamed the functions to simplify the code.
>     Renamed sdciae_capable to io_alloc_capable.
> 
>     Changed the name of few arch functions similar to ABMC series.
>     resctrl_arch_get_io_alloc_enabled()
>     resctrl_arch_io_alloc_enable()
> ---
>  arch/x86/include/asm/msr-index.h       |  1 +
>  arch/x86/kernel/cpu/resctrl/internal.h | 10 ++++++++
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 34 ++++++++++++++++++++++++++
>  include/linux/resctrl.h                |  9 +++++++
>  4 files changed, 54 insertions(+)
> 
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index 3f3e2bc99162..360c52a62da9 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -1196,6 +1196,7 @@
>  /* - AMD: */
>  #define MSR_IA32_MBA_BW_BASE		0xc0000200
>  #define MSR_IA32_SMBA_BW_BASE		0xc0000280
> +#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
>  #define MSR_IA32_EVT_CFG_BASE		0xc0000400
>  
>  /* AMD-V MSRs */
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 20c898f09b7e..dff3354c2282 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -56,6 +56,9 @@
>  /* Max event bits supported */
>  #define MAX_EVT_CONFIG_BITS		GENMASK(6, 0)
>  
> +/* Setting bit 1 in L3_QOS_EXT_CFG enables the SDCIAE feature. */
> +#define SDCIAE_ENABLE_BIT		1
> +
>  /**
>   * cpumask_any_housekeeping() - Choose any CPU in @mask, preferring those that
>   *			        aren't marked nohz_full
> @@ -479,6 +482,7 @@ struct rdt_parse_data {
>   * @mbm_cfg_mask:	Bandwidth sources that can be tracked when Bandwidth
>   *			Monitoring Event Configuration (BMEC) is supported.
>   * @cdp_enabled:	CDP state of this resource
> + * @sdciae_enabled:	SDCIAE feature is enabled
>   *
>   * Members of this structure are either private to the architecture
>   * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g.
> @@ -493,6 +497,7 @@ struct rdt_hw_resource {
>  	unsigned int		mbm_width;
>  	unsigned int		mbm_cfg_mask;
>  	bool			cdp_enabled;
> +	bool			sdciae_enabled;
>  };
>  
>  static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
> @@ -539,6 +544,11 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);
>  
>  void arch_mon_domain_online(struct rdt_resource *r, struct rdt_mon_domain *d);
>  
> +static inline bool resctrl_arch_get_io_alloc_enabled(enum resctrl_res_level l)

The custom is to pass a pointer to the resource when interacting with it. Why is it
needed to pass the ID here?

> +{
> +	return rdt_resources_all[l].sdciae_enabled;
> +}
> +
>  /*
>   * To return the common struct rdt_resource, which is contained in struct
>   * rdt_hw_resource, walk the resctrl member of struct rdt_hw_resource.
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 6419e04d8a7b..398f241b65d5 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -1798,6 +1798,40 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
>  	return ret ?: nbytes;
>  }
>  
> +static void resctrl_sdciae_set_one_amd(void *arg)
> +{
> +	bool *enable = arg;
> +
> +	if (*enable)
> +		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
> +	else
> +		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
> +}
> +
> +static int _resctrl_io_alloc_enable(struct rdt_resource *r, bool enable)
> +{
> +	struct rdt_ctrl_domain *d;
> +
> +	/* Update L3_QOS_EXT_CFG MSR on all the CPUs in all domains*/
> +	list_for_each_entry(d, &r->ctrl_domains, hdr.list)
> +		on_each_cpu_mask(&d->hdr.cpu_mask, resctrl_sdciae_set_one_amd, &enable, 1);
> +
> +	return 0;

Same comment as in V1 about this arch specific handler always returning 0 and can thus
just return void. Also the name should not reflect that it is resctrl code. One
option could be _resctrl_arch_io_alloc_enable().

> +}
> +
> +int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
> +{
> +	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
> +
> +	if (hw_res->r_resctrl.cache.io_alloc_capable &&
> +	    hw_res->sdciae_enabled != enable) {
> +		_resctrl_io_alloc_enable(r, enable);
> +		hw_res->sdciae_enabled = enable;
> +	}
> +
> +	return 0;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 5837acff7442..8c66aeac4768 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -344,6 +344,15 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
>   */
>  void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d);
>  
> +/**
> + * resctrl_arch_io_alloc_enable() - Enable/disable io_alloc feature.
> + * @r:		The resctrl resource.
> + * @enable:	Enable (1) or disable (0) the feature
> + *
> + * This can be called from any CPU.
> + */
> +int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
> +
>  extern unsigned int resctrl_rmid_realloc_threshold;
>  extern unsigned int resctrl_rmid_realloc_limit;
>  

Reinette
