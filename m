Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE2317C9
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 14:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711549789; cv=fail; b=ChGpT0QdIcJ+FaTKf/f1ZxKzpUQWDSr00WkP3KXWT56ynXH5wZxVOI+LgTYe3mYRCpcou+AkAFJswUJqbUJ+VIfjkBHFEtoIa1cQcaYTdAvlc/X+mzgWQXVpYlbBYecH5gILyx5sEbkjAjFdDKQoCnDO2R4JCkGiVYUtJO6ZlxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711549789; c=relaxed/simple;
	bh=YG8ByXonk3DmfIf8AROE5vqySbk56MqUmskwEJhxPiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=biBtbI72ZreEYAU31M9Ssb5RwHQAwQIrxeaZNFufKg77rwuYIRwhhGaKIz/ajbyj9zHfrR9B4MOpbMVbLXDhrPpezh6ffirb2iYQimrrU7u1HnqkjCKoHskzGE/FL0yqQodcJu1VTU+fFfami84W8Gj3qPewoN5wQmJ5r4EpMvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OAaxERFW; arc=fail smtp.client-ip=40.107.102.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OAaxERFW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2jVGKdFPphhCihwFG/cNY/x8XNbK7gjxQXO4igP2gsC9ODR4F7EyhZD2bVmxh0GI9wAjtfyBOURBU63L1cna973kV7/fZa/ZBzXuij1oJugtsc9PeHwbmPSvf0ZCm8G4Qt0gi4Z8JOH12gvZxrLMCxpwulAmZgQUc1nBM3Q5EBWblvSBHIevPuMD4IIRhjVDlQPFYy2LjFrY+apPgsYsyzNlSi1VclpwLIHWjOO3Uz+1kMVln1pQH/Ec4J+86r4BhjcwM65VMR0b1jx+SThKX+P/y/Ja3nOTJiXarEkpfu9wsUMCdALZSN8APk3NBQqITJ9eO2zWTM4Xrc9+tj14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVTgtlfD3Av83X1Acu2jkrV6YQmdjcjQsqrs0wOFbBI=;
 b=hmOOFEjajsoucK4zDmwuANV/c1Z7CZBPa0RO5HOiadlH7GW9HY2Z72yAseBsKqedenI/yi+Flyz6HkUTwaPy9olLHmrFpW2oTxRfCx+Cu5/F745Mx3RtRanB8D+cJwdLUUgJrEuLBL25+eIrcb0TQVg+oMk6FCeUD17nK+xSRKSBZSkxJIBju6CDuYkqGBajA20ZexyhGw7r7QoqcQwyYha/jgAa/uaTT39Bhzql4a3hxziYB5zqlYF5UcEEBSsN/tsF8EFryRXq4mue9HARlh4NRpyvi/zrLHbcg+G1Bnz7cC74idBLHlxZx2j762H285yuyxPaUNmz+GNzzY742A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVTgtlfD3Av83X1Acu2jkrV6YQmdjcjQsqrs0wOFbBI=;
 b=OAaxERFWQBLmCvdSjT+YulH+qnLoqtEcAuf2XKpuUKTBPMniDEquCaPTkCPpD3EOGwqeF0fwOF5ngsQA8QJ71bl20ATNZtyGS/MeChgHHKCiu2xGo+5qaVdgvfLNGLIksaTsE+MFOMeACXPrmww8N/cnTQswTevgcFPzYAEXeunlws1NP97nN/pWWa4SbW1cyRKz0ggrBk38uHpLJA+qldL0jzuxiH7cn6De86eA6c+6S/fFsHgyyLaerPGLljx1QpaV404cVZlBPaqHFQ1/SzPB1+7kLNJPZolNbSKi1aGDtjzbCFiDjh9+z9RwPR4uxv2cEvr/+cxoP5DmR14JIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) by
 SJ0PR12MB7006.namprd12.prod.outlook.com (2603:10b6:a03:486::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 14:29:42 +0000
Received: from DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::dc5c:2cf1:d5f5:9753]) by DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::dc5c:2cf1:d5f5:9753%6]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 14:29:42 +0000
From: Zi Yan <ziy@nvidia.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, willy@infradead.org,
 Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
 Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH 1/6] mm: migrate: add isolate_movable_folio()
