Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792560986;
	b=QE5v8sqQL1cgOrBXSKEsz1KoFni02OGERIqNHV2wSnvpc0qiQiAzXYm09q6k2ziz05wR
	 YvwNjI1Ok84WY3NZr7M0bvrtNrAjMN/Si8wKOW3Z03Ipjb5zv0Cz6ZcOv8VJA2VtPU9RX
	 TvSqWxY1gZAGNcGQlPjBlFVjDX625QkyLds3UEvt+e0BgDef5nu8DZVBO3dr6mK+l2InI
	 o0tig1WrY41bAYI9J8AUSFKnjhDWAWBt4r98Fah9swMxaZuYcCUtU+c9DDnzj5D5kknn4
	 4QcIgkEqQprbHwT7t2iFtpiaYWMbJ0/HJDEnavn3/TgAeZVSe8Sj9jGXoplHBOgcLIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560986;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=o3QDH4GHZKZklfz0YvP98XXlcOQ9C0e/UzN3/wc5PoU=;
	b=ID+o6pQYEbFvhivRnmS7TDLNbcL9Z4ahg9UY2zAQpk3Qjzq5NiXgWdmxqAoOcIklod/Y
	 wZFPI0u0LF+KZImdjMg2RvESgPpQN6Cs+rDOWP9On/nC6W22dc1V6FcixD1i1nBoAJEPe
	 R9KO6mXUxtxXmivGtG/Hpy6LMncByunsO1G/BrLBFKZ4oKYWkVfp7RfHqKuIWekb6IemL
	 CPt4v/Hjgho8gM2lq1nmOcmZ+bOj8fDvTuZpw5VFm1EVXJIORl2PeMS2RIWauPjPAXJUZ
	 ERxj5Fa9K+bANcrmd/S6BDAKfIuv9F7Im3srwzIfU9dm+22ktLWsS4p6TaWabpzwhyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=luoyeHPH;
	arc=none smtp.remote-ip=95.215.58.32
Received: from mta1.migadu.com (out-32.mta1.migadu.com [95.215.58.32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07674606A31A
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 05:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07674606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=luoyeHPH
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WRus9dGBDYjUeT/LwFm/stq6NmRjNXUQhGme5JxIkOY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792560982; v=1; x=1793165782;
 b=luoyeHPH6x3yhOyE2QrOEiKTsuLBH2bb4PQiEdYqtGEvh0MnnaAj9tJrZ1HAb9qYsR/qASIa
 5/u3IENo3j1lgFPUZgjyzZXsf8dzM+USSkRXGxSHBywXQcifyHvlfirzE0YNM/BfclNUKNi3lAs
 zpgrmirXOdkoONjWDJweCQ/k=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 3d92309cb2c66050;
	Wed, 21 Oct 2026 05:36:22 +0000
X-Mizu-Trace-ID: 3d92309cb2c66050
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 1/4] mm/sparse-vmemmap: map shared vmemmap tail pages as
 read-only
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261021045744.93554-1-lance.yang@linux.dev>
Date: Wed, 21 Oct 2026 13:36:00 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 akpm@linux-foundation.org,
 david@kernel.org,
 osalvador@suse.de,
 maddy@linux.ibm.com,
 corbet@lwn.net,
 ljs@kernel.org,
 liam@infradead.org,
 vbabka@kernel.org,
 rppt@kernel.org,
 surenb@google.com,
 mhocko@suse.com,
 mpe@ellerman.id.au,
 npiggin@gmail.com,
 chleroy@kernel.org,
 ritesh.list@gmail.com,
 sshegde@linux.ibm.com,
 skhan@linuxfoundation.org,
 rdunlap@infradead.org,
 qi.zheng@linux.dev,
 linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F19AE41A-8150-4444-B18D-824BB0CECB82@linux.dev>
References: <20261019090830.1917657-2-songmuchun@bytedance.com>
 <20261021045744.93554-1-lance.yang@linux.dev>
To: Lance Yang <lance.yang@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 21, 2026, at 12:57, Lance Yang <lance.yang@linux.dev> wrote:
>=20
>=20
> On Mon, Oct 19, 2026 at 05:08:27PM +0800, Muchun Song wrote:
>> Both early HugeTLB HVO and device DAX use the common vmemmap =
population
>> path for shared tail mappings. Map these pages read-only so that =
illegal
>> writes fault instead of corrupting metadata shared by multiple tail
>> pages.
>>=20
>> For early HugeTLB, this moves existing write protection into initial
>> population without changing the final mapping. Device DAX gains the =
same
>> protection.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> Documentation/mm/vmemmap_dedup.rst | 3 +--
>> mm/sparse-vmemmap.c                | 3 +++
>> 2 files changed, 4 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/Documentation/mm/vmemmap_dedup.rst =
b/Documentation/mm/vmemmap_dedup.rst
>> index 8c287ae3f86c..76f903975a40 100644
>> --- a/Documentation/mm/vmemmap_dedup.rst
>> +++ b/Documentation/mm/vmemmap_dedup.rst
>> @@ -193,5 +193,4 @@ There's no remapping of vmemmap given that =
device-dax memory is not part of
>> System RAM ranges initialized at boot. Thus the tail page =
deduplication
>> happens at a later stage when we populate the sections.
>>=20
>> -Deduplicated tail pages are not mapped read-only. The mapping layout =
is the same
>> -as HugeTLB.
>> +The mapping layout is the same as HugeTLB.
>> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
>> index 40eba70c0048..ba0496daf4de 100644
>> --- a/mm/sparse-vmemmap.c
>> +++ b/mm/sparse-vmemmap.c
>> @@ -295,6 +295,9 @@ static pte_t * __meminit =
vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
>> return NULL;
>>=20
>> 	entry =3D pfn_pte(PHYS_PFN(__pa(p)), PAGE_KERNEL);
>> + 	/* Map the shared tail page as read-only to catch illegal =
writes. */
>> + 	if (vmemmap_optimizable_pfn(pfn))
>> + 		entry =3D pte_wrprotect(entry);
>=20
> LLM pointed out that an AO MCE before bootmem gather could still reach
> TestSetPageHWPoison() on a shared tail, since the head isn't marked
> hugetlb yet.

Compared with the RO problem, a more serious issue may be
that the struct page has not yet been initialized, and the
MCE preprocessing flow may all be problematic, performing
various operations based on an uninitialized struct page.
However, this problem is not specific to hugetlb; the same
problem exists when CONFIG_DEFERRED_STRUCT_PAGE_INIT is
enabled.

>=20
> Wouldn't that trigger an Oops ... Anyway, I wouldn't expect to hit =
that
> during boot.

Therefore, I do not think this kind of problem during the boot
stage is a problem, because we have no way to prevent it.

>=20
> Reviewed-by: Lance Yang <lance.yang@linux.dev>

THanks.

>=20
> [...]
>=20
> Cheers, Lance


