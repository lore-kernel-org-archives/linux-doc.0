Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902103BB670;
	Tue, 28 Jul 2026 22:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785277262; cv=fail; b=n8PajALMv+bGntoLD+FutnwKXmQBnws2B3mpmaEd9VnpFxbakrXudGUNKmvDHHwhDY+LE05iJ0GsPcJdQXy89i5zWMVB0fTru0tqTc3z1+hnLeGsAn8tjT5DdPb5GGAzNtcCGelhusfN4vcibGwzSeEO7ONin0jWAcWjNXEc3Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785277262; c=relaxed/simple;
	bh=aGV+PufeODlrndvl6obk/oG6w1sA3ADTm6o+mFvDO3M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YsUlyTOSS+LTghWaC4kYxzC0qGtdvd5pIef5GqmU/HoMP/8JBPVQnKgb8qcXLlaYRJ7/chQGa2aNdNP8wTHnE9U+3Wy0cIWLm1omByrYPIvoN4+TcV/IBrl/TSxQCqiYYMlObseeUSaUtEf+MKn2AAbGc0tlWxhlfdgQ5/JIOEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FR5QFSRY; arc=fail smtp.client-ip=52.101.48.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FR5QFSRY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rt2+6xls+XEcKd+/01Omo7HH5et8SdRlMMlovWOrDHfWQOS0KC+vQd8jqoOdoTlJQLVOElKfvR+0dE1susQaAENx487xMufCQkbrB6sLAlveG8Js8v55TPCXaH7ZCsdKHPHyf7cx34fSQ+j6uwFwySPWRJkGPtDFDSHlbetsjsf5DUlFGYqET5iG60yCAeQCUATUDyeTAyFfMUbD76vHutAQzy5ekA1UZ3EbPgE9Pz6MsXwyA5H6VLZzsKIMeUUzqcuzvvqE54h/4uVR740jAIog+2NSEmNdyHLtHfWoTkYCwZz5HfB/Us+OE+W7qFeev0LKjASjwqUbHZyX9x1yOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCtKv4N4l+GYe37EKQdktEgP/Nxyj+T3r5+xfTvX7Cs=;
 b=LZR1Uc8fHLDomom0rlhKzjpdYVubPI+BeKmMPJRPARVRyt8gSSQ6ED6RO84Mb54mmMcRugt2+KJ62BNtOf4zC3YGZFCnK+YXQVyKrrYgAt6ws5Tiperd0KAeAGU1L5PddBtEm/VH/OSxYSxncAP4dT9MdEwX+chhT1lh77sY5mXgEfmivTORkn5lIYhI9jLk5MoWRGrBVvJTQSuN9p4JQyVR126PoTkEjExSqOVfJfCdDCGkWngOnBFHwL/bt4C5X8cOOi32OGOSYFjQyKOmnLW2/oyzFyMELmzWaNRzKzslDOkJnITkpJbrhNHPgFpTjhbc/Xozi/Fc01Vg/GymPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCtKv4N4l+GYe37EKQdktEgP/Nxyj+T3r5+xfTvX7Cs=;
 b=FR5QFSRYgFjQtOKwjkeU3pN9pH9PirYKOCCAn1jyaALL9cINp3bWimFBb5MweLrPRSOfRDtKALhaw8Qu0hUzPZ8oW45g4bakVNBe+kgWrHTh4b/lBadKA0cVzt+A9XqXHVO384s19EBH4PFohoV+HMk9KRXc2w4EIlCcbZb2+Mg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by IA0PR12MB8747.namprd12.prod.outlook.com (2603:10b6:208:48b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 22:20:56 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 22:20:56 +0000
Message-ID: <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
Date: Tue, 28 Jul 2026 17:20:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, "Luck, Tony" <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>
Cc: "x86@kernel.org" <x86@kernel.org>,
 "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
 "james.morse@arm.com" <james.morse@arm.com>, "corbet@lwn.net"
 <corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "Eranian, Stephane" <eranian@google.com>,
 "peternewman@google.com" <peternewman@google.com>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
 <20260728191818.GBamkAeh7BD1d6Gd8X@fat_crate.local>
 <2c098892-5d4b-402b-bdfb-59e3bf164c8d@amd.com>
 <SJ1PR11MB6083636E406ABF9F64CE3F25FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <73737438-01ed-437e-846a-5aa8bd687462@amd.com>
 <SJ1PR11MB60835A80CBA4ADA35A617EF8FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <7495c998-4f3f-4ea5-a383-350584afb42c@amd.com>
 <6d006c4c-907a-435f-ac94-32974562ce2d@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <6d006c4c-907a-435f-ac94-32974562ce2d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:ef::9) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|IA0PR12MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: ff645a2d-96d5-43ba-a227-08deecf67e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|23010399003|366016|376014|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	vGVmnEYqavWbwx5K0Pm6ztYaIcBrGkFDmNb4FglZRqHhNq/QeAOt+8zIBtYLvNAQcAbmf3pvEdD2z7COXqS3bGghkOKnAe/UqPQiInd9y270ijI54ioA5H4XUwU60i0R7BPqeBjT+2UGtoMKk+WljGP8tVRDr9hFAur0WUcy3pjY99zFmsLJeOBgdD2AEX9m8diavOSpONuK2B67/hENmymMi+zzlBjyirx9FFxFBdLewV1MTsbeM8O47qDkl8sN1M8xdK6+GU9kA4T01aXx/S2jXxxWgI3D0Y4GunxmUAhZKf7I1RJVjpsxS3EKS7hlv8Yr4AUVLfNVqnKMVFWvEK0JP5C0isn46OWUAIADCd9ExgSGlxfL8jq835B9UdzP8hnHEWdsA951oGQRnthb2XSg6n+9KVQSz55llHN1TefLP80JyqE0hxOTKCpT8i9Q8N83PK+Wh2hdoaFchhGEpAfKGlGuinRiIqlGAUYWOk12D7bFBW4IuLvz4SxOOxxKsp1OWyrt2MJ+5Xxgae1TQOZ88e79fcpNaQRue7/yp0x3g3JMPFW5voPhIby50xXi3UvMaj30+A+PNCXRbeuO/9gZ2pGVPW5en2zklE5zVREr67cruRkqdEVSwLXIKolAq56efbcMBzmDAYKijI7/XU4mU7C2nh9tFO2/yAZyN18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWRiRzEveVVFQ2o1S0xuVittYnFSdVVja0VRZDhkMytqak5QZ0F0akhYR1Zn?=
 =?utf-8?B?QVV3YURzZ3ljclZmR01jOTcvU01YOHRqeDNONnhwejFKN2FjS3V4aUFLdHRO?=
 =?utf-8?B?NGZ2UnBKendtbW93ekFQUmw2K1JZZEFKb2lJR21UOG55TnpYNjNHdTZseHBC?=
 =?utf-8?B?NEVHeVdhMlA1dytqOEk0aC95bWJsYjNHME5vSU0zMXRlY29rbXhLa09tbkJN?=
 =?utf-8?B?VjZUeW9SRmtEZTJEODFHMVJ2OUovSEVFYzczOE9McDcySDVXWVNJUWlxZHlE?=
 =?utf-8?B?RlBxejVlcFQ0dUp1YW1WY2FUU3p4Tklvc1FmK1NBa0VIT1FWV0hyYzhTMFNQ?=
 =?utf-8?B?enRlWWV0Z3owQ2NTckd6SmlGNG9yZGxsZkVtaHBUaDd4elhucUFCMkdpMzA1?=
 =?utf-8?B?NTM2c2xlR3hBMC9PVGtxTUl6QndxRk1qOTdpbUl3M2lTa0xhZWxJVDJ1ZFZT?=
 =?utf-8?B?U1c0UlROVTZlSWdSazYrd1hlTW9JNjkxMnUzcUJBWUd1MHF5UGdDbE9vcG0y?=
 =?utf-8?B?YktCTExXUGNidHFHSUthMnVVTDkxK3hZMVJ5RUkxVVBRV2M1aDRwL2h6T01u?=
 =?utf-8?B?MkJ0dFhxbGJhYUZKdzdPeFUxdE9hcGdrNDRVOEZmT0hMaXN3WmU4aUhIZ3hD?=
 =?utf-8?B?b1g3MkNOMGpUL3o4YXA0V2JLMk1ybWRURFBocnY2eTE3S3ZkRkRFVWVsS2V1?=
 =?utf-8?B?dTRFaDVha3p5Y0JEdkh1QkZSZzZ5eFBvbW8zU1FOcmVJdGF4UG9uUWxtQ3Nt?=
 =?utf-8?B?VFBiN3kwWEV6RE5WZXRwSlBEMGg1ZFA5SnpCd0ZIK3ZsZlEyT1VTQkduZC9U?=
 =?utf-8?B?eGdrY1had01SZVhCWjJDdGRlYk5pVW9ZV004Rnc1Sk90SHQ3WUZvV2VpRC8z?=
 =?utf-8?B?RWN3UVYyMmpIRWxYeS9sc1UzZ3g1N1RMZFR5UVFxL3VBVnU2MzhKYTVYZWdh?=
 =?utf-8?B?MVFENUVZbm50eHpzbTFBZVJxN0RkZENKNmF4eVJOVy9xN2tzVHJYYWROeDZD?=
 =?utf-8?B?bFdZdUM0R0RDRWlRZ1BMbFZ4dXpIellYaG1EVmhMbHBlVVpwdmFXY3N5YVl0?=
 =?utf-8?B?R1B1SDA5ZWRpTkZQRm5YSHJZbzJHZWttRGRWa3F0OVlrSUF5bmxpU0crUGNx?=
 =?utf-8?B?dU1oSUlhSGtobDBzS3drNmVPN3pvSktIaG10RThRMzhrUzZLanVSamxPZndi?=
 =?utf-8?B?Y0c3TE9CQXloMTFZa2w5NUM3aUxjaUZ5eWI1YU9rR29RaWVQeXZ6UGlNTDh5?=
 =?utf-8?B?QmRDSUNmS2xMZHZCTkErTjJzVER6cHQ4cDJBYTgxM2QwTDFSQ2FHQUtCemJl?=
 =?utf-8?B?RXdtU0JJcWQyZTgvVUtvZWJYME1yRzltT1BHQWd1aTBxelFFakRCd0Z3S21J?=
 =?utf-8?B?TnFaZ3haMlhNd056NkFLdG01dzFlVVg3RG12WUJsYWJZUnlPVGZOVkZFM0FT?=
 =?utf-8?B?c1d1QnFCcUZuY2dsVHp3SXY3N0pEVjZnV3JLNG9rVUJBN1BsaXFsNlBYOFA5?=
 =?utf-8?B?L08yWDhqSGJOeHBSZDM5ZU9EUkpITmo0STVDUng5bUlVRmRpc0k5TXo3VW1v?=
 =?utf-8?B?aU1MT1I2RnIvajhDbnB6ZTNpVUxWZjBhRDI1aUl2MmtsWTBNdlc4dUp4NWxC?=
 =?utf-8?B?N042NHNhUW5OTThmdzM0TldTQkMwR0NuVGJ3cktCSjlqS3I0T21sU3BVVE5i?=
 =?utf-8?B?TDAxU1l2TERoYVFlUUY4ZkxlS28yUndSWks4dTNtcFJOalArcThDTVEzbVA0?=
 =?utf-8?B?NU1qRlVxTVZseTJQK21tTm50bVV6MzU4WmRVRmFaUHc4MVZ3NHlpSTF2T1J5?=
 =?utf-8?B?V0lZNVNvZ1A0UnhmWThKb3kycjlyRXVBczJRMjRsWlRMYlpxNmtkcm1LSWZG?=
 =?utf-8?B?aTIxUTdVdjZ1aHVyeVd5ZnE3c3BuSmpEeGVGWjlEU1RMV0Y2a0FhbDM3WVh4?=
 =?utf-8?B?K0dVSVBmOU9GUFJZT1Bic1Z1SG94ZEpRVVdFRy9yNnVNL3NwaFlxUWs3TlpD?=
 =?utf-8?B?S2xFS0dSY01ISVNrbnRpVU94czcxS2ZwaktBWGpJMERYWFVjbXRUZXQ5eTdt?=
 =?utf-8?B?Y1U2TDdqV3B3blh3aGFQeE9VeTFHaCtmZHZpWHNFeDQ1NGRlZ24zUXltMXo3?=
 =?utf-8?B?d0xLbEhWWFh1OCtjcWZXTHZMS1Rqcmc2SXBNVlcwYnloZUw1RzZBakZpaGdE?=
 =?utf-8?B?Q1I1QlppOHhtcjJFdWt0NXVhL1B6ZnVMSWhMRzdmcHhKYXpUQis1TDZqSjJy?=
 =?utf-8?B?dnFyVjVIemM3ZEkzcS9GRE9UeHl0dmhqOW5VT1ZOdnpaTGo4cVFEMzNwMG56?=
 =?utf-8?Q?v4HwBeyRFm2sxssI+w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff645a2d-96d5-43ba-a227-08deecf67e9a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 22:20:56.4611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLYcB/wSnR4T+yNbmszlFLYGjceabyBnAuBHi0kX3Q+Bp4O/5y23HCXp2RYukDvN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8747

