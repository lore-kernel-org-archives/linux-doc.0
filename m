Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010060.outbound.protection.outlook.com [52.101.46.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0650233933;
	Wed, 20 May 2026 17:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779299377; cv=fail; b=d/ZdJuDQaSUxhr3t/upLK7PmvlKF9jluhhuK+NpGtkFKIB2hStkpxSwZ6tLkRapnYuFqDMmZhurKji31Hm6J/vN4LjJmmzmz7+WTyScQcZFAvu3kFNp61GIW49OMqWQ9fuG4myLRAhUp0vzsqcdgx5qtW9SqwIGrXJiXBe9LbWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779299377; c=relaxed/simple;
	bh=B/lurGLL5/tCWiTTQNPaL7AdV6VhNxs8sUuyYM+rDzg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FJ+CEVZUaBg6tx1XHJy5Id5K17GUCVY4BW+YqAx2IYa+7sVPdqtKqS1nD7I4AWvQwuZc2uB0g535UDEXOTegCQJT4O/t0pWVdsXjWILCRm7bHkXz3aeIPlxYzXYWOP6pC9YbbnKD+1R/NgHB/yhOD5iCindb0EkmgpDLjkklLjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YVwlBjzf; arc=fail smtp.client-ip=52.101.46.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YVwlBjzf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIV/spC0H0r7nFbqLLZPKd8SiiWVAPMmMRA1n3ZigdlAuD5orzFpWRXJGkx7Ih6Xv7U8JyGJtjCjMkhSJUog2lzQrzhWSaSMiytr32aQcagu4e10kq+xYJGvDjiQfAfb8d6KHQVNYXyPVO/PbPjHjoTFcus0Q88rUrBQuU2OuTvKWsmLDPwP+T8vxJ1a8iDrg4qsKc3PEuUzy+edgn5fLReh62Rp4Jxos0UQgJXgyZH/Kxpg5+jTWIfWTE+3dEqLPyE0TXmpxDW7JUcbAERvsrgUnJaA18kEU3l7ykTFDvQBRrtHgxVGrU5OXbA43/JozEdySQONi1GxRwee30pQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zdow/1uCGgkpU6wm/1R67kMhEu4ZbkfDj+wfUAWuY+Q=;
 b=aWrP2/AvdxT99gS1ikYvc6QySUk1XDAFnhdmXQJnKab++FlX+tkJBF9vXP+neO7Fb8M2ptuJIXI4Qi4cNYwfYRKfGgCFSz5KQ8sTECsrTv7zMcRGd9HUDw+NEmj341NIYVWnbEvQq2qKbPJ2ZGFZcEWgo/cJ574od+6k3CbkW/WMQV40v3ofQxzuxL7RJNrhuYlVpkluq3t9KM9MqIh2n+3xhokc/nxJt4cGM/2wgJFWYYizZfr5Ow5apOBEh06EhhkPPXD7kngNH6zuXJS3VExg/TMBAPW9ncs3Uu8r1Tp2TS5fje90Gbv1gYv4gHWGapaEClZ+SYOq7KQrLlyHfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zdow/1uCGgkpU6wm/1R67kMhEu4ZbkfDj+wfUAWuY+Q=;
 b=YVwlBjzf3Rm27n60uQ+DcUrZcO6U1qgc3emgQBHIKKR5liHuX+mczn1Zf71TZfgRlq4BoVq1zch0RFaAkDpBR3v5muybKb+2zIO/4j2SVcT35BME/r9Gbt4qq/szLOekWpdKu0kPyS85ygNaencuCk/OIqIWNfnln0Z0xdDfx78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA3PR12MB8803.namprd12.prod.outlook.com (2603:10b6:806:317::8)
 by PH0PR12MB8175.namprd12.prod.outlook.com (2603:10b6:510:291::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 17:49:30 +0000
Received: from SA3PR12MB8803.namprd12.prod.outlook.com
 ([fe80::b6b5:dec5:43de:6d2f]) by SA3PR12MB8803.namprd12.prod.outlook.com
 ([fe80::b6b5:dec5:43de:6d2f%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 17:49:29 +0000
Message-ID: <1a410ca9-f4a2-4956-8477-033d61a733be@amd.com>
Date: Wed, 20 May 2026 12:49:25 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] x86,fs/resctrl: Program PLZA through kmode arch
 hooks
To: "Luck, Tony" <tony.luck@intel.com>
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
 sos-linux-ext-patches@mailman-svr.amd.com
References: <cover.1777591496.git.babu.moger@amd.com>
 <0cfd813e10072eefc8f4d84328e83bd9a6220ad4.1777591497.git.babu.moger@amd.com>
 <agzPTMvJ_LdEmKXe@agluck-desk3>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <agzPTMvJ_LdEmKXe@agluck-desk3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR01CA0004.prod.exchangelabs.com (2603:10b6:5:296::9) To
 SA3PR12MB8803.namprd12.prod.outlook.com (2603:10b6:806:317::8)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8803:EE_|PH0PR12MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: bea0ccb8-55e4-4088-0873-08deb698240d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|3023799007|11063799006|18002099003|22082099003|6133799003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	mk6XcxrGKZYEIre+fbEdXrbGf7hX6ObD5sRjNqtpGg6F1wYS2G0mpTMBVwyMCOOnPqJo8EPVJNl4xXvnwFnjfQZ29jhXdKFDXkeSvL9OgsAyl0dgT5NVjmugrRlauQ6TiXvfq0e/Q/W0Cpw1FTCfLghJGn+TN6QXinRq5ZvxX063CraTokmdq9Xy3fPu12wUzS/54bsRaPhbBHL+crtxQ4HWp1QYl+AauMVDNIs7nQxkcjJTnO3jaG3TxHcEiTcE7JRkjUqGsz+BKtfk+4PXkC9g9BQNrHPRiKrc0wR2CbtU17IxSW6hVQd84KlirOgoPmMYmeKJBTs9w4F9rkrBbGKApstHtvBZRb7y+K3KymQPB1ty1Mp19FfRQhvws0Z2IX8NMh/1gUrNk44SXKaSzCh/ngH14KYF6v+90yntakTmHG61xckROT9WCe3nrsFidQF6TAkdTESU5gHYhojUQWEIUdxYYN//ANo5Lk7vIQm665rT1YN/Ys/CbQAsbCUgZxjaOLWkXlylUP4EahyiJexku67P/hbn7XqJqpTBLcexuvG8yKrTs1K60kGasR6akErHndhwl7pxUtjUVUqYwfyrouotIKZlHKLvP/wKtbo1FBsQM0cWvTbPf1zAgG3Gfm5fVW/GxkojU4nDBdIBc2Twe6l3+CHlEEaW7Y0R1BC8Y0vbAyUoBRED25Gjx2HL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB8803.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(3023799007)(11063799006)(18002099003)(22082099003)(6133799003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjMyTVlIV0dFUVhVSTVibGdUVkVGamRHTWh4Tzc2TDZWVjBuNjd0aHJqYTYw?=
 =?utf-8?B?Vld4NVR0T1Z2Q2Z1ajFvdHFHa3d6M0FRdy9tOGZwSUQ0RVhLVHVtNUpGcmJp?=
 =?utf-8?B?T04rM1hNVUpzaWdhRGp6Q2ovaTBWT09vdUhrZ1ZUT1NkSjRPcVRtdnMwTFZt?=
 =?utf-8?B?ejlGbmdNVHh6bzg3UVY5L1N6dnZoRkh4aE4zYWJ6cHg4aGQzbXRhYTJHOWJO?=
 =?utf-8?B?dnNEUlZ4REZiK1ZqYmhPYXZCc2ZSU0pYSjNFRVpGM1NaR2M0N2F1SDN5OE8r?=
 =?utf-8?B?bE1ydXVNcmlPdzRScDBGSWw1VGZGUVUzRGdhSGRDSzNWUCtJMUFHb1VIV2Zz?=
 =?utf-8?B?Sjg0NHA4UVplQ3NNOEFIWFhWU3U4Ujh1enBHcWtFVnpxaHZDUGpxU1hvbWRz?=
 =?utf-8?B?b2FWd1FjTU9ZdmMrRDJEK0Y4NWZ3UE4yVVY3NUhTYnJPRlVlZTlraXdSSnh5?=
 =?utf-8?B?SEJNQlNzUW9xV1hxc040Ny8xMkNSay83TmdMeHhQZ3pXZ3ZOdElKZnNBWkQ2?=
 =?utf-8?B?OWVYbzFLT1hhaXZYREJFWXlxc0NmSFBoTTZnOElIVENreXhpdy93cVduVHhs?=
 =?utf-8?B?SXdBdmhhV1VML1BPaDhXbWkyTUVqSkI3aHhsOXNPWUsvT1lmMjFiTi8vSDJE?=
 =?utf-8?B?TGl3bGF2MVVMQmhvU3lpazBFNGhFYkpNelRIdVltRytBOWQzY01kRGMvbVVY?=
 =?utf-8?B?ODc0U1haZGhKTy9HZVlFL0dEU2N5VXVVakFMSW1tM08yQVNuVVh0V0lqZ3JP?=
 =?utf-8?B?MUM0SWRPa3Z6ODJxeWxWUUlUdUI0dCtVaCtOSXU0WUNEREhSOTlvRjVkcFg4?=
 =?utf-8?B?eEJGQVFhTklOYlA1RithQ2JMWWhlMmNFVUdhZ05PT09KVjZpVUtQdlBEaXFO?=
 =?utf-8?B?dWpqNWE0Wkl3V2xEcVFWWmVod2M0YU8rMjVmMzQ5SnlWYVd4RHNQRURUbi9j?=
 =?utf-8?B?Ly9tWG00eGNHUDd5bk0yQ1FGeklDUVdtcVh2VHRGS2xGbkJ4S1hpZjZIbDZE?=
 =?utf-8?B?aTN0QVhReUs3Z2IxcDBvVjdrTDluVjVnU2c1YW0za1J3c2NTVzVPRGZJZ3d3?=
 =?utf-8?B?aFhsSTBsWE5VNWxLWU9HbzFMdlZOOHlvK0xwNTJNN1ViZ1VPRTBCR2hjbk5S?=
 =?utf-8?B?aFFUM3JBOHZ6MmtUUGVSMXVQbmlKT0JXWmpkNFJuNHZucVY2eTFjbmdKSm1L?=
 =?utf-8?B?ZXFnT1FZVVBpSEFSQTFoaUJDaVcxL2UwUnNwdzNoem8rUG5qbVd3bEdLOWJp?=
 =?utf-8?B?S2FJTXVhUElqd1JBdVhoYXlqSHdXWDdvMnJtZE1nUGRlMStvZGVxdENkVSsy?=
 =?utf-8?B?ZjR4T2RranQ5RzkxL093OHVWT2NlT1c1Ti9sRGdETnowTXVUN2lHbzFZbHZR?=
 =?utf-8?B?SEdDZ0FRNURKRkFUTFdwcWNYZGRsSjF5Wi9qZHBjL09Lek5jb3VvR29XenNR?=
 =?utf-8?B?VjBZRVJyTEZPSVR6TldwRXRVckJOV0VmVkRtQWlvTXFMVk9WVnFSLzdVMVl6?=
 =?utf-8?B?aXV5SzYvbVFsZURJWUhDRTNYdXduTFA2cUowSDJUOWxSZFZja3dJK2hicWx3?=
 =?utf-8?B?T1NkaDVybUxjcVlUaVF5M2x5S1JmS0kzMlRqbm1tQllkMWx3dHQ3ayttYkF0?=
 =?utf-8?B?UCtCd2dETVgrdCtNdTV4MzBhckdNa3B6NkNHWC9McWlGUHRjYU91TWsvRnBE?=
 =?utf-8?B?YzZsUkZ3MlhROUlialdzWGN1aHMxRVBDRmpjRnZIMzRFMmJwRHhCdVR6TlpU?=
 =?utf-8?B?cm9rVytzZkdFOEVnVk0yNzNVZE1QbmhDWjU3S2JCNnkzU01DNStPODJqbDNy?=
 =?utf-8?B?WEtQakp2Z1BaTEk3d3lSY0h4OXlJUHNEVHUwZzVTcVBiWVdrWi8vVjA5SVkx?=
 =?utf-8?B?VHIralF4aGNEUTRETzBtOTZpdXh3NUhJcXJOR1dMQmJoMnNYbG5Uem5Gdm1Z?=
 =?utf-8?B?UjRzbkNGVEJzWE5hTXhqcEN0R3FIaGV0eEwycWwrS3JyS3M0ekxaQXpiL3Yv?=
 =?utf-8?B?dzB4YitxVXpkZmVJa0tzd0RjMm1Nb3lmYjBITThEZ2t1YnUrTkNTTmdCZXVz?=
 =?utf-8?B?elRJYlkySUtoS3luK2c4TWRlcjJkaUxvZUFtVlo5Yk11cnQ5LzYzR2dJRHMr?=
 =?utf-8?B?Si9yN3Zmcmh2REc2d3NvMHE5T2JGZW5Ra1BSSm5OaVlQRmhRY1E4anlacDZq?=
 =?utf-8?B?Vkl3d3ZvSzRidkNpN3M4OGMrM3RwZG9vaTNnVFEwZHp0Q1R1c1YwcHhXNVpC?=
 =?utf-8?B?dVpYVXduSERuUWRVaHU2V3NadVYyUndINU1qL1NsaWE4MXo2b3RtRWIvZHhI?=
 =?utf-8?Q?5j/HtR+DaGSBvushpE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea0ccb8-55e4-4088-0873-08deb698240d
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8803.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 17:49:29.2254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUhSCL2YPjhJZNdqZBDSFdXrNv7jJp8ie+tVWUqOEvPLrPBBRGaYtKrM7Qbn+ui6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8175

Hi Tony,


On 5/19/26 15:59, Luck, Tony wrote:
> On Thu, Apr 30, 2026 at 06:24:49PM -0500, Babu Moger wrote:
>> +void resctrl_arch_configure_kmode(cpumask_var_t cpu_mask, u32 closid, u32 rmid, bool enable)
>> +{
>> +	union msr_pqr_plza_assoc plza = { 0 };
>> +
>> +	plza.split.rmid = rmid;
>> +	plza.split.rmid_en = 1;
> 
> Shouldn't there be a parameter for the value of rmid_en?


I realized that behavior is not required—it was actually due to a 
mistake in my v2 series implementation.

Below are the relevant definitions:


GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
The CLOSID is applied to kernel work, while the RMID used for monitoring 
is inherited from the currently running user task.
No separate monitoring group is assigned for kernel work, so kernel 
execution naturally inherits the user-space RMID.


GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU:
Both CLOSID and RMID are explicitly assigned to kernel work.
This allows assigning a dedicated monitoring group for kernel execution 
and therefore requires a separate RMID.

Example: For GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:

# mount -t resctrl resctrl /sys/fs/resctrl

# cat /sys/fs/resctrl/info/kernel_mode
[inherit_ctrl_and_mon:group=//]
global_assign_ctrl_inherit_mon_per_cpu:group=none
global_assign_ctrl_assign_mon_per_cpu:group=none

# mkdir /sys/fs/resctrl/ctrl1   (PQR_ASSOC closid=1 rmid=1)

This configures all the CPU threads to use closid=1 and rmid=1 for both 
allocation and monitoring across user and kernel modes.


# echo "global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//" \
   > /sys/fs/resctrl/info/kernel_mode

# cat /sys/fs/resctrl/info/kernel_mode
inherit_ctrl_and_mon:group=none
[global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//]
global_assign_ctrl_assign_mon_per_cpu:group=none

This overrides the previous configuration, and PQR_PLZA_ASSOC is written.

Possible options:

1. (closid=1, rmid_en=0, rmid=1)
Here, hardware uses closid=1 for kernel work, but RMID tracking is 
disabled for kernel mode.

As a result, reading RMID 1 reports only user-mode activity
This contradicts the definition of this mode, since kernel work is 
expected to inherit the user RMID for monitoring.

2. (closid=1, rmid_en=1, rmid=1)
In this case, RMID tracking is enabled for both user and kernel modes.

Reading RMID 1 reports combined user + kernel activity
This aligns with the expected inherit_monitoring behavior


The preferred approach is to separate kernel monitoring by assigning it 
a dedicated monitoring group and updating PQR_PLZA_ASSOC to use a 
different RMID (e.g., closid=1, rmid_en=1, rmid=2). This is exactly the 
behavior implemented by GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU.


Thanks
Babu
