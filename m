Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011003.outbound.protection.outlook.com [52.101.57.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C5A3E2AB5;
	Fri, 15 May 2026 18:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778871193; cv=fail; b=rz0qAEzA+j1L75rDF9HgzwM7MRfAuu1jRjmx2EvWes9vknswwrbCs/tdxIWERrFeMNvW929DqcWMFEnUzhXuGd9EkheSMnrLuPrTPJUEU7OuNAVMLXXuzBsGFzWj9j0mLWU80ZycRBk0Ttmblng7DsxuOwD84qPtS3qf74Wx9J8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778871193; c=relaxed/simple;
	bh=/P/ncCOwvfRHRL4E975gidppC4kZ3g23l+wnA0ASOg0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E4E7jmcwM9t60/PCv12xE9RMe1E24Av1YmchEAGLWuinfnv+HmDXJ6r/OetFfI30maOaj5iuBcafDw28BU8Kh6VRKoI0xyFRrlUj2ud+GzH8IQIg9W6Q2pqNoFw53B8NOPPlbnC6doz5GovM4KH4gqWnhco6QPiShoU8dEu14+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gITLE+Ss; arc=fail smtp.client-ip=52.101.57.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gITLE+Ss"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjHeW951Aqha/W6IwW18h6SS4d+94WqPvIizx2TDflbK5l4FtGnGLUcG73oInjbySr7Gxw0u4sfx2ZxSuC0dgxG3SPNEohW8EiDbzL2LeN/Hw6YuEGJuVQmLkLbaHc+dGLia4iljZDveWSan4ufzh+lAwG+0umEFIVj9oDe2U1EI3bVNvmWvqJlHz9SUSo0lf5Z6lpgpuVGQTIZERLFV6hyxuKjGQw9nwJpEtNLVYR/eoZKbWBe7YPKcYc1zp5hOYH7IFzfwl+QDjynJbHhehT6gtOLb8RmQt1AjpUGBa7X735EHmSt+p8qpvKgDiNj65kbXTfOxwnT3QLvcNW8yLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmzqrqnupwFmt2Ey5Ocw7TETiXXSQPnt5FzrftmxJag=;
 b=iVxUmjP0LDQCFTWGqLOQF6GmxMXis9L9/qbmM3PuPhJ0O9C0AmJsBea7as9G3nAH7mpOahGJBHn3+d0LPkCwi7+c1xigbbZKnXAEjUdTgQ7XA7eMVV4Kok6q3fuligp8hccSXgAhwh/iBsnSalFlHxijMihePuUmJHinPCrycr1BwCd49qdj83x+NH7ByCTNPK6Cp06eoo7G4Qz0xC5hhzgIUoRyskpPupiGi3GY6Yu2SrlRQNq6AhA+ZHiYVDNjdOhoLe6SfHBT1DD7YRrQyoRpFKltjsInecHzwoc7wfk4KB0jG1CtBS1dQ7fouDe8fO9/GMuk+E8OQZHc3ONivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmzqrqnupwFmt2Ey5Ocw7TETiXXSQPnt5FzrftmxJag=;
 b=gITLE+Ssh2YVCuWhLzFZLRMEjr37m5IrSKgtXPDxKNXMjQs+Dt3Z5Ox20CkWVlQQyZsMGCoA4I9p/TqxtpEhn3VY8EepbtLYlRg89zdlCTc74BsW6utkRMSjYfkJ4bIOuBwDvMeTU89Hfe0cj50LcYUwwq3C5w8U54RIlmcZoMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA3PR12MB8803.namprd12.prod.outlook.com (2603:10b6:806:317::8)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Fri, 15 May
 2026 18:53:02 +0000
Received: from SA3PR12MB8803.namprd12.prod.outlook.com
 ([fe80::b6b5:dec5:43de:6d2f]) by SA3PR12MB8803.namprd12.prod.outlook.com
 ([fe80::b6b5:dec5:43de:6d2f%6]) with mapi id 15.21.0025.019; Fri, 15 May 2026
 18:53:02 +0000
Message-ID: <e638d46e-ed7d-4673-b969-58225c8935f7@amd.com>
Date: Fri, 15 May 2026 13:52:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] x86/resctrl: Support for AMD Global (Slow) Memory
 Bandwidth Allocation
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: skhan@linuxfoundation.org, x86@kernel.org, Dave.Martin@arm.com,
 james.morse@arm.com, hpa@zytor.com, akpm@linux-foundation.org,
 rdunlap@infradead.org, dapeng1.mi@linux.intel.com, kees@kernel.org,
 elver@google.com, lirongqing@baidu.com, ebiggers@kernel.org,
 paulmck@kernel.org, seanjc@google.com, pawan.kumar.gupta@linux.intel.com,
 nikunj@amd.com, yazen.ghannam@amd.com, peterz@infradead.org,
 chang.seok.bae@intel.com, kim.phillips@amd.com, thomas.lendacky@amd.com,
 naveen@kernel.org, elena.reshetova@intel.com, xin@zytor.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, eranian@google.com,
 peternewman@google.com
