Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011014.outbound.protection.outlook.com [52.101.52.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB323A1D10;
	Wed, 21 Jan 2026 16:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012943; cv=fail; b=lNgZCLXW2PvIS+smoxevY4b4BcFQ8KzC6qo0bdiRDOyCVAod9Om0vnAPVqecn/lGp/gGrIZ2aTYEPSoMcb1HegoaNwDXq510QMnX+Lk8yWGTWi/LvW2pPHCWw+iqV2wvNq6RQGRIxkSQMWsU+0ZsDlFiDytMhz0X9JzR7hXNRM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012943; c=relaxed/simple;
	bh=Ap06javgBGNjMdQZFjlC0K9Y1w8/jPemdxblUZWqg6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LsxZJnkQatsmxC3xuIMpIZJzvsOSKQjpXI9yx5xK8G/BFtWKpm1imUC/zay74sr66sq0ClKIqFQJuu92vMdw7s44/cheTdlJwo+68k8sGu3w3UpKoSFl9vkI+2brAKI7MAcbQxhOIF3cc+QbxQ7S7kaooG9su0l1pDmaHETvXY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X0NuUdZF; arc=fail smtp.client-ip=52.101.52.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X0NuUdZF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZnqQWEq8AbLPaGq1+IJ1rhczljXv//nMBrVf0YrPAdnMKJRPXh3vDqjdexG9lCpyQJO/F+2W6NO3Sf6KVBIXXvZNx/+4BmG9nDb0+YcSXRU/j6eIXn2vuBNLMfA9albxDphvEAAxCcXNjR2desJ041R/kgtGeF0qyckgQfwh+kzR+EvNmlqydksxicDkn75y6d5BeN1w834WNfqZLrwuuxuhZMNzjhVzB1qvWsmsOMZT2lw6KK81150wf78gpZlKmDLiyJcglOS3+UcF5F5C+G00r+IDrjZIfyt8xmKdGN236FqM01lKNsEqh97TzW8bDp5eoroNEUddddnt4fm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srzzWppi7dWfu73X4JVEv9+gGBw/9vU9snoSazX3T7w=;
 b=i4Ci8fH++wcciXm4TIe7hhSpGr/phtfKaoKpPyNEI95jJLgYWa/SUB7ZBEhV1MW/WR/spPQ1R1LQlyBqan+AhLdcQ/S+yS5YJLS+HPyhrqe3U2yOZisNoxA+nUeXYWYYSGHMoxk34gYW6E4e+TZK5SmdQzhQIwNSMJQu7yY0hUFjruR3gfd6e6ZD7/g45Vl5r9xR4iTL06iFo7ZfCVijN35Z/bqoy1FX+D/HcqL9mNwH1exKoNxseSasLOpM0ZP/F1hWkRRZwb6G69vPaktrFmJHVxNUNuod5MYtPHmb0H4hvLrPxB0ktyXb9xvxsbuDGAc8JCyo8Jznl8HjFeWiuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srzzWppi7dWfu73X4JVEv9+gGBw/9vU9snoSazX3T7w=;
 b=X0NuUdZFohAyJ23Mmopqbv09LmMWTmq1Tv8OPxi09M2ARu+gUpYTyEz0/Q9Sp/42p4w7ZGhpH5qlM/9VYbZRXsUnrIxWPgtpFeqQjpJzup8TOrrcEX6halYQQdQj5s0C88shVaNGot/qWtoHV5WJIG8KzCtX7v5743eMsTcM8uEnd2IY8MKBMrwmjaFPsqV/I2hgLKMxeduOky59ShqDHP0cLXKZmaBxJE4vekYaF8KasC9jSwQdYK8zSrEoww/Na2bmYj2oKeuqmOo+F18Y3sr7IjAw3ep0yrY/PDHP+IBw247WU78Q1lqqzwhQCNz86D2Np3n33xvWAEjC8NO86g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SN7PR12MB7180.namprd12.prod.outlook.com (2603:10b6:806:2a8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 16:28:55 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 16:28:55 +0000
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
Subject: Re: [PATCHv4 06/14] mm: Make page_zonenum() use head page
Date: Wed, 21 Jan 2026 11:28:48 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <05053F70-2885-494D-91E6-C447EC1A1676@nvidia.com>
In-Reply-To: <20260121162253.2216580-7-kas@kernel.org>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-7-kas@kernel.org>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SN7PR12MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9b821c-95fc-4c4d-bea9-08de590a2b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OTjlu9k+NJYzbcE50v0AaJsVnBOUFHy8LPjhbRODf4naesYLydcYFet8KrxX?=
 =?us-ascii?Q?HYo2sMx2/EPErj+dstfPZUrWnDBeE9ibxwQvwJ5OGVOEc0zWSmvd8iN2GAOM?=
 =?us-ascii?Q?IP/dUSKqq6EepP8YkWeP59PaMM8lgtaD6C+L0BS6D3pU6PGgBJQdtGhFtZfV?=
 =?us-ascii?Q?W1kCKH/tbVQP2Tl5bc4QfkLf4QCEgSqE94fugL6Q4EZHr9yAfb+3YM9jdVjU?=
 =?us-ascii?Q?aWmDqXoQXigITwaQQHrKSF28eZDP+UtFEtct1ob60K1xEUmsjhVbqy+76VmL?=
 =?us-ascii?Q?pNc9g2EcOsFB81Kj3NXk8xrlUZ0nl3mNXCNI85gQA1cJC22ozwtPyMZ6n4Ie?=
 =?us-ascii?Q?hXIkDVp+Vcu8yAXFqR/LNdTMcIHlfR0duYNPslPfcnDs3Prqr4kVhiP86JoA?=
 =?us-ascii?Q?z74kDtz3mEEDVg9YzMt+TsCR5TAevVsYv7qQHO9P1+PdZJozUWRrKmn8bh1D?=
 =?us-ascii?Q?WxKt1ys3hGA73vhlSpTF2qJ6tNUSk2DQUKD+Gc3SSA6H+WBbKwSKpeKWhuHE?=
 =?us-ascii?Q?kRkXz/4I2NvaBKCtdF3boBp13prxtR0zJprqWOGZLfJWKU80qrKnJBO6ZdxN?=
 =?us-ascii?Q?NsvvTiLdP9ja7W6ZMMzfBghEpdtwZOQG5tURXHqBxoJwl0+dmUEePxuWs/gn?=
 =?us-ascii?Q?NYNMgXkGF8trm4TC0XeBiz2eMBCE5IEmStYcXi10uq28OQptBlAiPTaAzCOr?=
 =?us-ascii?Q?xTw6jI9HvBIoU9TFcIOcoIaPuwwF4QxKkskRtRxBhIgveUDeGjQnkuEUbO9B?=
 =?us-ascii?Q?UW3TRFv1lOg3gGq/DFy28fnhOHhr1/XBXON5e2t2npkX+Ao8lxDu8TCK6XSj?=
 =?us-ascii?Q?+9tc2OACXOVlBHfGwUm+I6npl9/hnQNlHv8PNxR5frabw8tAHOi/qwrPR/Ue?=
 =?us-ascii?Q?LNDNbTJC3xH+r/G/ETetD0waXhwyY/6LZpiM/yDcCndsJl2OVcO9bhHbus00?=
 =?us-ascii?Q?YJr0x34GAqFQs7cAqUpz5UVFmvH/WTWFtiUIdBG5DKtSR2suUQjOFx/9Hjmx?=
 =?us-ascii?Q?Os8O7qSaaFQptT9cmocFMkL82ZqsOrNdMk91CmR1dFw+7Ie0INyGK8KZioXC?=
 =?us-ascii?Q?tYQny+phZIpzRXI7O3mNoGTE0FhOUl/NvEekqTevVMm87veZ6+IOe9LHJjZj?=
 =?us-ascii?Q?7ngGeK8dORNQ5yFvPrti/SzdoU1QSr5eBfnfPZ6jOQKk+gu5DSqG8JElB9Dg?=
 =?us-ascii?Q?szngNdTl6fef4NZKcQsYPK6ukd/A5HLZBH2FBGIuCu3Z83WXDoimPjsJmAXw?=
 =?us-ascii?Q?4CkR92KklDe+aYPsNyvzlDznAZw5gu7ugBa0UUMlnqLaqSeP2qa7GBQZqyK5?=
 =?us-ascii?Q?iAP/y/v/ReJbKjYHo7x6ogFW1R7xdThWaWPiL8ulVqsswHdrVolLI1hDZvhu?=
 =?us-ascii?Q?74nUVcTxUX9KU5uZIGZdahgYuK85pxzuu3h34Ncd0WCjmxM04TyKFjIPq81+?=
 =?us-ascii?Q?6MDbj7AsKA9i1usJue+wGhNa5Z/rIVDBdMZPbvnqOHYq0+CPkHIoBgBSXzE3?=
 =?us-ascii?Q?QM0BzWajl9bLjBlIy/9KrVg3REA6RRRnyAwQwulJh2ggrAyVVwLbYQ1t458P?=
 =?us-ascii?Q?cAy+xIrhg8WZcL6rydg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iX2nBDX5t83MfUlp79bQL4EDrkee4b0C34zYpSLznWlQhKZZMynTvy1BTkRF?=
 =?us-ascii?Q?60dZVnuYGSydrM7lbXGm+Fgns3TOsawLKTxE+PCzONARi3/O3pUZ/mfNOIhN?=
 =?us-ascii?Q?In0p56INciwCJdI6zgjdPPM9iyTOpAry7oNAIOpirrwINAd5BsnF/4HdS04I?=
 =?us-ascii?Q?YtsNPmHaV8j24r0Oubkp6lXCoLJYOWLB3+aFNA7GqKQwDWEvcvOScjpHlZpy?=
 =?us-ascii?Q?zidumIWnikKkdh5Vq0AVabEJ/ntBRSkkgAu5H2bixNlhsICgorjM5az626o8?=
 =?us-ascii?Q?8LLQXhZ92+Hl/K0n1+7wOxx4WhQPb/nlSE3AVDr+lvccxjPQbgHhUnmpjVcI?=
 =?us-ascii?Q?FlvvhBnzSlY4jo0YoBDuZNTBgwDcv/2pSCmh4+XCnoE3HuqjnxBansX42wwQ?=
 =?us-ascii?Q?rs/oZ+IZWfGRt9UlV1kZ5dREctyFGDXrgYEOCQSYC8fDdcpZClo9+3Rq13j5?=
 =?us-ascii?Q?DTdTmjdrN5LNSUjdPAnZuNLDi3Ei+bH7U96AZslFk+wojZKUkP8DARpUV9lt?=
 =?us-ascii?Q?aXxjtsBeit0RTvo1dsdYVhZkrjNt9TLb9RpNCql+rq99EpqJnhZRqtMXrr+t?=
 =?us-ascii?Q?O09hgG+Q4Jb+/bT5dXPqhjkpvsTFppnpdupFZHc988vnUyGEVVg52E+/mqTP?=
 =?us-ascii?Q?OlDnPEBUPQynR5h3njdscnpDkjeBxs1BS/+OzVZg8LGT4SlMell/p4xaIxqS?=
 =?us-ascii?Q?siF1YxVFpyHZUyY2bcL9el06qMT+SPHdxz7UBtjnrt8uNHQNlLTKAmIdCtSI?=
 =?us-ascii?Q?mMF56bopREpWEhsafwHp47PiGmawnAr4J5kWlCODvB/Kjs36vIfGx5xi5P0q?=
 =?us-ascii?Q?N8LlqrPkqMhk9kivWu8no/LaqFio9bcXdVzjtuN7BEv56lbxkWicqFXANTnH?=
 =?us-ascii?Q?/IAiej9EYyD1B8u1YPSeKvRRAM/m+t2/vSwXKICTMFHsjVUXc6O6MQ6JDJwf?=
 =?us-ascii?Q?CsI6JT/zCbCChsKWrcf4OZbF4/Ig1JvRt0qkQWCe9weoMSAsid3/Wviof4gc?=
 =?us-ascii?Q?lXpNXflp/76MtR462OTKV3Km1ArHsjtO4zqYlsiyzmAn6bEKoUlGyrW4FHT7?=
 =?us-ascii?Q?HKd17grC6xqvAmzNKpWo2h0uWr2YMyxYDpyzki6WxZj3i42dCv3Y1KBXUkOk?=
 =?us-ascii?Q?4J6lJgWAlVZS6LcR6oWiHY65upFAWhXW3ufdElUWf7npmomaRLkieMeVvn/T?=
 =?us-ascii?Q?7E9bz2MT/A8TXfWysV9SeFwqOAOoCHVpbdx066rm3Qd76s4VSUO3eXlUkgBM?=
 =?us-ascii?Q?WFIwRAJSp9tzJxfyy1Jn2MODXnCD4atsKh/WCZCqktiAQeFV0DB4n1Xv5K5S?=
 =?us-ascii?Q?AbT5oB/q0lVo7HfgBVrKv75UMLg6bT5+WvZVC53Uxy6uF1Df3ooWasTakgBb?=
 =?us-ascii?Q?iZGVz1HTfLdCnSZHGpGEyn7ogen0f+/9alrRlY/C5hidXTk+MesWSq1o0OaF?=
 =?us-ascii?Q?seCYvMDIMxbLAKYt25WSMs4s3ZJZBENuTrgK2hqMz4O7N3YFfAqJizYVjDK0?=
 =?us-ascii?Q?NYMG4mNu4xZJtX5RxB3gcgyIGJQllevPVdLREf53ICAGGSaxEYtUC7nbmtf6?=
 =?us-ascii?Q?s2LdPfaYw6SLnaEn8PdM8TpMJ7G0eSxt2Apf9IqCJTVMNTQdtXgTWL42/7FV?=
 =?us-ascii?Q?KeIwzJ6cWpCP+3q/E5JgkVRAJPJogAVIp3vXs5s6AgGqd4I4RSiPEfHxzkbu?=
 =?us-ascii?Q?VTdaJQiamwGWkfeF9o7pJDHDKkPMcEqcgkA9ZpaM/duBcfXY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9b821c-95fc-4c4d-bea9-08de590a2b8f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 16:28:54.9986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zC6MvYjpspDf084issj02Ao4Y9lG3glRKMbysBDWfHLO83nkRev2KGPd/Ln0eCpG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7180

On 21 Jan 2026, at 11:22, Kiryl Shutsemau wrote:

> With the upcoming changes to HVO, a single page of tail struct pages
> will be shared across all huge pages of the same order on a node. Since
> huge pages on the same node may belong to different zones, the zone
> information stored in shared tail page flags would be incorrect.
>
> Always fetch zone information from the head page, which has unique and
> correct zone flags for each compound page.
>
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> ---
>  include/linux/mmzone.h | 1 +
>  1 file changed, 1 insertion(+)
>
Make sense.

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
