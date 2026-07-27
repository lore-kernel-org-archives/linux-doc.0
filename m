Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131123D525B;
	Mon, 27 Jul 2026 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183440; cv=fail; b=rlYPKrP0bZJs6DUFVssidrShyWMUvzrMR6n8pEoZk/38Y1M6aePKc+C4mwWkzRHysE2AxTj6qQPmfBXwoHxkehGdA4Ha1g+GhoThH4sXmEZjv6RoUaM2KDpgIcw5c8h2pzb5nPEDUQjdeTS0uG8StszqiVhzcffah2FzWkoVGIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183440; c=relaxed/simple;
	bh=iRnc2vSH/esJR6QVQAQZZ9gvn956vLv/mutshJ4uzHI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ULJVFfTEfE/zthwDuvWcN3rP8xkunoVPoJjXLC3J4CpNiVn6oDxGFjreAEDq4fu4ZJptWdfS3NifvMZRHCqLmP5NmsJbHSnG9hdSTH3s9lHIc5woqgb+pCIavehsrMZ28BBkGl9nf82JgGxekoN1mZAPB+Os0Fza8+6EaJfNm4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tID0WI6J; arc=fail smtp.client-ip=52.101.56.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tID0WI6J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfD2q28l6B3ih2YhwEqLaGB2xyc/6xhXy3vs7V5o3TaA+dcgbJexAwk4leiObOYSBcx8hNPVo4SYrehxaeYOjgufVHOXUn5f6N0Bj2kLEGQZP72yfSedupE/mQsRNUUDlbU5W1gW6Axv1eJbDz3p/IHEnYMJon/al0FyVpUKUHTWe9i/43siRVo0HoZY082sjx4X46UjaICi64UdI/hqot5PgGaZj6DwNnkXfA0dHrHxoQeLGSBAOc6CCjIBm4V3gIiowumA+m3/pAEkBcIZAlUUn+NsOnYxVcGRvMpUaOiLAwB//Bl2lOp3etMMbYRmM0gYfrGcT86//3nbzGbz2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YOLHzt/We0XnU7lOvH8DmAZcMhLRFy4Z24QKU/ZVkk=;
 b=ZL2JRs6HoQ5JiOEiUjkBR0keF3RwQ1sFMOMXoSotVgrnGH1fgVJJot5xThZGNv8qYyVLSK5ANv9jM5TRe4AC999y5l38NuOFP42wdsbsKAJZjhUZ5PAUNynrWqFMwGKgvzFTG85bvJ3v8xExcvJxVmWdqM0YTpyoHHrfpDXeVJNp5It+nrF66ZQBqhz+5hqew4Qyb8TDf8SvrjlDFOgNxO5l0uVMVKKbL4rHIDViu5ikQL4R/u3KX2zyMAkRS7jLZYYP4zw458hQODnH7cadqbMyHeaZsuqMOHV9bx8MOsfsYqJWC5zhCpszfQiMZm6V30NR0kJrVuMsuUvdgcgILQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YOLHzt/We0XnU7lOvH8DmAZcMhLRFy4Z24QKU/ZVkk=;
 b=tID0WI6JrosHguKbVLL+jDfzd0PpnMQf/As/FtkmPZy4S48kU3Kh/O5uEUMEwj8HsnFny9CbJ8UFDFA806iOlB2Q/TpjNpBmoxakGUYGZltSdMVQwAQwfS5UJ3I7FG4DJS/wzmVKZSqaA3zF0vKMJqKwUXFRPXG3h+xVZ2ZzBzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SA1PR12MB6773.namprd12.prod.outlook.com (2603:10b6:806:258::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 20:17:14 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 20:17:14 +0000
Message-ID: <5a8815ce-487c-4ec3-8c38-d9b3c067302f@amd.com>
Date: Mon, 27 Jul 2026 15:17:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Reinette Chatre <reinette.chatre@intel.com>,
 Borislav Petkov <bp@alien8.de>
Cc: "Moger, Babu" <bmoger@amd.com>, tony.luck@intel.com, x86@kernel.org,
 Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, eranian@google.com, peternewman@google.com
References: <b0dc49dc-ac35-457b-90c6-842a3cfcf8e1@amd.com>
 <f3fd774d-0662-4094-90b6-f0c5a4bc5d26@intel.com>
 <78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com>
 <dbbe2eac-bb0a-4655-9d0e-6e8feb702717@intel.com>
 <e77ef79c-5241-4f7c-b0af-dde6f131600a@amd.com>
 <bd739e7e-7a86-4291-9c08-f2c72bc2dc3e@intel.com>
 <48fef38f-8e2a-45e3-bb60-f293a1d60be8@amd.com>
 <c1979f4f-eabc-4d71-a711-ab465b9d9c1e@intel.com>
 <20260724231239.GAamPxZ2IZiFYRmAfg@fat_crate.local>
 <911ccf29-e152-4bf1-9773-04680bbe9638@intel.com>
 <20260727140539.GAamdls0q_W0zUmhqw@fat_crate.local>
 <119188c4-1127-4155-9a05-dff47e25be85@intel.com>
 <7469f2ae-10ed-4b30-a8c3-9d786c99c746@amd.com>
 <d2c4e17c-2aa3-43a6-980f-ab4bac769852@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <d2c4e17c-2aa3-43a6-980f-ab4bac769852@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:806:20::11) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SA1PR12MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb2063e-6b3e-4dca-4f8f-08deec1c0c25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|13003099007|6133799003|56012099006|11063799006|5023799004|4143699003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jdU4GnDIydIW5C4aG/nEndJfPOUY5Zt+N/AqQ9qJyox/W+YJ6XJWR9mBTqn22I3v8gW88AAXSkA78G8iOjR/85hmST1+hGvKaXsfGj/0hbQQ02VJkUGNTa401GrNhwLi1Xfo6hW6ujb+EsZZ1r4c+4WVUNd7QdkvTBz5oN2zEyedTCv12fQN98ND6UBvIllBsA2o5EREDs03fJilu6KD6pIC/KQwspwPrWXXR1Duj2V5gwrsFS7SpQn+dlHXqfs6n12mdg5th7Gv+bsqDoT7De7fJLh/uIdkELDcWE99vbjSbQVJZNiCoi6dq8u87Q6YjamWodBEwKmLVe4QwOtE73xT5jTo4D6ZuagzrTRoAw12EFt6hJ+2k0AhXbkAASR7a2e83Exk1ML7RZN5hRaQY8kAKzRKHCxGlWie5NeQoKFO1rmaQdo1xHtNZBMQrZRyIpgyWzWJ6PEt61DmqgSPPDXa0E9Jdo8/Z/eR8LFvEFAU+RQrZQdhIdHwmOOeq09Vai+GBKL14SJzeMhaliMVskoZb5/rZSU0f4r1LqDXfGb8B65xRyYXjqC8quCu8sU90SxPuJErhCOheXeHyjTy+QSasZVoym6TjLQX5ezhMx245o07o/qpeAQ2mLeXi9dsaGdEQJ2//o1GZWRE2glixG0+gVJpXH1VOX40IXXKVtk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(13003099007)(6133799003)(56012099006)(11063799006)(5023799004)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0dQeGlFaWVnRlZYTnNLQmkrbXFBaXJrMjNuVjJrT1ZBUWQ5U2pxQUpvR2o1?=
 =?utf-8?B?QlZQZm1ENWtBcjBkbnNacmhKeHp2NXZpamJiNjZUclFXdnUxaisxQkhkd1Rx?=
 =?utf-8?B?Ym1PRkxZQzNROC9kd0ZRc1hYdHFzQ1Z5QjFGcDhjOUp0ZTBRV1dlbFlITWYr?=
 =?utf-8?B?Q1JSeXEwajEzWDV3M1dYV3NLYzY1ajhUOFlDNE1NcHV3UlNOMUo3YTcwbkhv?=
 =?utf-8?B?M0NGSDdiaFE1VzFFc21JcndJNEc3akdMQnZiWE9JUXgxbmxFMHhIQU1hQi9j?=
 =?utf-8?B?NGwydXVpZzFCK0FIQmZUbHFBcEdWQ0R4eUR2bFdaQnh0RHhVVlZGYzB1TDhv?=
 =?utf-8?B?MHM0NXhYRU1KbEZ6UzBMbkpScDlWVHl1ODR5dG4xeXVxYlcyeFhJeGgxNlFP?=
 =?utf-8?B?di8vNnF4ZFlLSENYL29zQ3d1TnlqT0FoSDNkd1BORmRpZy8zZVA1NnN4a2dH?=
 =?utf-8?B?NXpXbFU5UmloUnRaRDZveElxTVB5aWNBSStRUGlHdGhHT2Q3bEswb1pCN2c3?=
 =?utf-8?B?UG56UWZFenZ4T243d0pDcitzbVlpRlh6d1U5clE2V2d1dGx4bEVYVlpHRnhR?=
 =?utf-8?B?WG15aGh5cnJnR3ZTbUt5ekRvbk1Rdkx2VTVEYzlSRjc3R2RMUW5JS1Y5S2NX?=
 =?utf-8?B?aGExM3VGcHArS1drQnlJSm5uRXdxdWVBaStNb2NSSmJGZHRLMHZScDY0K2dP?=
 =?utf-8?B?eFZIYUNJNy9pRjh3SjNIaE1KMDBlZmhzRkZyRlN3T0RaQnlUSHBtMCtPakhT?=
 =?utf-8?B?V29KZy9ZT0JPazdKa3RmcWZUcm9LNEZEdU82ZmVYREpDL0IxaWNzMUdLaldr?=
 =?utf-8?B?aU9aaERLcVJ1Q3lKdlhqbnhadDhZQVdIcyt6RVBUZnJvS01vdXBEQ0pCK294?=
 =?utf-8?B?eG9MMXRKb2Y2RXFuNFZKUXNwMDBnbWRZSVFHYmNCcU1kWlZFL3I5bXdkWGt0?=
 =?utf-8?B?cS9CQ2trN2JkaG53VjJEaWpabGd4dFFZNXBycCs2VnJsMElob3phYWwvRHRE?=
 =?utf-8?B?bkRkVHhFNkp3MHhDOW85VGg2cVA0OEk2N3lwbWxnQmdSNDYwZXhvN3Q2L2pO?=
 =?utf-8?B?QkNKdzRmaTRXRE9hbkYrME5RQm1oT0p2SjQyM0M4OTdJKzljSW1BK3VXeUpj?=
 =?utf-8?B?NG0yTE5vdlNpbWlNbndTYkUxSS9HSldUVGhFL2ZXYnAxaHZYb1JNL1JLQzdy?=
 =?utf-8?B?ZDVTWmM0L000d3hiVHY4SytBNTJHVGtJazJ2RVptOEZRU0E3cWwzM0VMaVJD?=
 =?utf-8?B?enp2Z3lvY0R3NlRBV1RWSDdpSGpoa0JEbHhLZHk1NXBqSGVRamlGdDhyQ2d3?=
 =?utf-8?B?YjF4NFh0QUdzazcyaGl4c0pya1J1WW1mRTNuWlJTbml2VFJlc08vekRIdG5k?=
 =?utf-8?B?VXRLbHJnalYwSnNUQldZbHlwY2JVbGtYY2J3cEYyZzVHMWRtM1NpK0xqaHFY?=
 =?utf-8?B?U3gyRGovTDNmRlNiY25YN3p4RzRuZVc2L3hyUFpWSHdDa1lIekZ0cEdxYUto?=
 =?utf-8?B?azJFcnhTbTlyUnJ4c1FwTjE3YmRNOHJZdWdudDkvRUROOVhRVTl2NVZlL3FP?=
 =?utf-8?B?N1BBNVBTd01RRXQxd3VqU0h6SmhhQms3bUc5dUpXcUlWQ1pjeDZmTTg3VHNt?=
 =?utf-8?B?Y2pTMVNyVlNsdkVhcDc5WDI4NEJXTnNkbzRkNENyNWRvcGJhVUxqWE5NaGoy?=
 =?utf-8?B?dXhqbG9ZQU5XMkZGUDVTM2VrdXBBNWY4MTRGN2ZkUGc5dDhYK3ZlaHkyL1BK?=
 =?utf-8?B?ZEJLQjZZbm5XMHJ6aG9VcmhKWEhCdDZWU29XOTJtWWNPdXhoUFJiZWpJMWVG?=
 =?utf-8?B?ZDRuLzRFck04OVR5UzlvdG9IT0U0V084bkprVVMrL2FyZWRTYXY5a2FDQ2pr?=
 =?utf-8?B?YjZIM1Rxa0F5TDZTR1d1eENweXhHZWhZZjlldVoxOFN4VlVuU0NycHZMMkli?=
 =?utf-8?B?SkthL252ZWpvNzYxUWRlQ2p5VnF4WS9qVWhMMmVnUXBQakV2ai9IVnY0OXZQ?=
 =?utf-8?B?SW9EY0JWdmU1d1Ryeklob1d1OUk3Y1dYUEU1S2FORHRoOEoxTG9FcHZKU0gw?=
 =?utf-8?B?WVZCZ3YwRFhyZWRIRjVReE5CVGxySUk2N0pYZit2SFh6Y1lyWldjdGxZRDNZ?=
 =?utf-8?B?dUhsbS8zaHlldDdHMW1kbXh3aXdsMHoycGFxUFhOT3lTTVdEam52em5yWFZX?=
 =?utf-8?B?L29hMjZJUytsS0o0eHFzemNkSjR0TDR4TTJSODh2dVR6MWJZZzI5Skw2VlYw?=
 =?utf-8?B?RGpvc0IvN0c1a3FCSFNySkk2eDJUY3N4RU5lcjlkNHZ0ZXdFOXBkdXhtQkZG?=
 =?utf-8?Q?6W3OJhSZwXZpaDCEHJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb2063e-6b3e-4dca-4f8f-08deec1c0c25
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 20:17:14.1899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wk0Wcp5YXqI4B6QwZ2eEmgZ9NHEvvVp3iodBZlyZqMPTLcEoSSGgi4PB/uu62lP1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6773

