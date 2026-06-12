Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013040.outbound.protection.outlook.com [40.93.196.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C52C3A75B8;
	Fri, 12 Jun 2026 16:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781283373; cv=fail; b=WZJh/nUpORwN60HBAUfCsUsLqHaYPpWyzZ1pJSsNSFtWR+8dc112OHqyv2MAmuvbmHW6DnzW5FTp8nykNUvL6yXaAQ670vS8lWhmyfpDvMm2fWIT29BKzaGrKYfBv4WIrtdiWS3KRgGliLhBvPKa7fA5wfSlTEdqICBNvc3Bkm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781283373; c=relaxed/simple;
	bh=0/s/c98b5XUMYNHwGFjWIF1X7zPhbtQI87HRoviXkAw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sw9EB1JnGXHjA49zepTwzgGWLR9zV44kfEu4gL7w5gdMBHnxe6qqjC/+E9q/+ZZBdIkctnJGLmO1PjZIYhD/+yRt946jFkzgnkC5/cIkTXHdVWXjX3D50WO9PvGEhFhYkoM6yfrjXhSlr0eCZJvHTqTdJkM1ynle6qUg3NWkw1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zZ8QbkmA; arc=fail smtp.client-ip=40.93.196.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zZ8QbkmA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcFaJ9tZy9hvrycs7h9JCUa7g7Yy2M3phdiAGb3mjVRjG6Cd3T8bp6Kv8UiQ/s6XFTpcR6zu7/c/A2+n6ynquvnd3wpiJcQwqaLDC51Yw3gXosJWn4giHvfzUP5yjbaObGhMmEtqIrQlpNQekh92/mOblEm83pkexSxc4sdQ4Ko8A5zofFxH+mwqNaMcKRNGrL+pWSq0CAcJ5/jgFKaYCYxq3V+grLA8w8UltLr1pMAjqPl+68fMWj7wQRFKRurb7AexRjwSpk7cs6D7PjJFiDjyQX9HPKdt46vBhZWJJwrXILmkoB1aEn5w1Hs2sdsspWAwnNyaaiLYedDyDbXPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PG1cN47k9t7ElZJiR557+yXRott7kA1ySzlqL1vsEjY=;
 b=bJ0g57Uu3iFhMkeUTB8jvJSw9o+TblT5+AyJxiK2Bve1wCeAoxnkR4OqRbE4qMhqpPmOuBA/TAbc5RS5VqaiDqn7rJA4v+eGeNyJeCJvdG9YuOFvKv3OpboEfrODRHWxl9qndnw+1JKhv9Vbt4YXtwjJcmvxKwNbfNlitWI14fPzFFbismZ6+rU2BYalpuHcKH+uw3Jh4VGXITPih1IX82CLzcsBt8Ga8jB6Bwh9M7fQ3NVUeXFyvD+U2BkyF7+YDJebpM/8AN2vLaFjIpsQcYbpgqvxkcDb8hY2o+7HIe2cGt4IVWG4OuFdplAqpXHNfyJw5FxV1GGWlfj6/zM4Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PG1cN47k9t7ElZJiR557+yXRott7kA1ySzlqL1vsEjY=;
 b=zZ8QbkmA1OsDPVPqYNu7prIBFQeMO7ysvM96Cd4WscpXAsMQPo3UpzbyEYytWSD/q/vsR1fneIEqGYU7wpHE1kMEzB/ot5gtunGMbuG6OHQEgpSm3CH93i7HnJ2trsa7ruoyS5dPOtO4fnf7QX9aMypqiw0h9cF/A2MhiZiwsak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 16:56:08 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0113.014; Fri, 12 Jun 2026
 16:56:08 +0000
Message-ID: <a737ae9e-9cbc-46bb-b565-0b888e69f0ea@amd.com>
Date: Fri, 12 Jun 2026 11:56:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] x86/resctrl: Support Privilege-Level Zero
 Association (PLZA)
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
 <f59c7f5404f29b2901af68d8032ee615b7f0efea.1777591496.git.babu.moger@amd.com>
 <081b5cd6-37a3-4aaf-862b-b41e9536bb66@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <081b5cd6-37a3-4aaf-862b-b41e9536bb66@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:610:1f4::24) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|LV5PR12MB9828:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c8491c-903b-4ada-a742-08dec8a37feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|366016|4143699003|3023799007|56012099006|11063799006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	RXaPWRqUvWRlmJRO7ysOnWJblXcXdBKVnf9d1cQWUe8NnoczTiODNredAS9ZODAeRLRSzrB9zgTO6DDTDHKMy3Eb7o2z0dhJ6/Y1NdGiDT7goEmaRkRLc44LNyuG49pYD9Os2EgsZCG6r4cC0nwRT8VWwXSheoP4gLUs9cITj9eKzHGedFw5D4QCo+xAalISnJ5Jdez4//SzV5OJxALrwhQI6SlP2Pw+8kOLUqrlRLKs5cy942QOciLfz47Z9hOBmL4LKNqSRMbkm3HPC4Tg3shh496N/QZqJbgX6G3ZkFTIpEQdxoVm3uNF4mGpDYyOWk9DYZLOcO1IIQDvbQmuZ7CTiz5bSEI/50L9yKoj787dtfC4yY8dTR0/7rBJKqlRCJYsaW6TsgEvryftSwDYIeVLfMDZJ2gV3LHJAjBnNCTYDqRwLbVCLvh80cnR/k8DvP8GMmF3OX2t3EzdlPoBxsC/LIuShScuqfehO63UsLtsd713Et8V0kyxNCXiVc6+sn54+7Ggjyu/Yndt9cQVAv9ZDpZCj+IIjwm4SPRQXOaRRSZrNEwqwWSRO4hgf2nFfGmV4Zy55INxN4iOE07aotwnxM/rO5lo8+lGkZBfQUyScvWARtr40omvMh16d/RuS8g24xau89M4UxSQFBo5CyCerlHaeFJavSk463JTco9EeR9FfDAkwYqvqeLQfa9i0oWBcukq5ciM3SM/r+mOSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(366016)(4143699003)(3023799007)(56012099006)(11063799006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEJIcFU2VnI1eUpEODBLM05BQzJndkErVG15b1V6VXo1NUtQdEJmb0tad2t4?=
 =?utf-8?B?ZENIR0ZGdlUwNkVGa1llc3ZFa3JncTZKOHBUZU9kVnZLc05Ga1lWdzEzdUpC?=
 =?utf-8?B?QU5HS1dYZHRaWVZvZi9SaVRSTlgvTkVkUHozeVJqWDFjRDFxSkh0Y1pUUTla?=
 =?utf-8?B?bjdOMEF0bFdYNHVuYXQ0WDBodG1iNUluQVM0eXpUUWtkS1hoL08yZzFqUzVv?=
 =?utf-8?B?L1BEbi8wYnJXUzE1Yy9uem9ZNm9Hbms1QngwSVJzZU1yMXp3ODVKTURJa1ov?=
 =?utf-8?B?NHFZRmE2SWF4ejdZcTczdDZjOXRTeGxwc3hjZ1BDOUNMVzJrSHNZUFVTM0l2?=
 =?utf-8?B?TUJRWThhMlBvcWo2Z3NoRUZxU2N1RS9FaE56RnlrU2JvczFhKzRBaFFZTWF4?=
 =?utf-8?B?YjZIajA3N3Rmb2dBUzF5RTl2YWtraUZWUjFNZDRWUXBpUmRBSVd2SEVtZ1FV?=
 =?utf-8?B?UFMxTGhZVTh2WDVCZmtDbWsrSitYR0ZtQVpabnZLMXlSRGxLWmZGZlZtYWtW?=
 =?utf-8?B?c2pJZ1VUZUU2KzlLVlZuM3U4Q0ovVlpUdXQvY1dHWVV1aHd0cjRYbGc2U083?=
 =?utf-8?B?NitKSnNzK29OOElZQi9SWExvaG9QMkR2bTRsYzFrY08wbUU1Zk1zbTgwcmhH?=
 =?utf-8?B?d1ZSRkxjR3ZQdW0xMUdZaWoxbU5UQ0duN3ZqZEFibGZJc1g5Y2E3U0dJOEdU?=
 =?utf-8?B?KysxWEFncEZRc2NsbE9NOGRLRFBvamR5WFBaZGZjNEV3U3ZrS1I5OGlESlow?=
 =?utf-8?B?VTVSTHUvWnYrVTJlVXVqL3hJUDFDZ1pmMUdhcGlReTI5d09oK0RsRmhGeTAw?=
 =?utf-8?B?L2JlOXlscWZxOWN6QWcwZTh0WkI0QTRpVFFZUEVGOCtKUXh0a2NOajcxNDZ0?=
 =?utf-8?B?UkFqV1RzSnRzVHRhVkhjOWdKRHRyUlAySGZDcUZNRXVDTVVNaHNOcmtCMHkr?=
 =?utf-8?B?Mk9Rc0RKTHNGdTZ2aGFPcjYxMVhwTldLRE0xcUprTmUrMThxYVFKRzR2L2VG?=
 =?utf-8?B?Y2YrY1pVNFVIV1cxZDZiNWZITEdGdGVuYnppV1VaUk5SSXJKN25LNXZ0SXBC?=
 =?utf-8?B?c1J5bHhTcVBhWnBZWFp1aHE4dkZWaHdlbWVaNEdlMDVFSU9HK1I2T1oyM1Nw?=
 =?utf-8?B?QVR2cGFscTFtaE1sb3lYSW1xbDI4R1NYaWtTQnB4MzdFVWZmMDBNc0N3YTRi?=
 =?utf-8?B?dmVrdWprUENIamVIbDgwR2JKWXUvWWlLcDVoU1JXYnVkeWMzUitRaW53bmVE?=
 =?utf-8?B?MzZlRjZxTlVKdnljekFOREZOb1Q1eVVNK3dZb3VLTldLN1pwK1FZb2I3QXhI?=
 =?utf-8?B?SENUWDh3R2Z0M0MrS3YxWEZ4SDRUemt6ZDRqU3NLWU0yakNCdUFjb2lha2Nu?=
 =?utf-8?B?Z2JJNnc2UFgvbmFoYzI3UzUvWUtMb241WVNTTkJRbnpmMnIxSG02V0NKaE9H?=
 =?utf-8?B?djdaMUZFWnNhMXVsTDhHalBaMnlqWE1zU0ZmcEpsMDBHQ29rYnMwTndmcWNK?=
 =?utf-8?B?dkp3d042L2VkZ2d1bHNINWczV3pNclN6aVRtR3dGYUQ1cDgrWkI0aVVwTEsx?=
 =?utf-8?B?Q3VFTGpkeU5xVlFkVU5DcitFRldqSkhMNi94SlpPQStCd1MvTzZsdVJCcWNY?=
 =?utf-8?B?Z3dzV3JjUGFLbVI3QmVmYW5QbXZCQnN4aDlTdVUzRXJWWE5yYURkUjdENHBr?=
 =?utf-8?B?ekFTWWVlT2k3OStXYWh3QWlMT2Q3aFMvSHZxTVk3Y20yaVBDSFRPanJ0V01x?=
 =?utf-8?B?QTdvVTk4cC9tS3RLODYzTitOdVp3UFNPcWlCQ2RwNktLVWxmR3BkL2dpVzZo?=
 =?utf-8?B?Vm1IUlMvb3l3QjU5K2ZsY1VOeGV4YVh2U2d4a0pPek1TNVM3dUJQUzE3Q0lZ?=
 =?utf-8?B?elp3OUVEL1N4WDBMdE8ya0dvdExXb214YXFzMmJHRDJzOEZxTVViQXNtNTJr?=
 =?utf-8?B?VEREVUpOT09sSFVHNFpxbmV6V1VYa0NMYS9mNTNlNlRuekQzUGVYM0tBK2dR?=
 =?utf-8?B?aGdBcStmN3pQM1Q5Mm5xM2oxb2lkeDhlOEx2TlIyQlFtV2s0R1VtSE5BSkww?=
 =?utf-8?B?LzdlYzFZZTBlSWI0TDhrNUhsSXMrU1huZGF3d2tYaWdnUUtZTmdXUmQ1V3Bw?=
 =?utf-8?B?elFLYVJ0RFlQZ2lBNDQ4ZU1iTkN4UTFZeG5RTzlQTnVpbWQvNWFnbi9sUkpw?=
 =?utf-8?B?SW1KZHovYUdTT3dvTFJSendRT3pzRDZrUDRTR3BQRnVUaEZiWm0zUGlaL1Ez?=
 =?utf-8?B?eEtqaWVZVU45S1Fwa3hMWUlETGlML2tUZlpQYTdPY0xkRHNFbVdxclBTdnFt?=
 =?utf-8?Q?/Ml+rWmOsyjYbvME1B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c8491c-903b-4ada-a742-08dec8a37feb
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 16:56:08.5664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h739u40VKdXP92fVOG65HMUJk4oUsA5DGaS9gxfaPoISs5/ywFadNONT2j2VeJNt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9828

