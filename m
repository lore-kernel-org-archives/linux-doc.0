Received: from mta1.migadu.com (out-236.mta1.migadu.com [95.215.58.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB024FDE64
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676235; cv=none; b=tGn+LzYYVNKfVR5NdmRKAbAsBUTvzFF2xhWmBm0PxAKcbW9lwhx2gyCQ8uHx5m6FJkFTnLjN/p5xXKANeVQWc/ZomVLCy9ctDRMPnpu0iTP/lpfCgFrbmKJGkzhb/TtCJDzugUPL4SFe4I0zT3zEd9EoKd56kouu4CsPg1QtiQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676235; c=relaxed/simple;
	bh=4nbqrJ878FZWi0rZ57VBSYZymeJkYo6GGL1ScKrDJ8E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=iTdUsAAGOwLuaxSC3trD0dhltsGmJO6ue7oWRY5gUWZw8UfcpYQQf+9oNBnO8YgLub6OR3RfLBsmd7J+GAvOGNBJIwrwwprv71VPrMvDzBSYEBaZbuhk7UcH2VaXEbs4TnMrsTMQPTqLrAlL+ZTqj2cK/SIT1g+mNzbG25UvHA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JxVixnux; arc=none smtp.client-ip=95.215.58.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JxVixnux"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4nbqrJ878FZWi0rZ57VBSYZymeJkYo6GGL1ScKrDJ8E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790676224; v=1; x=1791281024;
 b=JxVixnuxXKa7J76MDELbiqjNz/md1RpTK8wtwknrf1cn72sACiDKlPMFxfdEdO104ClJfoge
 rmzMfGTjKARQNsmBQ5VO0ugOFmLzEAR5WMwgGq1cSrym7OdROPafTZxZeC6a/LWFW23IT8xYFQ3
 fbYRBWqSSp4EsaYjMxRNpIKs=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 00c772cd190c1b5f;
	Tue, 29 Sep 2026 10:03:44 +0000
X-Mizu-Trace-ID: 00c772cd190c1b5f
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v5 08/12] mm/sparse-vmemmap: move vmemmap optimization
 helpers to a public header
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <0481F7BE-F912-4E83-80F1-6E7990B447C1@linux.dev>
Date: Tue, 29 Sep 2026 18:03:20 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lance Yang <lance.yang@linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9720986C-2DE2-4968-9CA6-7823B1F978C5@linux.dev>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
 <20260927025441.741633-9-songmuchun@bytedance.com>
 <a31cc06a-c22f-41c2-851e-4827869e9df1@kernel.org>
 <0481F7BE-F912-4E83-80F1-6E7990B447C1@linux.dev>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)



> On Sep 29, 2026, at 16:44, Muchun Song <muchun.song@linux.dev> wrote:
>=20
>=20
>=20
>> On Sep 29, 2026, at 15:39, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>>=20
>> On 9/27/26 04:54, Muchun Song wrote:
>>> The vmemmap optimization helpers currently live in mm/sparse.h,
>>> which is an internal MM header. That works for MM code, but
>>> prevents powerpc from using the same interfaces without including a
>>> private header.
>>>=20
>>> Move the declarations and inline helpers to vmemmap-optimization.h.
>>> This is a preparatory change for powerpc, which has its own vmemmap
>>> optimization implementation and needs to use the common vmemmap
>>> optimization interfaces from architecture code.
>>=20
>> Which raises the question why powerpc was special and will remain =
special. Wha's
>> the big problem here that powerpc must do special things?
>=20
> Good question. I also don't think PowerPC needs special handling,
> but when HVO logic was introduced for PowerPC, it handled HVO on
> its own. =46rom my preliminary analysis, the reason it didn't reuse
> the generic logic initially may be related to the fact that
> PowerPC's section size is 16M. With a 64k base page, a single page
> can cover the vmemmap range of multiple sections, and the current
> generic logic doesn't cover this case.

I looked at the code in my local branch for removing the PowerPC
vmemmap optimization handling, and I found another issue that needs
to be addressed.

Since PowerPC vmemmap optimization is restricted to Radix, this only
needs to cover the Radix page-table implementation.

The generic vmemmap path currently allocates intermediate page-table
pages with vmemmap_alloc_block_zero(). This bypasses the normal
page-table constructors.

PowerPC Radix uses early_alloc_pgtable() before slab is available. For
runtime population, it uses pud_alloc(), pmd_alloc(), and
pte_alloc_kernel(). These helpers initialize the page-table metadata
and fragment reference counts expected by pud_free(), pmd_free(), and
pte_free_kernel() during hot-remove.

To address this, I plan to update the generic path so that it uses
the normal page-table helpers once slab is available, while retaining
memblock-backed allocations during early boot. Once allocation and
teardown are correctly paired, PowerPC Radix should be able to call
vmemmap_populate_hugepages() directly and remove its duplicate HVO
page-table walk.

Thanks,
Muchun

>=20
> However, completely removing PowerPC's special handling is already
> in my follow-up plan. We need to wait for the current series to enter
> the mainline, and then we can proceed gradually.
>=20
>>=20
>> Change itself looks good.
>>=20
>> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>=20
> Thanks for your review.
>=20
> Muchun,
> Thanks
>=20
>>=20
>> --=20
>> Cheers,
>>=20
>> David