Hi Reinette,

On 7/27/26 13:12, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/27/26 10:24 AM, Babu Moger wrote:
>> On 7/27/26 10:25, Reinette Chatre wrote:
>>> On 7/27/26 7:05 AM, Borislav Petkov wrote:
>>>> On Fri, Jul 24, 2026 at 04:53:26PM -0700, Reinette Chatre wrote:
>>>>> One clarification here is that as I understand there has not yet been
>>>>> an actual user complaint. At least not that the pqos utility mentioned in
>>>>> this thread is aware of. Instead I struggle with the speculation about possible
>>>>> user complaints with different interpretations on how this change could be
>>>>> perceived by users.
>>>>
>>>> Sure, but don't you think that it is enough that we know about it?
>>>
>>> Only if we are sure that we have the complete picture. I do not believe we do, yet.
>>
>> We already have an issue open for this, and it is fairly
>> straightforward to reproduce. Please let me know if there is
>> anything specific you would like me to try.
> 
> Just to be clear, when you refer to issue it means that pqos is returning zero for
> unassigned counters?

Yes.

> 
> Is this issue public? I am not seeing any related issues in
> https://github.com/intel/intel-cmt-cat/issues

Opened one:
[1] https://github.com/intel/intel-cmt-cat/issues/311


> 
>>   >
>>> I connected with the friendly pqos folks on this issue. They subsequently did an audit of
>>> the tool to understand how it may behave under the different scenarios. They found that
>>> the tool currently parses text return values ("Unavailable", "Unassigned") as zero.
>>> This could cause incorrect behavior. (more below)
>>>
>>>>
>>>> I mean, the pqos tool shows 0.0 in the MBL/MBR columns now.
>>>>
>>>> And is the
>>>>
>>>>     pqos -m all:[0-191]
>>>>
>>>> invocation not something people would usually run?
>>>
>>> ABMC enabled (mode claimed to be incompatible with pqos)
>>> --------------------------------------------------------
>>> This example is from Babu's email that highlights that when ABMC is enabled this returns
>>> zero as bandwidth from pqos perspective. This matches the pqos audit that found with text return
>>> states, like the "Unassigned" happening underneath the output above, the return value is zero. When
>>> the counters are not assigned then the events will always return "Unassigned" (until reassigned)
>>> so having it return zero all the time may not cause issues. Once reassigned the event value
>>> will always return a valid value (no text return values).
>>>
>>> ABMC disabled (mode claimed to be compatible with pqos)
>>> -------------------------------------------------------
>>> Without ABMC there are scenarios when events may return "Unavailable". These scenarios vary
>>> based on how many monitor groups are created and the workloads run. I am not able to test this
>>> but when I attempt to combine what I know about AMD bandwidth monitoring with the results from
>>> the pqos audit I am concerned that there may be a problem.
>>>
>>> Consider a scenario where an event may return "Unavailable", for example:
>>>
>>> <return A>, <return "Unavailable">, <return B (larger than A)>, <return "Unavailable">, ...
>>>
>>> pqos will see:
>>> A, 0, B, 0, ...
>>>
>>> The "pqos -m" usage attempts to determine the bandwidth rate and, for example, when going from
>>> "A" to "0" it will be considered counter wraparound that would appear as a very large and
>>> wrong bandwidth number.
>>
>> Yes. Agree.  This is known issue.
> 
> Has this been reported? I do not recognize it in https://github.com/intel/intel-cmt-cat/issues
> and the pqos folks I spoke with was not aware of this behavior.

