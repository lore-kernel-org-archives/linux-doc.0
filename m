Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BE230E84A
	for <linux-doc@vger.kernel.org>; Wed, 10 Dec 2025 03:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765338052; cv=none; b=WXiZIi5hj1/8QqD65PYFbIi9M2Z0muVMIs+Et2g8bPM+1ZuCfAFGoPpjaxkAmG9fcQXQ+h++QB6M+OOtP+WbxlivyDgal4JR+yVZWB31Pk9ZPlano/oWbzbTQYgEmioOSSrIN9KWvbUB5mPjXOl/yYzxeady3ARjiHyHvpArObc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765338052; c=relaxed/simple;
	bh=9oqviFKoTHAhGwQy6F+NAQ/1BrNXZKhdi1PGKzY4zE0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=eLqPSkZWWSoPOsxzR2rXeAoayn8JBYBgHosu3/vtV3R4nUn/540UnnAxPeiLNuREJHyHovZCrkiiwJIZwNjDNLNwWwZ205QIBe1VZZsty6VzMo/rS4lqt7WAo/TL3sWhe6sGnEYvsdrbCoZSGKor515ASHt3WK/9jfP+FMGpwoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vdGc9NdR; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vdGc9NdR"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765338047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IahRfcaN/wS2F2zk9l8Y+MJaaILKyAdPoMXUoKo0oyI=;
	b=vdGc9NdRghRFW2WaxuBMxyBRdc7LD97X3/mLwh/Fq9xTvIPkoFOgRVcgW9iXUb83kxN3GP
	SHStxRL9KXc6pq7Zj/MUAPXKmHvWlozOKiLi/iyMAAwhxIcbBGXLZgJlrjnPcuRo+i1lYQ
	KzUmk/xoVjnRUbCu1Gz2BVLPzgsPhdU=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCH 00/11] mm/hugetlb: Eliminate fake head pages from vmemmap
 optimization
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <m63ub6lxljw7m2mmc3ovbsyfurl7hp4cvx27tmwelcxxrra5m3@eva5tqcdjxtn>
Date: Wed, 10 Dec 2025 11:39:24 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>,
 Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Usama Arif <usamaarif642@gmail.com>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6396CF70-E10F-4939-8E38-C58BE5BF6F91@linux.dev>
References: <20251205194351.1646318-1-kas@kernel.org>
 <4F9E5F2F-4B4D-4CE2-929D-1D12B1DB44F8@linux.dev>
 <m63ub6lxljw7m2mmc3ovbsyfurl7hp4cvx27tmwelcxxrra5m3@eva5tqcdjxtn>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 9, 2025, at 22:44, Kiryl Shutsemau <kas@kernel.org> wrote:
>=20
> On Tue, Dec 09, 2025 at 02:22:28PM +0800, Muchun Song wrote:
>> The prerequisite is that the starting address of vmemmap must be =
aligned to
>> 16MB boundaries (for 1GB huge pages). Right? We should add some =
checks
>> somewhere to guarantee this (not compile time but at runtime like for =
KASLR).
>=20
> I have hard time finding the right spot to put the check.
>=20
> I considered something like the patch below, but it is probably too =
late
> if we boot preallocating huge pages.
>=20
> I will dig more later, but if you have any suggestions, I would
> appreciate.

If you opt to record the mask information, then even when HVO is
disabled compound_head will still compute the head-page address
by means of the mask. Consequently this constraint must hold for
**every** compound page. =20

Therefore adding your code in hugetlb_vmemmap.c is not appropriate:
that file only turns HVO off, yet the calculation remains broken
for all other large compound pages.

=46rom MAX_FOLIO_ORDER we know that folio_alloc_gigantic() can allocate
at most 16 GB of physically contiguous memory. We must therefore
guarantee that the vmemmap area starts on an address aligned to at
least 256 MB.

When KASLR is disabled the vmemmap base is normally fixed by a
macro, so the check can be done at compile time; when KASLR is enabled
we have to ensure that the randomly chosen offset is a multiple
of 256 MB. These two spots are, in my view, the places that need
to be changed.

Moreover, this approach requires the virtual addresses of struct
page (possibly spanning sections) to be contiguous, so the method is
valid **only** under CONFIG_SPARSEMEM_VMEMMAP.

Also, when I skimmed through the overall patch yesterday, one detail
caught my eye: the shared tail page is **not** "per hstate"; it is
"per hstate, per zone, per node", because the zone and node
information is encoded in the tail page=E2=80=99s flags field. We should =
make
sure both page_to_nid() and page_zone() work properly.

Muchun,
Thanks.

>=20
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 04a211a146a0..971558184587 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -886,6 +886,14 @@ static int __init hugetlb_vmemmap_init(void)
> BUILD_BUG_ON(__NR_USED_SUBPAGE > HUGETLB_VMEMMAP_RESERVE_PAGES);
>=20
> 	for_each_hstate(h) {
> + 		unsigned long size =3D huge_page_size(h) / sizeof(struct =
page);
> +
> + 		/* vmemmap is expected to be naturally aligned to page =
size */
> + 		if (WARN_ON_ONCE(!IS_ALIGNED((unsigned long)vmemmap, =
size))) {
> + 			vmemmap_optimize_enabled =3D false;
> + 			continue;
> + 		}
> +
> 		if (hugetlb_vmemmap_optimizable(h)) {
> 			register_sysctl_init("vm", =
hugetlb_vmemmap_sysctls);
> 			break;
> --=20
>  Kiryl Shutsemau / Kirill A. Shutemov

