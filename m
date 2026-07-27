Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7783DEFF1;
	Mon, 27 Jul 2026 22:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192291; cv=fail; b=f3yatuXxSAaOlp1VA1XMRgokIrm8ZFwwMKnlPrVJaSdnkv/ogbHauwsKewX7qK9Y0zaZaVrVvh2gP9l0FH7PFN5yKGvGbSzWQptcHX+yxiWqGaUJIXz7FjPBh3TJEUBlC2OwpAWE9r7zyrmRZdJthTuYcjR6YdyOW2SPHEDkxHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192291; c=relaxed/simple;
	bh=+cYXDLllUjuAwFRO2SQB+x+PyHZCsgEzbuSos6vcFuc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=peyL9ML/7MLBLhWWsA3Q70zORNilfvN7RjgZvA6Ky6honVBd1yxQztVPRZGAo1+TwcUVi6hkbxmb42TJdQICpqJWSfwj3bm4uEtcoEh3qJQrKkFLuzarXUvBesgN2v/VQqOmqgxWsSEF4aAT6oPH3OYQSAAgXPfB8sX3IQxbFvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3Y7x/8I4; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3Y7x/8I4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUke5jAJiCKE7NDJlBF0JXUyxYQBNDb6NmeUvA0LdgFrsYGCo5Ltq+l+ELNAm0f7zT7g22YXkZM4k0ZMAH3xQk0/zJRmX/kqq39xPoPNoo5KKRPmSAqR1JPQuummJLHrMPr1HHiqgjaaJd24PSr9zhQrU1LYXS9D1KhCUQ3R0L/zzdexWfUPZ1DjscKPIUJK0kaL+Cu3N9Oogpi/g7VUr45MAWt9f79qsk1Cx2gD/givG8kiUcgR6g/J39656CGtsO3lvtudDMh2HoCubnGrL4k1JUs8GqAaNpOoUEjdiqrUwsnPqULyAfckp8coQtZvtZVOmPY3oz4k4QA5eBi2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehkm4FR2sQ8dF5UQNdi62WmEqzWMLNtZBALj1pH2GGs=;
 b=dA+27QYAkaaqCo228x6zvf7rbiDV4aSpI+t8WOosN9v60BvjygfKOKbKLAK4CVAD13q5vK/mhEIjnJHq02W3sbOPlJhrLpu2gi8KmBB+YphJQZh3S1O0WvsdjFIg/OSDHubefZg+GZ8bd3aBryxo0hTsmskshgEI8r6zjBN/uBZT8+ASF+lVYlgNH+rBchmclZMELRXKRHUHh8edAqH/b0p5MzkjKXviPO4chgbXEIpaa8KqT1RRd1bKLupEUYw/SupZjJD20oK48GFCmn1AX7Oc1ec61adqF0eLagt9YENgO5s374l2YA/wg4TSy7EqivD1GGb3g/iaiDGWsNKZTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehkm4FR2sQ8dF5UQNdi62WmEqzWMLNtZBALj1pH2GGs=;
 b=3Y7x/8I4zM5CocBJceBz6wGTXviWch/JEc/Vuwfh6tx2KkO0zhlnuaQiFGD26GkRvtFnMn+3giAUJrqi4QCMzt5pq69plgKhRlYK7enS4+Gfim/144cKgBIBisb//5oB6ml8h99Cy0ptGLXyOEeLpsjGcExD3eetiTWN5MsvEaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by CH3PR12MB9217.namprd12.prod.outlook.com (2603:10b6:610:195::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 22:44:44 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 22:44:44 +0000
Message-ID: <d393895a-9763-401d-a04c-90bf15f7e9f5@amd.com>
Date: Mon, 27 Jul 2026 17:44:47 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, x86@kernel.org, Dave.Martin@arm.com,
 james.morse@arm.com, corbet@lwn.net, skhan@linuxfoundation.org,
 tglx@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
 hpa@zytor.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 eranian@google.com, peternewman@google.com
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
 <5a8815ce-487c-4ec3-8c38-d9b3c067302f@amd.com>
 <62559344-5182-4d16-a9ad-e22163b20e7a@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <62559344-5182-4d16-a9ad-e22163b20e7a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0502.namprd03.prod.outlook.com
 (2603:10b6:408:130::27) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|CH3PR12MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: 042dbebc-d4d3-4815-f930-08deec30a709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|23010399003|376014|18002099003|10067099003|11063799006|5023799004|56012099006|22082099003|4143699003|3023799007|13003099007|6133799003;