I was not able to recreate this issue. I just opened for the one I have 
seen [1].

> 
>>> Question to Babu
>>> ----------------
>>> Do you perhaps have a test/workloads that, under "default" counter assignment mode, can create
>>> many monitor groups (more than 64) and cause "Unavailable" to be returned frequently? Would it
>>> be possible to put pqos through its paces in this environment?
>>
>> Yes, I tried to reproduce the "Unavailable" issue with the pqos tool.
>>
>> So far, I have not been able to observe the issue. I created 64
>> monitoring groups, ran MLC, and simultaneously executed pqos.
> 
> If I understand correctly 64 monitor groups will still have enough underlying hardware counters
> and always return event counts, never return "Unavailable". It is when the number of
> monitor groups are 65 or more that the hardware counters will start to be re-assigned, no?

Yes. I created 64 monitoring groups and then ran pqos, which creates an 
additional 15 monitoring groups.


> 
> Even so, I do not know if 65 would easily trigger the issue ... sounds like it is possible to create
> many more (4096) monitor groups on these systems so there appears to be some room to make it easier to
> create scenario where "Unavailable" is returned.
> 
> On a higher level: could you please run the test that can expose pqos to environment where it will
> encounter "Unavailable" and observe how that is handled?

I was able to reproduce the condition where the hardware reports 
"Unavailable" for some of the MBM counters.

