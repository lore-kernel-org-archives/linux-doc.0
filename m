Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012010.outbound.protection.outlook.com [40.93.195.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E55331EA5;
	Fri, 12 Jun 2026 17:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781286594; cv=fail; b=JdIWCKpLLRflCbT7cS8h8PPaEkumGhkLIoezHNc44htc46Qp1zabokTWTMAp0lpaFJRWOdWTSJaNNlH+N2qwuY0eF0KBXg8Mfa+31gsHb56EN0uU5JTN7K1dWQ1QkEkxHcWASy5tWqjua9IV2y2z8nGJreYT0txjYDrs/BFx2pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781286594; c=relaxed/simple;
	bh=AAwJNXagyEhR9UQYbUUZ1ckOZRRrj8Lc07frUzgdn2c=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Lp7n1uEwGjrZJYajJX8XK8N7aD1q0bJQqmpqLF1vlOOG2exEyX5W6hruUSKnlRdAnSPG0RNKUpVu1KnxdRwhIpHNmatZ5EH/ZAwAWtcFJrO46RUvsEnEu3h0yRcw/AnXiC5gUuOxSMxemOfqJmRqt7PiuEMewGvIrm3NJ1FISdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Y2Y+kg3W; arc=fail smtp.client-ip=40.93.195.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Y2Y+kg3W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frDO4kq96RYa3up06Mjt8zVzG8VPXbk/JmniI/HU3hW5UtYjiLcf/jHx9m2RfPVwXZT0ovEj5cwKWiDbJ31CzZNUIkm2VS6WTDcBotQPXMk5Q6ql0Z9B0ZUVSsNFRcMF5ONd6+QUI5hnqOd0BFmH2ItSCrc+DjPzqZas/TCwPbiBmKedvW98k1qK9EInd9COQ8IB2xjlMDbCPAYAVm+lDQIL4VdcsP10sAHbWub1VfwGVxuRVZ4kygG4O/GFII3a/OEasIBVi8Yzu5WlHZH3MeoTQ4vmkbiXjiU9xndf1fDMCIA8tsj0uNUCOo7U8/XeP3UfyUpgbOfD9EjPt6ZEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCeSJIGekPx4EaYfzqScdOyAc6NZuPZ3yM4sCMdLmBE=;
 b=NyvAps7de9VEpB59CkdPSnuhmnNYBGVffkZYbtKhm8iNi17te3XbzfOGwHcLMNGhYkOFz3ZbVrYoyq8GkxpIvaoQkKtGIfQ918kLkMZ+v285JJOQYnMLAcwsawmWnR48YWJsrM9SCV7k7h1q/71v1f/e+Q/ddsnmgeJGHxy/9SL1GjApyuZL6OPBhbpxvkBl9oL33zNTjEtz/LidPhA8mwbCSBjEFf4JQhMG+gt2ddtD97slyYd2+o4TUc51cjx8B2Rua/NSzRP1YpAXopffoSlfa9a5khDdZIqt0Ji7UxLSdtRoXUc3aGov+3BFx5df3l9QWknRbCX9E0+P/qYUiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCeSJIGekPx4EaYfzqScdOyAc6NZuPZ3yM4sCMdLmBE=;
 b=Y2Y+kg3WQb5+u1hPQ5AkKmODdZr17NuJwg+M25K3mFjTk6TJZTXXU2xTgfBwOndIJBPxYo9DHiCYaR8lX50kvGZeRM+p1kGcEL2CK46YUUG/d2cnvN9B8GIMEGPbVYofzVUpwQpAHoB5FKh8Eds7S9+BrVWkZ/l9s4vDF2zI0jU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by CYYPR12MB8752.namprd12.prod.outlook.com (2603:10b6:930:b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 17:49:49 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0113.014; Fri, 12 Jun 2026
 17:49:46 +0000
Message-ID: <f2c6ca56-6a21-473f-a7f8-3cfe6f409138@amd.com>
Date: Fri, 12 Jun 2026 12:49:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] x86/resctrl: Add data structures and definitions
 for PLZA configuration
From: "Moger, Babu" <bmoger@amd.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@kernel.org, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: skhan@linuxfoundation.org, x86@kernel.org, mingo@redhat.com,
 hpa@zytor.com, akpm@linux-foundation.org, rdunlap@infradead.org,
 pawan.kumar.gupta@linux.intel.com, feng.tang@linux.alibaba.com,
 dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
 lirongqing@baidu.com, paulmck@kernel.org, bhelgaas@google.com,
 seanjc@google.com, alexandre.chartre@oracle.com, yazen.ghannam@amd.com,
 peterz@infradead.org, chang.seok.bae@intel.com, kim.phillips@amd.com,
 xin@zytor.com, naveen@kernel.org, thomas.lendacky@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, eranian@google.com,
 peternewman@google.com
References: <cover.1777591496.git.babu.moger@amd.com>
 <e84fdbc324b312ff137d279ec154e3827c0aed81.1777591497.git.babu.moger@amd.com>
 <db9c0b3e-184c-4100-b59a-91f6e818fd31@intel.com>
 <190bf049-4928-411b-ab5c-30d39817f118@amd.com>
Content-Language: en-US
In-Reply-To: <190bf049-4928-411b-ab5c-30d39817f118@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0068.namprd04.prod.outlook.com
 (2603:10b6:806:121::13) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|CYYPR12MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: 889ea95f-344a-4a3a-cd58-08dec8aafdc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|3023799007|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vlQE0K2j+miVAhmxZN2v3o00hnPbfUekkc7MhTYlT9axrvLe9dX6y1KoiOszu6rDDNai43ptFfCGZvGhm6Bl4xKtZ3poszKeai796kgZci6ISJ1ixbAk2Y+RPUz1TvxqntrGETZM0bPUkBPFIFFFN4E/9xNMrkZNFb1+YKaHETUOPy32CPPJhbVtcTXv+zh28ULqisWQxITLWDKEjln1basMFXjUBNoTElwc0FdKFr4eX1/hVnqD2JYXJfA33xoHMpIZpxn9wt8hCJdonBRMSrHhnBO3w9px2GZknzxhcYa/0fUReg4tS9k5QGG4tsr4/iQMFeapIAzoqQ55WBALthsca82YOiqfFd5PDJPWKkJ3Q5L/HXM7oT5XysQYMw6YwI9BmcjeujhNrAuCFlvLjMYIEqt7c+XgOsHZ83xB9E+8uPL+OvCGiPVxlwf6nV5qs6kgvsUc29e7sevHB8FCUNEyY0AEeLaJufKAg0L5MpYHHbgBHHP04mzl/Jhlcqt3qExd8Zx1PEdy8OiagxnvnIR+5kVdfGDKYlEdqXk19RkPOTonw/YynIElaF+MCKIXrocGFSDpDvBgFGXJgYmQhtzn0E0JhVCqCzYPr6MP/SJc84PToqnsZcZLArpG5vRNExKB6ekRHAF3yOe8MCCNKMr+HX3m9iN0mS6AWWhApX4HkJU+WogNpcwrqkVC61SAXjJs3OYsVBho0Xwpex49Uw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(3023799007)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFFETTRaREt3d05UL3ZoMlBCamI0QTV5WXd1Mk1NZHVTRFFoQlZ2aVN2TlBL?=
 =?utf-8?B?U0lydEJSSnV5OFgxVUU4Y3BGSkUrNncrc1lrMTA1NmdVc2w5Z2E4OTVkbURk?=
 =?utf-8?B?Tjlka2FFUkMvVlFtYlZWMzMrT0w5aDBzaDA3ZkpMa04wcEg0YmtydTRtM2Yr?=
 =?utf-8?B?cUw0Zmh4UTRGSE1Md244Mkl4K1pkTWRtWWc3bW0ySUhYUElDZnVnbVZpRzJu?=
 =?utf-8?B?RkFseGtZMmhRdkVkQXdzY0E1OGswRStyVjNibjZxSjJVTm56VnBtRElWSERJ?=
 =?utf-8?B?UDBtQ1pITjZObmlHak1HUzcwM0h2cGUvS29Da1lDMFlOT1NRNXlnQ3RPeld3?=
 =?utf-8?B?M20wYUMrNWVqUGp5NWN3NzY5OFZXQTNpUHZORWNZb1RzSlpCb1VoN3hZbTNS?=
 =?utf-8?B?RDJWNExQYk1YMWFGL2RkNjBCWkI0QllDV2p5V0oxcFZNKzllRG0rbzB6M094?=
 =?utf-8?B?am92MmhRQ0pyWFFuMWN4QURsQzY3WSs3Z2RuWU1iQ0tEVkZKeUh2aFQvbTht?=
 =?utf-8?B?VUVpS0UyQ3hsalA3TXZqOFJEZmVITW9ZcGpEK24rbWNaMmpuK0VkdmdiRFF3?=
 =?utf-8?B?Q2d0R1hhWUdSWWFNSVVKcGd2QzFiaU5TRFl3cGw3dnM5TDdPSUp4SjhLOWFh?=
 =?utf-8?B?Vll3NEF4dDJNOXFMb2dFc3lUYzhMUCtMUDRLbEh5ZmY2T05nU2YxTjZLQUVH?=
 =?utf-8?B?T2hiVTlFYWdWRU1xdTRDeVNZck1RQVEwYUlqS3F4SSs2TW9ObDlVN2J1QzhD?=
 =?utf-8?B?djZ1VGdGc0ZITHphZjB1WFdUODZjNGpJSXRKcjlMOTZDTXhKNDNCZlZmbGZR?=
 =?utf-8?B?VTRTclVvYW1kTkg3bk1HcXI1S1NzVFZsaUk2T0Nad0hGZlFYeEVUcHhJT0U2?=
 =?utf-8?B?K05oY1lMK0x1dEMreFJxVDRhSm9PeStjTmlaeGJiM3BDZG41RU5ZZGRHUUxQ?=
 =?utf-8?B?b3lHKzIwRXczbTJvTjVJQmdVUGQ3WjRYeEtSaWJaaThKYjRMekQ1M3ZQa1Jq?=
 =?utf-8?B?TG02bVMxTUNMS3V0cUNNUmIzc0ZsRERkUXJsU0k3c3lUVmc2VDkwT1orM3VX?=
 =?utf-8?B?YWVDQStMVDJlK1dGZjVETmkvOFF0bkdpYTZOWnBlZldsK3ZwZXV5QXhDeDJm?=
 =?utf-8?B?Q0lrQlhOVlFRSWtmMnZMM1ZCRTh6eUJTSzUrMElNTHBkZ2FFR3A1aHV5aGxJ?=
 =?utf-8?B?SExycFg4VmY5REVldlNGTG5MR0V3TUM2QkJQYjhjRVFzamVRdVBjemlHV2o5?=
 =?utf-8?B?aVFSY04rT2E0Z3pHbFRLZlZHSHlIZ1VaeUxOT042N1duTDFFd0R1SVV5TUtk?=
 =?utf-8?B?SnBNTTNtcWpKZDFKNk1lQVZ6Y2dNTzhQZFU3ekcwcGd1M3BGT1g4dUFDa0FH?=
 =?utf-8?B?Z1ZxQkxCcENYM2ZQU1VvZ2ZsUXNVSGRVY2s4bmlWQzRKS2xJUlcvaFNJUWEr?=
 =?utf-8?B?cDVFRFhJd3MrZEowZk02ZlRJUEJNYTBock1QbVlFNldvelJnMWRxY0ZIOU4r?=
 =?utf-8?B?N3hJK2YzZkQrQVhCVW1uUExtVjE4S0x3dktXTnMrSTYzMVpLbTh4QjBSKzBS?=
 =?utf-8?B?YXdVMWhnUElnVlFlSXdsZm4wUlpSSk5sZ3hNNis5VFUwd2M4bWl1b0pjMnl2?=
 =?utf-8?B?YXQ5Wm5ITS9seU10OHlrN0g1cGlvQWhOelFaQ1hFNkl3TS9wVmNKTndBbDlJ?=
 =?utf-8?B?ekxDUVpGc045Z2dwajIzMTJPVXBtMXlsZ2I3ang0cTAwN1JyMkNnMlJPNlk1?=
 =?utf-8?B?SVYwcGlweFVxQy8zaEhYSVdRL3VJYy8ySUl5c2w4OEdxQUxXN2VseDY4VEFP?=
 =?utf-8?B?R3dUZkJvM25iQXBNNzdTTGhyNzZhdVpha2tXYit0ZllobWFaQTdXRkRYZTNB?=
 =?utf-8?B?V0RqTjlkYW14cTJXMXcrLzA1NjRQZ0J3bmJzRktoQUJwZ21xU0orZzZWOUFH?=
 =?utf-8?B?MTgvcTBwUFE3Z1ZqaEp3UnVhQnJwYzZ5eFAyTUZXVytIVHZxMjN2bm8ra0Zi?=
 =?utf-8?B?aUo3RXpyNGdpRmRrZklQN2hYd2M3QXN5Zzk4VTR0eThpVmFqU2l1UWk3VzRq?=
 =?utf-8?B?bnJZSERCQ0pKTXBCK1l3aFZ5dG5LK2JqVXkzdkU5NjVJdGRicDFCdXF2clpZ?=
 =?utf-8?B?L2pEZk5zWkxiQlFWOFpsTWxGbC9mU01TamN0WUtvc3owdWpweFpMQWV0SXBZ?=
 =?utf-8?B?N1BJTzZhU1FDQTNzV0c0cWpCM2RlRmwrN1ZpWUw3RW1CZlJHbXlrZ0gxZWl5?=
 =?utf-8?B?K1BlTFlxWlJFamlIcXFNb0w3UDBKTDJiNm9DZ0hPeVpsbHI5ZjlBVWZpYnBk?=
 =?utf-8?Q?BSLt4fJxDVqpcjWtiR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 889ea95f-344a-4a3a-cd58-08dec8aafdc3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 17:49:46.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owwc3s/qveKSnN8od16Zvg7TdN0DVXnpHLcJR7OuEfwGB4bE6alDIHZJVDMAXE2H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8752

Hi Reinette,

On 6/12/2026 12:32 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 6/11/2026 6:40 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/30/26 4:24 PM, Babu Moger wrote:
>>> Privilege Level Zero Association (PLZA) is configured per logical 
>>> processor
>>> via MSR_IA32_PQR_PLZA_ASSOC (0xc00003fc). Software must program RMID and
>>> CLOSID association fields and their enable bits using the layout defined
>>> for the MSR.
>>>
>>> Define MSR_IA32_PQR_PLZA_ASSOC and the RMID_EN, CLOSID_EN, and 
>>> PLZA_EN bit
>>> masks in asm/msr-index.h. Add union msr_pqr_plza_assoc in arch resctrl
>>> internal.h
>>
>> Above paragraph captures what can be seen from the patch. Please check 
>> entire
>> series for this since many changelogs in this series verbatim 
>> describes the code
>> changes in patch without helping reader understand why those changes 
>> are made.
>>
> 
> Sure. Will rewrite the changelog. And will check other patches also.
> 
>>
>>>
>>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>>> ---
>>
>>> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/ 
>>> msr-index.h
>>> index 9dc6b610e4e2..623628d3c643 100644
>>> --- a/arch/x86/include/asm/msr-index.h
>>> +++ b/arch/x86/include/asm/msr-index.h
>>> @@ -1287,10 +1287,17 @@
>>>   /* - AMD: */
>>>   #define MSR_IA32_MBA_BW_BASE        0xc0000200
>>>   #define MSR_IA32_SMBA_BW_BASE        0xc0000280
>>> +#define MSR_IA32_PQR_PLZA_ASSOC        0xc00003fc
>>>   #define MSR_IA32_L3_QOS_ABMC_CFG    0xc00003fd
>>>   #define MSR_IA32_L3_QOS_EXT_CFG        0xc00003ff
>>>   #define MSR_IA32_EVT_CFG_BASE        0xc0000400
>>> +/* Lower 32 bits of MSR_IA32_PQR_PLZA_ASSOC */
>>> +#define RMID_EN                BIT(31)
>>> +/* Upper 32 bits of MSR_IA32_PQR_PLZA_ASSOC */
>>> +#define CLOSID_EN            BIT(15)
>>> +#define PLZA_EN                BIT(31)
>>> +
>>
>> This is unexpected. So far resctrl has only defined the MSR numbers in 
>> this file, not
>> the individual fields. This seems a legitimate use of msr-index.h but 
>> creates inconsistency
>> with how the fields of the other resctrl registers are defined. This 
>> may be ok so I am
>> looking past this for now. Since I am not familiar with this use I am 
>> looking at other
>> patterns of this and it seems that the register fields are usually 
>> defined right after
>> the register to make this relationship clear and also use more verbose 
>> naming to establish
>> this relationship ... I do not think such cryptic names should be used 
>> without context
>> in such a global scope. Please compare with how other fields are 
>> defined at this scope.
> 
> Sure. Will use the names tony suggested.
> https://lore.kernel.org/lkml/ 
> SJ1PR11MB6083C069F99FAB8A0BEB8518FC182@SJ1PR11MB6083.namprd11.prod.outlook.com/
> 
> Also will moving the register "MSR_IA32_PQR_PLZA_ASSOC" together with 
> BIT definition. It will break the sorting order. Hope that is not a 
> problem.

Never mind. I don't need the bit definitions anymore. I don't need to 
move the register.

Thanks
Babu