Date: Wed, 27 Mar 2024 10:29:39 -0400
X-Mailer: MailMate (1.14r6028)
Message-ID: <C3A86B80-49BB-4E2A-A230-9EB5FA2B4A40@nvidia.com>
In-Reply-To: <20240327141034.3712697-2-wangkefeng.wang@huawei.com>
References: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
 <20240327141034.3712697-2-wangkefeng.wang@huawei.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_FB39C306-EE3B-4E3D-B62A-1A0E2685CDCA_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR17CA0035.namprd17.prod.outlook.com
 (2603:10b6:208:15e::48) To DS7PR12MB5744.namprd12.prod.outlook.com
 (2603:10b6:8:73::18)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5744:EE_|SJ0PR12MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: 94bc9fa5-70b6-446f-8e92-08dc4e6a5794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I3iN9xo5DN4iaiSYtCnI7vxqpcfk+tbJpCLTSBk43yOhVK++tRgSJ7aCFfEcX7f5U5LTugl/f1mOA4HKh/ab+C76T3WJ33o6XXoVZdcI11IoHQJu6kjPuKBPI+DUSwmyg6UGAV0IblRrnzc+xw1Pkopv7VH3fIl0vEgfZUSVw5hcAIXiVBPgxLle/MZf/ft05CrgO7SiP2RmscDep5loMTMgzzpTWza6o+/Ajul0DonJ8b1qkYwarwDXvsx04lJIH/ihhfk+ragEn5mgg9L1RWdq81bG4w3GtN4LOkEOYLaJaN78TCR1aA6xEh3y2T9CguQtKUK25RyjiddMsiiNEi6forWN3YOlhJs3V8Loz12hCG0aafcC3D/Lm6Fy7K9a0brGr9whxomOhabr57tEfpnY1aqVaJ7GTNGVVflgPX7Yxf/6HzmYpQLgvPIAshqWM1amtI0UTFEu4U0DVk0e9GrHKTe6jqparqqrjR2J9g9FsZF4MvBldVbsvyZceg989HzRLbBhoLrJlyladumyIEV4vYrpm5w00BFoBhIogmHuBrMto/cdgID+lFOLI4d6Zwuk+vYLdKDveTl04Av+SeqtBaGEEQ9o7IJtB6aFA998abA2tkBVD4pBwQ1BIR0WmMchHumeQTP12h2541Viyqx7hWPaxc58tM7cw0q/DFo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TRPtd+jEn/6KWGpopAvjwjNqwr7KVaYKQYU8Vb4Zfxv4YZ7SkShF5aqzKyGa?=
 =?us-ascii?Q?l2fgkyc38Qlg5fAwxSyw/icOjPb8Up6trZQWe1aAHw8tGSr6Y+r9KTKKmIuj?=
 =?us-ascii?Q?uYk7d1Fxtefn+eOBnd9OVh13EdqeDEwAooq+BCdpR6hS9NO7DADdROc1q2jP?=
 =?us-ascii?Q?i/lIwIYz1XVSofmfaVplkvQE1qdWYwQzcjiZiEp4GoMXYjq5bnHqBxmUzszo?=
 =?us-ascii?Q?G37ZI0LWDrPZGFT1D13e6Lpo/HXr6ieXBkUM0ALPv8TpUj6PY60j1Z8nPJ4J?=
 =?us-ascii?Q?cTZJ15AFt0CIh5u5tSkrR0xh54dXfE0TwH35bItwuxdD1jwzj94cAhrxXb5V?=
 =?us-ascii?Q?Kiof5m/0+sSowQrkh0XImdia5xhdYh0AE2ss1BnLCjVYVmctRePlZjk5Qp2C?=
 =?us-ascii?Q?0JVzQyBM7zm7Rw08Xog2ZzgeUhEV6IKG3Ka7jZUJXYHmkwpt3Nox1jSsIwsA?=
 =?us-ascii?Q?5yUn8+ecAINYqMlTv6eio+UZkOkj63j8OGZgtGspmTYGTmQM1Rf6OWef8DqL?=
 =?us-ascii?Q?l4XzjRMl7RVDn0VPlvYkva5KfLUQlLGCJVfdo1280cZ5IzJzk63beqTcOMew?=
 =?us-ascii?Q?2cfEAaqURjD+Sd43zZytJS1xgCZrxHXbRS3Lo6rmbXvLVWOU9dq06JmASl1x?=
 =?us-ascii?Q?Hq9bMmmw1g3HnNHAlz0A62byZ/l/ODU9wNCx47lb0XF1hq419vTcFngMVoMl?=
 =?us-ascii?Q?2iLFCGSMKvAPkkbvPFq4Xv6vDzLDh/53YgRTBDc+fYQ1I/QKLmB8X/I44Uec?=
 =?us-ascii?Q?GVzPPBs5qjunScBv6n996GLiAz4RE2qw5P4A41/FW4L/M+X/zWIedZOyX7Vs?=
 =?us-ascii?Q?EZR2UWdUElOMf7+2gX5gkN5IvgSxm02SjNQ7a0EE3EqI1CRPHZovc64XWcYk?=
 =?us-ascii?Q?/xyeNqiQkNgZP52h6XOfQOiFyNzO56zay6ovFL3y2hcbSjyLSULou/IvhiH5?=
 =?us-ascii?Q?2+Mn/9LwF06n1FsxN0IhqAnNv+vI2R/KyquKQE9MomuUJ6zYDg0JnB5IBAE8?=
 =?us-ascii?Q?o7PGlkULkdKqLCl1Qz7Sp9qe49xuYdCo7txCdyyDuZFzsoc42G+YtY0IYC4i?=
 =?us-ascii?Q?TcuR8hFh/DmGcP1vhvmygIvuMuEeYYGYAIDnSD5UgPRR+xBHzW8qZMVfSFod?=
 =?us-ascii?Q?VoCwapNGzzKvHxodQqCW1PxCA0eqJ1L38jcTVZG7Ac1VYJYAGrR1tpUbZGbn?=
 =?us-ascii?Q?+atdya4X+vjA61P/wLSzEIMN6Rw9FpkSspcsRmjIF2rn1Z81dJksRuXcmq2B?=
 =?us-ascii?Q?CuwEAGRYEA895TUuYoaeXXMPmW0xmZcSho9NbM/yCH3TmiL3JybnWHaa4+js?=
 =?us-ascii?Q?vflOpNGZxL4x3+7n+NLpkO/8WiC4ySghLGZsY4BuW45Fas5ymmajOVjJOqaP?=
 =?us-ascii?Q?KKUjwbBr97AFNGR+Y8eCnq5pePLpg8PlYNTUWq6q8DHWfCSkN6ttvaTs3JRf?=
 =?us-ascii?Q?7RRddYEITGht9sds7MQYHCIIRIZ37l0Cpsnj6JH6548vTHz0eoj9BeJ/XIIu?=
 =?us-ascii?Q?pzbeOny6IM9noVrHxhuLXheNVCXHD+sqbbf1ZRBPr9rfbrjidIiL/ghJY61M?=
 =?us-ascii?Q?zMfDr7R0siOFyt6BgXrt8baSxAFsjVBAK1ksJy02?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94bc9fa5-70b6-446f-8e92-08dc4e6a5794
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 14:29:42.3867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKPagQwybUMNsJVMcrAG6/HYxCn/Sbw8sTskMvdjFMR201oZ5juW1u+IZsovAYFU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7006