#cat /sys/fs/resctrl/mon_groups/dir*/mon_data/mon_L3_00/mbm_*
Unavailable
Unavailable
Unavailable
Unavailable
Unavailable
Unavailable

However, the pqos tool continues to operate normally and reports valid 
bandwidth values:
#sudo pqos -m all:[0-191]

     CORE         IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
    0-191        2.55      55146k     74496.0        20.0        61.4

> 
>>
>> The issue has not reproduced in any of my tests so far.
> 
> I'm confused. It reads like the issue that you mention earlier is a known issue cannot be
> reproduced.

I meant that the pqos tool continued to work as expected even after I 
recreated the condition that caused the hardware to report "Unavailable".


> 
>> This might require specific test scenario to recreate.
> 
> Right.
> 
>>> Of course, "AMBC disabled" scenario also includes AMD systems before ABMC was introduced. I do
>>> not know why the issue with "Unavailable" handling (text returns in general) has not been reported
>>> until now. I assume the pqos team may do most testing on Intel systems that do not return text.
>>> ...
> 
>>>>> The patch notes mention that this change is planned to be reverted at some
>>>>> point in the future and I have not heard of any changes to this plan.
>>>>
>>>> Where does it say that? I don't see that aspect.
>>>
>>> For convenience, copy of patch notes from original commit [1] is below:
>>>
>>>      There are plans to enable "mbm_event" by default once additional counters
>>>      are available. For now, keep the default mode to maintain compatibility
>>>      with existing tools.
>>
>>
>> I added the text below in the comments section (after ---).
>>
>> On second thought, that was probably my mistake, and I don't think I
>> should have added it. I also don't see this happening anytime soon.
> 
> ok.
> 
>>
>> Considering all of this, I believe it would make sense to make the
>> "default" mode the preferred mode.
> The original problem statement is that pqos is not able to handle "Unassigned" return values
> that will be encountered when "assignable counter mode" is enabled.
> 
> The request is to disable "assignable counter mode" by default to address the problem
> when handling "Unassigned" counters.
> 
> Disabling "assignable counter mode" will under certain circumstances cause "Unavailable" to
> be returned on event read.
> 
> At this time there seems to be a mismatch in understanding how pqos can handle
> "Unavailable" return values. For me to sign off on this patch I would like to fully understand
> the risk doing so. Could you please confirm from your side that pqos can handle all scenarios of
> the mode that you request to be the default mode?
> 

I created the maximum number of monitoring groups supported by the 
system and was able to reproduce the condition where the hardware 
reports "Unavailable". Even under those conditions, the pqos tool 
appeared to function correctly and continued to report valid results.

It's worth keeping in mind that ABMC mode is not available on the 
majority of hardware currently accessible to public.

Furthermore, default mode has been the longstanding behavior in deployed 
systems. Moving back to the default mode is therefore not a new change, 
but a return to the behavior that users are already familiar with.

Thanks,
Babu

