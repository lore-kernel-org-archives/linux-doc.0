Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E738630DEDD;
	Wed, 10 Jun 2026 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781107909; cv=fail; b=BfJJR3Z0Dn3swfQWWJ0bT79K1gYWa0UsHMWuOMv8Z+eqyQdF2CnJeGDtHqPZ6UweVxfFT9oR8+C2K1w5bJ59jm/1P/P5KAe7tDqd5pAzXyPlH1nSKtfnK15QmVgVmuYCFdnnqkmGxnaq9riHighimk94pC5y0WU5zDp5OGPIYzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781107909; c=relaxed/simple;
	bh=U34W4BU4z0qgFsNsQTrMczTghohKiX1ZtDvWXuKV7M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kwEa4DXWuG6ZJgBG5Yiofr2sQGXbjUQAEkBgUr4BSoZkKA8dKFFv5dyKRhpojBEVfjqV2IhF9DatWBzyzUyCux+j08lsCV2YtG5oKotpzKAOthY/f3xd6RDTb8ai+yo1pJtBB/1eLgimjwYmKACb6uTlBWofYR/k4Md50ZezEnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WMYWKRUV; arc=fail smtp.client-ip=52.101.53.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WMYWKRUV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhJWAZS7AhIVjrYcGoQsF1GCqHBoqdTxQROk7Qq0e00jm0IrRIC5p7ta/sfq71OyokE+6bj7/I3C7sQK6u1EpCyinmfsspx+Wy2pv+gBhZ+w2g5fSWWfGWArlcJVQV7Pao1AohPX6WqnDCGX8qWQVXMcBl/f6/Cyxrz8/ps1ZesDTc9o0jKpjboefyW0tGVzVqHc+2LwaNhXwG9hD28PrA9JEDUielivsqw6dPeaNlWIqz/VqZSaHL2uwsLYOOTqvGI/yJHdvoVUWe1Gf0quSVK+Zc5FzaMsIyKdgBZ8D2D0M7ip9oXanABoAQIxB+QThQWHSWkxiQbEU1DfQGrcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U34W4BU4z0qgFsNsQTrMczTghohKiX1ZtDvWXuKV7M0=;
 b=qKWR38jncbVE2sh7TFVbHkHvL9z27ZF9cCQlPxkbjgPjZueTJwD1jEiW4LWMnBS+LwsN3rq4BVZ5JaZi/eZt9mEcKPSJt2AtQpGKGpCB8GAafX1+zyX4x/1HE+aJwvwIebvNON+iG+sVSRDEhsVrlA5M6muO3t+fO52NG4nYwGlkyQ47WIDtJuHixoSpSdWLAN138F7EHcaoL3RfvvSjOpmD9/Cgz4m74YP8jl6340jVA/AAd8TjjyE90eycL/XJIDl2bieJ1/3DuDJazNgjH/qsR9GajpRFSMzuO/vxnuDygRXWHvhdhGvTH9vnpn2nwznL9/AAOdrf+M5VU/lJzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U34W4BU4z0qgFsNsQTrMczTghohKiX1ZtDvWXuKV7M0=;
 b=WMYWKRUVb9TMq9MMtCx10TjUEUCNoxl053Y3M2xPzceD6c+rwxgyG6c2ppi3LQP+zOieDxk0o1wCWuSfVVYBS/LEge+8kMPwG52iEuSHDEv0uQzv/XKkp2IB7iWVM9duJJJa9O+jbAX2ejD3CsCc9bvkPFoD7qwix/dtgDbAA21nf847ffgzfQ2hdVS4K+XxHlb+WXyXcyENhPDPIfjFk3s6jDpxcXKwVMFhovRLPwEEG/VRovsGh2RSQi9HGISzaUkmVtnvlNBGWdnrGxvwnC5UEkD8Vh1rS6i6XYpwywRt/IsgGqRvdeP6Ai1P1pmIqZDpOPLCm8yUgSBlCbfj4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV2PR12MB999072.namprd12.prod.outlook.com (2603:10b6:408:354::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 16:11:45 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 16:11:45 +0000
Date: Wed, 10 Jun 2026 13:11:44 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v2] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
Message-ID: <20260610161144.GU1962447@nvidia.com>
References: <20260605144551.2004391-1-sdonthineni@nvidia.com>
 <ailKYTOX23EMnJsK@willie-the-truck>
 <223c49ee-528c-4750-9885-fd8e0247151e@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <223c49ee-528c-4750-9885-fd8e0247151e@nvidia.com>
