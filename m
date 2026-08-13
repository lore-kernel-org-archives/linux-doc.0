Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011067.outbound.protection.outlook.com [52.101.62.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D9C41D124;
	Thu, 13 Aug 2026 15:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635574; cv=fail; b=qrYcUlOhgMyeUkxN0J2JGnqJ8Rdx60FcWyK+A0mWf4PUJPIwzp58aCyIp/F41AXHGZ+mEg5H0A8MeBkb0bnRRtAHYMvfVs0rWwVhEjrTjvwzzgzNi+rpGEDiTvgeFI9nU8k+dmgG0ptfEPBW/2sFXNsIKYWj95Rs5nFXHLREe+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635574; c=relaxed/simple;
	bh=AhjwxWzxOm0pplxsWqVso98my9JCCyzx+5HsU+5eOLg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P3cFSdKIF17fwBfxglgoP2GBXmA9W94Dw0NoO87yyYWMhl4kbHRNnTYtUQRtvPutwpob4VccAdh+E1cxNOd3l/VICQrkwE4wfjrRktawu4U5DEQni+FpH8IAaV/Jbrt+97YXyCvLljDPjvIHoVbusL0bpfaoX71zegAMPrNYiTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iUWP5zOY; arc=fail smtp.client-ip=52.101.62.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iUWP5zOY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3HSPTlxNCXJ/mbRBm7e0W57VfjmvknNgHzsiE30atH6lsPs4JTIqVhnESgwKJRdqfQn36X6qqMAOxWJ2SljaJm6wGCm+B8i8J9aS4m7obK3FfFBKog0kjSh3S/skQYauYL9559MCrdY9gLcI1IcQ1XXZj/HG0suHR/fVziZCb/ZdPHJwrsIe760EQro+ltVZOcL2rr1QunmPOu/Z6Nm4/V/WgSBkMr/F4wo+H+YrGjuMZ9WHzxL8cj1XfGnIXY0oZQ+DRP8JGLDUGz4eY9AOnlra5WGXpfzbqxW8c9K9GhORBMZlesUQbaRMv0EmdW15b4nRUj43wnh8fOTKD2WeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60K4aif5i5ehIB2u5iyJicT5FsgKzbRGmSu/d8ogBHc=;
 b=tCibwkIvatjBWWwqylwjI+Cv2vBTEqgn5mGTcI892N3ewWOnBuihQFqzi8aG8E40DXQEZFmDBcG2hNxB14O5Vdck/qgE+Z9Q5naJFnHDs7EX3SgUb8jUEyYHh9yLnDiu73XcU6JHvnU0xNwlDhXLSMbs75oLfcO2FV0iuafjWfIFIiviiaB/IIrbRetkada7UWLGWHolqRpezOOS//3BastmuFCTdsLC+8ioN+rHXaL7+Ml1j1B09jlGFyUaSlQLvP8p/2MnwgcXy0ytMYWYTALztF4FoFkcWdZnTkwy1yrFxZTSt0T92zwptUSSBBmHiv3S5wwbCFRAs2+FodWYAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60K4aif5i5ehIB2u5iyJicT5FsgKzbRGmSu/d8ogBHc=;
 b=iUWP5zOYjCa7xqso37LNd7rSyOi5tyIPy4fSG0lEUyN2IhXdHg4PjiB8xqsqTVn1++rHMOFwP9pRSlYWtluCTCxCh8K5o9X/h7SCD19ka/UgRO/TXHEfW49ms2mvwhEYMZWwng90rdYPI96cWQhC5Rb53MoMWLdjLvUelubh1QA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SA1PR12MB9516.namprd12.prod.outlook.com (2603:10b6:806:45b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 15:39:12 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 15:39:12 +0000
Message-ID: <7f0e9b5f-993a-4ece-a294-d38f96f11149@amd.com>
Date: Thu, 13 Aug 2026 10:39:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 05/15] x86,fs/resctrl: Introduce architecture
 hooks to program kernel-mode
To: Reinette Chatre <reinette.chatre@intel.com>, "Moger, Babu"
 <bmoger@amd.com>, corbet@lwn.net, tony.luck@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, tglx@kernel.org, bp@alien8.de, ben.horgan@arm.com,
 fenghuay@nvidia.com
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
 <34a5119a28e102b8d6a0d0cfc3623fb0813a11f7.1783461016.git.babu.moger@amd.com>
 <0764a430-f64a-4655-a44f-5c2ff15f2ed7@intel.com>
 <d0a0ffd1-c759-4c3d-be09-f1d49ead29e5@amd.com>
 <99d40aab-2428-4f17-8398-2fec92a2ca44@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <99d40aab-2428-4f17-8398-2fec92a2ca44@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::18) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SA1PR12MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: dc612568-ad1b-473b-42f6-08def95105e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|22082099003|18002099003|56012099006|10067099003|11063799006|4143699003|921020;
