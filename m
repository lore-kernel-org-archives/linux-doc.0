Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4F03A7DF4
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 03:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769051480; cv=none; b=O4sL14nvrvMc55ugSsg43DFPo9r9K6k/CTtmw1wGp506NBJmobc51/VfiEJqqxVQJ+vXZJEUYNbwlNz+IFLjfHh8WRFsOeXqgvaWpYrVulXwNwWJv7gEfel6/pxMR9yqLB1t8zb17iUGjzeRI3ZNMamW1v4OY8VIb4PYfckWCw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769051480; c=relaxed/simple;
	bh=ZQDnhhWuG4i8BpEog6Mk9tYJNSL01Pw6xxtVJ0xfuR8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hklDrk7hmILOGz6TJJDvWPA7ATDroPFcocWn67KFh7DA7TUI7yJui30BJFRXyOoo+PO+MeCEyz8nMFroIaWrqDLcdMoWbSFUaYmU6ylRbC5/NPt+v6isLrypPxKkaMLdyDzFbzLQ8ZP/fVPrZLin7fbiLjk4ZT+Y6aY6dpdlt9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UjCCfmCt; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UjCCfmCt"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769051465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xvA1wq0qreituDJh/hMPrxm5rJ40HKT6I2SwEUTel6w=;
	b=UjCCfmCtXXXGGrvHicWu9/ktRUefIaFeWghRm+n3yZOagd0wHt22hJMOXGuVgKU6qMXd+3
	2Koitgh292ACg/8cFqBNXbxbrz6i4oOm8eVGTfauPatCgZ+EoDa0GvPAuijwHr3f9fQZam
	YEewmn01tWJrJotrZ7HlTldzd6KqBzI=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv4 07/14] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260121162253.2216580-8-kas@kernel.org>
Date: Thu, 22 Jan 2026 11:10:26 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <71F051F2-5F3B-40A5-9347-BA2D93F2FF3F@linux.dev>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-8-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Jan 22, 2026, at 00:22, Kiryl Shutsemau <kas@kernel.org> wrote:
>=20
> If page->compound_info encodes a mask, it is expected that memmap to =
be
> naturally aligned to the maximum folio size.
>=20
> Add a warning if it is not.
>=20
> A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the
> kernel is still likely to be functional if this strict check fails.
>=20
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> ---
> include/linux/mmzone.h | 1 +
> mm/sparse.c            | 5 +++++
> 2 files changed, 6 insertions(+)
>=20
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 390ce11b3765..7e4f69b9d760 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -91,6 +91,7 @@
> #endif
>=20
> #define MAX_FOLIO_NR_PAGES (1UL << MAX_FOLIO_ORDER)
> +#define MAX_FOLIO_SIZE (PAGE_SIZE << MAX_FOLIO_ORDER)
>=20
> enum migratetype {
> MIGRATE_UNMOVABLE,
> diff --git a/mm/sparse.c b/mm/sparse.c
> index 17c50a6415c2..5f41a3edcc24 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -600,6 +600,11 @@ void __init sparse_init(void)
> 	BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
> 	memblocks_present();
>=20
> + 	if (compound_info_has_mask()) {
> + 		WARN_ON(!IS_ALIGNED((unsigned long)pfn_to_page(0),
> +    			MAX_FOLIO_SIZE / sizeof(struct page)));

I still have concerns about this. If certain architectures or =
configurations,
especially when KASLR is enabled, do not meet the requirements during =
the
boot stage, only specific folios larger than a certain size might end up =
with
incorrect struct page entries as the system runs. How can we detect =
issues
arising from either updating the struct page or making incorrect logical
judgments based on information retrieved from the struct page?

After all, when we see this warning, we don't know when or if a problem =
will
occur in the future. It's like a time bomb in the system, isn't it? =
Therefore,
I would like to add a warning check to the memory allocation place, for
example:=20

  WARN_ON(!IS_ALIGNED((unsigned long)&folio->page, folio_size / =
sizeof(struct page)));

However, in order to minimize the impact on the buddy allocator, I =
personally
suggest changing `WARN_ON` to `BUG_ON` here, and changing the checked =
size from
`MAX_FOLIO_SIZE` to the maximum size that the buddy can allocate, in =
order to
ensure the buddy allocator works fine. This check requirement is much =
weaker
than `MAX_FOLIO_SIZE`, so I think `BUG_ON` should not be easily =
triggered and
therefore should not be a problem. For non-buddy allocator interfaces =
(such
as `folio_alloc_gigantic` or `cma_alloc_folio`, etc.), we need to check =
whether
their struct page address is aligned as required. If it is not aligned, =
return
failure and print relevant prompt information to remind the reason.

> + 	}
> +
> 	pnum_begin =3D first_present_section_nr();
> 	nid_begin =3D sparse_early_nid(__nr_to_section(pnum_begin));
>=20
> --=20
> 2.51.2
>=20

