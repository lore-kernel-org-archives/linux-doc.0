Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14853126AF
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 09:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766396775; cv=none; b=uuqI9z6RG55Iuh10WW84Bo+/Pdb1qHy43fBsewQ9Cn4R+7rL95BYhb19/1+VhCTJ09BdrZY0VA+V6lK8G6E0Q8WsezkTvegrJvDAE+Rny55kRHwmMa1+6AtfKDel2Z41ViinS3oT3mhHJdMxqFpY3S0t7HQA+/C3WQtTodoYwkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766396775; c=relaxed/simple;
	bh=mqQh9yIE/F3IAbsBdjlJzFZuXWEyXPgfG9BSwkSSIh0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lx3pUhud9u7h3d3mSiQ7FMF69IRlCSqxKb5QZ6cFa1WwG/rphYwgMcTItbcDlXUDj361JKP4LFweF+IgMmo1ozvBQN8B/qUz45LJ885S8IbScvN+bMMQWBNMXECBdfgrP1tZ0wPpkx5p179mbg1zPpPaDF/tahPuWT12C50ZfH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dxJMTQnW; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dxJMTQnW"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766396761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mqQh9yIE/F3IAbsBdjlJzFZuXWEyXPgfG9BSwkSSIh0=;
	b=dxJMTQnWy7525VqqYqZfh9xjZ4zZlAeWpYhDHKN9ylu3y9DAi5fc46LkZOVobA3GPKOn7e
	yV6hiRozKtFavTcAUk6jWMRebaMfnHGH5nJ3vkAU+8Rk/ROojwjuUideiyTwKXGfpIiT9b
	CFt/EGJVEcJBZ4jassS2xC96d8BWCAM=
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
In-Reply-To: <34BED0AB-22AF-4107-84FB-543D11BCA136@linux.dev>
Date: Mon, 22 Dec 2025 17:45:16 +0800
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
Message-Id: <78326B0A-7845-4D80-8BAE-C2191030F8BC@linux.dev>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-7-kas@kernel.org>
 <34BED0AB-22AF-4107-84FB-543D11BCA136@linux.dev>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 22, 2025, at 15:57, Muchun Song <muchun.song@linux.dev> wrote:
>=20
>=20
>=20
>> On Dec 18, 2025, at 23:09, Kiryl Shutsemau <kas@kernel.org> wrote:
>>=20
>> For tail pages, the kernel uses the 'compound_info' field to get to =
the
>> head page. The bit 0 of the field indicates whether the page is a
>> tail page, and if set, the remaining bits represent a pointer to the
>> head page.
>>=20
>> For cases when size of struct page is power-of-2, change the encoding =
of
>> compound_info to store a mask that can be applied to the virtual =
address
>> of the tail page in order to access the head page. It is possible
>> because struct page of the head page is naturally aligned with =
regards
>> to order of the page.
>>=20
>> The significant impact of this modification is that all tail pages of
>> the same order will now have identical 'compound_info', regardless of
>> the compound page they are associated with. This paves the way for
>> eliminating fake heads.
>>=20
>> The HugeTLB Vmemmap Optimization (HVO) creates fake heads and it is =
only
>> applied when the sizeof(struct page) is power-of-2. Having identical
>> tail pages allows the same page to be mapped into the vmemmap of all
>> pages, maintaining memory savings without fake heads.
>>=20
>> If sizeof(struct page) is not power-of-2, there is no functional
>> changes.
>>=20
>=20
> Forgot to mention, I believe I stated in the previous version that =
this
> mechanism only applies when CONFIG_SPARSEMEM_VMEMMAP is configured.
> Therefore, you need to wrap the entire mechanism within =
CONFIG_SPARSEMEM_VMEMMAP.
> For other configurations, it's difficult to guarantee alignment to a =
very
> large size (for example, in the case of CONFIG_SPARSEMEM && =
!CONFIG_SPARSEMEM_VMEMMAP,
> vmemmap allocation uses kvmalloc, which only guarantees PAGE_SIZE =
alignment
> for the returned address).

I found that we can call kvmalloc_node_align inside =
populate_section_memmap (for
memory hotplug case), so that we can specify the alignment parameter as =
the
input size. Then, this mechanism can applied for CONFIG_SPARSEMEM &&
!CONFIG_SPARSEMEM_VMEMMAP.

For CONFIG_FLATMEM, we also need similar approach to specify the correct =
alignment
in alloc_node_mem_map().

Thanks.


