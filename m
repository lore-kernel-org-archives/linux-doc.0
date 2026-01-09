Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5453587CA
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767951715; cv=none; b=bhfPNEpl+co7l9Cgh0TYnmzuD4sM3K9hG63/8XM9qGd9LtOxmw2hkSUneA1109HPW02LkIrQLtg/K5tTuILi0StKqcjKmmwXWctERZ14rExcnvTbf30zBDb0YVcUSViB3xyWktlbLetHBxrozQx9cXmrWqtU4uZmWxOtvRLhhVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767951715; c=relaxed/simple;
	bh=bKwgOMskqdA4tPkhNa8kIBmSirTsMELfV9ZLK6lKs+4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dqaUrHcSgZpqr9b1ka6qwWumTf2yABRBmx6z9/vOcXGzNaqltBlgYGKevlLaPk/Dvi1gmtdcmkdNOkbcF4K9ECedaRa+TA6nu1toFTsbZ/pgidDeLluIyhXC0yNHLAGp3N20+GDkGa/NSiOkHHiwch55gULvNH7oiV4+k9Za2vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sI+e2yT7; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sI+e2yT7"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767951701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H+5FiipzRYj/oIjJJysJmQ8HBc7MSXAZ4RNJB55yPyY=;
	b=sI+e2yT7/nZDArPgy8eiHaymz5EezHYFHyu0NJ6rmCLH8yjTShwgyHzFSj1UwbIjydzr7c
	1kJIzCPOLTs+EUR5zLUH9s+RDftQPHWmHhzz0jjuhvbPXyNNu1e7mC54TFgYpszg6VIJH2
	beFzsfBmxCn4xiofn0KDApdwZ0CwMPs=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv2 02/14] mm/sparse: Check memmap alignment
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <fwgrsslq74vk4dhkuh5hji3xnrql7nxuia6wdeexjltzb4feh3@nbshswn3egkb>
Date: Fri, 9 Jan 2026 17:40:47 +0800
Cc: Matthew Wilcox <willy@infradead.org>,
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
 linux-doc@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BFCB39D2-20F9-4059-8F54-9029208C37BE@linux.dev>
References: <3b758468-9985-49b8-948a-e5837decf52d@kernel.org>
 <CDAEC896-E3EB-4EAB-9F0F-70BC448B3B9A@linux.dev>
 <4f82b8ef-77de-422b-a9a5-691c4eca24a3@kernel.org>
 <glu3noshgeh7ktwwqofk7xcwkvhek2x3hrbdmyyo56gmctdx3t@adsfih557p7g>
 <2ace6fc2-6891-4d6c-98de-c027da03d516@kernel.org>
 <yup3hvfsn4tvfnv32mdf4yoabt4igb2lkvllfac72g3abdkovm@auqdaijzby7d>
 <fwgrsslq74vk4dhkuh5hji3xnrql7nxuia6wdeexjltzb4feh3@nbshswn3egkb>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Jan 8, 2026, at 21:30, Kiryl Shutsemau <kas@kernel.org> wrote:
>=20
> On Thu, Jan 08, 2026 at 12:32:47PM +0000, Kiryl Shutsemau wrote:
>> On Thu, Jan 08, 2026 at 12:08:35AM +0100, David Hildenbrand (Red Hat) =
wrote:
>>>>> "Then we make page->compound_head point to the dynamically =
allocated memdesc
>>>>> rather than the first page. Then we can transition to the above =
layout. "
>>>>=20
>>>=20
>>> Sorry for the late reply, it's been a bit crazy over here.
>>>=20
>>>> I am not sure I understand how it is going to work.
>>>>=20
>>>=20
>>> I don't recall all the details that Willy shared over the last years =
while
>>> working on folios, but I will try to answer as best as I can from =
the top of
>>> my head. (there are plenty of resources on the list, on the web, in =
his
>>> presentations etc.).
>>>=20
>>>> 32-byte layout indicates that flags will stay in the statically
>>>> allocated part, but most (all?) flags are in the head page and we =
would
>>>> need a way to redirect from tail to head in the statically =
allocated
>>>> pages.
>>>=20
>>> When working with folios we will never go through the head page =
flags.
>>> That's why Willy has incrementally converted most folio code that =
worked on
>>> pages to work on folios.
>>>=20
>>> For example, PageUptodate() does a
>>>=20
>>> folio_test_uptodate(page_folio(page));
>>>=20
>>> The flags in the 32-byte layout will be used by some non-folio =
things for
>>> which we won't allocate memdescs (just yet) (e.g., free pages in the =
buddy
>>> and other things that does not require a lot of metadata). Some of =
these
>>> flags will be moved into the memdesc pointer in the future as the =
conversion
>>> proceeeds.
>>=20
>> Okay, makes sense.
>>=20
>>>>> The "memdesc" could be a pointer to a "struct folio" that is =
allocated from
>>>>> the slab.
>>>>>=20
>>>>> So in the new memdesc world, all pages part of a folio will point =
at the
>>>>> allocated "struct folio", not the head page where "struct folio" =
currently
>>>>> overlays "struct page".
>>>>>=20
>>>>> That would mean that the proposal in this patch set will have to =
be reverted
>>>>> again.
>>>>>=20
>>>>>=20
>>>>> At LPC, Willy said that he wants to have something out there in =
the first
>>>>> half of 2026.
>>>>=20
>>>> Okay, seems ambitious to me.
>>>=20
>>> When the program was called "2025" I considered it very ambitious :) =
Now I
>>> consider it ambitious. I think Willy already shared early versions =
of the
>>> "struct slab" split and the "struct ptdesc" split recently on the =
list.
>>>=20
>>>>=20
>>>> Last time I asked, we had no idea how much performance would =
additional
>>>> indirection cost us. Do we have a clue?
>>>=20
>>> I raised that in the past, and I think the answer I got was that
>>>=20
>>> (a) We always had these indirection cost when going from tail page =
to
>>>    head page / folio.
>>> (b) We must convert the code to do as little page_folio() as =
possible.
>>>    That's why we saw so much code conversion to stop working on =
pages
>>>    and only work on folios.
>>>=20
>>> There are certainly cases where we cannot currently avoid the =
indirection,
>>> like when we traverse a page table and go
>>>=20
>>> pfn -> page -> folio
>>>=20
>>> and cannot simply go
>>>=20
>>> pfn -> folio
>>>=20
>>> On the bright side, we'll lose the head-page checks and can simply
>>> dereference the pointer.
>>>=20
>>> I don't know whether Willy has more information yet, but I would =
assume that
>>> in most cases this will be similar to the performance summary in =
your cover
>>> letter: "... has shown either no change or only a slight improvement =
within
>>> the noise.", just that it will be "only a slight degradation within =
the
>>> noise". :)
>>>=20
>>> We'll learn I guess, in particular which other page -> folio =
conversions
>>> cannot be optimized out by caching the folio.
>>>=20
>>>=20
>>> For quite some time there will be a magical config option that will =
switch
>>> between both layouts. I'd assume that things will get more =
complicated if we
>>> suddenly have a "compound_head/folio" pointer and a "compound_info" =
pointer
>>> at the same time.
>>>=20
>>> But it's really Willy who has the concept in mind as he is very =
likely right
>>> now busy writing some of that code.
>>>=20
>>> I'm just the messenger.
>>>=20
>>> :)
>>>=20
>>> [I would hope that Willy could share his thoughts]
>>=20
>> If you or Willy think that this patch will impede memdesc progress, I =
am
>> okay not pushing this patchset upstream.
>=20
> Or other option is to get this patchset upstream (I need to fix/test =
few
> things still) and revert it later when (if?) memdesc lands.
>=20
> What do you think?

It seems the merge of memdesc is still some time away? If it=E2=80=99s =
going to
take a while, my personal preference is to merge it first and then =
decide
whether to revert the changes based on actual needs.

Thanks.

>=20
> --=20
>  Kiryl Shutsemau / Kirill A. Shutemov