Hi Reinette,

On 6/11/2026 6:23 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/30/26 4:24 PM, Babu Moger wrote:
>> Customers have identified an issue while using the QoS resource Control
> 
> "Control" -> "control"?
> 

ack

>> feature. If a memory bandwidth associated with a CLOSID is aggressively
> 
> "a memory bandwidth" -> "memory bandwidth"?

ack.

> 
>> throttled, and it moves into Kernel mode, the Kernel operations are also
> 
> What does "it" refer to here? From text it seems to be the "CLOSID" but that
> does not sound right? Should "it" instead be something like "a task with that
> CLOSID"?

sure.

> 
> "Kernel" -> "kernel"?

ack.
> 
>> aggressively throttled. This can stall forward progress and eventually
>> degrade overall system performance. AMD hardware supports a feature
>> Privilege-Level Zero Association (PLZA) to change the association of the
>> thread as soon as it begins executing.
> 
> "change the association of the thread as soon as it begins executing." I am
> not able to parse this.

How about ?

Customers have identified an issue while using the QoS resource Control
feature. If memory bandwidth associated with a CLOSID is aggressively
throttled, and a task with that CLOSID moves into kernel mode, the 
kernel operations are also aggressively throttled. This can stall 
forward progress and eventually degrade overall system performance.
AMD hardware supports a feature Privilege-Level Zero Association (PLZA)
to change the CPU association at the user-to-kernel transition, so the 
kernel execution can use a different association than user mode.

