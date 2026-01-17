Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650423081BE
	for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 02:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768617615; cv=none; b=TK+ho1ckwQ5t8fdWmU7WUygQ83knBRMUaw+P4/qEmMZpBNU7ehvW+wAagkCOTsrUzcEZOdlsTvOq4BpY5C1qZ7qJPAd4wpbTTPla1vxwY3jkxflAiWcAxbjvsl/P61TiKysJxVDKe3ZNr0bWvQRNygn+tjFE3BkvIjdZisdl8l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768617615; c=relaxed/simple;
	bh=0ynNVtNeEZwk4HTGRWCQb3Zc0OanvI44FFjKzRdYEes=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=BT8L8peg2caPrQ3N7CoLNdOEJz5uwjkw45ZH1fIzxzE/cGAfsTyotMi7bZ3OvyrASQvXxZ7fWr2Ost5D51sLAWd3BvHZe3YcIRCFsWu2VFjvialu81La+BUsKwoYXdlpoZ/97rcKiHpNSuYiZq46e9aGFMrLIkbwuXV8EXcU+08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xp9iGWhD; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xp9iGWhD"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768617603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DRAUHQ48YUycgqnfPxdOpy3lIq4LIKBXjAPLlYalbN8=;
	b=xp9iGWhDcwt8mumGizWnyqjk+/ogh4k68oKpm1+E/iynSSYg1xwrWXba/vqeKNVNRBLryK
	VyKizZ7ifbQnWKD05zPhDyOxZqQIB4a1DeDyfS02iI8QFUW0G6aPnHq58rSvgFgYuxBLx6
	v5Xw4HdSkgdo5VqDVNQZR2AVyB7Qt+0=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv3 10/15] mm/hugetlb: Remove fake head pages
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <aWpTopypeRTOIVGR@thinkstation>
Date: Sat, 17 Jan 2026 10:38:48 +0800
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
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
Message-Id: <0F1C93F3-9A1A-4929-9157-589CF8C0588D@linux.dev>
References: <20260115144604.822702-1-kas@kernel.org>
 <20260115144604.822702-11-kas@kernel.org>
 <30ae1623-63f9-4729-9c19-9b0a9a0ae9f1@kernel.org>
 <aWkhbWR-3fWjeTaE@thinkstation>
 <53980726-C7F0-4648-99E9-89E10645F2E7@linux.dev>
 <aWpTopypeRTOIVGR@thinkstation>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Jan 16, 2026, at 23:52, Kiryl Shutsemau <kas@kernel.org> wrote:
>=20
> On Fri, Jan 16, 2026 at 10:38:02AM +0800, Muchun Song wrote:
>>=20
>>=20
>>> On Jan 16, 2026, at 01:23, Kiryl Shutsemau <kas@kernel.org> wrote:
>>>=20
>>> On Thu, Jan 15, 2026 at 05:49:43PM +0100, David Hildenbrand (Red =
Hat) wrote:
>>>> On 1/15/26 15:45, Kiryl Shutsemau wrote:
>>>>> HugeTLB Vmemmap Optimization (HVO) reduces memory usage by freeing =
most
>>>>> vmemmap pages for huge pages and remapping the freed range to a =
single
>>>>> page containing the struct page metadata.
>>>>>=20
>>>>> With the new mask-based compound_info encoding (for power-of-2 =
struct
>>>>> page sizes), all tail pages of the same order are now identical
>>>>> regardless of which compound page they belong to. This means the =
tail
>>>>> pages can be truly shared without fake heads.
>>>>>=20
>>>>> Allocate a single page of initialized tail struct pages per NUMA =
node
>>>>> per order in the vmemmap_tails[] array in pglist_data. All huge =
pages
>>>>> of that order on the node share this tail page, mapped read-only =
into
>>>>> their vmemmap. The head page remains unique per huge page.
>>>>>=20
>>>>> This eliminates fake heads while maintaining the same memory =
savings,
>>>>> and simplifies compound_head() by removing fake head detection.
>>>>>=20
>>>>> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
>>>>> ---
>>>>> include/linux/mmzone.h | 16 ++++++++++++++-
>>>>> mm/hugetlb_vmemmap.c   | 44 =
++++++++++++++++++++++++++++++++++++++++--
>>>>> mm/sparse-vmemmap.c    | 44 =
++++++++++++++++++++++++++++++++++--------
>>>>> 3 files changed, 93 insertions(+), 11 deletions(-)
>>>>>=20
>>>>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>>>>> index 322ed4c42cfc..2ee3eb610291 100644
>>>>> --- a/include/linux/mmzone.h
>>>>> +++ b/include/linux/mmzone.h
>>>>> @@ -82,7 +82,11 @@
>>>>>  * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with =
hugetlb, we expect
>>>>>  * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
>>>>>  */
>>>>> -#define MAX_FOLIO_ORDER get_order(IS_ENABLED(CONFIG_64BIT) ? =
SZ_16G : SZ_1G)
>>>>> +#ifdef CONFIG_64BIT
>>>>> +#define MAX_FOLIO_ORDER (34 - PAGE_SHIFT)
>>>>> +#else
>>>>> +#define MAX_FOLIO_ORDER (30 - PAGE_SHIFT)
>>>>> +#endif
>>>>=20
>>>> Where do these magic values stem from, and how do they related to =
the
>>>> comment above that clearly spells out 16G vs. 1G ?
>>>=20
>>> This doesn't change the resulting value: 1UL << 34 is 16GiB, 1UL << =
30
>>> is 1G. Subtract PAGE_SHIFT to get the order.
>>>=20
>>> The change allows the value to be used to define NR_VMEMMAP_TAILS =
which
>>> is used specify size of vmemmap_tails array.
>>=20
>> How about allocate ->vmemmap_tails array dynamically? If sizeof of =
struct
>> page is not power of two, then we could optimize away this array. =
Besides,
>> the original MAX_FOLIO_ORDER could work as well.
>=20
> This is tricky.
>=20
> We need vmemmap_tails array to be around early, in
> hugetlb_vmemmap_init_early(). By the time, we don't have slab
> functional yet.

I mean zero-size array at the end of pg_data_t, no slab is needed.

>=20
> I think getting the array compile-time is the best shot.
>=20
> --=20
>  Kiryl Shutsemau / Kirill A. Shutemov


