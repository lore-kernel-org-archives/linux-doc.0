Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D979404BFB;
	Mon, 29 Jun 2026 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739261; cv=fail; b=S/Flofwhz3eJi/mGwL4DElQznt2b8+UMKe1ZuHqX5IXOjIPYeMjw6gqViaI1iXdEImuWZQeOhtc/Bzf3nVDe9MGBk9U8bVnyILyK8CJsiPhBiwMxQUDSnFSqSOwE92Y/sanlAN0vHsf0Oeepd5XhvyEGXNUP2q3knAjN4o+oAKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739261; c=relaxed/simple;
	bh=LS+Kdet8rH0R/swwducjrxRNxjh+o1t6Nc6ooY31zgw=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RDOiHc/dpVHauZVolGC8RRiJ30ttS8G87/e7ezP7p+l/sPLxoG+MTRYZvzCg+s4r3e+gwE0dfjIrcsjOSiSfVgAJisLEgWhOGEHGzcv5RaOcwrafmUmedx25HalbyDQ2gXfqo0q8FqXbxbg1iUJVq9a/RY4ccW78t5jhLsXWQyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GX3UyiVj; arc=fail smtp.client-ip=52.101.46.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GX3UyiVj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0Xw87Og6ixhTZuV2gDJ9KeYcmD6H1qqAhsXbsxDLCOWQBDCOaDl4FCuEiLGrxCHS1mFUVlEQ9mRhLc6pLYTvKbrIgksbGxUFakTygLAhixJlECsp0zhTBhgOv0o1nVRRx7OSPS2VniwtjYaqJxN9lXl+xqtigZbyViVkkWLSU9aNYSqEHX4H9nS/Fx7mwurd0Uc9NID65FyuaeM8I8NCZr9ZjHiPcdCbX31fczm/UshvRorf7iHntEb43eMeXZfVaDqhhOAItcyDIy2jFyEvaHJ2TWduGWN7a2HVjOEB3VOBo2qdMMSbgtd/clDkPHYWzNgeqti/+Vu8hJ9GenyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYxZmbFlOxqVSfTFSk6cdfZYrUt738CFzCpnLPmM+mM=;
 b=niirdaV4Wr522na+dpCor/xat5mH4+c5h5NI4pwWDgHIU7qADuTcf6TcmxtQCJes2MGsmUwkAVctHxwiHWYIt7TKuogsDWLeUlgDxfQta1c50ROCjHpJstX/0YUnMoWSSAmv1poMttO8s4DqCpCGA+7Ia7fG3tq0Lepxs3k/OtdHOFORJdWXvU2RQ1kry976+HPaluViCHRAt3HNAEcokyRyWqwFIIys1CZsX6EK2wFCUMbEFh2VPbPchdfBnjBqhhr4mJiUQ2+g5UzceyyP8Pc6bwgEXQXlcMR85jOc1Qe03zqsoQVfPfHPpbiHa8GBGIAkY5vVE4I/zUkxIFL8iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYxZmbFlOxqVSfTFSk6cdfZYrUt738CFzCpnLPmM+mM=;
 b=GX3UyiVjqW0eCX0JK/DcJwBFHMjTTDml1Vc8mEYDEnMC217Ej52pPh3msigpOMY468BnFdVC435cKDkaamngslK25DDbcySPH6GbpaWgHkakbwhXj73UFzxQ4njkknhujammWenOeIuOMIt2nb5VAUbddVya836DNqkzjzgtrv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SA3PR12MB7782.namprd12.prod.outlook.com (2603:10b6:806:31c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Mon, 29 Jun
 2026 13:20:56 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 13:20:56 +0000
Message-ID: <069a73a0-da1d-4190-8af4-a279e9d62ba8@amd.com>
Date: Mon, 29 Jun 2026 08:20:37 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <bmoger@amd.com>
Subject: Re: [PATCH v3 00/12] [PATCH v3 00/12] x86/resctrl: Add kernel-mode
 (e.g., PLZA) support to the resctrl subsystem
To: "Luck, Tony" <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, reinette.chatre@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, tglx@kernel.org, bp@alien8.de,
 dave.hansen@linux.intel.com, skhan@linuxfoundation.org, x86@kernel.org,
 mingo@redhat.com, hpa@zytor.com, akpm@linux-foundation.org,
 rdunlap@infradead.org, pawan.kumar.gupta@linux.intel.com,
 feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com, kees@kernel.org,
 elver@google.com, lirongqing@baidu.com, paulmck@kernel.org,
 bhelgaas@google.com, seanjc@google.com, alexandre.chartre@oracle.com,
 yazen.ghannam@amd.com, peterz@infradead.org, chang.seok.bae@intel.com,
 kim.phillips@amd.com, xin@zytor.com, naveen@kernel.org,
 thomas.lendacky@amd.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, eranian@google.com, peternewman@google.com,
 Swapnil.Sapkal@amd.com
References: <cover.1777591496.git.babu.moger@amd.com>
 <aj6g5jojdWASJ5YJ@agluck-desk3>
Content-Language: en-US
In-Reply-To: <aj6g5jojdWASJ5YJ@agluck-desk3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR14CA0054.namprd14.prod.outlook.com
 (2603:10b6:610:56::34) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SA3PR12MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: a867c597-2b72-411a-6dfd-08ded5e1409d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dwGjH8nXzw7L8iBZ0dKP01O3FcjvIe+tRmRtxqOOa5Pcz5TwDmvRGMzgEuTNPOUQyvsKzCBQjU+/4lnsgnad2EjJs052I8TM/TB9dOHmih8mS5xX8oD/aUW7k8F/u0ndFntRLkYHuNKP0Sa845OBF0AP7oRkl6Kc968K60AtcbAMHojcO5hXzaXxJ8FdRTSV1FFpkhcrfyTdHlAhJpcg5RK8ZfRJS0ILgp8pPUKrvuyBKIPuNGqdqE2CZlmmiaYdeZa9LTD15UbU2k7s+/japEMnnDbOPeBHVwzpmlvtBg/HBpBZ48mtJWnSYvIqu9P7sJtOGq3Rw/MNSm3d+hviRCsIzRAlRvw3rvLn6/QdAn59d7Mn9vo24QXWlI9TE3uVIy2LvVU4pyGV1UOJ2CuBWwF+vGcueb7PsjRmLrIrf700SF9edlLZIrplCT2jrVQph7MU9+VcvOYR+oDBwphI+t0TUiy0OpjwUDtmlIIhmPGTYfizefItaRHTIdqGSRJRkHdeUFUEFyfFjGja+f41zjjtZx+YmR4az+sai4FTcIlnjx7oVNpK2KNl8rkieXZ6wACoVbHU0Te2ATKjrkDoMVllCKkZelFCK6Il488oslc77nW/MuDVcwVZmDWQDxksEFU0A1lO06aBbMp/UqN/Q2MDwFX8Gn+uZlQy773fw6s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUg2WGhrZHc5aitHRnd3ZzlJOVdzM0FCZ1VoRThIL2VuQlJxRmlzZDJuRmtJ?=
 =?utf-8?B?OWtpZjNwSFNwOTdSM1J2ZCtPaVVIaUtISXNxeWppTjdBQUFrTGFmS3VkOEJ1?=
 =?utf-8?B?QmI5czNQWWdPa0dqTnpKYmRUV0VmTE5kSmQrVTc1MUtPNGdHQTlxdEZ3aWM1?=
 =?utf-8?B?Vm9NUGNnSVFBK3ZYY2tqNnNQS2pBQWxqdURyTTEyVmxlWUlwSFcwSzF3cVZR?=
 =?utf-8?B?aW93eDJwM1RwcnBwRVFnWE9lbUc4OVQySjBLdEp3b3hsd3MxMXhSOUdBS0dn?=
 =?utf-8?B?OEk1K3hrc2t1UWR4VFB6b2pvUUxxZDE0Z2NHb1UycHFWeEsvYnQzeTRSaXhz?=
 =?utf-8?B?dStyUXByUHRHdHlkNmZzeHJVVWJLWEt3alhvczU3VmN3UEZXUGtXRkFOd0l5?=
 =?utf-8?B?ZUtjcEk0dFJJNnZ3WTJoWXg5RkczT0ZjL1lVMGsvM0pZZHMrQUduV05yc3VR?=
 =?utf-8?B?OEU5cGU3WmhLVUNyWERtT2FrREdXTTdHUk9KeEdNcXVrd1FzVERDU0FjNm1P?=
 =?utf-8?B?aE9HcjZXaDBTZ0dTaGt5eHQ5ZmNkOWRqZFh3dEtZMHNvNzlNaTRZNjVNbnUz?=
 =?utf-8?B?bko4OXpuNkVRd3FsQms0U2xKeHhNWXFZU0pEbkVaYjY0cS9FeUg5OHNHckRm?=
 =?utf-8?B?M3RXWkpPN3JMRzJDYzU1SHdpSCtUdy96Lzg4L1dGTTdWNWw5KzZULzhEQnNl?=
 =?utf-8?B?dHczK0lNSjJabHBhcTZqTDhSaGF1ZDZrMjNhUTZyeU9SSG40NGw5aDFuUlRa?=
 =?utf-8?B?bHZJUkJFMVdCRFc5NVZqZCtkYm9GQ1U1Z3ZpUDcwbmJvL2s1bmplWWVkc1J6?=
 =?utf-8?B?ang1dUR6QURGWkRpSGJSend6c0wzRmdRWVZQU05VZkNhbDlhUmo0cXBBcG1G?=
 =?utf-8?B?Z0w5MXl5S0FoRHBPbXZwQnR3MTRDS3Y1bTRUSnBMNU5saEs5cm42aUx4QTVo?=
 =?utf-8?B?NGRrd29MT29RdCtVc2pDakVzQzBlakk4M1R6ckp0OHVPc05jcGFoSmI2WS9l?=
 =?utf-8?B?aWR3eU5zYWVjUnZsTXBLY2REN0l6WmJSMHJ3UGZtcDA1R1ZVTmpxeWJwalV1?=
 =?utf-8?B?Q1I1V3lIU1BreWhVOWVreGVxTW0zQzFEWDM3MGx4R1hBLzlXQU5qWHA1ZDB5?=
 =?utf-8?B?aUUvdHR3Z3FqS2dOcE5nVC8waE1SUGVsalJxdVhTTEI5Ulg5NVMyWW9WeGxI?=
 =?utf-8?B?RnBKWS92eTVwK0plUU9XeFkrSlF6TkxqYjIzcTNNc2hhNUhtKzdSYU5jak54?=
 =?utf-8?B?WjgrbWgzM2ZHN2lOQUlzNGppNGFTM2JaUlh3RnlzbzhuWFJQcTdqdFc4eTFF?=
 =?utf-8?B?QTU2YlNkdDl1SFZxcmhPMGEwNkhsNlBJR01iYlNXMFZtWmFxRHFISGlCaWJl?=
 =?utf-8?B?R2t2M3hMZlB5aTBkanFhVWR2T0owbGVhdEVaUTV0VkhkOVpWYjdKRCtJYzY2?=
 =?utf-8?B?VHVZUldnR3JCOXkvYXFxQjNHL2tpY3BYOGsrc0RVdHRBMXdVbUxmM0hEKzZX?=
 =?utf-8?B?UDR5b0dTVW83WGhOUXI5b3JUdW9ONkFKRlJsZFVyY0xWU2x1VHNMcnRIMGho?=
 =?utf-8?B?ZjJkWnFrdXNhZE9sQjVSNzlpZm43TlN5N1NKdktPUFRlc3BwWmthZllXSmxo?=
 =?utf-8?B?b0xJUlZNanBOckZQMDlMTUJoMFZ2ck9VbDNaTHVBcUU4TkEyVWEvS2ZCcm5L?=
 =?utf-8?B?UnN3TmdBVnNvQzZiaTZZRUtsZTVGQTBVVVNIWTJ2ZzVERzI1bW1qNUpxdklo?=
 =?utf-8?B?L3hIb0NpS0xjTEFhVlhmd05xUDZyZFNTYjdXZG4zQ2tQUkxHYTBWcnd5VDVT?=
 =?utf-8?B?S01lak5NSHh3OXJ0S21Ta0ZNYi9TVWpvNFJaMGhLZEx1aHVSTi9YczR0M3B2?=
 =?utf-8?B?ZTFCckNPdGprczk2RHVZSXNkZGpEK0RFSFQzYlhZRTJ1VlNxNXVhYUVPa29j?=
 =?utf-8?B?S25yUEJyMTgwTkMvajB2Z0s4QkxPV1FoeHU0MnhJTUt1TndOdmNxTmE3bEJn?=
 =?utf-8?B?K2tOcWllcEdoMGVlbk9CWThsdDB2RXZJTjlOekx2cnFJSzNyOHArTUhWTmdG?=
 =?utf-8?B?RGs0by9Qd0RBSDdlazhaZmkrbUV6b1ErZTFMS2JEUUxEU0NRQVNrbTNOcWxP?=
 =?utf-8?B?dkh0ekVQU3hiU3NaSGVLMG5UdG9LSjJlanpwYTZvdWtuL0JXaWt0R1Q3bjhm?=
 =?utf-8?B?cWQ2eDVvcEE3UzY0eGV6dkRaaFdsa2RZdUxhRGQxZ3VVczFLOTZXdWx4WjVj?=
 =?utf-8?B?YlQ4Vk5BTEFrZElGTGoreGp5L1RWZUNsWldnMkJ3VHBNSUJpT0lEeTJ5Q0t3?=
 =?utf-8?Q?t9ctmxADOfk/f+kufO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a867c597-2b72-411a-6dfd-08ded5e1409d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 13:20:56.3803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HloHaAw9YIV/Qclq7h+BKdW/vS9h8+CHBRQp2JjyEXqsBHPXvRgt2tf2t9nICOqA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7782

Hi Tony,

On 6/26/2026 10:55 AM, Luck, Tony wrote:
> On Thu, Apr 30, 2026 at 06:24:45PM -0500, Babu Moger wrote:
>>
>> Hi,
>>
>> This series adds support for AMD's Privilege-Level Zero Association
>> (PLZA) so kernel work can be assigned to a resctrl group, and wires it
>> up through a small generic "kernel mode" (kmode) layer in fs/resctrl
>> so future architectures can plug in without touching core resctrl.
>>
>> The features are documented in:
>>   
>>     AMD64 Zen6 Platform Quality of Service (PQOS) Extensions,
>>     Publication # 69193 Revision 1.00, Issue Date March 2026
>>   
>> available at https://bugzilla.kernel.org/show_bug.cgi?id=206537
>>
>> The patches are based on top of commit (7.1.0-rc1)
>> Commit 3382329a309d Merge branch into tip/master: 'timers/clocksource'.
> 
> Hi Babu,
> 
> Have you had any thoughts about a resctrl selftest for PLZA?
> 
> I'm not sure there are any easy ways to show that PLZA is effective for
> MBA control (as most normal system calls don't do enough to easily detect
> whether the kernel CLOSID is applied). But perhaps you have some ideas for this?
> 
> A test that sets global_assign_ctrl_assign_mon_per_cpu mode with a dedicated
> RMID to track kernel memory traffic would easily show MBM and llc_occupancy
> numbers for kernel activity.
> 

The AMD selftests are already somewhat broken—or at least incomplete. We 
should get back to the earlier patch series:
https://lore.kernel.org/lkml/cover.1717626661.git.babu.moger@amd.com/

I’ll start by looking into that. Afterward, I’ll consider what can be 
done for PLZA.

At the moment, I don’t have a clear idea for PLZA selftests. Thanks for 
the reminder—I’ll give it some thought.
Thanks
Babu




