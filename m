Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011060.outbound.protection.outlook.com [52.101.52.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC57125CC57;
	Tue, 14 Jul 2026 22:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784069294; cv=fail; b=lexqqr7MBSU9cTPl83iXNjGQDmNCVaJFg3heR0I/ykVgTk6zA9kNkSauU1Xd76PxDo6WAOnQuX1rGwyPXEHr3uBcXW//Bh6lqcXdMopusgp/kVe1ARbV2+PwhSlwaqaFjU2ESnhMaSdZYYBTKDCisS2/1ycTw7kPFpM87i3IQ0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784069294; c=relaxed/simple;
	bh=PnKIwm4V93tnonydhACDX6JHCDHDkxnK/hPaJu3Zs3w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nTCH7St2GtOdHGcpnJNRu6ZTGc9Tz47iEMLgEy/iLdEm5ONRhGBAGTeZbRsN8A/vS21K4ZOY3RczfFE5LvD+vZAJpQSoSFtFQyWd5FExCiuwTI5+a51xHbBfLeZDQp97Rz0RmVhpY8ro3SYJM7KN/eBy3niPdDVSlXE9wtWLp48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UVNnP1cs; arc=fail smtp.client-ip=52.101.52.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UVNnP1cs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdNNdnHizFUYH3oYsoiF7MZKNNTVcvbY3SkddE8sglTDoN9JFKuieDONZAeOfc1MwHOCK/x5sVrred1Da+Vy4HSAndMc1KF85OpEZVP0TqqASoYf9w6z6ibUhTxQK2ILYnipGZFykCHjwUylE6RYThD/DZhC04z8Uv9D54y3AOvo9PcBUXRdSqe4t1Vi2CqpN2aM4R9ZihW2Np76c8FedGeHlpLdnU6Fpq3ZypMK3KiWK/4OFkaSNGA7fZZzoqL/EVZX27LUqrdAETazff7uxVZUPAMnP0hmb3B9yrILPcezB9r08xte6YSegJXcLYYtCYoOX9/poKH4Y6h41G+qnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/016gnX2VsBB/Cuk8uUc00cQ1MUYddZdoXXIGpmReCA=;
 b=dNOen3OEIuVYM6NlE0hCPwu+SKRglSmXFECRMoB/fscGLl+4pur1QrMWulDf0uaXUGVxIO114IofkNuhpr8g0Ktd20T4om/6m6czG9jW5nPSTkVcbnWfIlWJK7V0f18liMkGZx2gy2ZJBEDsvS6XaHlidK2vJaJ7JejKjLi/4iw9MPZHuEtRR4DcHKcfNVhlm5os6nX19JPb2VtAqUJCwVRSorHjL374++NvZVynHR9t+suIDcVucyOrCiZoeh8X/dkR7tpz99dM/2Si3anWlpKtfzeBHPlg8YtI0R1D3JBDFxqus3fNd2EVG3i5CDonlZVyhtv8dvA1xPjZyfPXBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/016gnX2VsBB/Cuk8uUc00cQ1MUYddZdoXXIGpmReCA=;
 b=UVNnP1csrgECU1jaVfOYm6yZWOncXW3nQi+r8wXbxIfYxrVy34hG1Zwco/a/6GekeVsBTwlSMbh9YBxUCVUHTVvoHpi/4Bn/ZwRZSJ7BLAtu5ZL2xt480zM/D+RmRydB/ix9JmMYMejwGW9xaTmJS5mOYYBRFPinnEZtUohTVfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by LV3PR12MB9093.namprd12.prod.outlook.com (2603:10b6:408:19d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 22:48:08 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 22:48:08 +0000
Message-ID: <2cad039a-63ee-4340-a9f7-d8aaeeda593a@amd.com>
Date: Tue, 14 Jul 2026 17:48:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Reinette Chatre <reinette.chatre@intel.com>,
 Ben Horgan <ben.horgan@arm.com>, bp@alien8.de, x86@kernel.org
Cc: james.morse@arm.com, fenghuay@nvidia.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:610:cc::23) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|LV3PR12MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a1607d-2929-41d0-a7f5-08dee1f9f992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|23010399003|18002099003|22082099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dfS+jWQmFP5Bk1jjLyy0Wj8rStUi/X12XARCGRhqRYKS/WU/L3J4A0ksm1r4gtOLXE7XrKCC3FYtmznhgJtLr0LgIC8/iMqxRpg53zvjhlaXm6btTOF6diZiV6tr2plB585ZN4ZdARmjjR/8wxXsPYnVo+0aiqXSF9V7o5tRnM8SDS+RuDAz9kJv62WubfoIQ78FDK0xgV24GUOtUttYJ2moMwe/ORtQeL/tiUC/3qLbTCmdyz9QasiQH4CETxqre6+Zz2RZMdvh5kIYKPvsxeIEv/65sWuVxvBdF+enqmpsdFffoNow//Afuh5CBt3oEFz2qZmAzxsaeF478XvCuWktOoXX0ppIRQwF/+hykIdZSCekgXPZ8e5KDgKCaQj/0LVmQj2wZRrFnPw2/Zymiar2cMMZQ3V2wNML4y4vRlxiHIuqBF+hXaydoREoPuoXK5GYa2EkSnVdskdS8txhW6HmD89BQf3dSzF9MeXHTyQOcOSyxRjwhR7BSJnxHY8qDtGamCz5kqiZ7Hchg2BbUVXtsDy8ILucNnOlVQSTYxxN+ZZkyxKuUVjPyS6nK7RgzOcnZudRHBel1+V1zCyZYD+FSdVshG8gc8WdqbX7ov1HX+RfI9Emxzyk3CfSeiyQn4WDGyNW7iOBXHAfTSCdnrpZ7sN3Sk3TQDRF9za3aeQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXZTWm8zTEJYd21CeWxpZXhSelRHRTNmUndDZVorNEpveHpIc1VJL3JJVTJn?=
 =?utf-8?B?ZFNjZFBnSlF0cG5iY2tWajFZZHV5MXgwSk9wZ0Q4QUlzK3ZxWXQySlUvdWZw?=
 =?utf-8?B?cXRLY21SL1RHV3A5UVMxMTRuK3h0ZWEvRGVNQkZwWDRvbnZmdFlCZXcvTGJr?=
 =?utf-8?B?Sjl1dzVoTkZHWTJmaWJzeEJ1aDJtaXZ1WmtBNS9VYXdsL3hQeDhSZjdqNlV1?=
 =?utf-8?B?VlY1MGI0Z1FXZkhwc2ZhOXFmcGQ3LzBncjErbWx6SS9kU0lDQWVxWExCZlg0?=
 =?utf-8?B?NnBRVldkbFlhZlY5MGJhSHFFeHBHY01CWVdxeXpZd0pjbXJVVnd1V1dpdVJ4?=
 =?utf-8?B?ZzhTNGdjNlZPeDFiNm9iYW02cHA4MGhQdytDdDM0VUpOeWhkeDFucFpBd1Zm?=
 =?utf-8?B?eVNhQ0s0NWxTS2FxK3pkOEFOVjRhT3o1K1ZvWmpTc0s3OUhQU2JpcVhZVkEz?=
 =?utf-8?B?T3N3ZXJpOENRalovaENIMFBPOHYyT1FFNHI5RmpqTU00M1FsVDU5dXE2Ujcw?=
 =?utf-8?B?SUpvUGVuaVZlbGtPT1d4Uit1MkRzRGx6T1BsSVBjU2RhOFNLdmYwdHY2NVpQ?=
 =?utf-8?B?Y25tNmNOSjFlYU5vYUZGSU44MThVc3BlZUQ2ZlRSTmVJNFJvTVd1ZmtwMUVz?=
 =?utf-8?B?YUxQV0Q4OUhjbkRTdjVBeTl6OWFnRHN3YkdHeUpDZXgzSFZra2crQ1dOaEp3?=
 =?utf-8?B?ZzYrd1ZVOEtyRUUrb2JKYTRuRGlmSlQvb2RkUDB0eDhqVWxPeENPZ1lhUGdX?=
 =?utf-8?B?R3VoZ3dWY0JycGExZXR2VkxrSnFpNC9ubHZpb0VrZEtpM29lTlo1Q1lNNzVy?=
 =?utf-8?B?ZlVnVTQrdE5BTmxiR2pZWEFURy9PMEMxcnprd0Z1MDBJMHJMRjlwblRocGsv?=
 =?utf-8?B?VGJlVjRZR0RRMjBVYzd1RFNOaTVReFEvVTFKWHZnTSs5REZ5UnBOdmYyZ1o5?=
 =?utf-8?B?alRHOTFIZUN1QThLS0hRWFFFdDlJYnN1T0dVMmdHcWU1enZzank5TnRidVdw?=
 =?utf-8?B?WXc5YVQ1aVAxRWFDZFVRRGpVeHR0T0ZUcU1sR1FlYWdWdlYxWEM3Ti9Lb0VP?=
 =?utf-8?B?ZVJtYVY1TU55VDZnUCtYRkNxczFDaWxPNmVjNG1MSHVQK0RHSGlvc1RlUk0z?=
 =?utf-8?B?U1JiZXMybUx4cVJoRHUxMVQ0OVNndEsxNlRiWnY3M0FpOGVZa0FyYlBLUVNz?=
 =?utf-8?B?cXlqT2V2NW9RQUhMY0JKS3djOEp1S1YvbGxsUU1RMG9CK1FsWlRpT1hWK09j?=
 =?utf-8?B?bGhJcU9Nb1Zvc3YxVEdIUVBFZVpoMFMzK05pWFo2b0FUVi90bWRoNGNGamVI?=
 =?utf-8?B?dk5oY1hNZ3RwMVdTU0pCZmM1ZlVhR0dMUkpRQlJqNklwNWVKdnRydUJsblVz?=
 =?utf-8?B?bkd0QWUybVlxT3VsOEt3bVBmMzZjTFlVT3hrNjQ5WFZ0N1pNUlhnMkxhV1Nv?=
 =?utf-8?B?c1F2ZHd0UW9oZ0JNWXBnVnQ1UjVxYmpFQWJxeENsdGJNLzU3UjBRNDhoaExE?=
 =?utf-8?B?UGdMUnFPcUY3eE9ydVY4NlV2Q0Noa2xFWG5lWGpBQjFLdnA1S0UyZCtjazRE?=
 =?utf-8?B?TUNUanR3S2VrU2lNb005MHc5Zll5R00veXdWWnlrZjBNZjExOE42MGpYV1pp?=
 =?utf-8?B?UVdBTnVTSURtR1BPaGxaOHlDMkFWYyt3bDVCeHJSMFZWeU9zMmhBZ3p1MUhX?=
 =?utf-8?B?ejI3cFhsbDVaaUVwK1MvRjZoU1NBc2k2SW04ZWxhN0NXRkd4dGFENEpnZDRH?=
 =?utf-8?B?V21qUWNIU2dtQXpxbS9tcHk0NHZxeXhsZmJqYndWZmhodzVPQ1RlT2Q4aXV0?=
 =?utf-8?B?VU5PZnNwRS93OTlQMFNUdXlLdWtjdFhTaENOTUVtNkJFQTlWZ1psWjRiMUsy?=
 =?utf-8?B?YWc1Y2w5elJNUms1UmJpZ2daRk1mMGZwLzQrcFJVSUp4Mk5Yb0wwYVR1ZFh3?=
 =?utf-8?B?Y2tUK1ZISjNDZ0hpUG5ZcmthSHlFeE15NWVLRnBuanNvUzFMdk9UK0pmVUJt?=
 =?utf-8?B?dXVrd1dnNVNxM0NnTElmR3VHSHlGRnRBdUFuWm51VFBDU3l5VXlYSmlPa0Nv?=
 =?utf-8?B?akpONWo1RjF6eGRmREw3ME1maSsvbzBDa2t4MWYwR0QzTUNoTDNsR0x2d0V4?=
 =?utf-8?B?RDgvb0Z6NjV6SDVXRitnV2VmNlVJU1VlUkVYdXFCcHBjWXgvRFErT1VJVFU0?=
 =?utf-8?B?TGpJVzgxbEZKMnd4OWplRFNFc0Y0c29MbEdCZ3BGekZ5TzdSd3ljejR4WlR5?=
 =?utf-8?B?NGJQQzM5Y0cxQS93cFpRR2FwTE40bXYrNWlCWjNhdEp4S1U1VFlRZlRZTXA4?=
 =?utf-8?Q?FU1+VmdMT206mYZkMG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a1607d-2929-41d0-a7f5-08dee1f9f992
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 22:48:08.7514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2Lq+e5JUXCAfCMCS8+4+PUEESTv94CE8mrt5tqcvOlHFw5G//Mb+RbWve9jS0G9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9093

Ran few tests on the series. Everything looks good.

Tested-by: Babu Moger <babu.moger@amd.com>


On 7/14/2026 12:45 PM, Reinette Chatre wrote:
> Dear x86 maintainers,
> 
> Could you please consider this series for inclusion? It applies cleanly on top
> of x86/cache with HEAD at
> 	 2566b5cd6a27 ("fs/resctrl: Fix UAF from worker threads when domains are removed")
> 
> Please note that this is the first instance of a series that touches resctrl fs, x86, and
> Arm. Since this is a resctrl fs API change these patches should stay together. You will
> find in Ben's message below that patch routing via tip is supported by Arm.
> 
> Thank you very much
> 
> Reinette
> 
> On 7/9/26 2:31 AM, Ben Horgan wrote:
>> This version fixes a couple of non-functional mistakes in v4 pointed out by Reinette.
>>
>> The patches should stay together so please could this all go via tip.
>>
>> Changelogs in patches.
>>
>>  From cover letter of v3:
>>
>> This is a new version of Dave Martin's patch [1] to delegate rounding of
>> bandwidth control user values to the arch code. As there is now more than one
>> architecture using resctrl, I split the original patch into two, a core resctrl
>> patch and an x86 patch, and added an MPAM patch. Please let me know if the patch
>> break down and ordering is sensible and whether the pattern should be followed
>> for any future similar changes.
>>
>> This does have a user visible effect on MB schema when using MPAM hardware
>> with 'bandwidth_gran' greater than 1. I'm not sure if MPAM hardware with such
>> coarse controls exists in the wild but it is spec compliant and I've tested it
>> on a model.
>>
>> [1] https://lore.kernel.org/lkml/20251031154225.14799-1-Dave.Martin@arm.com/
>>
>> v3: https://lore.kernel.org/lkml/20260515140612.1205251-1-ben.horgan@arm.com/
>> v4: https://lore.kernel.org/lkml/20260706160639.2136674-1-ben.horgan@arm.com/
>>
>> Based on v7.2-rc2
>>
>> Ben Horgan (1):
>>    arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()
>>
>> Dave Martin (2):
>>    x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
>>    fs/resctrl: Factor MBA parse-time conversion to be per-arch
>>
>>   Documentation/filesystems/resctrl.rst     | 17 +++++++++--------
>>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
>>   drivers/resctrl/mpam_resctrl.c            |  5 +++++
>>   fs/resctrl/ctrlmondata.c                  |  6 +++---
>>   include/linux/resctrl.h                   | 19 +++++++++++++++++++
>>   5 files changed, 42 insertions(+), 11 deletions(-)
>>
> 
> 