References: <cover.1776980182.git.babu.moger@amd.com>
 <cb8272dc-4419-45a9-8cb4-110c803e62ee@intel.com>
 <797e863c-211b-46b8-b404-de53f8453527@amd.com>
 <8939476b-1e1b-4aed-88a3-5b8764a63030@intel.com>
 <3bc59b3e-4506-4489-a424-6e7f91232af1@amd.com>
 <67782399-2d96-4207-8ee6-815bd0c4104b@amd.com>
 <f92d0db9-1d6d-43fe-8a8d-893aee75b389@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <f92d0db9-1d6d-43fe-8a8d-893aee75b389@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::34)
 To SA3PR12MB8803.namprd12.prod.outlook.com (2603:10b6:806:317::8)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8803:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f414d2d-a72c-4159-cda6-08deb2b330b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|3023799003|22082099003|18002099003|56012099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	sBkiY3M2RNBjq4tKEd7mKJPZQLhE8gQC/spomgFZJ+lID6ToTH9vN0nMM6+FNTpnI4Ws7k5UyVVtFGLFFkdU/RlFFYC2kobMDDkT0xFU1ng/72pngVGxEgs64DE7Zj10DJ0YqGeeM/qQjwT8CAI+bqE3YAxaOl9Yq5raTjE02Gc9sU04+S+Ivi+JtFgmE/iM5qmtt8YSP2tca8YdiI+G+UefOa/IoB7ch/2PFhWJxFhCQtDIfQv1Q5vQWZLbYRjG0Or5zmcUrLOPc3GxT/dSddSHLJfCt8WSeZUWS0lHQfFMwaWE5Y9CNoI9309ObI+v8YOa+UQK6Kim6gTVfAf0ZRX9Y9C4eE0rnt5vnM2ZVCJOzRdTDZiuWw87rg8Z2mWxujPfTt+Zp6TurHXCLXuqkVKNos0WNW6CIoEOIeqEccQ2IYATuF34h9r4FarG58NucIcRYlJfI+UTReJNBzKHf7/keHmjgPBqWK5E1ikLioCycnrwf0tMN9ir9IVX10/78++ruExAhGWd0/nu2jO8XkgpqeSCZuFIRBsGdyFal4tN3Zemyk1P2e63YRoEfMvpa6uGHYk52BD5xjWSFQ5VuSPs9vqoLXkzTx9gDtOBBG+0p5JhgDaoGoQXyPz4Jir25OBhnFwkSTsnVWnq63sIE5bXRHFQA87dGv7h8iPXwAaKvI0a4p20cH5EqYkC7Dw5SN6YtAEPx2QdTb59VfWcLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB8803.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(3023799003)(22082099003)(18002099003)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEN4OHNhSHpabG9tQTVJTHlQSGMvZGFrTjVKQU5iaVhKd0FiM1lSN1B4cHI5?=
 =?utf-8?B?blBMNE9XbE9WUmxyaFJ1NWNpaldrN1I2QzVOay9EaGFxUFFrYjdNL2hFdnpN?=
 =?utf-8?B?N214V3BqSC9MOEV5OFUrNDVpcHdFQ2IzSW13WmVLQ2lINW93WU1wb3A1RTdM?=
 =?utf-8?B?bUlJMlJ2NHFsT1VGSlpRV2ViVmJqOElBREgySHJaSFBVbVcyemFsNlJEUUpT?=
 =?utf-8?B?UU50aDYzeit0NGdFWk9RNUVacUVzSkVObjJYNmVlYzYyL1VIanNkaFFwdlFR?=
 =?utf-8?B?cHg4OEdXV3MvbmJPdm5zUitOSXpQUEw4NnNCNko4WUZBQ3ljYkxrdVFMY0N1?=
 =?utf-8?B?QUdVMnpUZ3YxWmlwS2JpK3BrMmlzQVBEWWE5WGRrSCtTdjhJRHdXUmtsaGRh?=
 =?utf-8?B?d041bWg1cURObXhhRkhKM1JscThZQ1E3UHpzdE1ycXdHYkhOY1R6dm41bms5?=
 =?utf-8?B?bXk2WWc1Q3J0VDN4YmlPZUg5a1VjSDI3cFNyTXlTQVB5cEhNRHJoaXp6SGVr?=
 =?utf-8?B?UDJhUzdQQUw4UlpkbXk4VUgwaTMrVEY5Q1R3b3FVRGVsNUJaY1JlVjZMcjhW?=
 =?utf-8?B?NVE5dlJvM3doelBtMC93Z2cvR1VNYy9tdlRKYVpsZXpBK2R4NGV3OW11dUd5?=
 =?utf-8?B?QWNyd1ZETDRYRjNsK0JMY3hhS0NsamducXFOREpBVVJ0bHIyZWNtTlVkdmpk?=
 =?utf-8?B?ZThjSWhSM0JUS0hTQTk3MWhJdVB0L0FHZVBnNXdsbGlYeEJCVktIS1NldE82?=
 =?utf-8?B?Qi9zOWJ0REtRdEdQZ2w5aVFYTTZTVzZkckgxS0xseVlCeEhsV3JNUFRQWlpU?=
 =?utf-8?B?Rm5udTFSSEdFUytJR1pWUVB1dkdWWTZsSTR2enBkR3dnejdGWG1RUlZ2SFFh?=
 =?utf-8?B?SHNmY0pyelVuM3RXcS9UbHk3ZVljUVFvaVpYdFJqWTB5MGJzU3M2NXdpaEFH?=
 =?utf-8?B?ZUpXUjZnRkJ2bGl1OFgzSjB6RSttaElTeStrdHFzaUpWekJ3T3RvM0s4eERq?=
 =?utf-8?B?MElRQnM1ZU51a0JhSVc4SFN4VUVtR2pvTi8xcVVsYW9JbGphdlhpNi9uMWtQ?=
 =?utf-8?B?NlU1aGs4VnhuOFd6YSsyd1RYd0FDWXR0ek1PdXdxQ2lSRm8yWnYvcFFuV09q?=
 =?utf-8?B?bmluV3hrOVVSdFNXK3Q3OGxyUklzOGIxZnRIWVNKVnhMRXozZGFHS25Caisy?=
 =?utf-8?B?Nnk4a0srMGQyRnc2WE9relJZRTRadkZNVWRwUlpiN29KK0dydE55Q1J5QlJR?=
 =?utf-8?B?MkN3bTJRRXpQcWlNNHdNTUJtR0lHL0VpS0pPdjZnQlRMQURZcWhXQXkxcW1T?=
 =?utf-8?B?aVNUTzBXM1Y5b2p4VG13b2xxa0dMa0xpU2Z2LzgxaVRGcjY4SEhFQkRwR2Va?=
 =?utf-8?B?L3EwZmdmUEY2KzB2RkFQTUl5d2J0alNhSzFzOCsrbmJYb3VtL2lhaU1Ba1M2?=
 =?utf-8?B?WHBWK2ZwZ1M5T3o1RHF4T0JPVUFqaVdKcXBxZzVwdlIyZE5JZW1IMndmd0hY?=
 =?utf-8?B?R29XMG5TVjlEYjZTUU5BOUd0bnN5ejd6Qy9KcEl2M0l6emlJQndacmcwR0dP?=
 =?utf-8?B?dzlqUEl0Mm05SVZxRlBmbmNLQ0ZwQ2M4R0JpdThHdDFqeUE5dXQ1R0FWUURZ?=
 =?utf-8?B?anlDNEVSaUMvakRjaFMyVjJuR0VxU2h2ZU54TlZYVmRIK0Nld2NlbzJ5KzdV?=
 =?utf-8?B?NzRvNDdqZ3MvR1I1Y0FjeXV5UXl0aVFsN0xreTNpZGhZUDU0RHQ3QTBVS0hL?=
 =?utf-8?B?djZ6Unc2eitwemRRRSsxYnVwdDlSUUVERUlzcGlSZGo1YnlEb29OR2NtOW1H?=
 =?utf-8?B?NzRwL3UwVnpyRS9KR0QyQ2lnSGJJaEVXcGprOXpBL1JKaFk5VGJyRFRXQUlY?=
 =?utf-8?B?V3o4Z0JhbXJvWldjZWs5aGZtZGxRYUNGSGwxWGMvdzUvMVJURDdQU3c0YzZC?=
 =?utf-8?B?L0NKUEdOME12ekZKdFRVTE5XR3FnRXdXOEthdjFETWVwN2tqdFAxTlFsc0F6?=
 =?utf-8?B?UmlUYnpHU21qRmlNTUJQeGZYZ2xJZzN4dFVINWp0a0hld3hmeFNhUE90d0Yz?=
 =?utf-8?B?aDhsMHluYnlTR09VYmtzZHRRdEJIUXc3K2IvTE9RVWZmRk9sOGNRZWMzTkFR?=
 =?utf-8?B?bUhJUW0ya0MyRGxWRWpUaGQ0TEd2aDI2V0lMVTV6MDEvNVdYU2NtRjg1NUhW?=
 =?utf-8?B?L2NDekJUQ2FIUmNUWUMvVUx2UUFWQlJNYTZXS05pT1U5RmpJOWxqdWVEeHdj?=
 =?utf-8?B?Vkh5dlcxbkxFZlY1bkIyODRHYStLUFlNMUthYS9tZlhzVzE4c2NrUUxtVlNl?=
 =?utf-8?Q?1CSwoBpIXzeeVeirY9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f414d2d-a72c-4159-cda6-08deb2b330b0
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8803.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 18:53:02.1287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qv9ef0ugBat34bY1mPIk2flzTp5qsPD+Oa7xaqlthRpGIsjqZ6zSKPoytv1Ahtsv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583