X-Microsoft-Antispam-Message-Info:
	wKUA2IK2yxsYuzLc2QS4mpwXDxuO3qZ0H45L/rvSN+oNmvDVcrdwN/AEsJGeW46YZILlr/lNNUsIkAUTf2NE/VARCO7h06Ovm5nqm1ZTElmzn6OXQJNowoECP56Y19Eh+YwYT0PzbNoE5LFaIzdtAWhKSoXUtKpjmpOMuELtSqA3CEGki0lylPrC5PAlUVxyXAp12unWB4EMPnkKs3A9lMAtaxbclspLN+zt1HBKzHPRMgN9U/R85mLrzYP0twDs5c4v7hEUHLhWKxrRO5q5rAe++YSz6dRr/HfiLC0fWgIJjchmZAJMqQEQVmitPuxSCyIg+bw/vd2HoHZEwESXQWYRD/kYlJWSY7aaB/nEjNHvQWSRtmdwKDksYqTlKy17NToe3EAicFskkbU9jnTqsLH1QiJ8Ib2vNFxnaEqzckFMhpaXI/CxZ3zsiXv6dre93rZK6hmldds2ME9gs/MAYilIiX7zvKXYaY7A6aBrHYJYOczTyL3rUfAyXNv/6/0O98SNHbfx/sU1rD+g+Y8O/kPw4K16io/6ptlxxazNdupK1/J9LXUAz5feHOb7KDSAlsQrmTqFlpwE3Tl2kCIYBedEWuGthLuPNvbocGfEqC/sFwzEPfc6RBty/1up+Tv2b9NVv+sWBxs+udacxk+L/mPIy55SOruAyMe8/mUWlJYcIgkTHF1agEs5iG4Vc+334lbWoQIUEMzzDNhhBQt3ng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(4143699003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlNWU0h2T2RrTmVBcDUyWmpwc1F5NjhOQ3hjSXFVWXYxZnUzUFloUlVRamtM?=
 =?utf-8?B?K2JxdXU0NUxHNDM3K05xbExsMGcvN0lXVmpyUjFRdFNLR053WjExVHdDTU1G?=
 =?utf-8?B?YzErS3NOR2dNTWJTdnhKVGNGR2lxZjJXRGtqUjlRN3MvZnR5ZjhzUDBueGhS?=
 =?utf-8?B?N2JvL1o4bmhtdHFZeFRhUkdrY0hGZEJYTFMxYTF2UCtWNFJWTW9zMzJQaUQ2?=
 =?utf-8?B?ZWF6Y0RUVUxBWjhvNEhnQWw0bW5EL0c3YTVVTXorZW1RUmJnaTNuajdmR3kx?=
 =?utf-8?B?U1FhU2NORW8yRlphblNNSzdBclFKcVVEeGZpdGpxcWhXQnVoa0RmVW52WTUr?=
 =?utf-8?B?MVJrVTRzV29RNjRiQzlDMEtTQkNydkdxQWF6SU5mMFVqbGdwRVY1cFN3THI5?=
 =?utf-8?B?bDRpR3l0Mko0QUdEMWp2ZXBwcTBXRzc3V0NiZDBTVnZxVGZMS0U4bGdrTi83?=
 =?utf-8?B?YVFmZklNRmRKTW9kZFhneDFGWnI4czV4SEpia2U1eEd3dXRtSVl3UWJqRVl2?=
 =?utf-8?B?aFNXNU1Ja0w3Y3ZncE11UmJEWUwySWNYMkdvVGVDV0RlcmNEaVM4UWVUeHlJ?=
 =?utf-8?B?Vm5qMjNvTkx0WDRTRzFmQ002YUx6Q2tteE1RYkl0K3g5bFdNSmlvYzcyVzJB?=
 =?utf-8?B?dFhpQWpreVZDNlFxWVhiMEhtNGZ1ako1TTU1dXRhMHNLUElyOTNFSHJOSFkv?=
 =?utf-8?B?dWh4bHBxUlVJenA0M1ArSVdWa3Y3aUd5ZkxRN0RRc01JSG5qQUR5bFJBUDRy?=
 =?utf-8?B?WGFRNk9wemdEYXZuZEhLTjRwK2ZMY1NBdjZsTERkSHE1cDVvdkE0WXZLaFZG?=
 =?utf-8?B?MFRSNUF1UHBEdjB4eDVpMHBtNWozbmd2Slc3dFdrYWRpYW8yd3BuTUFsOE8w?=
 =?utf-8?B?MGRXRFVYYUtOWjlKK1hsVkpBRmpudEE3YTVrWXFUVVN1dE1ncGNnSk1lQ3Ry?=
 =?utf-8?B?elMvaFNnWWgyYm0xc2R6UFJrSFVSTzdESFlOSm9mYk1xYlBLajh1WmtQOHBu?=
 =?utf-8?B?RkxzMjNIK2haczVmN3NIejNQNTRDVk1YTExkbGUxaWdNV2lnR1ZId1JPNEdw?=
 =?utf-8?B?a0R5a2lPaCtLaFZ0MURHR1dDVmswL0pENEZQWThmTzV0K0p5ZUh0SEV5ZDZM?=
 =?utf-8?B?QXhpcEp1MUtpR1VlZkQ2UTJ5bDkzaEY1TW1La1pacWZHWkMwZ3dONzNjZURo?=
 =?utf-8?B?c1lEL0dNR0FzWHM0RjF6NUM4bWRQdnIvOTBVaWFhM0V5bzBpR2N0NkpDY3R4?=
 =?utf-8?B?ZVRpbldnalpLWmNYWkVZSGlUUTdtQ3F3N3FTYTQybndXbERpWG90d2NXbzdU?=
 =?utf-8?B?MEUrOXprSDRrZ2x4OWJkZXRDWHVCQ3BBQzBUVHJJaVhLZjlvVWJTanFzTGFa?=
 =?utf-8?B?cHFEUDRRenRVV2U3bi9kMXYxNFFLQWxCUFVxQ1Y0a2RQU0djQzBHUnRCRm5O?=
 =?utf-8?B?UHlqSTY1eXVHL3QyR2hrK1FYd0JaT2xSZDlZREJhcHQ0bzVIemU4Szg4Lzg1?=
 =?utf-8?B?c3QrOUhtVGM2aWVxZkxtTjJsaVduQ1V6VVo0THRLYUlST3ZpeDBMZDNJMzdS?=
 =?utf-8?B?eitzVXVoSlA0QVpwdHVTbTc3V2tmb0pEdUpzOUVpUU1GMVdBZ1ZBWHhWWmJl?=
 =?utf-8?B?TGJWRkwxSkZ6NEdHUGRtTnB2Sk53N0RtTWhCZzhEMkJJb2V5Yll6RjRCZnJS?=
 =?utf-8?B?b3dhVGtzaW5BZWlUYitKVG5FR1RLaTBRWmJ1eHFmc0tXLzNUandDZWRTdUdW?=
 =?utf-8?B?YWRreGNXQnNBRjdoUTVzbVU0WXp4TEc0bXVVN1pRZ09peUJpMmsrTm9XZHgz?=
 =?utf-8?B?NXJrWXZtQ1dtR3pFYk5LZnR2OGVFeUgwV2FxMHBqYk1OamRGLzhlSFFUOFlD?=
 =?utf-8?B?YUtnZUg0VzNKYjlDRWlkTG9qZmV3Wnd4Y0ZTc2ZCUWpzWHBTK0ZBelpsUFFW?=
 =?utf-8?B?TzdtU1dUcCs1NVpQOFNKV3FWeXpIZFVlL1VHTXNGV2JvR0EzNnpUbWphVFd2?=
 =?utf-8?B?bS9yYjhqcURZRG5KZ2cvMFJWN3A0TjI4dldzUm1PcGdJaHhBRUdCRW0rcnJU?=
 =?utf-8?B?cGh2TEVQQXBFQVRvTnR6SkMyUDBxb0c4T0Q3dW5KK2dIVkJUY0RRYkkxdFNN?=
 =?utf-8?B?M1ZFWlY3UEhSejJFcm9YV2RBZS9IVXhScWp0SUVlbGVSRmN4M3h4b0N2dVh5?=
 =?utf-8?B?NjIrWklZbGgySHJXTHp3RnpQeFlBdXJqa3l2bG9OczhBMi9wak9Xam0vQUcw?=
 =?utf-8?B?SHhsU1hBRnFzSnRnTFAzZklrZUwreHBhYXFJeDNWdHhsaXkrL2FhWlUzek9F?=
 =?utf-8?Q?KfqwDC16jIJhEk/ugN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc612568-ad1b-473b-42f6-08def95105e4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 15:39:12.1623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1GFKw+zKQu9f+7WktnE3zi+y+JUAMZBGld2mJek0hHF+D84IWpd6V1GoZ7gb0QH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9516

Hi Reinette,

On 8/12/26 18:34, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/12/26 3:11 PM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 8/10/2026 10:14 PM, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 7/7/26 2:50 PM, Babu Moger wrote:
>>>> Kernel-mode policies defined by enum resctrl_kernel_mode must be applied to
>>>
>>> "Kernel-mode policies" -> "Kernel modes"?
>>
>> Ack.
>>>
>>>> each affected CPU whenever a policy is selected or its scope changes.
>>>
>>> What is an "affected CPU"?
>>>
>>
>> Kernel mode policies defined by enum resctrl_kernel_mode must be
>> applied to each CPU whenever user space changes the kernel mode or
>> modifies the CPUs associated with the active kernel mode.
> 
> ok, could this thus just be "each CPU"? I find a lot of text in this series use
> unnecessary adjectives and then makes it worse by using inconsistent adjectives.
> This makes the text difficult to follow since it is never obvious if the text refers
> to the same thing as before. Please remove unnecessary words so that the writing
> becomes concise and easier to follow.

Ok. Sounds good.

Thanks
Babu
