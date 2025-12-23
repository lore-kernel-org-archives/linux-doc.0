Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABF02E764B
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766479095; cv=none; b=UDoCWu8Do7Cozmk7qFf09azyOCcimz5ZEy9Kx9Hva70AYj8t2beN0xzbTzgrqi6KqTvK+dMKvscE+OoGiP+dIh2uJ8qLlbJgmb7UKvfdvYx0Eyg5XLX565WgYgRO3Q0DfqFXR+YFT0h6ZRcWOEwi4JfVrJvb36YFBgLHXBQhyNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766479095; c=relaxed/simple;
	bh=JVqssrgNVIt1GMeeaZkcbXfXktQUAuugBNh6PUjbH5g=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ZRrbswGaZLpCKui/6pH0To6z8LfbRObU/n7jCGHEHDa/nsfD8wA6VPBYnR5PQEEjv8h9eeIzF2PmFPj4pmLRCXowDRdjLpYP0HE5d9cZAlMVA2fCjetIOX24qEi2Zbhu3BS9dWvRrz7Dle99bf57ENDu4YGa1WKs7Udcisz58To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SIkXFXx3; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SIkXFXx3"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766479091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T3bZGvz6MmLv1ELl8PtfKAdNX1JyM/84K1naNpWvlzU=;
	b=SIkXFXx3A5OBSvwycBg77SCgntOdSO/3JTaPBParteu7KlOITT/9m2GUiC/30qBIR5HSGX
	cCjlmpvNz6WPbA1GRMOLZ9HcL6Mqge7p46ZYQbYdjnoUa/UeiKxEJ1cwOKikH1wqhFqrP7
	bsExehCgQ3NK9OI0FeqbbIGM4gfXue8=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCHv2 06/14] mm: Rework compound_head() for power-of-2
 sizeof(struct page)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <jre3fk4ojcw4qbnp2feq7ed4iwo4zjj5leehv6l6jtw6soigm2@iybzeqz7jyi7>
Date: Tue, 23 Dec 2025 16:37:39 +0800
Cc: Oscar Salvador <osalvador@suse.de>,
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
 linux-doc@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1786115E-4C04-490B-A45B-9C06D7B33ED3@linux.dev>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-7-kas@kernel.org>
 <bde227ef-b072-4f48-ab68-bf184dfe7421@linux.dev>
 <jre3fk4ojcw4qbnp2feq7ed4iwo4zjj5leehv6l6jtw6soigm2@iybzeqz7jyi7>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 22, 2025, at 22:03, Kiryl Shutsemau <kas@kernel.org> wrote:
>=20
> On Mon, Dec 22, 2025 at 11:20:48AM +0800, Muchun Song wrote:
>>=20
>>=20
>> On 2025/12/18 23:09, Kiryl Shutsemau wrote:
>>> For tail pages, the kernel uses the 'compound_info' field to get to =
the
>>> head page. The bit 0 of the field indicates whether the page is a
>>> tail page, and if set, the remaining bits represent a pointer to the
>>> head page.
>>>=20
>>> For cases when size of struct page is power-of-2, change the =
encoding of
>>> compound_info to store a mask that can be applied to the virtual =
address
>>> of the tail page in order to access the head page. It is possible
>>> because struct page of the head page is naturally aligned with =
regards
>>> to order of the page.
>>>=20
>>> The significant impact of this modification is that all tail pages =
of
>>> the same order will now have identical 'compound_info', regardless =
of
>>> the compound page they are associated with. This paves the way for
>>> eliminating fake heads.
>>>=20
>>> The HugeTLB Vmemmap Optimization (HVO) creates fake heads and it is =
only
>>> applied when the sizeof(struct page) is power-of-2. Having identical
>>> tail pages allows the same page to be mapped into the vmemmap of all
>>> pages, maintaining memory savings without fake heads.
>>>=20
>>> If sizeof(struct page) is not power-of-2, there is no functional
>>> changes.
>>>=20
>>> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
>>=20
>> Reviewed-by: Muchun Song <muchun.song@linux.dev>
>>=20
>> One nit bellow.
>>=20
>>> ---
>>>  include/linux/page-flags.h | 62 =
+++++++++++++++++++++++++++++++++-----
>>>  mm/util.c                  | 16 +++++++---
>>>  2 files changed, 66 insertions(+), 12 deletions(-)
>>>=20
>>> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
>>> index 0de7db7efb00..fac5f41b3b27 100644
>>> --- a/include/linux/page-flags.h
>>> +++ b/include/linux/page-flags.h
>>> @@ -210,6 +210,13 @@ static __always_inline const struct page =
*page_fixed_fake_head(const struct page
>>>   if (!static_branch_unlikely(&hugetlb_optimize_vmemmap_key))
>>>   return page;
>>> + /*
>>> +  * Fake heads only exists if size of struct page is power-of-2.
>>> +  * See hugetlb_vmemmap_optimizable_size().
>>> +  */
>>> + if (!is_power_of_2(sizeof(struct page)))
>>> + return page;
>>> +
>>>   /*
>>>    * Only addresses aligned with PAGE_SIZE of struct page may be =
fake head
>>>    * struct page. The alignment check aims to avoid access the =
fields (
>>> @@ -223,10 +230,14 @@ static __always_inline const struct page =
*page_fixed_fake_head(const struct page
>>>    * because the @page is a compound page composed with at least
>>>    * two contiguous pages.
>>>    */
>>> - unsigned long head =3D READ_ONCE(page[1].compound_info);
>>> + unsigned long info =3D READ_ONCE(page[1].compound_info);
>>> - if (likely(head & 1))
>>> - return (const struct page *)(head - 1);
>>> + /* See set_compound_head() */
>>> + if (likely(info & 1)) {
>>> + unsigned long p =3D (unsigned long)page;
>>> +
>>> + return (const struct page *)(p & info);
>>> + }
>>>   }
>>>   return page;
>>>  }
>>> @@ -281,11 +292,27 @@ static __always_inline int =
page_is_fake_head(const struct page *page)
>>>  static __always_inline unsigned long _compound_head(const struct =
page *page)
>>>  {
>>> - unsigned long head =3D READ_ONCE(page->compound_info);
>>> + unsigned long info =3D READ_ONCE(page->compound_info);
>>> - if (unlikely(head & 1))
>>> - return head - 1;
>>> - return (unsigned long)page_fixed_fake_head(page);
>>> + /* Bit 0 encodes PageTail() */
>>> + if (!(info & 1))
>>> + return (unsigned long)page_fixed_fake_head(page);
>>> +
>>> + /*
>>> +  * If the size of struct page is not power-of-2, the rest of
>>> +  * compound_info is the pointer to the head page.
>>> +  */
>>> + if (!is_power_of_2(sizeof(struct page)))
>>> + return info - 1;
>>> +
>>> + /*
>>> +  * If the size of struct page is power-of-2 the rest of the info
>>> +  * encodes the mask that converts the address of the tail page to
>>> +  * the head page.
>>> +  *
>>> +  * No need to clear bit 0 in the mask as 'page' always has it =
clear.
>>> +  */
>>> + return (unsigned long)page & info;
>>>  }
>>>  #define compound_head(page) ((typeof(page))_compound_head(page))
>>> @@ -294,7 +321,26 @@ static __always_inline void =
set_compound_head(struct page *page,
>>>         const struct page *head,
>>>         unsigned int order)
>>>  {
>>> - WRITE_ONCE(page->compound_info, (unsigned long)head + 1);
>>> + unsigned int shift;
>>> + unsigned long mask;
>>> +
>>> + if (!is_power_of_2(sizeof(struct page))) {
>>> + WRITE_ONCE(page->compound_info, (unsigned long)head | 1);
>>> + return;
>>> + }
>>> +
>>> + /*
>>> +  * If the size of struct page is power-of-2, bits [shift:0] of the
>>> +  * virtual address of compound head are zero.
>>> +  *
>>> +  * Calculate mask that can be applied to the virtual address of
>>> +  * the tail page to get address of the head page.
>>> +  */
>>> + shift =3D order + order_base_2(sizeof(struct page));
>>=20
>> We already have a macro for order_base_2(sizeof(struct page)),
>> that is STRUCT_PAGE_MAX_SHIFT.
>=20
> I used it before, but the name is obscure and opencoded version is
> easier to follow in my view.

OK. I'm fine with opencoded version as well.

>=20
> --=20
>  Kiryl Shutsemau / Kirill A. Shutemov