Hi Reinette,

On 7/28/2026 4:58 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/28/26 1:43 PM, Babu Moger wrote:
>> Hi Tony,
>>
>> On 7/28/26 15:24, Luck, Tony wrote:
>>>>> 1) Does it start over from zero?
>>>>>       Seems a sane option.
>>>>> 2) Or does the monitor group see whatever the counter was at
>>>>> when being used by some other group?
>>>>>       Seems less sane.
>>>>
>>>> As per this code, it should start over from 0.
>>>>
>>>>     } else if (ret == -EINVAL) {
>>>>                    am = get_arch_mbm_state(hw_dom, rmid, eventid);
>>>>                    if (am)
>>>>                            am->prev_msr = 0;
>>>>            }
>>>
>>> Nope. If you want the value reported to the user to start over from zero,
>>> then prev_msr should be set to the current value of the counter. That
>>> would make the next read start from zero.
>>>
>> When an RMID is reallocated, the hardware detects the state
>> transition and the first read returns "Unavailable". At that point,
>> the counter is reset and begins counting again from 0. This is the
>> expected behavior on AMD systems. Therefore, setting prev_msr to 0
>> is the correct behavior.
> 
> I believe Tony was curious how this looks from the user's perspective.
> 
>>From what I understand it is neither of the presented options but instead:
> 
> 3) Internal cache of hardware counter (prev_msr) is reset when resctrl discovers
>     that the underlying counter has been re-assigned.
>     There is a separate software maintained cumulative count to which the
>     hardware counter value is added as the event is tracked. This cumulative
>     count is the value returned to the user.
>     The user thus always sees that the event count increase and it is
>     guaranteed to only increase based on a portion of memory bandwidth
>     consumed by the RMID/event being tracked.
>     The returned (cumulative) count will not be accurate if the underlying
>     counter was re-assigned. The user does not have insight into how long the
>     underlying counter(s) was assigned to the event being counted.

Agreed. When this happens, the counters will not be accurate.

Thanks
Babu



