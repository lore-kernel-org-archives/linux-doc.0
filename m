Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3720410D35
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082224; cv=none; b=mrn88AcDZltcAXKGx7APjNdLG9x5xRAztJ3l9uwLU3i0hF1OzYFL/ImFmNVsxf/CTdgiAtJCf0GrN8OJOCwMn0UJ+TKmccVYV/8qqsMsdeTv8nogTmGGQOesQJVyC5hLo9G2/9ZWqK6xl0W5ucxucmKUs76Se9OvAL4wFdpTrmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082224; c=relaxed/simple;
	bh=5mti+cH+gIVHkhjhrlYIkIedLkXLfamyXpOSg9ale0I=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=KS6boxsRDAIq4mGxhsqXyNnmE93RIuWMiNZ7MDzRS1PYbGAHIHx+450Lur0eyrtjVAozS309w1+lSiYkB8JgPJNT7vnB66qj879iQ7tRjgbljN65EQVhYsY5vIlrl8b2AcaTbNQqPMA84alHTQKhDpgSjQyR5vrBd9nWODE15yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fLoqvw9Z; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fLoqvw9Z"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769082209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pzPuT7Y9eD4SMA4TJ/n5cBldWGtFSgOh9m5Kf01lyMo=;
	b=fLoqvw9ZME5l4IcJ8t5qH63hRwLwGLgIU9ZwopRTmvSipSXBciTztEZcY4UUj/+HIo16ko
	lk+A3QKMKCqa3AD2E6TXGTMLXKDLOx2zihvpvw4K15FZwFNM/vU3Jts5/GSTKoia7eUhHn
	QYmBoKT1bGABgm+zyTu7XB4Id0N25vw=
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
In-Reply-To: <35B81EA5-D719-4FC4-93C5-674DD5BFDA4F@linux.dev>
Date: Thu, 22 Jan 2026 19:42:47 +0800
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
Message-Id: <45434FC3-455E-4CE8-9F43-F398D5EC73A9@linux.dev>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-8-kas@kernel.org>
 <71F051F2-5F3B-40A5-9347-BA2D93F2FF3F@linux.dev>
 <aXIJY5irR0obgdQe@thinkstation>
 <35B81EA5-D719-4FC4-93C5-674DD5BFDA4F@linux.dev>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Jan 22, 2026, at 19:33, Muchun Song <muchun.song@linux.dev> wrote:
>=20
>=20
>=20
>> On Jan 22, 2026, at 19:28, Kiryl Shutsemau <kas@kernel.org> wrote:
>>=20
>> On Thu, Jan 22, 2026 at 11:10:26AM +0800, Muchun Song wrote:
>>>=20
>>>=20
>>>> On Jan 22, 2026, at 00:22, Kiryl Shutsemau <kas@kernel.org> wrote:
>>>>=20
>>>> If page->compound_info encodes a mask, it is expected that memmap =
to be
>>>> naturally aligned to the maximum folio size.
>>>>=20
>>>> Add a warning if it is not.
>>>>=20
>>>> A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so =
the
>>>> kernel is still likely to be functional if this strict check fails.
>>>>=20
>>>> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
>>>> ---
>>>> include/linux/mmzone.h | 1 +
>>>> mm/sparse.c            | 5 +++++
>>>> 2 files changed, 6 insertions(+)
>>>>=20
>>>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>>>> index 390ce11b3765..7e4f69b9d760 100644
>>>> --- a/include/linux/mmzone.h
>>>> +++ b/include/linux/mmzone.h
>>>> @@ -91,6 +91,7 @@
>>>> #endif
>>>>=20
>>>> #define MAX_FOLIO_NR_PAGES (1UL << MAX_FOLIO_ORDER)
>>>> +#define MAX_FOLIO_SIZE (PAGE_SIZE << MAX_FOLIO_ORDER)
>>>>=20
>>>> enum migratetype {
>>>> MIGRATE_UNMOVABLE,
>>>> diff --git a/mm/sparse.c b/mm/sparse.c
>>>> index 17c50a6415c2..5f41a3edcc24 100644
>>>> --- a/mm/sparse.c
>>>> +++ b/mm/sparse.c
>>>> @@ -600,6 +600,11 @@ void __init sparse_init(void)
>>>> BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
>>>> memblocks_present();
>>>>=20
>>>> +  if (compound_info_has_mask()) {
>>>> +  WARN_ON(!IS_ALIGNED((unsigned long)pfn_to_page(0),
>>>> +     MAX_FOLIO_SIZE / sizeof(struct page)));
>>>=20
>>> I still have concerns about this. If certain architectures or =
configurations,
>>> especially when KASLR is enabled, do not meet the requirements =
during the
>>> boot stage, only specific folios larger than a certain size might =
end up with
>>> incorrect struct page entries as the system runs. How can we detect =
issues
>>> arising from either updating the struct page or making incorrect =
logical
>>> judgments based on information retrieved from the struct page?
>>>=20
>>> After all, when we see this warning, we don't know when or if a =
problem will
>>> occur in the future. It's like a time bomb in the system, isn't it? =
Therefore,
>>> I would like to add a warning check to the memory allocation place, =
for
>>> example:=20
>>>=20
>>> WARN_ON(!IS_ALIGNED((unsigned long)&folio->page, folio_size / =
sizeof(struct page)));
>>=20
>> I don't think it is needed. Any compound page usage would trigger the
>> problem. It should happen pretty early.
>=20
> Why would you think it would be discovered early? If the alignment of =
struct page
> can only meet the needs of 4M pages (i.e., the largest pages that =
buddy can
> allocate), how can you be sure that there will be a similar path using =
CMA
> early on if the system allocates through CMA in the future (after all, =
CMA
> is used much less than buddy)?

Suppose we are more aggressive. If the alignment requirement of struct =
page
cannot meet the needs of 2GB pages (which is an uncommon memory =
allocation
requirement), then users might not care about such a warning message =
after
the system boots. And if there is no allocation of pages greater than or
equal to 2GB for a period of time in the future, the system will have no
problems. But once some path allocates pages greater than or equal to =
2GB,
the system will go into chaos. And by that time, the system log may no
longer have this warning message. Is that not the case?

>=20
>>=20
>> --=20
>> Kiryl Shutsemau / Kirill A. Shutemov