X-Microsoft-Antispam-Message-Info:
	LU7tZf9F8d95qoGUi/mGYm84djYQRsjIOfmRQT5wh+u1WbJaafkr8Km1nu+jlRdxscBCF5/ZNRY2FsVGkrF/fK0amZDh3nIwNfh8LYWx0YBDz70wiG1HBkKVJMOX7nv6V4VeNQoC+698oO966XTIEQN1QVcTNRDy+yb9u3PUW2VYllEIE0glEUSJz7pcfC2ihg9jDu/C/+t3ldiyBxTJJMOpEW1FBc8I/3IeGqTTdG4fV5dMP+sscDrGJpwo77NG5KtCoTQfgnzspZvxX9+kFv5gVqE+gRntzoKyrZqmEVWn8I74qHJhYJIzLezc3rwFAoGFjM62jqIjfamn2Ocpbnna2hWZpKbEdbFdF2UPqUDLJAanV9MPv2PLqnrVdDGOJjMBFNMTh3Ii1/YXeeQ6RWsi780p4aZ4BAAjOgoknwy2ITdRV8R8XEgu8DlDvyvPFTqrZsCj11gBT6z7gfVAJo7eiyJWZGd988vgG805XR1JZ5hmphfSDihH0z6Kj+8tirT4Hfnv5OLI2nmtjBP0wZpohGWzGfVN26lFUKCAVei47wrSRFiAsPkOzumxTrJGuPehw7aTxn3qvgxH1SL3MavQnL4WCqQAbA6UYG9Wp+yyhecIxMD5rcYiFPWEvumSSY+IbCSeu9G/fw5cNauJ4FMnHTy1TOM6xorqJkeDn8E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(23010399003)(376014)(18002099003)(10067099003)(11063799006)(5023799004)(56012099006)(22082099003)(4143699003)(3023799007)(13003099007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2pzSTRQRnhjNHEzYkxMOHY1WW0rdHZHNElYWnExTDN4U2s1NGQ3dml3YnNB?=
 =?utf-8?B?RGFaNXVhWHlGQkNNODVRVFhIZUZmU2dFZmVGY1hGZlZRVFM3ajNXSE53d2hI?=
 =?utf-8?B?VHliYXNEYlJyNVFoU0FPQ1RIelc0RGlWT0tCTkY4TUdkam5IT3RwSlUxbzND?=
 =?utf-8?B?VU1YK0prNC85NUgxTDZjY1NKK3FVTkdTcityQ2lRNXllLzZ5MThVME84SEF6?=
 =?utf-8?B?QTRPNHNheTNoZ0w5NUdnMXRDcnAxVjlaR2ZGSkdpcE92T25XeE9qaEFUUDlE?=
 =?utf-8?B?ZGM0eEhxTFhSWmJNNzNDcVp5L0QwRXBMSGZDYmcydGdGVFlRbThLWVlXVFd0?=
 =?utf-8?B?UUtBRVZKMnkxV0krak1nSzJITnZ5U3lqVVh5NENJSlpCeGNQWE8ya0NpL0dR?=
 =?utf-8?B?WGlYRyt0bFZPSWlUaHVrR2lTK0lWNFRYelM5MWxhWURWSXN2cVZhSXZmLzEr?=
 =?utf-8?B?V0x5WG40UDE5ZUptSGszNXh5UksxbGwwWFphV3p5UzZlL0hFZ3o5TElaa3Y5?=
 =?utf-8?B?bjJFYTlLenI0bFh3NFJmcStlekhSaUhxSm5hUE1QdGlBTGVXUC9vb3ZCSFlp?=
 =?utf-8?B?b2kvNUxxajhGZnpUQUwyTllLcFkrdXl4bS9ieUxYR3FlM0IyL1VRemtyOTR2?=
 =?utf-8?B?azFGbVczS0hiejJNbHgvUkhXaFRMWWoxeCtNaW5hZHhRS2tCQ0NmbVg3YUFq?=
 =?utf-8?B?SEwvZlBQSVNIWVFwc1Nud1pNc1c4bXF2MnJVS0JENldxUldEQ20ySmVmbnVw?=
 =?utf-8?B?b2xodTg1QXZLVXJQc3NkdmRpbkFBNmZDSUpPL2laR0h4RWJkTmlWM3RsU3Rw?=
 =?utf-8?B?LzZZSjJta3lVNW5zU3pjSGZxUEI2VzJsUXJFSWlFbm5LcmNFWnN4bU9iaUQr?=
 =?utf-8?B?M0tnaUowczhZMHJlY3dEN0RJUlBxS3EvOTNJSmJvNTd2MzEvSnpoYWlwUkkw?=
 =?utf-8?B?azhqRzZCVDlldzBpdFNqUEphcTZTTnY2Uk9WenRneXMrY25nWDZaTlQzMG94?=
 =?utf-8?B?aGFRbXl6djlYMU8ycS9keDNxOHRWQkVEUmlSRExUTUdUVjNvaDBta29KMmVF?=
 =?utf-8?B?NVY3Ui9nR3RFeGxhSVlpQVR6QVVKdjZuR3kyeTV5MFlnVndqQ0FVeUlsSG9Y?=
 =?utf-8?B?cjd1OXNKSkFrWWozQTRLWDFSSFFzWlpMWitValA5eXFSblI4MVB4RGR2cW5M?=
 =?utf-8?B?ZmRXdVlLaWo3UlZENzZTekZlZW9kM0tXblNjSExKWHZ4T0FzeWF1OGw2eFBk?=
 =?utf-8?B?NzVTVm5iR1FaVTVuTktkSmYwV0dTc2hQdVVLRVVYa1dQR2lVbWRJd1F1WWFj?=
 =?utf-8?B?MHFBRFBJc3ByY3c4aldoS3FvZlBGU01jc0VRZHk2djlRc3czeWludmVxekkx?=
 =?utf-8?B?UHZjTWZNS1hZTEFyWmJUM2JwelFuVDdBa213aGVsdmg3MGVwZDZvWTJ0c1RC?=
 =?utf-8?B?akZaTEszaVBEblFTNjhIa254RlRZU3Mya1NSVExSVk1yT0IwaFdKcUxsQTZF?=
 =?utf-8?B?N09acWhMZGErWEZxVXRJUndBYkIySHR6RlM4YStCM2FUQ2pzY1dpV1U0S2x2?=
 =?utf-8?B?VWFiV1lZTEU2SHdRUWxjaHVrcmx1MUNSSVNMOTBoM2dnOHdzNEFoblgzWVNN?=
 =?utf-8?B?bU50a1JwQ1hxZUI3ajJoV0JWSzVqVXozL2dHaDg0ck5hWTNYa2JXWDlBQXJQ?=
 =?utf-8?B?NWFCTWNDR01zVXRCbVpEMEpLODNaL0p2c2pJUElVYjlJb21FTkZiVTBsbTVM?=
 =?utf-8?B?ZG1oWUZNSjZNS3V5VHZ6R1U3ZkVOOEJQcjZmZkdnQ3FyZDFteTkzVjdibzRs?=
 =?utf-8?B?bGN4dTY5MFVEc0l3NlFJdEdJVzZ6RGFxTHY5dWdKRmVVczlEcUZscmk3RExS?=
 =?utf-8?B?VHhXZThjVWEvK1NQMUN0elRPYzQzdFFwOEJlNmFtVXRvMWJlWVBYdUFjZWRk?=
 =?utf-8?B?OXNQbW1yZE5UZ1EyQXN6NXI3Q1k1ZjhnT05HNnRZWHlvb3FpOTBjTm5tVm9o?=
 =?utf-8?B?Rk9zQThIb2RRRjBycXNEdVgxL3gzV0JuWDBUdWlCTjhyTThsc3paSVkxSzIw?=
 =?utf-8?B?LzdMQWh4RTcwUzBsUXZYSGQxc1dzZERpRXhCRkg4Nmg3UXpsSVY1VUtjYlJF?=
 =?utf-8?B?U2ZmeDgvVGdONWJleDA4bHBjK1IxSjJmNlpWSERyNlJJdE1tNWVya04rdXlR?=
 =?utf-8?B?V0QwRUlJVTUxTHVtNFNIVDNaSnVEQ09NbnNpZEs0N3BZbjlYbjM0cC92OW11?=
 =?utf-8?B?M01Idm9ZUERVMFNrMU55OHdOOURxZHBpV3pPbElEQWtYRkx5ZGhrMnFmeHZM?=
 =?utf-8?Q?jXyABzYr+UKVhvHRyx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042dbebc-d4d3-4815-f930-08deec30a709
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 22:44:43.9429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRLlD7pNEhClqcJE+ecZJrWXiTjvT0k5mw9SGlZVUcslwtVqsW+2ORz7Lr3Aus4/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9217

Hi Reinette,

On 7/27/2026 4:42 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/27/26 1:17 PM, Babu Moger wrote:
>> Hi Reinette,
>>
>> On 7/27/26 13:12, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 7/27/26 10:24 AM, Babu Moger wrote:
>>>> On 7/27/26 10:25, Reinette Chatre wrote:
>>>>> On 7/27/26 7:05 AM, Borislav Petkov wrote:
>>>>>> On Fri, Jul 24, 2026 at 04:53:26PM -0700, Reinette Chatre wrote:
>>>>>>> One clarification here is that as I understand there has not yet been
>>>>>>> an actual user complaint. At least not that the pqos utility mentioned in
>>>>>>> this thread is aware of. Instead I struggle with the speculation about possible
>>>>>>> user complaints with different interpretations on how this change could be
>>>>>>> perceived by users.
>>>>>>
>>>>>> Sure, but don't you think that it is enough that we know about it?
>>>>>
>>>>> Only if we are sure that we have the complete picture. I do not believe we do, yet.
>>>>
>>>> We already have an issue open for this, and it is fairly
>>>> straightforward to reproduce. Please let me know if there is
>>>> anything specific you would like me to try.
>>>
>>> Just to be clear, when you refer to issue it means that pqos is returning zero for
>>> unassigned counters?
>>
>> Yes.
>>
>>>
>>> Is this issue public? I am not seeing any related issues in
>>> https://github.com/intel/intel-cmt-cat/issues
>>
>> Opened one:
>> [1] https://github.com/intel/intel-cmt-cat/issues/311
>>
> 
> Oh, now we have a mess, no? You start by stating that you already have an issue for this and when I

What mess?

I mentioned that I have an open issue that was raised against me internally.

I understood that you wanted me to create a public bug to address the 
issue, so I went ahead and created one.


> ask you about it you quickly go create one with the pqos folks for this behavior we are
> currently discussing to change! Why not create an issue for "Unavailable" being treated as zero that
> I believe all agree is not correct.
> 
> What are you really expecting from pqos folks based on your bug report? Or ... are you now just
> using that bug report as leverage and planning to close it when this patch of yours is merged?

I’m not sure what the final fix is at this point. We’ll get to that once 
we have a confirmed solution.


> 
> To be honest as AMD representative and the one that enabled ABMC in resctrl I would expect that
> a bug report from you would contain guidance how pqos could best support assignable counters.

Again, I don’t know what the final resolution will be at this point. 
Once we agree on the fix, I’ll update the bug with the relevant details.

> 
> Please take a moment and consider your report from their perspective. I think it may be
> reasonable to view the current pqos behavior as correct since that is what the kernel exposes.
> If you find current behavior incorrect then please provide some guidance to pqos folks. For example,
> do you expect pqos to always switch to default mode when it encounters mbm_event mode .... or do
> you expect the pqos should do counter assignment, if so, how should it go about doing so, or ...?
> 
> What are you expecting from the pqos folks in response to your bug report?

We will discuss that once come to final resolution. They can always say 
"will not fix" right?

> 
>>>>> I connected with the friendly pqos folks on this issue. They subsequently did an audit of
>>>>> the tool to understand how it may behave under the different scenarios. They found that
>>>>> the tool currently parses text return values ("Unavailable", "Unassigned") as zero.
>>>>> This could cause incorrect behavior. (more below)
>>>>>
>>>>>>
>>>>>> I mean, the pqos tool shows 0.0 in the MBL/MBR columns now.
>>>>>>
>>>>>> And is the
>>>>>>
>>>>>>      pqos -m all:[0-191]
>>>>>>
>>>>>> invocation not something people would usually run?
>>>>>
>>>>> ABMC enabled (mode claimed to be incompatible with pqos)
>>>>> --------------------------------------------------------
>>>>> This example is from Babu's email that highlights that when ABMC is enabled this returns
>>>>> zero as bandwidth from pqos perspective. This matches the pqos audit that found with text return
>>>>> states, like the "Unassigned" happening underneath the output above, the return value is zero. When
>>>>> the counters are not assigned then the events will always return "Unassigned" (until reassigned)
>>>>> so having it return zero all the time may not cause issues. Once reassigned the event value
>>>>> will always return a valid value (no text return values).
>>>>>
>>>>> ABMC disabled (mode claimed to be compatible with pqos)
>>>>> -------------------------------------------------------
>>>>> Without ABMC there are scenarios when events may return "Unavailable". These scenarios vary
>>>>> based on how many monitor groups are created and the workloads run. I am not able to test this
>>>>> but when I attempt to combine what I know about AMD bandwidth monitoring with the results from
>>>>> the pqos audit I am concerned that there may be a problem.
>>>>>
>>>>> Consider a scenario where an event may return "Unavailable", for example:
>>>>>
>>>>> <return A>, <return "Unavailable">, <return B (larger than A)>, <return "Unavailable">, ...
>>>>>
>>>>> pqos will see:
>>>>> A, 0, B, 0, ...
>>>>>
>>>>> The "pqos -m" usage attempts to determine the bandwidth rate and, for example, when going from
>>>>> "A" to "0" it will be considered counter wraparound that would appear as a very large and
>>>>> wrong bandwidth number.
>>>>
>>>> Yes. Agree.  This is known issue.
>>>
>>> Has this been reported? I do not recognize it in https://github.com/intel/intel-cmt-cat/issues
>>> and the pqos folks I spoke with was not aware of this behavior.
>>
>> I was not able to recreate this issue. I just opened for the one I have seen [1].
> 
> So to summarize: it is known that pqos returns zero instead of Unavailable but it is not reproducible?
>>>>> Question to Babu
>>>>> ----------------
>>>>> Do you perhaps have a test/workloads that, under "default" counter assignment mode, can create
>>>>> many monitor groups (more than 64) and cause "Unavailable" to be returned frequently? Would it
>>>>> be possible to put pqos through its paces in this environment?
>>>>
>>>> Yes, I tried to reproduce the "Unavailable" issue with the pqos tool.
>>>>
>>>> So far, I have not been able to observe the issue. I created 64
>>>> monitoring groups, ran MLC, and simultaneously executed pqos.
>>>
>>> If I understand correctly 64 monitor groups will still have enough underlying hardware counters
>>> and always return event counts, never return "Unavailable". It is when the number of
>>> monitor groups are 65 or more that the hardware counters will start to be re-assigned, no?
>>
>> Yes. I created 64 monitoring groups and then ran pqos, which creates an additional 15 monitoring groups.
>>
>>
>>>
>>> Even so, I do not know if 65 would easily trigger the issue ... sounds like it is possible to create
>>> many more (4096) monitor groups on these systems so there appears to be some room to make it easier to
>>> create scenario where "Unavailable" is returned.
>>>
>>> On a higher level: could you please run the test that can expose pqos to environment where it will
>>> encounter "Unavailable" and observe how that is handled?
>>
>> I was able to reproduce the condition where the hardware reports "Unavailable" for some of the MBM counters.
>>
>> #cat /sys/fs/resctrl/mon_groups/dir*/mon_data/mon_L3_00/mbm_*
>> Unavailable
>> Unavailable
>> Unavailable
>> Unavailable
>> Unavailable
>> Unavailable
> 
> Thank you for running this.
> 
> Do all of these monitor groups have workloads assigned that generate memory bandwidth so
> that they do not just keep returning "Unavailable" but often return data also? I just want
> to confirm that this is not just a variant of the "Unassigned" test case.
> 
> 
>> However, the pqos tool continues to operate normally and reports valid bandwidth values:
>> #sudo pqos -m all:[0-191]
>>
>>      CORE         IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
>>     0-191        2.55      55146k     74496.0        20.0        61.4
>>
>>>
>>>>
>>>> The issue has not reproduced in any of my tests so far.
>>>
>>> I'm confused. It reads like the issue that you mention earlier is a known issue cannot be
>>> reproduced.
>>
>> I meant that the pqos tool continued to work as expected even after
>> I recreated the condition that caused the hardware to report
>> "Unavailable".
>>
> 
> ack.
> 
>>
>>>
>>>> This might require specific test scenario to recreate.
>>>
>>> Right.
>>>
>>>>> Of course, "AMBC disabled" scenario also includes AMD systems before ABMC was introduced. I do
>>>>> not know why the issue with "Unavailable" handling (text returns in general) has not been reported
>>>>> until now. I assume the pqos team may do most testing on Intel systems that do not return text.
>>>>> ...
>>>
>>>>>>> The patch notes mention that this change is planned to be reverted at some
>>>>>>> point in the future and I have not heard of any changes to this plan.
>>>>>>
>>>>>> Where does it say that? I don't see that aspect.
>>>>>
>>>>> For convenience, copy of patch notes from original commit [1] is below:
>>>>>
>>>>>       There are plans to enable "mbm_event" by default once additional counters
>>>>>       are available. For now, keep the default mode to maintain compatibility
>>>>>       with existing tools.
>>>>
>>>>
>>>> I added the text below in the comments section (after ---).
>>>>
>>>> On second thought, that was probably my mistake, and I don't think I
>>>> should have added it. I also don't see this happening anytime soon.
>>>
>>> ok.
>>>
>>>>
>>>> Considering all of this, I believe it would make sense to make the
>>>> "default" mode the preferred mode.
>>> The original problem statement is that pqos is not able to handle "Unassigned" return values
>>> that will be encountered when "assignable counter mode" is enabled.
>>>
>>> The request is to disable "assignable counter mode" by default to address the problem
>>> when handling "Unassigned" counters.
>>>
>>> Disabling "assignable counter mode" will under certain circumstances cause "Unavailable" to
>>> be returned on event read.
>>>
>>> At this time there seems to be a mismatch in understanding how pqos can handle
>>> "Unavailable" return values. For me to sign off on this patch I would like to fully understand
>>> the risk doing so. Could you please confirm from your side that pqos can handle all scenarios of
>>> the mode that you request to be the default mode?
>>>
>>
>> I created the maximum number of monitoring groups supported by the
>> system and was able to reproduce the condition where the hardware
>> reports "Unavailable". Even under those conditions, the pqos tool
>> appeared to function correctly and continued to report valid results.
> 
> Could you please share the test details? Just having the maximum number of
> monitoring groups would not trigger the issue by itself, it needs workloads
> that generate memory traffic that intermittently do return data.
> 
>>
>> It's worth keeping in mind that ABMC mode is not available on the
>> majority of hardware currently accessible to public.
>>
>> Furthermore, default mode has been the longstanding behavior in
>> deployed systems. Moving back to the default mode is therefore not a
>> new change, but a return to the behavior that users are already
>> familiar with.
>   
> ack. "We returned wrong data before. We can do better now but we want to
> keep returning wrong data since that is what users are used to".
> 

I think we are getting nowhere here.

Thanks
Babu