X-ClientProxiedBy: YT3PR01CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::33) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV2PR12MB999072:EE_
X-MS-Office365-Filtering-Correlation-Id: c7c72af4-b0e9-4b16-8bf0-08dec70af7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	BOWZc76ndJBGsUhYwM2jhiKvSOA9u8wI1WT1PpENJQkKLB1hfU/wykzx7IOI/ewJSiL7xVbRY8rDkQschqOf2Ia8yMEKdpCMnlN/mvvel8cGhCWYCI4whixSXjNUizsG25t3Yfa82Bb26JmdkFYAodurpRrAxg2/xykJKfk2sxzrR/r814lW+U0rH0IJ/95xifDdBfyUQNAOYiNT9kWMoS+c/F91qvGPJUk3EDXdPCp2adI7MYtUrFxExgfXXIMIk99Ua2WowH/n2X47gqK0BcOGPt50tOIHtNSKsqa755+0NAU9XpvB0flWaKjA3XknAePU8jZQwSukqdJ7MVpdPIYwuX1WMpLrlZkE11EOthK8glQuMvlwTCFQ3gbUCMTmRgo8A24NEpwI7zltvmGOCULi8HqAAoMQwfhheb0uTzSKCPkcij5gbQ+Ngc33y24eflcPwgIHFjBcHgI83wV+FENTog0LOpDn0bt94a3x/lsykNyxsSQFJZVHlfW4Wf9r1Ph9Vp4LjsOb36GMUt8wYz4rW52BS3qZYcypph8Nx9O7NcG3PJXltKk1fW/QDyIiES/CQv9KFgEuk2XFKC9njrBtPpttqnFXMVO5EuVDLyjjb/8isCsOTqOh7BO8/m0r+OPgssUhDIhCmA8TPafiFGsO1hkKPIc/vtJ+HkTUDUhA1hP4KLv13i4wdhZDZK77
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEVNYm1uakdhRXM4VEsydDlBQ29HbEJqSzJVKzRUVWx2UFdFRllmNEc3WHlY?=
 =?utf-8?B?aHlVVDZWYSs3cW1PRDYvYWY0c0ZFVE5vcjZWNlRJK3ZjTFpBWXJidUUrb2tv?=
 =?utf-8?B?V0ZjVlh4Y2JLK0g0anFxSDM5Tzc4eXBRT00raXNVSmZXV2tDNWhzQUZqTDYv?=
 =?utf-8?B?RU9YN0J6MVJCTG4ydU04dTVjUUljL0l6KzVLNEZOVWc3KzdwZStYaGFTb0dz?=
 =?utf-8?B?d1Nic2VPSXVqOEE3aHJMNm5ZUGhaWnhXRVNSanZoTjNmY3ZnTHZnbUM5UHlY?=
 =?utf-8?B?dFAwMlBra3ExUjYyMEdsYzAwRXRPcHF0M0J6M0tDaDNKQUxieGl6c0IybjNz?=
 =?utf-8?B?TG1oMnRDQ0kwclowZnNNNGY1UmZLUzlvUkltK29vZFJyMklOTmQzK1o5ZFUx?=
 =?utf-8?B?Z0FCRExuV2dBSnV4RmE1REZFdzRxbkhvWkZONDU5cXA0VG1ibk5sbWJleTlL?=
 =?utf-8?B?VlZjSWdTaFF3QzZNRVp4RlVlNVhyeVZKdzNsVTBNOUZObndKbURpMW5OZlR3?=
 =?utf-8?B?RXpQeFArQlU2bWlYVnFuZVA5R0RPNEVpSmJrRERvbFdFWTJZd3lLVEo1ZTY2?=
 =?utf-8?B?dk9XT1hLZjQwaDB1WVdZNnQyMXg1VzErL21TNzc2K0JvYWtIMU91YW1aTHNm?=
 =?utf-8?B?NVA1UjByT1VMUVp1dzU1ZzAwdVVoTzQzSkVZU0NHcG0xdWptZUdHZmE0KzRK?=
 =?utf-8?B?OTM4N1FpdWRnd3dSeTEyVSt4UXdZMzUvZWMraktBbTdaM3ZSOERNZGU5Z1l5?=
 =?utf-8?B?dnVZY1h0eXR4UXZmVlQ2cUZKQmhrOS9tMjM1UXlNWGVDaVFlUEFlcWdYei9X?=
 =?utf-8?B?dUk4UkVsV2RLeERVZUFPRlhpb2hVWGUvL1FtV0lqSUZsdnZRcFNVanE5Ynlu?=
 =?utf-8?B?VWtrTCs0ZHl4c1FWSksxbk1jSHZXbHVhS3VReWFidHhwNlUzUmpUWlcrMTMr?=
 =?utf-8?B?YWhWYVhnN1V1SXpoaTJJbEVKMTRjVEdKN3JGbzAraGVDam1OS3c1V2RvTG80?=
 =?utf-8?B?OUpNUlFOTXZ6UmJLTnpqQ2VITXdWTUJIUHF2ZHFGRkdEWUh1MlBDT3pCcjlG?=
 =?utf-8?B?bHNrK0NPcVZlQU8ydFN4aHcxZWJHcU5LdkVvU3Zsd3hxVVRuT2lmS0JvR0NG?=
 =?utf-8?B?Q3AwZ3U0QnZYN0NrcXYvczhDaUhidG5CRUlobWNyS1J4aVVkVzhFUlp6WDFK?=
 =?utf-8?B?VG9JK3JMdDIzZ2UyVDQ2YWl6OGUvNWN5c3dDcTU1cjNnOHdjNVdyMEtEMWJs?=
 =?utf-8?B?V0hCUGlpeCt1eTVONklQbmZzOCtsSUN4RHU2ZWNKMkVTTmY3aEdYS0RWREIv?=
 =?utf-8?B?aHVXWHgyTUVwbGxpNzR2SGwzWjVSQW44WndkNjA4K1cyN3JRUzNlT3lYajB2?=
 =?utf-8?B?MzQ0VFVuS1VwV2pnMDJpZ2hCcXhEdCtuNDVlT0wxODBabW5pRVNtY1Z1blhF?=
 =?utf-8?B?WGJldEZvOWJ1anIyQUlrVS8wRVB6blRwSjFvdDdhTHg0VVhSQ0hJbkpWa3Mv?=
 =?utf-8?B?TTZRYkM3aWNTdU10OTJyV0s3ampPUjVSaFBKdU1GY1gzNy93NzBVVHhDVHc3?=
 =?utf-8?B?YTFkVW51SnVQRVE0YVAzQ2ptQk40NEhuelUwbFdDL2tlRHg2SmR6ZWpxRURj?=
 =?utf-8?B?Z081d2tLMDA4U2hDSVdRV1VsUkFITjM3d0w2d3J3ZVJ5Vy9XYkxLd1NGVnVZ?=
 =?utf-8?B?U3lXQ2M4dWp2UU1GbVVFVUxYV1FwYnhQNUdrYm8yUG5SUW8reThCd0huanZn?=
 =?utf-8?B?WlE0bmdnRFdnV3hRdzF2Mm15bXhLQUtWaDl4L2EwRVVFTXR6c0diZnVIMW1N?=
 =?utf-8?B?TmR1clptakU1V0xZbkdxcFJHUWFkQ3V0RHJrL1lvQndQemo1S3phaWlXOTBj?=
 =?utf-8?B?NnVxV0cvd3g3SjJOaHlpV0ErOTljZUpzMW13Sy9CMzRweTN6QkdDOTM1RkZM?=
 =?utf-8?B?NjhjZys1ZFgzVk5iejdCTTBIdnRxTW03cGF4akd3ODFvM2sySTg3eElpZlQ1?=
 =?utf-8?B?REtLRllQUmk4eFArRThWNm1RdXN0NklrdkIwYUlmK2NSUjhnR3RHSHlGekJZ?=
 =?utf-8?B?N0Q3T2QxaUYrMHh0Y0t4ZWhsVE1FbStFZ29ROHdZaG1lTXVFbjBPVXRxY3A1?=
 =?utf-8?B?ZDNrc3FWd3c0dmFMQTVuZW9PeGgwQ2YxbXpEUlVlKzhjdkFIdXd4QnBHcHlq?=
 =?utf-8?B?MGRLYTkzQkRySlMwOXlMUURUenFBTXYrVjFpS2FZU3h2OG9EWHRoWlRmSStq?=
 =?utf-8?B?WjZFRjdJZmlWNnVFOHRaOXdBdU0yUUFKYWhJN2gzaXNBVUpGdFdwNjh5aUpv?=
 =?utf-8?Q?ENKhRCjwTwNDnX9sfK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c72af4-b0e9-4b16-8bf0-08dec70af7cc
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 16:11:45.5745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDryyXGWoxd02iguiy2n7M+UhYGlO/UJ1wvDG1X8oESK8uQ/V/q8AJ+ZDbiEltip
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999072

On Wed, Jun 10, 2026 at 08:20:28AM -0500, Shanker Donthineni wrote:

> Based on the existing code comments and after reviewing this path again,
> __const_memcpy_toio_aligned32() and __const_memcpy_toio_aligned64()
> appear to be intended for WC regions. Since the erratum is scoped to
> Device-nGnR* accesses, and WC mappings are Normal-NC on arm64, I don’t
> think the STLR workaround should apply to these helpers by default.

Hmm, unfortunately I think the APIs mix together IO and WC both as
__iomem things. However I recall when I was looking a this everyone
was using it for WC.

Jason
