Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2066.outbound.protection.outlook.com [40.107.212.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9C51D516B;
	Thu, 19 Dec 2024 21:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734644308; cv=fail; b=rI1k/yL34UCyckGTWGkLyikHCZHPq9lEBcLf1glSKQWH34gS2J+k5FM6RcWpoK9zcfm6taTxH5d7gzOnuDvVnpnUCg21pOwVB60VQOq0ZHm43SyJJsx97K6qiCzXPpxJnAPWpN+pHscVyPNj3NopaG/eiOHA8tphdY9SXPN1O/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734644308; c=relaxed/simple;
	bh=kI8/BlCICisCg+6Eu67HLWj6Yopohj+bHezdYRHptbk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cg6q8frMiIKYURrBTd2N3elfDa4iYS5l13citelKYGmuNrJa07uNpyNbvbvvxijfXqQRXDRyRC5ha+ievokNg8wiZJgsgGKPazA047EMflEXzZ3q+NrsaCJ7MysFnj43QZkBSY5v4nw1MOAe6j6HA9q5GAhm5l+72Wm8ewItZ0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PLmAJOme; arc=fail smtp.client-ip=40.107.212.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PLmAJOme"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdRtKiSrfcPWQbq2F8nLcQEWUc8sgIdqJMAaqpEIgBl4tqE1O5LHW6C/+K+s+YKtUXEP/yXNh07k4EEVIyziBrW05uKj8grXGnFxk2SsVUndcoCc4XEJvi0OeT7fjqRDXPpezl2DdvIiRr17MBFmQRJUU6ULLtVr8x8KKm3IXjY5AJ+GWZC8e6vv1aN6M1Vp0U3YXB5GME8mXjh3yXDU4QSClMYZTvUOeO0Tm24KvSIk/60TAaPWkBsSRzOG6Fuwpo8KjDRrYGI0GCF5uN6P/kG4Xthox2bpVwKsMjiK28HC8YCzFa76y9UAmAh2c/WyUCnf8yb4+Pk5+zeJJ8lwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jS7wcIcZzAA/PM/vE+uUfJ9ZNAMpp4k81LAjpiYUJ+s=;
 b=PE5HzwQqIkNcFXDNvTE5/iAGQ0OXHrFUTIpIFoW2EIZ60efUITY5U0UrKvspB4i+W0zUKOyZU4GvtSpOubs7bSzSLYfJkSuiKUXNsFyG9yZFyvCIv6KKhhXyBUwhl+b147z73d5+Ojzmi00fB9ragWNseDowGfbpCbroi0FuSkJ/VMQwilpqo6HImIU9McU+KZTVcA0uD4YgOWana7g5o8BdCCldrrZqq2Z61aN2xLEdw/BWvMw6DM8qN0hNexoRdn3vIl7oqPafGSsC4ObJLvuepyq7RM2pf5b05EWrB/Iylh9mliMdT6fGY4H4kjWzUHBbJsMlWIhXWqf/o2ah6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jS7wcIcZzAA/PM/vE+uUfJ9ZNAMpp4k81LAjpiYUJ+s=;
 b=PLmAJOmewU+u99NG4XERiWZmqgf3SpRbofBvOj121kbJCsQqQdmVpvLhO1UL2KmRH/c/450ayjdgsD1Dyfg66GqZ1MBHq9Pm8Rq68jCXaXDIvV8WGn7DKzMM17h505QQAxpk34y7nc345cLCd5NRbASxXidAEWco6hvGN1x+R28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SA3PR12MB9197.namprd12.prod.outlook.com (2603:10b6:806:39e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 21:38:24 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 21:38:24 +0000
Message-ID: <7db76395-9bc0-4b26-942a-a354d5e3ff45@amd.com>
Date: Thu, 19 Dec 2024 15:38:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/24] x86/resctrl: Add interface to the assign
 counter
To: Reinette Chatre <reinette.chatre@intel.com>,
 "Luck, Tony" <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "Yu, Fenghua" <fenghua.yu@intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, "paulmck@kernel.org" <paulmck@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "xiongwei.song@windriver.com" <xiongwei.song@windriver.com>,
 "pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
 "daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>,
 "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
 "perry.yuan@amd.com" <perry.yuan@amd.com>, "Huang, Kai"
 <kai.huang@intel.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>,
 "seanjc@google.com" <seanjc@google.com>, "Li, Xin3" <xin3.li@intel.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ebiggers@google.com" <ebiggers@google.com>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>,
 "Eranian, Stephane" <eranian@google.com>
References: <cover.1734034524.git.babu.moger@amd.com>
 <a72e23d8fe43038cd319403ed68b657fb36e23df.1734034524.git.babu.moger@amd.com>
 <Z1tzyrUYTFR_iHuJ@agluck-desk3>
 <e43b10b7-60b0-412a-b55f-96271764faa1@amd.com>
 <SJ1PR11MB60831C44DEE7711F93C3C26CFC382@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <8cffb2ad-6645-45a4-8d05-c967c82eb111@amd.com>
 <f8073d8c-7dd0-4e8d-a196-183acef13d66@intel.com>
 <8e96f411-14ac-4d41-82b4-e3076f1c13f1@amd.com>
 <50a4371b-d7a5-48d4-bb79-b9f0f935b5db@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <50a4371b-d7a5-48d4-bb79-b9f0f935b5db@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0158.namprd04.prod.outlook.com
 (2603:10b6:806:125::13) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SA3PR12MB9197:EE_
X-MS-Office365-Filtering-Correlation-Id: 022a21c4-cd88-4337-b8e1-08dd2075772c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RW53emovcnhaZGNiR0FraXduZm1EYlg1ZUVFRFVPU05TZERCaVRqSHlCVitw?=
 =?utf-8?B?VzkrdEpyNFBqbWdGWktwck5yd2VkbkY3VTg1NVF4TUZ1VlJ2bms3Nmw3bEhP?=
 =?utf-8?B?OWhYaS9jWlRvUW1QZGhadnBYMXliYWcxMTZKbDdGdmNzVVZ4RzluMkhmNHpR?=
 =?utf-8?B?K2JqMGErMU9yZnpEc1YvSkUvYmZSazZlSkpqR2hBMW5CU29kQmhJQ004amRX?=
 =?utf-8?B?Ym44OGxuYmxTZjhQVjJJUkRjSDBjMm8rMFI3R21GOW9OZXI2QTBrVWwxTEVF?=
 =?utf-8?B?UkgzRnRjdGx3Nkt1REljNy90ZmFuK08rMU9LekFsYXVmRHhRSG8wMTdYTDlt?=
 =?utf-8?B?bXlPUHF2TU1sQ0lGeVJGWDNTRU15VWdHSTlUOU9YYU1iSUQvbDMweXE3YkxN?=
 =?utf-8?B?VDdkN1N0dlYzQVlIaURoOEtDd0RZL1hiK0tScGVNS29URkcxM01teCs2MkhZ?=
 =?utf-8?B?MVhFT29QSFdjZ0xJbVh3YzVCZ0lGSlNJTGJBZG51S2pMMTNlbHdlR1ZXSkhp?=
 =?utf-8?B?VDNsNTA2bWFEU3NIWFNVbitaNDIzWnNEZy9sQ2tuRHp0WVBCcXk1YlZDQ2x5?=
 =?utf-8?B?WExQN1V1K1RqQjBkT3ZEMUhGbjFXVkRHb1ZuMUpzRmUxczN6U0daQkpnUjVY?=
 =?utf-8?B?T1ZIUHBYNFBXNmJsaDg1Qm5OZ0tySnBTL0U1bUNlNDJaNXN2SmphVGZlQXIx?=
 =?utf-8?B?cVhkZGxiREUzRlNxR2xOOU9zSDc4V0NNYm9VTlZQV3p1RnFpNldQMmJMWDBq?=
 =?utf-8?B?TDBCWXFaSkpEa3dKMDQrQ0x2KytPQW5iY2NncHZpdjVzWnJ2SG1WY1IzK0g5?=
 =?utf-8?B?Nng2alV3OG52L3BEV0U1cm9tV05haGtzNkRRUmdLMDI5TTJ3NmQwaDhsWEJZ?=
 =?utf-8?B?WDQzenJXWWlSRGp4TFN0SVF6eWozc2E4emNMOExjTU1HODllUzh3MVArTjBn?=
 =?utf-8?B?clZsWE02N3pWSDdGZkI2emw0Y2tOeEhQTE1tc0FOWHBqV0FTQURITEFKWjc0?=
 =?utf-8?B?QzRDUmhVTXU4WjJPclVWZU8wR2MxcE1JdkxZV2ttRXN0ZEVPZjRsLzZ1eWIv?=
 =?utf-8?B?ajRwcDg0clNEcVZ1eDNqWE9kMmt6bU1ZVkJEWGR3NktuN2M1ZzRrOHRBbWI1?=
 =?utf-8?B?OHNoRlJvYytPdkt6OWlZQ015N3dpVzYrZTY4N3NVQ0VpUWhUQmFDMnhjeGpL?=
 =?utf-8?B?YUtvazhXanR6WDRtbVNBcjBUc3pQdTNyUGVFQllCb0ZMSWRSRUZ1V1BaSU13?=
 =?utf-8?B?M2trQy9LT3JRV0tLWnNXdzRoRzRWRm9MNlQzWk4zUm5IdVZ6U1B6S1RjR1Vs?=
 =?utf-8?B?V1JhMGF0dm44ejNsUlpBbXh1SVdIOTN3QTF3U1Z0UGFkRUhuQlZOU0pvWjRP?=
 =?utf-8?B?MlIwN28rV09OVHdBU0J4V1dIcXJuUkk4WWxKUTJ2UEJaZmFBNTdtMlpISzlh?=
 =?utf-8?B?ZlBWTFA5cVB4czNCSjk3c3VpMmNBWTdoaFhYa1N6ZGxDM05QeW84V0dJNUVX?=
 =?utf-8?B?T1I0YkhHcVZMeVpUVms0K0VNMVROWjlRY05YdkdIdkc0SXFpWjlSUHJqT3NQ?=
 =?utf-8?B?TEpYem44ZllndHRoRVJmdi91OFBQWUlnaUc2YmRHZlFocWN6YTNwaGRWT0ds?=
 =?utf-8?B?S1RQVk93VExlQ1Z4aFRqbEVNaEs3Vm1VeHNCdFRxem1mVFluKzV6aGRKdnlr?=
 =?utf-8?B?QTRqOCtoNGh3NjVmc0RCUTVkTXNBU0dGK1l3cjZrcTlIMU5qTndLSVhNYmox?=
 =?utf-8?B?VVAzVFladzJDQkFVUDY0T0U5bjhodHVXdzJMT3VQOWE0NnBvYlNDTk9ubzBZ?=
 =?utf-8?B?RW1yUEY1cVVRNERmTTd4RnJkN0d4SnIvNTk0bVF4cVk5b3hBZnlVancrT3FN?=
 =?utf-8?Q?OLGAtxEDRWxe/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUlpSkE0bXl6eStJZzhaOVhHOFBKM2cycHhWM1lWc3R2MVNCZjE5OCtkSGZC?=
 =?utf-8?B?VytLUFBjaDVyTDJMazJiVXIvR0RVZDlCMTY5VUZCSXg3RjZSRVFIY2xyMWE5?=
 =?utf-8?B?MnJaOFBmNVJUdjI1dGo5a3dtRXNWTjNyeDBIS1BFdFBGUkNKWnQ1YUU3OHBX?=
 =?utf-8?B?bVhlVjIxdHZxM3F3OGNYU1htc2tta1ZSWmR6eC9ySFpTYmJMM0JubTVUQk9E?=
 =?utf-8?B?WEtMR3UwZk0vWHJ6Sm1aUThvdm1QbVlCOEY5WnRBUFdERnVjS28rQW9NVzNS?=
 =?utf-8?B?NlUwMGYyMjh2bFNZV3IxTWhmeSt2cUw5WXVHQjB3N2JKRVZZQmtVeXNzckFR?=
 =?utf-8?B?cG1zdVNhb2pDQVVaVEVTTzJuMXhVQUFsZUtwbUxzVXQvMklUOVJTbDNvaDJT?=
 =?utf-8?B?a3ViZDVYb0FyMFFmNkZaVzRTOWZHWFVkUFBxeWNQdk92dXZBbEtIQmNPSlhH?=
 =?utf-8?B?cC96M3JhN3ZmcXYvUWVXZG5FMUZYNThROWcwcm1lV2JieEpSNXY3dnFTNWx1?=
 =?utf-8?B?R05HQkw4eVZ6RTJINEVJRXJqaFl0QjlST0hDZjZxem9TWWNMTE1nS01QTUY3?=
 =?utf-8?B?UFpJK3F5cE5acnRTYXBWNlpUdEtWVXJlNjhDWnhoS2pYQ2J3dzNRdklXeFhZ?=
 =?utf-8?B?anFPcXh0aWVzZUNGSnVnMjRvaUFoZzZIQXFhS0J5S1EyN3FDQ3RCM1VuL2RE?=
 =?utf-8?B?Z1I5Q0VES2ZpcE0xVlZTTk5makRLMmhWekRWNjdHZXJmbk1WcVp0dUdBUmU1?=
 =?utf-8?B?eWVHendCRmFadll5SzZIRHhvNmNDYWVoZkZ6MFlsRXpmbDJoNTg2WFREd0Nu?=
 =?utf-8?B?akZmdWVPS2FBcjhvamJBaWF1MVVFR0ZiYWpKbnBSem8xWnVaL0pwM0JqMm4x?=
 =?utf-8?B?Zkd3Um1WOFFqd2RCamwwM0l3NldPbXUvYWovenRKenNEL3ZJTXUrMFhPTzFW?=
 =?utf-8?B?ZkIxQ3hQNndNVllsZHV4YmF4Vi9hQkg5V1FPRGI3bE1kTDFNRkY4ZndSYzMw?=
 =?utf-8?B?dHMvVURHSjJURm8zSTdtTy9DVDVjQ29Rbk1wWG9Ra1E3SGhCc2lVVmYwcFRR?=
 =?utf-8?B?N09CL2FXVG9WMUttOFBDR0NSZU9FM2F6c3pjcE82aHE2akFkdkhrek96dUx0?=
 =?utf-8?B?OXJYTWZjZ2FsUGhuS3NNWmVmcTBCRHBMRXBLaFVXLzNHaGVEOVNHcWVSY0xX?=
 =?utf-8?B?RHZmYkpSNG1tNzJoYWhlekNPemVLVkVoYUZlZXBSenIraVFscENWMCtQZk1q?=
 =?utf-8?B?RWpRQXFLNk4zZHZIV1hUSFVTK0NGYzVOUVRqZ1dlRGkwYTZzUUlOWnZZdjBG?=
 =?utf-8?B?TzQ1S2krcWdsTzNBemFOMU1Lc1RmbU9OWEpPUTgrTkMzc0FjL2ltWXFGREpE?=
 =?utf-8?B?WG8zdEUzR1ZYRXJHNDNSV0VFMWVBYmxuYWduQmxTeFRUZDVxVC95aUwxQzFj?=
 =?utf-8?B?NEM2ZXplODBXSzFrQ0tzVWh6Z2cyNVk2VWVucTVsMTdwTjh6Mm1RVHoya1lk?=
 =?utf-8?B?RjcxYVdDb1FYOTlOS3IwSXMxMVVyMHh1VjY5OWtDMVRHUkNSWC9SQldzaVQ0?=
 =?utf-8?B?RHh0elM2L09HSE1MR3pmSG5OSzBJT0tJMlBrR1pWc0FJdjZReXdodmx2cWxF?=
 =?utf-8?B?YTZDS3Y3VENWWjg3U3YxU0V3SDFpWVJweXAwYTJReUNGaVFxd1BSMTZ4ZzFP?=
 =?utf-8?B?NnpvM2V4c2VjYldTNE1MRm5ubnFMdk9nSi82Z1lNOTNGSExabk1jUVBUUzd5?=
 =?utf-8?B?RUcxUVRaYXY5RjFyTVU0OGJUcUxpcUk4cHJzeEhMVHZ5Y2VBRGh6U2s0bjBa?=
 =?utf-8?B?eEtFdXI3RDcyUlpYdHpFYkVGd01VVkc0R2lVMk1lbEc5NVNzMk1YZ3VpYWxU?=
 =?utf-8?B?cUlyTU4xcWh1dGVvN1ZPWmdmWkhOMkZYem1qenV3VDY0SWFMNFVsMjVKWlZV?=
 =?utf-8?B?NE5JTHVXZ3BlV1VLRmVZNkJDQk15T3AyVEVDYjlFQlFFM3RHeUVjVlEwdWtq?=
 =?utf-8?B?VnBjc25RMnVGT0RXRGsxYlpsak1RU0lLSUpra0RYM29uUy96NWlSTWszRkxQ?=
 =?utf-8?B?Vi9iRkFYVHVHU2NZUGpHZXpVeUw3R3pSeVJiOFk0QzhlaDgybG1YTzVuck8w?=
 =?utf-8?Q?QXfAG4zogVpa5kLor4hJuNlmM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 022a21c4-cd88-4337-b8e1-08dd2075772c
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 21:38:24.1090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42HE0rnNj7cpBoHCRWIO1PwyKcNCzPou3+SA+EI+rFNy7Bz+o1eeMd2kPhCjObKF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9197

Hi Reinette,

On 12/19/2024 3:12 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/19/24 11:45 AM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 12/18/2024 4:01 PM, Reinette Chatre wrote:
>>>
>>>
>>> On 12/13/24 8:54 AM, Moger, Babu wrote:
>>>> On 12/13/2024 10:24 AM, Luck, Tony wrote:
>>>>>> It is right thing to continue assignment if one of the domain is out of
>>>>>> counters. In that case how about we save the error(say error_domain) and
>>>>>> continue. And finally return success if both ret and error_domain are zeros.
>>>>>>
>>>>>>       return ret ?  ret : error_domain:
>>>>>
>>>>> If there are many domains, then you might have 3 succeed and 5 fail.
>>>>>
>>>>> I think the best you can do is return success if everything succeeded
>>>>> and an error if any failed.
>>>>
>>>> Yes. The above check should take care of this case.
>>>>
>>>
>>> If I understand correctly "error_domain" can capture the ID of
>>> a single failing domain. If there are multiple failing domains like
>>> in Tony's example then "error_domain" will not be accurate and thus
>>> can never be trusted. Instead of a single check of a failure user
>>> space is then forced to parse the more complex "mbm_assign_control"
>>> file to learn what succeeded and failed.
>>>
>>> Would it not be simpler to process sequentially and then fail on
>>> first error encountered with detailed error message? With that
>>> user space can determine exactly which portion of request
>>> succeeded and which portion failed.
>>
>> One more option is to print the error for each failure and continue. And finally return error.
>>
>> "Group mon1, domain:1 Out of MBM counters"
>>
>> We have the error information as well as the convenience of assignment on domains where counters are available when user is working with "*"(all domains).
> 
> This may be possible. Please keep in mind that any errors have to be
> easily consumed in an automated way to support the user space tools
> that interact with resctrl. I do not think we have thus far focused
> on the "last_cmd_status" buffer as part of the user space ABI so this opens
> up more considerations.
> 
> At this time the error handling of "all domains" does not seem to be
> consistent and obvious to user space. From what I can tell the
> implementation continues on to the next domain if one domain is out
> of counters but it exits immediately if a counter cannot be configured
> on a particular domain.

Yes. We can handle both the errors in the same way.

> 
>>
>> Note: I will be out of office starting next week Until Jan 10.
> 
> Thank you for letting me know. I am currently reviewing this series
> and will post feedback by tomorrow.

Sure. Thanks. I will try to get to some of it at least. The review 
comments which needs investigation may have to wait. Lets see.

Thanks
Babu
