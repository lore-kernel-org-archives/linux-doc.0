Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013041.outbound.protection.outlook.com [40.93.196.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB5F31ED76;
	Wed, 21 Jan 2026 16:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769013144; cv=fail; b=hRKSsY6+tljU2Dj3984zq4451RkesJZRXOgC0YP/iH8o4G/7c+W7cP6dmGBcDYMvLPggdsot4Lvf5AdXOBwXjqyX/LZweGVQY2PtDJODqCqIY54/bwSOwbDaDKZiwwAsVmHK4PC/SNrVe2sE2V1GWqagtGBWCBqUR2+9wBsWfhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769013144; c=relaxed/simple;
	bh=li8x+EzE/3BOzQb7lzrwZ/FP/paIGF39SGEI3HygQiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uij5Lo5sHIKCdDmUzYJO1PM/B2312D2nw5LYyvLG3sC+ZQX+cxd5mb0EjOv/ZUdzrut9zb8B3xvXljTnxllQo4AMWVtOZXhE6Iu4jUl+n20sZNli+iI3F9uVeUgI7cdjM1ZMOwxfGDD+cbZ4v1gFKHRgSQWQ9OZR+ZHPIO/OnIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N32GGgvd; arc=fail smtp.client-ip=40.93.196.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N32GGgvd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYH3S3iS1/M20DA0W7ZgTQPn1Qh2hWm22WkWBMw3F66HwzU8y/tfXsKSpKkN4B6GEsvYRkeJ0z8JC3u3VGRivJDzceaZRcsSlDBzU+/MALhgSNt0psNV1U/ZaSUXYwkWpAiJhS4THaok+q5g+jccQFAKh/02lb9EakyWZQhsw8x/OXOqmMfyIw6VY1XNwbeFU3InrDDe+++HYCxLBtcEWZAKG4/WmkFEXcPUcG6p5azgRsgmUX+xd4dGvcpn4a/IRIpMO3Sa3CJLFaU/JHkHAwfIaZHk4S0eT9h6t3z+pIjmPpX/S+JcgjvZ9dlyukKMNtwJUR2b1keaZmvLwRC/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQP6Pt04OdEFCZeOmadEs7h9Asd89GQEeruUVHScB9E=;
 b=BfjLJx5m0NKw6aOAcCFpVLAMq+TG30fBsCrU5Tc17/L4PUzDHd6YsxFjCT95urzmFAixc1d7mifN6BIj9a1M9boOg8k+ZXSRYZCqroNH13E0XRYmcueYCgYWPYPs23VHRADM9lL5GWi+eRWHC+ajIeCZp9cdLwX1QSGeHBR8Cr44rDQpsgjp6gEWK/CVNA5786bh/Qr2pVgTOxusB11BxHtHWeoxIWda0CAVMnrVCljfmnYjPNboGbcVAiaBApXB3Z4+SbVAIJxQIW2K2/+i9SC1iZs5MvVqzAG/hyKMf4gtJcIgEf6OlwJ5GfuAXGS5PtcGGYShIlJJLBZmFGOxrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQP6Pt04OdEFCZeOmadEs7h9Asd89GQEeruUVHScB9E=;
 b=N32GGgvdDgum1kyS8Hr0POdcqurCD5QSI1HM6SROZvbDoqt3fJC7BsGtrV6ewpjVCO0T1w+kRQP2KvgSrEWvWHgY2zpCCQLmhiWA0EMXd1o3jDpHKvgXVZzRBWbX3z6i27MaKsCoUAA7wWoiyHMmQHJ7UQImnOzb2BdvCFhqvMLfqXGsOxLnjkJeWeFzZjSlMukPeiPtqIgdr6SjDOiLSu33Nmx7EMe5egXUB3pPgpsiMdOfGl9DN2fDIoxXMOljfDVL8Z0y76o4+jBOV/iVdxDI3AIMXY5PsNUb8Li2vCv4Upa4Aqs6Lp4RlzeeFahcK0Xqgzvy+9j65c0bDUywjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SN7PR12MB7180.namprd12.prod.outlook.com (2603:10b6:806:2a8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 16:32:17 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 16:32:17 +0000
From: Zi Yan <ziy@nvidia.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCHv4 02/14] mm: Change the interface of prep_compound_tail()
Date: Wed, 21 Jan 2026 11:32:12 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <D842AD70-03DC-48C6-8807-4A004B98A012@nvidia.com>
In-Reply-To: <20260121162253.2216580-3-kas@kernel.org>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-3-kas@kernel.org>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::32) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SN7PR12MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 42069c82-ae48-4a54-fa03-08de590aa477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7fYYTtwA1YAQuh+prQM+qwgpAWwVSKbhXW9OigC4qMjIhVOMvGWN3XmEVUKx?=
 =?us-ascii?Q?jQ4ka8dlmM54G5XmsFNR01qjMflbdW4++OAiuQn0WIAA4tAMu3dV05y1Jpza?=
 =?us-ascii?Q?O9e7l6MxtjB/LEzCw0DXvHWRB1x9D78rUdDrKmQ9bdGYis5ri9VcjVkiVwdI?=
 =?us-ascii?Q?RrrBbQ1avDB3zmIXA9dRVd1JiCitv59TiDn+f0akRWw9SWSkN45Ycc1nuGnU?=
 =?us-ascii?Q?G+FR0e3fwzwlE4Uo6ggJPeW+Bc6IBNBFoS54dr+h0F4Z0Sd/TReFEwbRTT5K?=
 =?us-ascii?Q?Ecn00gxJDKu+xLER1KfrCHKppzyUzitGJlLNZRR5nZKvhMZ0Cu82wHO0843t?=
 =?us-ascii?Q?lgdZhy3niXzwzYquNypBOdLttxxTjuGIgV0hqWHUPBQX7zl0K/ZROEGFabjP?=
 =?us-ascii?Q?Wz3agm8lENiEYW9766jQMoxKpFgL2GrEYuexF3JFthQgkCPPJpX6V9gjxPcB?=
 =?us-ascii?Q?EfqBbqaXRMXwCQ+gNWc2Rzba62fuvfyujRDFgd8adkYJfd+uBIXhjsigGxNA?=
 =?us-ascii?Q?L7/SEUnBW6UyhuOQVVQN7zJS1kBvEGOJsrFjBGyI+83pEnxGXBMFTuBMsf2o?=
 =?us-ascii?Q?v3HPN6VbJRcZu9RbdUGlllqU7CNDpwEw1FJzB618KRqAjY4QgqyRPg0+oGh6?=
 =?us-ascii?Q?B8LvoVZsmBLVPvouDD4Do/0KqZNdHg9VMGf/wShNsrpcfF1/IQO1jOq4Wv8D?=
 =?us-ascii?Q?/st40nZB0sJZsohMNqNwfHEpuhT8koqEaOYY3m9g09Y9DdLh2/ksG2tkYghP?=
 =?us-ascii?Q?pEQ5WBXzc6x/mza4npVJDnMscLuPSaRe11Fo7cxgcdQny9j0bRMhlARR47x+?=
 =?us-ascii?Q?SquAsD47Rv6C0Ws34XJyocisUpIR1QgWmL6bDrfgfdR3gPTyVbCpgOzYOf+x?=
 =?us-ascii?Q?FrN1NFrI3FXhg7rcu89EH/LnQgzX4bFQrX7Ah8H0dEggUUX9htd2sXjaVvvF?=
 =?us-ascii?Q?3ZG+h2hIFrTVpEBErE2WNdphGXGkthrmZePdp9Dx9CNNX4zgy/ajSceDRnnC?=
 =?us-ascii?Q?5QUAxQ6UgBh0p5qLjleRKAYYgjRgKtJPaxdAuW9ByNsrUuEYL9BNhjNWxOGW?=
 =?us-ascii?Q?EztGLEvXnepMNM5QQQejBQUpd69EGlam2IKLSqPZmH7CMd/mkzzNC9zTSkSw?=
 =?us-ascii?Q?xSwhbTz9Snj+PyLQzJWysklrqROnjZWkQ2Ekff+4XU8nyT2Yb03uzMElCA4c?=
 =?us-ascii?Q?HzsYlP2paJxnFob0AbANewxs2x0Fe1kJHAyA6fwT+n/Qm0fQefqYbEUskB6a?=
 =?us-ascii?Q?BOdRVAO6mgBUjn+UABON4v8hvrdcB3YCeU7uaKd8JH8TzO2LB+gmjfHdA5DK?=
 =?us-ascii?Q?OnLlIX5UQZdRElzhok8Sd8u6/cxS9ib6/u/W1ncUGeLpnQ2ItN1h3WNNfqPi?=
 =?us-ascii?Q?bIoFIIHIdoIz1C5JaLxKUJVu4gZFSmlsXkWP8rhXa5WaE+RkHWBP6kypNub+?=
 =?us-ascii?Q?BcNeYfMACBWlVGrZT4a+ieccxRWD1VaDI8DL1nRTlxwcq3SQ7E52JvW50xZo?=
 =?us-ascii?Q?jTUfymSS+r5Ka+za7j1iOwEiZLhZgyBNTryQYQI2I99FDaajWNNNm6pxbe2e?=
 =?us-ascii?Q?zSO4TckjMFdjlLJe3cM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O6Jnu3iMq92IffXBDgn3ueC+1bflkTFXdvgF+YC3VhhXsr1UIDUqtKBxJIL9?=
 =?us-ascii?Q?zLVdlE3cTBICiyqHo7KMW3/N/YaDyCJBF/KIiHe19zi/+cTBKfcC+vTl1MsP?=
 =?us-ascii?Q?fmPYWBkWHCdmjTjphXPmJbZ/d6ffkFNhX57aWGvCiQK3ZfOA+4ex9UiV3esC?=
 =?us-ascii?Q?nGd1jAoUTgadlWkZi6RW028AmZ+jVXq1BDZHkRzuyhG/7Ti2mo2Z6ZE0Q5+M?=
 =?us-ascii?Q?Q3rymf6jUNnok1wycIvAS2v1ktwyLB7hNdepW8V+QynsPV1/5maW7E9iCepk?=
 =?us-ascii?Q?w/1hboZBD9kInBZp8v702+UK/cb1DngKxt88zFmFLS8tq1+i7jDpHODLWrjd?=
 =?us-ascii?Q?fXiNHlP8aSRE0gyTfxgWtKmc6UFCJBnNVMEZLJZhXoB1hWr9oCH8uwHE39SX?=
 =?us-ascii?Q?OegYMAHq4dsRbHieqyDyhaA9kWGDarxRtnjEdEQVx+peOPjWvRuKBRfDYRkZ?=
 =?us-ascii?Q?tlIbgp3BxWdWHWrGFMUgu4K9IEDAB3RPdIRq1jB7c1ArFshZzn/xYMqkL5EF?=
 =?us-ascii?Q?xfrYRpWlN5BI1HABh4xBdA8KsS5RDpXIAjzc2LdFVR138ruuDXNouQOxjfuX?=
 =?us-ascii?Q?RvjbVD2H/p3TJXN5mq2WOIPl/OP7in5gsKhmj18HZ0ttGpsvBveOa0C1h1+E?=
 =?us-ascii?Q?kVzVC5mi2XfJAgfyUgdcdRjMyp1mjCZsorC0i79nqq08SoMA2eDNCTpQ//O0?=
 =?us-ascii?Q?T+QB3O8+A2h4e4b6i8lAeiNgZvJD9E6L4/IZSQTdLmzNlqrjHjZLiq0UzMeC?=
 =?us-ascii?Q?Ei9aGBE5BJNZbdIHHSZ03ieVKBdsuAlO2HVMZFeor0HsnqFbN7gdk0jcOWUL?=
 =?us-ascii?Q?Ex8ZUwmIZGoD/96YIdUt0ZgicQvuOFR4gHLVtKAW8BaNjSR+Vk8zIs+iKDrN?=
 =?us-ascii?Q?2DeA1/TyiU1c6HRFCxwKhsyJn1kLlz6foVnU+kkFiBu8/6VqhexheQvoexWq?=
 =?us-ascii?Q?P37YesyijXuRPqM8FGb82lyeq4RNZKg2aTWnhcFb0aqNy94fRPLbItys+4Cy?=
 =?us-ascii?Q?Csa0Amiu8FunvN9bnK8CO6eRAlQQ6mybCBs+sEoP/a6p4WIGw2Wimk4ydk8o?=
 =?us-ascii?Q?zF9LFN3mvpvIzbzGaSYCHf8laa9ASHu4GqHF7c/Q4W/HJfhdutYoEoiBw7kY?=
 =?us-ascii?Q?tyoyjgL3huzg5l4pNEWx6055yFriOKO5okjT+SWt5LBoRzui4dldcCY5YtE1?=
 =?us-ascii?Q?cDnNGq9PeRI1iyL6BfUXgFJ9s+y0C+PhjQ+XegZvMrGH1F3iwXhEYeJTfdOc?=
 =?us-ascii?Q?zXiv5MSdbBV9acB53xiY6/hLOS14nLgPhrkDOnJ3wZR3rr+BGQfRuSBb8VV7?=
 =?us-ascii?Q?lzFaE9Odcji5IYCaf4sWRw5FMylsBaN08cTmHDFK5YzF3kR6bFwLP4KDqe7X?=
 =?us-ascii?Q?EY1Gv/WK7P4W5vr6LZyE0FBN+vZAh5xiMBdiKwYL7oHuuo3Gl5pnoA2yg61h?=
 =?us-ascii?Q?LJK7kQM5JNX7l9b7DVfH3iw9mr5Gohz/oJSnC2gdgJm3qRcAMCTxhmYS6k8j?=
 =?us-ascii?Q?9DTyJtqDTcJ2pDqokIjDmqs/7Oz8fvUJXkhelCVmemDm8jUL83Wph8WHr6Yx?=
 =?us-ascii?Q?hK5gS01J3UkDNeb88xVMvV/k2oqmX1srCcW9E8O/wfRSL5WfdK57foBIZ9nn?=
 =?us-ascii?Q?uJgC7/LromvLiKCmK79xocSH4FUf8dfHvnoLrbc0Wtq6Hw/KUhdDAXyGAoS+?=
 =?us-ascii?Q?1nJLkHWdd/7ZikNgfHHxA7XthGebzRDx2hY1AS80wXi4GCwJI7EQUYreV4Vo?=
 =?us-ascii?Q?Ub83bGrPgQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42069c82-ae48-4a54-fa03-08de590aa477
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 16:32:17.7999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBxMH1uHkWvs8ntzyAqWfCWolryOcz4ORTeR8Fzl+BO5JHiAufitpbCXipJDgMvx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7180

On 21 Jan 2026, at 11:22, Kiryl Shutsemau wrote:

> Instead of passing down the head page and tail page index, pass the tail
> and head pages directly, as well as the order of the compound page.
>
> This is a preparation for changing how the head position is encoded in
> the tail page.
>
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> ---
>  include/linux/page-flags.h |  4 +++-
>  mm/hugetlb.c               |  8 +++++---
>  mm/internal.h              | 12 ++++++------
>  mm/mm_init.c               |  2 +-
>  mm/page_alloc.c            |  2 +-
>  5 files changed, 16 insertions(+), 12 deletions(-)
>
Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
