Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045E4130481
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711550750; cv=fail; b=PfCwdC11hClueIvGpz0eeKkYqMkBrDEBEsNZw/PhzJKtVk681ap50jqmtfkM/GyTCtm03TBH8Gv5lQS0kgbKardjrOTLTeiLqKiGb151UfbPQAZ5jtC9BOanmw2jBNQeKs09qj1icprCrayzKu0jMnbcxRtt9UcgeYIoSeOJdFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711550750; c=relaxed/simple;
	bh=/r09anTNOTtTmOW6nUZ5b54gPyKK9cw7TRGJsgfcvxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JonpOsKLLPd1+9x4sG3oP1AFMTf2K2X6TNrS0Qz2TgNHcsOR5wd2cMbYBe+SP3PuQ5AfzDw260mfNkqAGfn4rV4+udXZfmeuxwICaWGCYS74b3TGqTLPfYD0Koy5wFGAQhp+A00YZUWE3aWPpn3xYClg6Kh7YGasQC78QeeXgO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CgQcGqw4; arc=fail smtp.client-ip=40.107.244.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CgQcGqw4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+pCWtva8zMwdlB3wRytKi1MUDAGavMKSROmkcmmSzmnpMiXNQrdgZZTRFRJJ0VmHc1qYBZS7gj1GDs0W2fM15+soE8qHC/8AfPz2e+ui1LgDFZDYH5ZbtiCjagKqM6qUWRFa55YZ/wZLWYCeS+V2BjOmqsRQWpw7xVvVY+a1k/wq58kitpImYHfknsEyBWAdcAneAUR2r3fC4HPxM7PPzUk45csWrHcbwdyRHUm6neSFQwRUnsLeENY511llFYEB425X8UA8OE9h8C2hoi7/+Jn6StkcJW0zV32ORUwzKav3TlIJJzN7chamJN1jj27fKo2fc7Z2cL1OeCWyu6clw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3C8A2Q4nkOmHQzEBwik36Mc9iYPMcOMlBNXuzUGSgY=;
 b=h3iYapKTldGsOVuAashMI54CGlEic9piKHy6g2CCf89WHP4jfOaO4bQS1tNohO2ijLhVp6FruUu6sOTHPNNNsLNH06H6p/JrAoMKHrBOkvsrK2t/1YTXVdQg/ZXtyX/Zf/uJX7sAfa6jHAcd2cDDiilohJd6jjvoBayRtcIZSJ7EHSRtxcM8C35A+34Tb920ifVcDf2V+s6BBEm4dcgAkcHVUUazULKylXqIAM1ByNM2qEilkomIeGwlOhchZSSycm83uVt8hQDiSZVkD3LUHCKBrDqA8XSDTDdziZ95qvpABTIZTrXZ0BSXbxa2FYwxaWyWu9zrRiFZgXXHizKLLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3C8A2Q4nkOmHQzEBwik36Mc9iYPMcOMlBNXuzUGSgY=;
 b=CgQcGqw4cFSn39Zfp8zswLxswKhbxTbhFBL5WooNrpws7553LOOzkVPFKZqJQXMo02f9ZpAQizMBfxZNP0RVTTYo0DJZx97IkztlhHQFzQhQP8EET8seqYVK+aYEJ0tzDNQVgbQ4hU6wZSfA8VFajf2YujUdU+8Gfn19OLhYkjPu8Ltr5v2SagvC3mE3a9giAPfDp5DF2aAKW7s8kB0Q17DLAoPGakAXIfOwI6BXNqC70nn3egVudlEMYm2xBkNRAlcDstoocSBHUBDbtsBB+5tcmiQjQIrPgFsjq+ZlbZXBtYUaDkVrZBCDXvvmfP71K48lAMG7Mad6wzuCMcbUvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) by
 CH0PR12MB8580.namprd12.prod.outlook.com (2603:10b6:610:192::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.32; Wed, 27 Mar 2024 14:45:45 +0000
Received: from DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::dc5c:2cf1:d5f5:9753]) by DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::dc5c:2cf1:d5f5:9753%6]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 14:45:45 +0000
From: Zi Yan <ziy@nvidia.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, willy@infradead.org,
 Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
 Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH 2/6] mm: memory_hotplug: use more folio in
 do_migrate_range()