--=_MailMate_FB39C306-EE3B-4E3D-B62A-1A0E2685CDCA_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 27 Mar 2024, at 10:10, Kefeng Wang wrote:

> Like isolate_lru_page(), make isolate_movable_page() as a wrapper
> around isolate_lru_folio(), since isolate_movable_page() always
> fails on a tail page, add a warn for tail page and return immediately.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  include/linux/migrate.h |  3 +++
>  mm/migrate.c            | 41 +++++++++++++++++++++++------------------=

>  2 files changed, 26 insertions(+), 18 deletions(-)
>
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index f9d92482d117..a6c38ee7246a 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -70,6 +70,7 @@ int migrate_pages(struct list_head *l, new_folio_t ne=
w, free_folio_t free,
>  		  unsigned int *ret_succeeded);
>  struct folio *alloc_migration_target(struct folio *src, unsigned long =
private);
>  bool isolate_movable_page(struct page *page, isolate_mode_t mode);
> +bool isolate_movable_folio(struct folio *folio, isolate_mode_t mode);
>
>  int migrate_huge_page_move_mapping(struct address_space *mapping,
>  		struct folio *dst, struct folio *src);
> @@ -91,6 +92,8 @@ static inline struct folio *alloc_migration_target(st=
ruct folio *src,
>  	{ return NULL; }
>  static inline bool isolate_movable_page(struct page *page, isolate_mod=
e_t mode)
>  	{ return false; }
> +static inline bool isolate_movable_folio(struct page *page, isolate_mo=
de_t mode)
> +	{ return false; }
>
>  static inline int migrate_huge_page_move_mapping(struct address_space =
*mapping,
>  				  struct folio *dst, struct folio *src)
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 2228ca681afb..b2195b6ff32c 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -57,31 +57,29 @@
>
>  #include "internal.h"
>
> -bool isolate_movable_page(struct page *page, isolate_mode_t mode)
> +bool isolate_movable_folio(struct folio *folio, isolate_mode_t mode)
>  {
> -	struct folio *folio =3D folio_get_nontail_page(page);
>  	const struct movable_operations *mops;
>
>  	/*
> -	 * Avoid burning cycles with pages that are yet under __free_pages(),=

> +	 * Avoid burning cycles with folios that are yet under __free_pages()=
,
>  	 * or just got freed under us.
>  	 *
> -	 * In case we 'win' a race for a movable page being freed under us an=
d
> +	 * In case we 'win' a race for a movable folio being freed under us a=
nd
>  	 * raise its refcount preventing __free_pages() from doing its job
> -	 * the put_page() at the end of this block will take care of
> -	 * release this page, thus avoiding a nasty leakage.
> +	 * the folio_put() at the end of this block will take care of
> +	 * release this folio, thus avoiding a nasty leakage.
>  	 */
> -	if (!folio)
> -		goto out;
> +	folio_get(folio);

You need folio_try_get() instead. Since folio_get_nontail_page() calls
get_page_unless_zero() first.

>
>  	if (unlikely(folio_test_slab(folio)))
>  		goto out_putfolio;
>  	/* Pairs with smp_wmb() in slab freeing, e.g. SLUB's __free_slab() */=

>  	smp_rmb();
>  	/*
> -	 * Check movable flag before taking the page lock because
> -	 * we use non-atomic bitops on newly allocated page flags so
> -	 * unconditionally grabbing the lock ruins page's owner side.
> +	 * Check movable flag before taking the folio lock because
> +	 * we use non-atomic bitops on newly allocated folio flags so
> +	 * unconditionally grabbing the lock ruins folio's owner side.
>  	 */
>  	if (unlikely(!__folio_test_movable(folio)))
>  		goto out_putfolio;
> @@ -91,13 +89,13 @@ bool isolate_movable_page(struct page *page, isolat=
e_mode_t mode)
>  		goto out_putfolio;
>
>  	/*
> -	 * As movable pages are not isolated from LRU lists, concurrent
> -	 * compaction threads can race against page migration functions
> -	 * as well as race against the releasing a page.
> +	 * As movable folios are not isolated from LRU lists, concurrent
> +	 * compaction threads can race against folio migration functions
> +	 * as well as race against the releasing a folio.
>  	 *
> -	 * In order to avoid having an already isolated movable page
> +	 * In order to avoid having an already isolated movable folio
>  	 * being (wrongly) re-isolated while it is under migration,
> -	 * or to avoid attempting to isolate pages being released,
> +	 * or to avoid attempting to isolate folios being released,
>  	 * lets be sure we have the page lock
>  	 * before proceeding with the movable page isolation steps.
>  	 */
> @@ -113,7 +111,7 @@ bool isolate_movable_page(struct page *page, isolat=
e_mode_t mode)
>  	if (!mops->isolate_page(&folio->page, mode))
>  		goto out_no_isolated;
>
> -	/* Driver shouldn't use PG_isolated bit of page->flags */
> +	/* Driver shouldn't use PG_isolated bit of folio->flags */
>  	WARN_ON_ONCE(folio_test_isolated(folio));
>  	folio_set_isolated(folio);
>  	folio_unlock(folio);
> @@ -124,10 +122,17 @@ bool isolate_movable_page(struct page *page, isol=
ate_mode_t mode)
>  	folio_unlock(folio);
>  out_putfolio:
>  	folio_put(folio);
> -out:
>  	return false;
>  }
>
> +bool isolate_movable_page(struct page *page, isolate_mode_t mode)
> +{
> +	if (WARN_RATELIMIT(PageTail(page), "trying to isolate tail page"))
> +		return false;

Why bother adding a warning here? There was no warning before. Also,
after this series, isolate_movable_page() will be gone.

> +
> +	return isolate_movable_folio((struct folio *)page, mode);
> +}
> +
>  static void putback_movable_folio(struct folio *folio)
>  {
>  	const struct movable_operations *mops =3D folio_movable_ops(folio);
> -- =

> 2.27.0


--
Best Regards,
Yan, Zi

--=_MailMate_FB39C306-EE3B-4E3D-B62A-1A0E2685CDCA_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEE6rR4j8RuQ2XmaZol4n+egRQHKFQFAmYELVMPHHppeUBudmlk
aWEuY29tAAoJEOJ/noEUByhUbjsP/31V+i7ad0LktOPCP3L6BcTuGFUQQCthtPTY
+F8NwNH/gLvsH7nU4kr59Hqzpro/wpaYBel39oKQYZstOq7V8D+b1V/f8WUDnlkj
lAkx2if6mLdE5YVaGF2q8aA4/LOtTK5sNtnttkW/TtOIQUeAB+s3+6EsdthDxs1H
wD42xfH+/su5ahqnHKdn6WXEBw0z/qeL3Iy2aNlnXQqxfwPfAkIm7hlYFikJegkW
5y2f5+E7bMKFj5HgUI+lehlC5sQA34dHaok0tTrYrufEJe4Rz6BDXn8Vo+LEWqEj
fD1qzwLkwrZb+tYCzwGiH5XBZuR257lSofLIagovc3dHibwBgqktaRAXsolHFV1S
qCaR6oJAf8BkzCfwW79YOYA0Jz3yZNccH4QmAWrZmDY5VjvMXC9Xkaz8/uRbCC/z
v8g0SZwa30XbM2QEzoo4Np3POGf08AkKHSgWUxlewpqx0keBDu9tY/q9h8N82plb
ppt5QsE2wa9kgoYv6zozXMScspmYNs9Ftt+/jKP+evX8p3a2w90Ljq/jB0fHyAyr
yn1fV4AsUYWL0UQQM9A9s5irUEBqaBP/Puvip9MNaBcBuosp/o+QoKR1Lqg2r3kC
xawVM544wPRGRlpqhfdUrcymEAH9ocjGi6FxXPXxRU2CBwjmZEuE+X3RjzBOKGrp
QFFHfrdq
=tYlE
-----END PGP SIGNATURE-----

--=_MailMate_FB39C306-EE3B-4E3D-B62A-1A0E2685CDCA_=--
