Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010064.outbound.protection.outlook.com [52.101.193.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9A33911A2;
	Thu, 13 Aug 2026 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654522; cv=fail; b=P3UHeD97qUDrbjy8BLrhzaElHlWkI4NqEhOLA6iGk0vOW4X2T9+aJPFWziczGWdjWG4B3MsMZ6tOq1UlaJYDXcJF00rc27sawNf+b1xhMP/wCVkle0HliejyDdWqlZ10htr02CRj5ajSxNWckD+NFaWxfwByJBZXdG4sgmBm8yI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654522; c=relaxed/simple;
	bh=bqbgaE0kwtBZTfgW8/5rlnYz/zkDLFhG53fZg98dboY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Jiog8P9vdLOcyTWCMpul9CAFa3KGNXRiFCvPAm3ee7ZE3lw0I73WAD7LK4bIAbotgFC+draq6XK9ETia0AptsT/2F+Oe4hJluSWoTkXe+ldpbHzl0w0qUdjt1eWN0OwbCIZJ9V89NvS1TQ6dsziZvS8Vn05NuqoJaDgzfsowYo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qkFOkqgw; arc=fail smtp.client-ip=52.101.193.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qkFOkqgw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkVGdvSigJSKkvUr7wJmJY9N57fZkn6U2UXnmscabiZm0HTlUklSK8aMi5vDnUJXLK+a5NA+OwRI5Zbyn0JrQ9dmYwLNx09F/HRHFzrEolwsfUm6lhh4VdQl8AELC6t5+GabrM/mx3IPmvzlWMwxKnsNMmCyDjsDR4NCeiKY0Ipv/1ILDlKyVaW80l77Ux/cCh+Lc2PUbIQrDuKWaD1AVvrR5OrCLsB/L0Qc3Xcw5cFtWOtiN3peLedGA5yefn+TmE+fx6W9nhFUvGzQnK+cW1Py4ooGSETMNh/C3srFbT67iRawF/c3K3LxjJWLDXRHdaRzdFpUCB23SahJuiQyMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVK5NbAMLVPZS1BJPUPmXX2iecAsDTLZoJWSvZPobBQ=;
 b=hHGdDjvLkPcAY4/wzkLW1mx4kAHsYbPRG5VOKSMZALPRk3gVT10PCywHCqPcHxhRPBX7J6le4g2PW2gpX/w5CZmB/Ev7zEu1RGYb6u7ztxJI/5eHiImkp1k2PMSNvvXHSy8tDAJbntvXCj6aXeG4n/9vvwRu4KhGQJuGet48PDRkBBP0qZzc6im7spBVo5S38nyund8RXE/R7CCWkvGfBOI2Ogf4j8SMCXQRvTy1od8BtvZj78NHOoxmmSiKkj6GwMACX0rXn4YYf70BGJ5guIblVN78YcYgxm6YaxnEFYAyrTedX/LHFIY7O2xqBVisHmY0cW9gGwCPrZf9oG2zEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVK5NbAMLVPZS1BJPUPmXX2iecAsDTLZoJWSvZPobBQ=;
 b=qkFOkqgwbr76N7WpCXZXR7Le2fPLd0TE4sGsrTYSOg1ZQ3WMLZuHXFNVdah+HULR813peRXsQSDEC14WkZyYhO/Av4fu0xTbNdhLfTEaU0/tQCr7GwwEXwO2jrYKt73agg0Q4g46c8ceHO7JjFe5Ki477a+v1t2QuCmYUV7lpOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by PH8PR12MB6698.namprd12.prod.outlook.com (2603:10b6:510:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 13 Aug
 2026 20:55:13 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 20:55:12 +0000
Message-ID: <9e5d9cb0-fabf-45d9-a0b1-5103559721b1@amd.com>
Date: Thu, 13 Aug 2026 15:55:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 13/15] fs/resctrl: Add interface to modify
 kernel-mode via info/kernel_mode
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@kernel.org, bp@alien8.de, ben.horgan@arm.com, fenghuay@nvidia.com
Cc: skhan@linuxfoundation.org, x86@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, akpm@linux-foundation.org,
 rdunlap@infradead.org, peterz@infradead.org, feng.tang@linux.alibaba.com,
 dapeng1.mi@linux.intel.com, elver@google.com, enelsonmoore@gmail.com,
 kuba@kernel.org, ebiggers@kernel.org, lirongqing@baidu.com,
 seanjc@google.com, nikunj@amd.com, xin@zytor.com,
 pawan.kumar.gupta@linux.intel.com, tiala@microsoft.com,
 chang.seok.bae@intel.com, kprateek.nayak@amd.com, prathyushi.nangia@amd.com,
 kim.phillips@amd.com, naveen@kernel.org, darwi@linutronix.de,
 elena.reshetova@intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, eranian@google.com,
 peternewman@google.com, qinyuntan@linux.alibaba.com
References: <cover.1783461016.git.babu.moger@amd.com>
 <9916861e5fe73cc8d7ea02ce366b512bc5424843.1783461016.git.babu.moger@amd.com>
 <4203f7a0-25e5-41d4-b6bb-95652540a834@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <4203f7a0-25e5-41d4-b6bb-95652540a834@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR07CA0058.namprd07.prod.outlook.com
 (2603:10b6:610:5b::32) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|PH8PR12MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 163cbf0a-7aa6-41db-f958-08def97d2b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|376014|8126099003|22082099003|18002099003|4143699003|5023799004|3023799007|11063799006|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	UMcA4mXIvg2uPVURD84dP75ppczKqnV7sApmJF+rAj5MGZnlcumCVDqy0iVa35NiiFUBuRK6FoKOhKg8+Xn0Y/wp7jH+Y3QtT+cB1b45ebqgUSbNRag1QlBC9dHiBKTUJyWFpwCO7g6smm1YZ+hvDz0tem86TX4RsdlM+8p7lG2UZMUHt/Dp7X+EiSwQ6dl3smuXbD3ik85ycOPBuO8TicRJOJTXo064UH06vijnK3BIcUbxWAC7N+FSsc3pQnQTRRyqLbOjTgd/GihHTL5845iy+qH74MVIBwWlxGWF+owYTzYQ50wSRRUCBS9sjafS+O+kjkNgCfjnYp5tiOmRd/uMi2NvJTn3mPCO0SKPgsUWPTMocw3XLSxqg1gJOV1GntjuJTuOSuFrOgMGiNDEKCMSLE0OhKayVJ+IRHAbkTV9YjHYYCDHv1zGJtK+4yPk14WgKRORz0e9rsLxzXuH7flHxeO6dMqAonVxXMMjKU8sRkYMUMl8pLGzXJ6Y8nEyqQXyJndNFqZORrxCQEj/ZpGxAAmJ7NoNmVMGbt01paxsV+3mN6iXkkOAyvFBG94qrEfQcmZCOML17MqC5HJHfMdOJnAZ3h5WsDZt94RuEC6MnKwMnDlpREAktBbnfy+GUw1LM+2ZZlHctGOKlCfVCYR1xkuTs3l8/p2r7DJvW3E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(376014)(8126099003)(22082099003)(18002099003)(4143699003)(5023799004)(3023799007)(11063799006)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU9QdTRvQU5EWjVhM1djWTRlb2VyVHJGalJVeFpSRTRNTlY3ZytPYUhxUDVx?=
 =?utf-8?B?VXN3MVlkd1JWaXhoNkR6SVZ4eFo2TVZjbXp6Qjl4R3dNSU1XR0NFMDhaM1Fa?=
 =?utf-8?B?OVBoTkUzSFVQbnIzL2laMHdBL2J5KzVlZGM5WTNBODEvZXlxNjhpcERzRFRC?=
 =?utf-8?B?SDFmQkJhVFR3UXVwWTJHRGhpV29JVzBvYjBTNWV4dktLTzNHc3FmVXBFNEVV?=
 =?utf-8?B?S1A5alFodEQwR3FFc2ZhdGVIeEx0RWNTemI1SVN5Y0EzRzRob0NwdVFDOVo3?=
 =?utf-8?B?MkNvVlloK0prSGkwSnRPUE8wOEplS1hVUzkvZ2JiY3EzQWFsNGlzc2MzWWpJ?=
 =?utf-8?B?MkhtTGF3ejl1aDJFVWw1Z002WnR5cDhaZmdLeFZRN0RiS3psNjQyYjdjSndI?=
 =?utf-8?B?U2s5VHlZN3BoblFXYnRtNXQyNElUNnhvbDlFU3d6QSsxREVJQ3dCUGtBS2c5?=
 =?utf-8?B?Z0dldXdiUUQxeis3M0RqU0tweTQ2UDRNUjB2RXpCUkpad01KTmpBQ1d5MVIr?=
 =?utf-8?B?Qm5CdFZQbDhjbDhMUHZ5T01sc3JwL0Y3WThUaXhsMVlqSXRNMy9ld2c3dWll?=
 =?utf-8?B?ZUlTOFFrZ3FGU2V1dDltY1BGZElxVFh0aXhndXVXenI2RmE1NExEVHcyZVRE?=
 =?utf-8?B?ak1makdLSUdOWlJYa3ZKTGp6TUVnLzBGWS90Q0tHMVMzMmoyT0xsK1V5NDcr?=
 =?utf-8?B?QlBESlp5ZUhtS081TjdqeHFKNit0cTNvUStHTjlNOVN0QXNYZ0Y0dGRNTzRU?=
 =?utf-8?B?d0czMWpyL1BVTzdEa2ZnaGUvZmJGZ0R4R0VPc3k1NmRuMGI5bjIxWEdwRU15?=
 =?utf-8?B?VWVVYjFGSkplVk1LSkN1azhSbkE4aWx6VngvV0ROczVLaE83eVRBNFpqdjZu?=
 =?utf-8?B?dzJCVWJuOXNNN2hSSjhQdWU0MXpxTS9zekJ0QlUwMFI3cU56WW5ubXJXNzh3?=
 =?utf-8?B?TmJRMnYrSFdKZlZIN2l2OHBsbVRBejErc0Znek9neXF4S0RMMjFMSGVDR1E2?=
 =?utf-8?B?T2F4VmRJRE9RQ1JlNXZxeXhoWWFJelVKWThQOUVWYUxzM1EwWWowazFGTzcw?=
 =?utf-8?B?TWN1bU0zREZ0QkhLc0pGMkpyOWxZd0Fxbnd4c09GUkM4UHQyUnYzN3ZHODRl?=
 =?utf-8?B?bWUvUEJ2dU5VTEw4ZndjTE1JRDcycnhBSW45aUJJSE9WVTlCSG85REVyYWsw?=
 =?utf-8?B?a2NqQjhub2NoTjRIWDVuRHdJSktuU3FwVjhtT2pPQVpreHR6em9vWXdYWVo3?=
 =?utf-8?B?VEpiUnA5L001ZUF4Nkc5UW5pQU9NME92N3VsWi95QlhZZ0tKemFwTlQyNm9z?=
 =?utf-8?B?OWVxWk85R3ZrOUtiS1dJeFhKQ1E1V0tpWFB6SzB0VVdnaW13bUVrZ2FwQTlw?=
 =?utf-8?B?UHBwUTlLRDJYMGVQMmxNdFYzV1NUcXJQZlhMblNVQjdDUFVxY2JaREtCUXpT?=
 =?utf-8?B?Uk93TzlFTTJFbXUxeWJWR3dBeW5OY0kxOUlrS2h4eHlXd29RRW4wMHpoNnQ3?=
 =?utf-8?B?MjZkY0E4anRtazhPUEliN1JBRGQ1RVdyL3Z0ZnloOFBoNlJpaXRLNWhRNW9D?=
 =?utf-8?B?SGpLVXFDUSt0bG1MVjF1TzhGd2xLOVlnWXE3bVhLaW9ZbE1ienpPS3J4bDN3?=
 =?utf-8?B?L2V2U04rVExLaUJLbEJoM01HVlMzeEoxYmk2SFU4bXk2SjA3a2NQVUtLUmU1?=
 =?utf-8?B?QitLQlJlRXJodFhNS0k3eEk5MlRlN3JLbUE5NW9GbXpTalVKWm15WVBHYjJh?=
 =?utf-8?B?MzFyR01MUXBsMmZmb3pENCt4dVVuR1JuankySkthZnBBa21Id1NZZjluZUxq?=
 =?utf-8?B?cmJlTmR2OW5ybXdCaXR0V3d4K2JEd2pQK0lUcHpzeVpVYmtwb1B0R25lNXQz?=
 =?utf-8?B?WlFlUUgvVXBwM2xUNmxQV1lkcUhVZjJOdXo1ZXdteVE1NW5mb1pNSEFHQTBM?=
 =?utf-8?B?elB3Wit4TzFEU3ptbmtnNGJoeEc3QjBBN1BLMllVNm5VT1Z0aXFoSmZPa09w?=
 =?utf-8?B?WUNMbUkrYnVueDlTN3MyNS9lUGN2Q1BTa3BlNmZhLzU4R0cyd3pwazh1Tnk1?=
 =?utf-8?B?eVpyUG4wQXJiQTAvVDRsT3c0UkQwWEZTRGhYTllrQm40bm9uRDkxL1hPOUxv?=
 =?utf-8?B?emd5d204TnVrNGJyT2xKRHgwMW8ydGZCeEl1OHJVQUl2SEd0eFprTzVsQllv?=
 =?utf-8?B?dEkybjZwQXBYTDA4LzJMaDdZbkV6Uyt0SmFmcFJVQXRUV0FON3N1OUVua21C?=
 =?utf-8?B?OVFuVUpnZU1VdG9nNWVvMmtQSmhiN1VDL0V4NlJXb2x5c0JPYXp6bHEwZlBi?=
 =?utf-8?Q?Veh4DGVottsrtdjGM9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 163cbf0a-7aa6-41db-f958-08def97d2b07
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 20:55:12.3030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJJZ+FgER26SNRWQpwEJCBsRFYP/M1jZxxsuCOLEBUoWYQHgTwohwSy7rviTG4/i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6698

Hi Reinette,

On 8/10/26 22:40, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/7/26 2:50 PM, Babu Moger wrote:
>> info/kernel_mode reports which kernel-mode policies the platform supports
>> and which one is active, but it is read-only and does not show the rdtgroup
>> bound to the active kernel-mode policy.
>>
>> User space needs both pieces to manage kernel-mode assignment: it must be
>> able to select a policy and bind the global-assign modes to a specific
>> resctrl group, and it must be able to read back which group is currently
>> bound.
>>
>> Make info/kernel_mode writable and extend the read format to identify the
> 
> "Make info/kernel_mode writable and extend the read format" - what does this mean?

Will rewrite the changelog. The text "extend the read format to 
identify" is not nessasary.


> 
>> bound group for active global-assign modes.  Inactive global-assign modes
>> are reported as "group=uninitialized"; INHERIT has no group suffix because
>> it does not bind an rdtgroup.  Square brackets mark the active mode on read
>> only and must not be included when writing.
>>
>> Document the interface in Documentation/filesystems/resctrl.rst.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>   Documentation/filesystems/resctrl.rst |  80 +++++++++
>>   fs/resctrl/rdtgroup.c                 | 238 +++++++++++++++++++++++++-
>>   2 files changed, 315 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index f3e941404967..5a13814d1325 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -528,6 +528,86 @@ conveyed in the error returns from file operations. E.g.
>>   	# cat info/last_cmd_status
>>   	mask f7 has non-consecutive 1-bits
>>   
>> +"kernel_mode":
>> +	In the top level of the "info" directory, "kernel_mode" controls how
>> +	resource allocation and monitoring work in kernel mode. This is used on
>> +	some platforms to assign dedicated allocation and/or monitoring to
>> +	kernel-mode work.
> 
> "assign dedicated allocation and/or monitoring to kernel-mode work" - I do not understand
> what this means.

I need to write in terms of CTLR_MON and MON group. Let me update that.

> 
>> +
>> +	Reading the file lists supported kernel modes, one per line.  The
>> +	currently active mode is wrapped in square brackets for display only.
>> +
>> +	The modes are displayed in the following format:
>> +	"<mode>:group=<ctrl>/<mon>/"
> 
> Please no! We know that resctrl needs to support more kernel modes and we know that their
> configuration interfaces will be different from what is needed to support AMD. They will
> introduce new modes to "kernel_mode" but those modes may bring new sytax to kernel_mode
> associated with those modes and/or introduce new files associated with those modes (like kmode_cpus
> for these modes). Writing something like above derails the plans to support those future kernel modes.
> 
> Instead, please write something like: "The display format depends on the kernel mode."
> followed by each supported kernel mode (nothing that there may be more) and what *that*
> kernel mode's display format looks like. Please do not enforce PLZA display format on
> this and all future kernel modes.

Ok.

> 
> 
>> +
>> +	The inherit_ctrl_and_mon mode is shown as "<mode>" with no ":group=" suffix.
>> +	Inactive global-assign modes report "group=uninitialized".
>> +
>> +	The bound group path uses empty components when they do not apply:
>> +
>> +	"//":
>> +		The default (root) control group.
>> +	"<ctrl>//":
>> +		The control group named <ctrl>.
>> +	"/<mon>/":
>> +		The monitor group named <mon> under the default control group.
>> +	"<ctrl>/<mon>/":
>> +		The monitor group named <mon> under the control group named <ctrl>.
>> +
>> +	Modes:
>> +
>> +	- "inherit_ctrl_and_mon": Kernel work inherits allocation and monitoring
>> +	  from the current user-space task (default).
>> +	- "global_assign_ctrl_inherit_mon_per_cpu": A single allocation is
>> +	  assigned for all kernel work; monitoring is still inherited from user
>> +	  space.  Requires a CTRL_MON group.
>> +	- "global_assign_ctrl_assign_mon_per_cpu": A single resource group
>> +	  supplies both allocation and monitoring for all kernel work.  May be
>> +	  a CTRL_MON or MON group.
>> +
>> +	Only modes supported by the platform are listed on read.
>> +	Example::
>> +
>> +	  # mount -t resctrl resctrl /sys/fs/resctrl
>> +	  # cd /sys/fs/resctrl
>> +	  # cat info/kernel_mode
>> +	  [inherit_ctrl_and_mon]
>> +	  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
>> +	  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
>> +
>> +	The modes and binding can be modified by writing to the interface. Writing
>> +	one line (terminated by a newline) selects the active mode and binds it to
>> +	a resctrl group.
>> +
>> +	Writes must follow the format:
>> +	"<mode>:group=<ctrl>/<mon>/"
> 
> Please no. Here also, please replace with something like: "Write format depends
> on the kernel mode." Followed by a list of supported kernel modes and description of
> what format each mode uses.

ok.

> 
>> +
>> +	The ":group=<spec>" suffix is optional; when omitted the default (root)
>> +	control group is used for global-assign modes. Selecting a new mode or group
>> +	tears down any active global-assign binding before programming the new one,
>> +	including when switching between global-assign modes on the same group.
>> +	The inherit_ctrl_and_mon mode ignores any supplied group and clears the
>> +	active kernel-mode binding.  The mode must match one of the supported names
>> +	exactly, and modes not advertised by the platform cannot be set. The
>> +	display-only "group=uninitialized" form is rejected. Errors are reported in
>> +	"info/last_cmd_status".
>> +	Example::
>> +
>> +	  # mkdir ctrl1
>> +	  # echo "global_assign_ctrl_assign_mon_per_cpu:group=ctrl1//" \
>> +	         > info/kernel_mode
>> +
>> +	  # cat info/kernel_mode
>> +	  inherit_ctrl_and_mon
>> +	  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
>> +	  [global_assign_ctrl_assign_mon_per_cpu:group=ctrl1//]
>> +
>> +	  # echo "inherit_ctrl_and_mon" > info/kernel_mode
>> +	  # cat info/kernel_mode
>> +	  [inherit_ctrl_and_mon]
>> +	  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
>> +	  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
>> +
>>   Resource alloc and monitor groups
>>   =================================
>>   
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index c537846d9264..7b06c3b3f00e 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1059,7 +1059,8 @@ static_assert(ARRAY_SIZE(resctrl_mode_str) == RESCTRL_NUM_KERNEL_MODES);
>>    * @v: unused
>>    *
>>    * Displays one line per mode set in resctrl_kcfg.kmode. Bracket the active
>> - * policy (resctrl_kcfg.kmode_cur).
>> + * policy (resctrl_kcfg.kmode_cur). Square brackets are display-only; writes
>> + * to info/kernel_mode must not include them.
>>    *
>>    * INHERIT_CTRL_AND_MON is displayed as "[inherit_ctrl_and_mon]" when active
>>    * or "inherit_ctrl_and_mon" when supported but inactive, with no :group=
>> @@ -1068,7 +1069,7 @@ static_assert(ARRAY_SIZE(resctrl_mode_str) == RESCTRL_NUM_KERNEL_MODES);
>>    * Global-assign modes append :group=. An inactive mode is emitted as
>>    * "<mode>:group=uninitialized". An active mode with a bound group is emitted
>>    * as "[<mode>:group=<ctrl>/<mon>/]", where <ctrl>/<mon>/ is derived from
>> - * resctrl_kcfg.k_rdtgrp.
>> + * resctrl_kcfg.k_rdtgrp. The bracketed form is not accepted on write.
>>    *
>>    * Return: 0 on success, or -ENOENT on error.
>>    */
>> @@ -1164,6 +1165,8 @@ static void resctrl_kmode_files_set_visible(struct rdtgroup *rdtgrp, bool visibl
>>    * @kmode:	Kernel-mode policy currently active on @rdtgrp.
>>    *
>>    * Reset the kernel-mode binding on the CPUs in @rdtgrp's @kmode_cpu_mask.
>> + * Called from resctrl_kernel_mode_write() whenever an active global-assign
>> + * policy is replaced, including a mode change on the same group.
>>    */
>>   static void rdtgroup_config_kmode_reset(struct rdtgroup *rdtgrp,
>>   					enum resctrl_kernel_mode kmode)
>> @@ -1212,6 +1215,234 @@ static void rdtgroup_kmode_detach(struct rdtgroup *rdtgrp)
>>   	resctrl_kcfg.kmode_cur = INHERIT_CTRL_AND_MON;
>>   }
>>   
>> +/**
>> + * rdtgroup_config_kmode() - Push @rdtgrp's kernel CLOSID/RMID to hardware
>> + * @rdtgrp:	Resctrl group whose CLOSID/RMID should be programmed.
>> + * @kmode:	Kernel-mode policy to program for @rdtgrp.
>> + *
>> + * @rdtgrp carries the CLOSID/RMID to program. For monitor groups, the CLOSID
> 
> I just cannot get used to this writing. It is not coherent. It reads like text
> from several people were just concatenated into this series.

Will rewrite it.

> 
>> + * matches the parent control group while the RMID belongs to the monitor group.
>> + *
>> + * The caller (resctrl_kernel_mode_write()) is responsible for validating that
>> + * the (kmode, group type) pair is permitted before invoking this helper.
>> + * This helper records the current online CPUs in @rdtgrp->kmode_cpu_mask and
>> + * programs those CPUs with @rdtgrp's CLOSID/RMID.
> 
> Please do not describe the code in such detail - this detail can be seen from the
> code self. Please make the description high level. Please check whole series.

ok.

> 
>> + */
>> +static void rdtgroup_config_kmode(struct rdtgroup *rdtgrp, enum resctrl_kernel_mode kmode)
>> +{
>> +	bool assign_mon = (kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
>> +
>> +	/* A new binding starts with all currently online CPUs in scope. */
>> +	cpumask_copy(&rdtgrp->kmode_cpu_mask, cpu_online_mask);
>> +
>> +	resctrl_arch_configure_kmode(&rdtgrp->kmode_cpu_mask, rdtgrp->closid,
>> +				     rdtgrp->mon.rmid, assign_mon, true);
>> +
>> +	rdtgrp->kmode = true;
>> +	resctrl_kmode_files_set_visible(rdtgrp, true);
>> +}
>> +
>> +/**
>> + * rdtgroup_by_kmode_path() - Resolve a "<ctrl>/<mon>/" path to an rdtgroup
>> + * @ctrl_name:	Control-group name, or "" for the default control group.
>> + * @mon_name:	Monitor-group name, or "" to select the control group itself.
>> + *
>> + * Matches the path syntax emitted by resctrl_kernel_mode_show():
>> + *   "//"            - the default control group
>> + *   "<ctrl>//"      - control group @ctrl_name
>> + *   "/<mon>/"       - monitor group @mon_name under the default control group
>> + *   "<ctrl>/<mon>/" - monitor group @mon_name under control group @ctrl_name
>> + *
>> + * An empty @ctrl_name selects &rdtgroup_default. Otherwise @ctrl_name must
>> + * match an existing control group. If @mon_name is empty, the selected control
>> + * group is returned; otherwise @mon_name is looked up in the selected control
>> + * group's monitor children.
>> + *
>> + * Return: Pointer to the matching rdtgroup, or NULL if no such group exists.
>> + */
>> +static struct rdtgroup *rdtgroup_by_kmode_path(const char *ctrl_name,
>> +					       const char *mon_name)
>> +{
>> +	struct rdtgroup *rdtg, *parent = &rdtgroup_default;
>> +
>> +	if (*ctrl_name) {
>> +		parent = NULL;
>> +		list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
>> +			if (rdtg->type != RDTCTRL_GROUP)
>> +				continue;
> 
> All groups in rdt_all_groups are control groups, no?

Yes. I think so. Let me check that.

> 
>> +			if (!strcmp(rdt_kn_name(rdtg->kn), ctrl_name)) {
>> +				parent = rdtg;
>> +				break;
>> +			}
>> +		}
>> +	}
>> +	if (!parent)
>> +		return NULL;
>> +
>> +	if (!*mon_name)
>> +		return parent;
>> +
>> +	list_for_each_entry(rdtg, &parent->mon.crdtgrp_list, mon.crdtgrp_list)
>> +		if (!strcmp(rdt_kn_name(rdtg->kn), mon_name))
>> +			return rdtg;
>> +	return NULL;
>> +}
>> +
>> +/**
>> + * resctrl_kernel_mode_write() - Select kernel mode and bind group via info/kernel_mode
>> + * @of:		kernfs file handle.
>> + * @buf:	One line of the form "<mode>[:group=<ctrl>/<mon>/]"; must end
>> + *		with a newline. Do not include the square brackets used to mark
>> + *		the active mode in resctrl_kernel_mode_show(). Leading and trailing
>> + *		whitespace is ignored, as is whitespace between the mode name and
>> + *		an optional ":group=" suffix. The ":group=<spec>" suffix is
>> + *		optional; when omitted the default control group
>> + *		(&rdtgroup_default) is used.
>> + * @nbytes:	Length of @buf.
>> + * @off:	File offset (unused).
>> + *
>> + * Parses @buf, validates that <mode> is listed in resctrl_mode_str[] and is
>> + * supported by the platform (resctrl_kcfg.kmode), resolves <ctrl>/<mon>/ to
>> + * an existing rdtgroup (or picks &rdtgroup_default if no group was specified),
>> + * treats INHERIT as an unbound mode, tears down any active global-assign
>> + * binding via rdtgroup_config_kmode_reset(), programs hardware via
>> + * rdtgroup_config_kmode() when the new mode is not INHERIT_CTRL_AND_MON, and
>> + * on success updates resctrl_kcfg.k_rdtgrp and resctrl_kcfg.kmode_cur. The
>> + * display-only "group=uninitialized" form is rejected.  Errors are reported
>> + * in last_cmd_status.
> 
> This is just a summary of the code?

Let me update this. Let me convert it  to high level summary,

> 
>> + *
>> + * Return: @nbytes on success, negative errno with last_cmd_status set on error.
>> + */
>> +static ssize_t resctrl_kernel_mode_write(struct kernfs_open_file *of,
>> +					 char *buf, size_t nbytes, loff_t off)
>> +{
>> +	enum resctrl_kernel_mode mode;
>> +	char *mode_str, *group_str, *slash;
>> +	const char *ctrl_name, *mon_name;
> 
> (needs reverse fir)

Yes.

> 
>> +	struct rdtgroup *rdtgrp;
>> +	int ret = 0;
>> +
>> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
>> +		return -EINVAL;
> 
> function comment states: "negative errno with last_cmd_status set on error" yet here it
> returns negative errno without any update to last_cmd_status.
> Please see commit 242c0ab4d51d ("fs/resctrl: Change last_cmd_status custom during input parsing")

Sure.

> 
>> +	buf[nbytes - 1] = '\0';
>> +
>> +	/* Tolerate surrounding whitespace before mode parsing. */
>> +	buf = strim(buf);
>> +
>> +	/*
>> +	 * Split "<mode>:group=<spec>"; the ":group=<spec>" suffix is optional
>> +	 * and when omitted the default control group (&rdtgroup_default) is used.
>> +	 * Trim mode_str after the split so whitespace before ":group=" is ignored.
>> +	 * Square brackets from resctrl_kernel_mode_show() are not accepted.
>> +	 */
>> +	group_str = strstr(buf, ":group=");
>> +	if (group_str) {
>> +		*group_str = '\0';
>> +		group_str += strlen(":group=");
>> +	}
>> +	mode_str = strim(buf);
>> +
>> +	mutex_lock(&rdtgroup_mutex);
>> +	rdt_last_cmd_clear();
> 
> Needs info_kn_lock()/info_kn_unlock()

Sure.

> 
>> +
>> +	for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++)
>> +		if (!strcmp(mode_str, resctrl_mode_str[mode]))
>> +			break;
>> +
>> +	if (mode == RESCTRL_NUM_KERNEL_MODES) {
>> +		rdt_last_cmd_puts("Unknown kernel mode\n");
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +
>> +	if (!(test_bit(mode, &resctrl_kcfg.kmode))) {
>> +		rdt_last_cmd_puts("Kernel mode not available\n");
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +
>> +	/*
>> +	 * INHERIT mode binds no rdtgroup. Ignore any user-supplied :group=
>> +	 * suffix and let show print the mode without a group.
> 
> copy&paste?

Hmm.. Text seems correct here to me. Did I miss something?

All these code will change with new interface.

> 
>> +	 */
>> +	if (mode == INHERIT_CTRL_AND_MON) {
>> +		rdtgrp = NULL;
>> +		goto update_mode;
>> +	}
>> +
>> +	if (!group_str) {
>> +		/* No ":group=" suffix: fall back to the default control group. */
>> +		rdtgrp = &rdtgroup_default;
>> +	} else if (!strcmp(group_str, "uninitialized")) {
> 
> Why is this needed? Dropping this would just result in one of the group error messages
> that should be sufficient?

Yes. That is correct.

> 
>> +		/* Display-only placeholder emitted by show; not selectable. */
>> +		rdt_last_cmd_puts("Cannot bind to 'uninitialized' group\n");
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	} else {
>> +		/* Require exactly "<ctrl>/<mon>/" format */
>> +		slash = strchr(group_str, '/');
>> +		if (!slash) {
>> +			rdt_last_cmd_puts("Group must be <ctrl>/<mon>/\n");
>> +			ret = -EINVAL;
>> +			goto out_unlock;
>> +		}
>> +		*slash = '\0';
>> +		ctrl_name = group_str;
>> +		mon_name = slash + 1;
>> +		slash = strchr(mon_name, '/');
>> +		if (!slash || slash[1] != '\0') {
>> +			rdt_last_cmd_puts("Group must be <ctrl>/<mon>/\n");
>> +			ret = -EINVAL;
>> +			goto out_unlock;
>> +		}
>> +		*slash = '\0';
>> +
>> +		rdtgrp = rdtgroup_by_kmode_path(ctrl_name, mon_name);
>> +		if (!rdtgrp) {
>> +			rdt_last_cmd_puts("Group not found\n");
>> +			ret = -EINVAL;
>> +			goto out_unlock;
>> +		}
>> +	}
>> +
>> +	if (mode == GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU &&
>> +	    rdtgrp->type != RDTCTRL_GROUP) {
>> +		rdt_last_cmd_puts("global_assign_ctrl_inherit_mon_per_cpu requires a control group\n");
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +
>> +	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
>> +	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
> 
> Could it be more specific to just require here that the resource group is
> required to be shareable?
> 

Yes. Correct.


>> +		rdt_last_cmd_puts("Pseudo-locking in progress\n");
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +
>> +update_mode:
>> +	/* No-op if the same mode is already active on the same group. */
>> +	if (resctrl_kcfg.kmode_cur == mode && resctrl_kcfg.k_rdtgrp == rdtgrp)
>> +		goto out_unlock;
>> +
>> +	/*
>> +	 * Tear down any active global-assign binding before applying the new
>> +	 * policy, including when only the mode changes on the same group.
>> +	 */
>> +	if (resctrl_kcfg.kmode_cur != INHERIT_CTRL_AND_MON)
>> +		rdtgroup_config_kmode_reset(resctrl_kcfg.k_rdtgrp,
>> +					    resctrl_kcfg.kmode_cur);
>> +
>> +	if (mode != INHERIT_CTRL_AND_MON)
>> +		rdtgroup_config_kmode(rdtgrp, mode);
>> +
>> +	resctrl_kcfg.k_rdtgrp = rdtgrp;
>> +	resctrl_kcfg.kmode_cur = mode;
>> +
>> +out_unlock:
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	return ret ?: nbytes;
>> +}
>> +
>>   void *rdt_kn_parent_priv(struct kernfs_node *kn)
>>   {
>>   	/*
>> @@ -2117,9 +2348,10 @@ static struct rftype res_common_files[] = {
>>   	},
>>   	{
>>   		.name		= "kernel_mode",
>> -		.mode		= 0444,
>> +		.mode		= 0644,
>>   		.kf_ops		= &rdtgroup_kf_single_ops,
>>   		.seq_show	= resctrl_kernel_mode_show,
>> +		.write		= resctrl_kernel_mode_write,
>>   		.fflags		= RFTYPE_TOP_INFO,
>>   	},
>>   	{
> 
> Reinette
> 