Date: Wed, 27 Mar 2024 10:45:42 -0400
X-Mailer: MailMate (1.14r6028)
Message-ID: <01BB19DC-3807-4954-A04A-55518301B6BA@nvidia.com>
In-Reply-To: <20240327141034.3712697-3-wangkefeng.wang@huawei.com>
References: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
 <20240327141034.3712697-3-wangkefeng.wang@huawei.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_8846AEFD-544C-45A3-BB14-BB4D5F4ECDB4_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BL1PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::7) To DS7PR12MB5744.namprd12.prod.outlook.com
 (2603:10b6:8:73::18)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5744:EE_|CH0PR12MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0a0ada-73b6-40ce-274a-08dc4e6c957e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WTnSR8Nj2sgE0ZvmiBjhTK96C5SrAcNlnwHTLjVmGTHo+NuyJS3RwqyXAOaCLSZ6TksG2AR0aOaKJD4P1KQp44du9JjI+rv0092zvLEIfKv41kVXEB03glEKZMh9RuIxPyRyseUiU04wGcMrT+haZTCMKPa52E6whJ+w5jG6kiAR+kotIVu7TV1SSFTw6gC3b+T/3Ejae4VvbKmAR9UD0oNwbAd5PATCtb7BPlq5OTmGbzMomEb/LfPqPQ9D4wCVQrEuqot6S/NzDKcb0OhjgSRNd9jmCI6axAOoCNA23GMNWUKX3R2Zvr6S/0+xtCv0j4kruRkc7b+UDzGIl4jP1O7CNc0NRwpx2yPQKW1QV2POfEw5Twhfg3G4dYHrF/z06LPnBJGIqLKiWDToq/epI+Y5nVlyS+ZR2P+NiZyApwRdW84Auj7nydQwQbP5i7k9RmagRHlU4jyi9sYDcnzRM9qXE4234DGm5Im9qb0iCXOcU0ZplFnyu3tW9U7OtFNg9u0XM2hxDJrG5v3Z7eamqdRTxM6EYj6zEQMTQLpInDqUGy6d51ZcNIHgWvNfZHzuPq9dXbpxYXBPExytLwzqTqxOMP1owJckRYe8q6hxvMBiSotCZyzJ751OEjnlhmKHTU6+p8mOEDUCyZ38Ca5EIw9CDGHVsSqXfUkyWdWbxmw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D4w+KPP3Nc5pp+YeVakWMVeOJkzTGtwS8vZqmKmSykevWKp30nq1NJ7LeaLC?=
 =?us-ascii?Q?9/4DiXl9NUGnQeBnLHojdAq5TnPBrBFS8+thKHkyDnRAsz//lNsCw1RAZyLq?=
 =?us-ascii?Q?68iTCSDhFGJDbB+BzFHE5Q7b2LHltakFzRLCVsQ1giu5dhllVL8UX5jpV+lh?=
 =?us-ascii?Q?B7vvteA75ZBYXjt3EnXcrvSp0xkJ1cmi8UpD18yWetFLAJMXlaxWcay/xkqf?=
 =?us-ascii?Q?ocC5PrlTsMLZnQAYY78fC2dWbtPDer7trIkbaQ0btvh04CgMglvbqMardsiB?=
 =?us-ascii?Q?Kj6sSGWXxXRtj1givSKMo3KOWv/p/QiPiHmGeNEYBCu7x0nyqCLYx3217y7g?=
 =?us-ascii?Q?wpyxfm/4CLhyPqY93s50sPcgMRsr5KbBJhi+I9S6LWLCjR8roFsED5LhUODf?=
 =?us-ascii?Q?0bBiEB888sZjG+Dj6n4g5V/R0g7iPQjmbj4EYYjLr99OaQTsuP5TLMDl4N9r?=
 =?us-ascii?Q?RtnoxEJK+qNFyBbMouBVeoyIkDz09KqxJ9wT3f+CxZTqWvSAPumCDbQgSPXE?=
 =?us-ascii?Q?oWhcrbxRFyjlvBJ4DnBqWM1WgGCtWrjrOZq7KuThMdWcTllZ6YAd2dXAuvhP?=
 =?us-ascii?Q?8CV6lJRuExLJURHIXDZe4jf8LyffD48x56hIj8hHLsVTaoneRX+pUm11TRUX?=
 =?us-ascii?Q?QftP673KT/+svWhKrvdEl7MQ/kDj9qr5cgKk4g0jIRaebcnfhuBYESpYEssr?=
 =?us-ascii?Q?oNmquSXJIPCbW6+FPmfHRYkXVgX8QLY2uVdhRNlZD2NrazJrwK0SMkDSU0pE?=
 =?us-ascii?Q?NOMfOS9hDjEdIQdgF7Ife31As8KzVWbN+ygXqy5K93aPLBrQj6kRQ+FF+91k?=
 =?us-ascii?Q?VGLJQl0o8ygpB/bo+H0NLQ29fIJg8ltxhzuYn6fOVJLA/bBfPkJx7epktCLe?=
 =?us-ascii?Q?NQi7LOjauEs7e7a7gaqFMamft0wVVjMEehe1DKxcxQJrCvgrWO+TWAIcdbNP?=
 =?us-ascii?Q?DUQEou0CrbASMUZEL6l81+f+8huKo9w5qIXys+ZPesdRoM/BOh9U5TvAeVVa?=
 =?us-ascii?Q?jeui7yCnMjyGvD8+RCmWRSlHRqw5Fg+tTVHqswypk6MoBrfecImucfQEs6BM?=
 =?us-ascii?Q?FJQGpPPdcdE5T3D2WTrA9zg3QC+ljSlSXj7gGY/0AjQnxz7/l4Fx6bkALehO?=
 =?us-ascii?Q?mVVUDEEYYEIeLWr3soQ2PrD7rK7mVfNg2rMymrl9jOtLgvq+wuirrQMvmRMu?=
 =?us-ascii?Q?Hfg3DamxQ1/+s/DPx53viTA3ZcQMrcvhFnsVN73S0X9vBgRGryRki3AetUrF?=
 =?us-ascii?Q?yP4IOVUxkp+XVPgScce0NBkwka/BGNLxb5AcLYHGi+1wSVcjmEAp2kZ6rdOh?=
 =?us-ascii?Q?2gtUandkgfr4MEUkY9RnxR3n+vNbs01KWjldr5mJDjNz4bEp85cyF0NXCLaN?=
 =?us-ascii?Q?N6JhFFvbeQ8xKVPyzwewP4xlSa8VOHHdZvgGGu//xCR1+1C0e85B2wJCVcm7?=
 =?us-ascii?Q?gRkeqSX0L07NQLNuoVGW33DK8pDSefcUJxbWoqd8oYpTP85QThh4aj5uXOyV?=
 =?us-ascii?Q?gvojCd+fSkuh39kCFaIG+HfSX6VLfofs1ebVF7vL/91odkqDV//HAhVHLHKd?=
 =?us-ascii?Q?lXzLf9SFfNCIRSZNv7X+F1pF5bgzTpJYzL4PiTlH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0a0ada-73b6-40ce-274a-08dc4e6c957e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 14:45:45.2307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIghuvn+nkFuE7jzthcB3tgSfFe3QsBNPR9eEcUz/o4EgK5Lc1nsC6qgeGIkU4qg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8580

