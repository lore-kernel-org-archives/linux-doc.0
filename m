Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784284;
	b=iZMYKmUfEXEaNw+Fl2+D3JCklFdXSjodNL9swebbb1GG+mMPA/YHMvEoiD5Oq/1f+EGW
	 MO8++UlCpBCh+WKP3qEcnH+FAqE3ENW/hWfVuP0mcE+Lsg9Dl4CrkoK+ybQZAmLws8+km
	 kE5xQ6d21EbKiMksHaynmK1FdmfnWx6F3XGiELuxqJa6s3tv7nd+8o0t4tKgJUc3PAoag
	 f7C1zZpq3bTeEtFA5YbP/zlJaHCg89m6Wld5iac1cFQo13Ur3MUU5AUC3vjXAl8gGTEH6
	 EwfdnLDjLtfNrTXf+DXQfOEuHPACLx3LGELDITmSNJulTkm57JT7Dc4pKKxtadJrVRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784284;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=Z94cg7ac1Y7ssrM7pMXNVdha6WnPl9D8zeq/vd59B+M=;
	b=fJ5Z7djJ4CJNdxXe9yEXhKRkPK+zdjytRjUyzkTZcONrRLlI1QrcD1bFjqgp4sKGvmTM
	 DP2GuJhR0lEyc6pub43sWuyeV/FrHqgBG61TS0PXBEbXInibtrTDCfJPCK8tT86p7x8eF
	 EUS2bOzo0gc51FsZxHXfGHbMKDjoOkXCybW47Qz5h4LhgoukvVFlFqMJztTm7VwNj2x1Q
	 bxxwTiRVpYkUnEVy87PTDUYVoiP3DCbDhUxnglK3rBQg45GRA8tPVZs5K5vuknisL2Njj
	 MPxxyQAPWz5RmBvj/jbXy32FKbHj9htFmhNKei0gNBs/9K1n7y5WvgaYg/Mwj2J5hMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EX7ppEPP;
	arc=none smtp.remote-ip=95.215.58.36
Received: from mta1.migadu.com (out-36.mta1.migadu.com [95.215.58.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB44606A32F
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 09:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB44606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EX7ppEPP
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Z94cg7ac1Y7ssrM7pMXNVdha6WnPl9D8zeq/vd59B+M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793784280; v=1; x=1794389080;
 b=EX7ppEPPaFtlHsu2VqjM1UaT7IQavLpZc2tjUMAdBemJipD4+ckQP/d52rZ59F0cF1x9DsBH
 IUxWJTDKJjptoy2MXwV8C9p+CbZwomGUWtnnf8b1zOhNujFY3axwLVkXUxUArQOvjUusimSdkPy
 NFEKajGaMsHkhUmJaP47nn6k=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 0fb9feb80626b30b;
	Wed, 04 Nov 2026 09:24:39 +0000
X-Mizu-Trace-ID: 0fb9feb80626b30b
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 09/15] mm/memfd: recheck the page cache before allocating
 a hugetlb folio
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261028-fixes_hugetlb-v1-9-a0a033db180f@kernel.org>
Date: Wed, 4 Nov 2026 17:24:00 +0800
Cc: Oscar Salvador <osalvador@suse.de>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@suse.de>,
 Andy Whitcroft <apw@canonical.com>,
 Miaohe Lin <linmiaohe@huawei.com>,
 Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Peter Xu <peterx@redhat.com>,
 Breno Leitao <leitao@debian.org>,
 Will Deacon <will@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 linux-doc@vger.kernel.org,
 linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DC756308-6AB4-4A6F-9DF7-E66F337A320D@linux.dev>
References: <20261028-fixes_hugetlb-v1-0-a0a033db180f@kernel.org>
 <20261028-fixes_hugetlb-v1-9-a0a033db180f@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Oct 29, 2026, at 04:13, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> A concurrent fault or PIN request can populate the page cache
> after memfd_pin_folios() misses it in the page cache but before
> memfd_alloc_folio() takes the fault mutex. The latter still tries to
> allocate another folio and can return -ENOMEM even though the =
requested
> folio is already cached.
>=20
> In particular, hugetlb_reserve_pages() finds the existing =
reservation-map
> entry and reserves nothing. If no global reservations remain,
> alloc_hugetlb_folio_reserve() fails even when the pool has free pages,
> effectively failing memfd_pin_folios().
>=20
> Recheck the page cache before reserving or allocating. If the folio is
> present, drop the lookup reference and return -EEXIST so
> memfd_pin_folios() retries its lookup.
>=20
> This is probably not worth backporting to stable.
>=20
> Fixes: 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios() for pinning =
memfd folios")
> Reported-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

