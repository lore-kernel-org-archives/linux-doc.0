Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E809E254849
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766489225; cv=none; b=tPDwThNFzVwLpxhG2galaswpcf2UfG8p1tNi3i66pWlgmBxDT55EmYoZ3Pz+gJqRp7sUn8nz6OnbijqHNiyvge0EGGHtaEq6T0Jvti7RiuN7ZLiHITJ543tOe/3ve2Xfm+zzP6Ua1JAex1MR1lvH3NEps0CBKe5igUOJNoH/qm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766489225; c=relaxed/simple;
	bh=JHAire6Xrax1yj32Yc8zIc5EhAa4dkXuU/POIrRR/HY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jCdnigsbLIjI6ii4a1Fl5yM/5jb1cxpbtlrLXTjh6E5D2mdd/+6/OnWUrSWEcnqBivo6s9fw1QGaGbEkaRyx4YyHAIT3s89wLxqiY589BFxoAOWBrE4FpoSHS2jvRP54uKKeNc5rmBAOY/KRxISHjwmZYcbdO8ReYLp28erZq+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ruu6uNy7; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ruu6uNy7"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766489220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JHAire6Xrax1yj32Yc8zIc5EhAa4dkXuU/POIrRR/HY=;
	b=ruu6uNy7NeHLswweIWluoeREM4QDf0rh3qZ+Urjcc0ceeBOlZFf7/WqDxNPMEBqhhyk1jM
	hTgK+0ZeTXoL4L26dmCdBhLDWJbrV0IFDeIGdHGOzWv4Bgqq5nn1oEZi6d6ZPJv9nf44s0
	j1+2u8uIbHVu1avHUbvFAL+MCK2+sKs=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCHv2 02/14] mm/sparse: Check memmap alignment
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <4f82b8ef-77de-422b-a9a5-691c4eca24a3@kernel.org>
Date: Tue, 23 Dec 2025 19:26:07 +0800
Cc: Matthew Wilcox <willy@infradead.org>,
 Kiryl Shutsemau <kas@kernel.org>,
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
Message-Id: <AE2B4254-3EF7-4974-858E-BDC51E02C9C5@linux.dev>
References: <3b758468-9985-49b8-948a-e5837decf52d@kernel.org>
 <CDAEC896-E3EB-4EAB-9F0F-70BC448B3B9A@linux.dev>
 <4f82b8ef-77de-422b-a9a5-691c4eca24a3@kernel.org>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 23, 2025, at 17:38, David Hildenbrand (Red Hat) =
<david@kernel.org> wrote:
>=20
> On 12/22/25 15:55, Muchun Song wrote:
>>> On Dec 22, 2025, at 22:18, David Hildenbrand (Red Hat) =
<david@kernel.org> wrote:
>>>=20
>>> =EF=BB=BFOn 12/22/25 15:02, Kiryl Shutsemau wrote:
>>>>> On Mon, Dec 22, 2025 at 04:34:40PM +0800, Muchun Song wrote:
>>>>>=20
>>>>>=20
>>>>> On 2025/12/18 23:09, Kiryl Shutsemau wrote:
>>>>>> The upcoming changes in compound_head() require memmap to be =
naturally
>>>>>> aligned to the maximum folio size.
>>>>>>=20
>>>>>> Add a warning if it is not.
>>>>>>=20
>>>>>> A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, =
so the
>>>>>> kernel is still likely to be functional if this strict check =
fails.
>>>>>=20
>>>>> Different architectures default to 2 MB alignment (mainly to
>>>>> enable huge mappings), which only accommodates folios up to
>>>>> 128 MB. Yet 1 GB huge pages are still fairly common, so
>>>>> validating 16 GB (MAX_FOLIO_SIZE) alignment seems likely to
>>>>> miss the most frequent case.
>>>> I don't follow. 16 GB check is more strict that anything smaller.
>>>> How can it miss the most frequent case?
>>>>> I=E2=80=99m concerned that this might plant a hidden time bomb: it
>>>>> could detonate at any moment in later code, silently triggering
>>>>> memory corruption or similar failures. Therefore, I don=E2=80=99t
>>>>> think a WARNING is a good choice.
>>>> We can upgrade it BUG_ON(), but I want to understand your logic =
here
>>>> first.
>>>=20
>>> Definitely no BUG_ON(). I would assume this is something we would =
find early during testing, so even a VM_WARN_ON_ONCE() should be good =
enough?
>>>=20
>>> This smells like a possible problem, though, as soon as some =
architecture wants to increase the folio size. What would be the =
expected step to ensure the alignment is done properly?
>>>=20
>>> But OTOH, as I raised Willy's work will make all of that here =
obsolete either way, so maybe not worth worrying about that case too =
much,
>> Hi David,
>=20
> Hi! :)
>=20
>> I hope you're doing well. I must admit I have limited knowledge of =
Willy's work, and I was wondering if you might be kind enough to share =
any publicly available links where I could learn more about the future =
direction of this project. I would be truly grateful for your guidance.
>> Thank you very much in advance.
>=20
> There is some information to be had at [1], but more at [2]. Take a =
look at [2] in "After those projects are complete - Then we can shrink =
struct page to 32 bytes:"
>=20
> In essence, all pages (belonging to a memdesc) will have a "memdesc" =
pointer (that replaces the compound_head pointer).
>=20
> "Then we make page->compound_head point to the dynamically allocated =
memdesc rather than the first page. Then we can transition to the above =
layout. "
>=20
> The "memdesc" could be a pointer to a "struct folio" that is allocated =
from the slab.
>=20
> So in the new memdesc world, all pages part of a folio will point at =
the allocated "struct folio", not the head page where "struct folio" =
currently overlays "struct page".
>=20
> That would mean that the proposal in this patch set will have to be =
reverted again.
>=20
>=20
> At LPC, Willy said that he wants to have something out there in the =
first half of 2026.
>=20
> [1] https://kernelnewbies.org/MatthewWilcox/Memdescs
> [2] https://kernelnewbies.org/MatthewWilcox/Memdescs/Path

Many thanks for taking the time to explain everything in detail and for =
providing
such valuable information. I plan to invest additional time to fully =
understand
the details you=E2=80=99ve shared.

Muchun,
Thanks.

>=20
> --=20
> Cheers
>=20
> David