Privilege-Level Zero Association (PLZA) allows the user to specify a 
CLOSID and/or RMID associated with execution in Privilege-Level Zero. 
When enabled on a CPU, as the CPU enters Privilege-Level Zero, 
allocation and monitoring for that CPU will be associated with the PLZA 
CLOSID and/or RMID. Otherwise, the CPU will be associated with the 
CLOSID and RMID given by PQR_ASSOC.


>>
>> Privilege-Level Zero Association (PLZA) allows the user to specify a CLOSID
>> and/or RMID associated with execution in Privilege-Level Zero. When enabled
>> on a HW thread, when the thread enters Privilege-Level Zero, transactions
> 
> Could you please use consistent terminology throughout this series? This patch
> uses "HW thread"/"thread", the next patch then switches to "logical processor",
> and then by patch #4 the term seems to settle on "CPU". Could this just be
> "CPU" from here and throughout series to be consistent and easier to read?
> 
> What is meant with "transactions"?  Is this just about memory transactions?
> Using this term combined with earlier "memory bandwidth" related problem description
> hints that this feature just impacts memory bandwidth allocation but from what
> I understand this impacts all allocation (CLOSID of all resources) and monitoring.
> 
> Could "transactions" be replaced with "allocation and monitoring" and be
> more accurate?
> 
>> associated with that thread will be associated with the PLZA CLOSID and/or
>> RMID. Otherwise, the HW thread will be associated with the CLOSID and RMID
>> identified by PQR_ASSOC.
>>
>> Add PLZA support to resctrl and introduce a kernel parameter that allows
>> enabling or disabling the feature at boot time.
>>
>> The GLBE feature details are documented in:
> 
> "GLBE" -> "PLZA"?
> 

ack.

>>
>>    AMD64 Zen6 Platform Quality of Service (PQOS) Extensions:
>>    Publication # 69193 Revision: 1.00, Issue Date: March 2026
>>
>> available at https://bugzilla.kernel.org/show_bug.cgi?id=206537
> 
> Please follow same style as what you used in the assignable counter enabling where
> this URL is provided via a "Link:" tag and then the text can refer to it. Specifically,
> 	Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [1]
> 

Sure.

>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v3: Code did not change. Patch order cahnged.
>>      Added documentation link.
>>
>> v2: Rebased on top of the latest tip.
>> ---
>>   Documentation/admin-guide/kernel-parameters.txt | 2 +-
>>   arch/x86/include/asm/cpufeatures.h              | 1 +
>>   arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
>>   arch/x86/kernel/cpu/scattered.c                 | 1 +
> 
> Please split changes to other subsystems and make these changes
> obvious with their own subject prefix to avoid sneaking changes into
> other subsystems via resctrl.
> 

Ok. Will be two patches.
1. For Documentation/admin-guide/kernel-parameters.txt
2.  arch/x86/include/asm/cpufeatures.h
     arch/x86/kernel/cpu/resctrl/core.c
     arch/x86/kernel/cpu/scattered.c

thanks
Babu