--=_MailMate_8846AEFD-544C-45A3-BB14-BB4D5F4ECDB4_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 27 Mar 2024, at 10:10, Kefeng Wang wrote:

> With isolate_movable_folio() and folio_isolate_lru(), let's use
> more folio in do_migrate_range() to save compound_head() calls.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  mm/memory_hotplug.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index a444e2d7dd2b..bd207772c619 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1774,14 +1774,14 @@ static int scan_movable_pages(unsigned long sta=
rt, unsigned long end,
>
>  static void do_migrate_range(unsigned long start_pfn, unsigned long en=
d_pfn)
>  {
> +	struct folio *folio;
>  	unsigned long pfn;
> -	struct page *page, *head;
>  	LIST_HEAD(source);
>  	static DEFINE_RATELIMIT_STATE(migrate_rs, DEFAULT_RATELIMIT_INTERVAL,=

>  				      DEFAULT_RATELIMIT_BURST);
>
>  	for (pfn =3D start_pfn; pfn < end_pfn; pfn++) {
> -		struct folio *folio;
> +		struct page *page, *head;

You could get rid of head too. It is only used to calculate next pfn,
so pfn =3D folio_to_pfn(folio) + folio_nr_pages(folio) - 1 would work.

And the PageHuge(page) and PageTransHuge(page) can be simplified, since
their pfn calculations are the same. Something like:

if (folio_test_large(folio)) {
	pfn =3D folio_to_pfn(folio) + folio_nr_pages(folio) - 1;
	if (folio_test_hugetlb(folio)) {
		isolate_hugetlb(folio, &source);
		continue;
	}
}



--
Best Regards,
Yan, Zi

--=_MailMate_8846AEFD-544C-45A3-BB14-BB4D5F4ECDB4_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEE6rR4j8RuQ2XmaZol4n+egRQHKFQFAmYEMRcPHHppeUBudmlk
aWEuY29tAAoJEOJ/noEUByhUYioP/im7+78vWoZsO5Zj+6Xvk1jOKMtflZvU28up
+0/AOaL1DtwXwBmatX/iMEsp56DF8aE0Lq8GUh2ypCTwj8kZgW7abJbE6q1mXMAi
wfg2swDzGM1s+3vhJV16xdaf7nMwIJvCgeFX2rL5z7c0SXBYnSyvZ9JBoZRMYoZ5
X7nCGBg7mwoDK6SYG/tZFGBSPI+e4MGd+5ip9wXnADzFFRFP/9soIVv6j1sZvivc
aLmvc2/12m0WogHnUlWztmg2aRJzDx9jc0W8rqF6UkMShQ58ZSX5ttxCFGqALYl8
+zUwbelaqtYobnxqFgtxIMvLk8H1AtgJrpDvlb9zQBvdxqis0RzxIV45aLweVi4p
umA+L44ykJVr8YX4chtyGQ8OvxzOgfWoA4GbsHkD6qz1S6uBunte0O9UlMVi8Y0G
pobd36Y2zb++jfB5HZeRbOlec/mFQHj8HbMW+mHo0lQqq3UePDC1UNWjcrss6z8M
nOJA3fRbZhZpwGq8kuHNJbIVpgbXAZpvOsOOM3UZOjfVpYWxR654f0FEBz3h7c0b
RWi3RIiWQE/+nI0to12Jii/Bjl6TFtA54HXU7xMe1ZHT30Y/CltXuEbJk/ERfoxs
oUsOWnK8pokI/qNW+5XZ+0BIi1u5pklh7vTzWkXxvlxHw9xGbev/AVaaBCezDkM5
Xem38M6+
=0XNw
-----END PGP SIGNATURE-----

--=_MailMate_8846AEFD-544C-45A3-BB14-BB4D5F4ECDB4_=--