Hi Reinette,

On 5/15/2026 11:35 AM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/26 8:31 AM, Moger, Babu wrote:
>> On 5/1/2026 9:38 AM, Moger, Babu wrote:
>>> On 4/30/2026 6:40 PM, Reinette Chatre wrote:
> 
>>>>>> Since there are so many dependencies on the new schema format support I am prioritizing this
>>>>>> and created a PoC that I am currently refining and hope to share soon. We can collaborate on this
>>>>>> to ensure that it provides a good foundation for the GMBA and GSMBA support.
> 
> Above is comment from me indicating plans to share the PoC and goal to have it provide a foundation
> for GMBA and GSMBA.

ok.
> 
>>>>>
>>>>> That is good to know. Let me know when you are ready.
>>>>>
>>>>> Could you please share which parts of the feature (e.g., Part 1, Part 2, etc.) you are planning to cover in your PoC?
>>>>
>>>> All three parts mentioned in https://lore.kernel.org/lkml/06a237bd- c370-4d3f-99de-124e8c50e711@intel.com/
>>>>
>>>> This does not address all the features discussed, for example it does not support emulated controls,
>>>> but I hope it is enough of a foundation to build on.
>>>
>>> Please share your code when you are ready. I can build GMB and GSMBA on top of your patches. Hopefully, I can reuse some of the code from this series.
>>
>> I didn’t see your acknowledgment on my previous note, so I wanted to follow up to ensure we’re aligned.
> 
> I did not think a response was necessary since it essentially rephrased my earlier comment and did not contain
> a question.
>   
>> Just to confirm—are you planning to share your PoC?
> 
> Yes. The fixes needed in existing resctrl code are taking higher priority though.
> 

Ok. Sure.

>>
>> My understanding is that I would build GMB/GSMBA on top of your patches. Please let me know if that’s correct.
> 
> That is my understanding also.

Thanks for the confirmation.
-Babu


