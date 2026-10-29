Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793245305;
	b=nu82js4jOCGBCzOL+fIdkplqCF5GRuc1kz0J2jjEP4jbkGDSKW58uqKbILJpTcBDUFrW
	 s8lNhTZvAsMxCId1GetfqtCY4BlDG2JS/F4cLjX4gVWRr7fgu6FwMnahk92QTK0GfjutT
	 TKRditNSGg3C9R7FNrA/7jGmye4T6ZOKyFnQZWj0sPT3mKKiN/Cwijdg6u0IlZczubuj4
	 i8C1dddF5DxX3eVyNh0xosSidhjadMbcSJpN7JvisYCPFaCpZgRa/tcWTEEzuFBRUpJ61
	 F9efX/4vAWSnyAvV+/oBh9vGCR340/H+NwL2JY87IYwDmHdd0oY2jlwgN+u08/FnKMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245305;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=SfpksgeRXYSviYFeyWHR5mqkoXxAslF2D1vkefSL3uw=;
	b=EAtlmB0ONln7LeXCIRDE8+F+Yh2CjzZ4rc7c8HNVbf0XL7e+Q8kWwsCOs7BLqy2VHZ9q
	 xVY5if9l1qA7i1E0SxGPCSo3Li5UzDzs+PKVroPUGeuiACqffhoGJk0FIv+kxhHzcUMvl
	 +hiG5jXxz+Tg1UmYzFhU+515AiJl/MQ+6N5vevWgx6S4Qa7ydbg6gpKqRVgd0iTQDyPuW
	 gJi15uBa3V2P0CKpUx4kaFx8ZKTNNJBxkv+1uatIYliYAuhHTLfsekomkvuJSf4tATIlv
	 jT0o1hewqRJjPiJQ4wFTH/OOax958k+laCiyCBizS8AdGgn7LOCrVUSC9Co2v9nFvnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NxV2zbRI;
	arc=none smtp.remote-ip=95.215.58.134
Received: from mta1.migadu.com (out-134.mta1.migadu.com [95.215.58.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A01606A31C
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 03:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A01606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NxV2zbRI
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SfpksgeRXYSviYFeyWHR5mqkoXxAslF2D1vkefSL3uw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793245302; v=1; x=1793850102;
 b=NxV2zbRImUBwLKbaCg/zWhoTSvWR2eSfQzp5or3rZukb97Uuetb23hfqkeJZqlF/85Uv7SQV
 14s70j8cLPyw9jp/T7OE1W8F9ax2XsvgOtzbsLJ+K8zxGU3m0hjhT/SGpjNMU8Qv+D01RB5EhgF
 NXXHqIlq3oU27FdrMaowEbaY=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id dc9967750c407019;
	Thu, 29 Oct 2026 03:41:42 +0000
X-Mizu-Trace-ID: dc9967750c407019
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
Subject: Re: [PATCH 03/15] mm/hugetlb: preserve reservations when shrinking on
 HIGHMEM
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261028-fixes_hugetlb-v1-3-a0a033db180f@kernel.org>
Date: Thu, 29 Oct 2026 11:41:12 +0800
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
 linux-s390@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A4D91A63-87BD-4BFA-A12B-22A8513A496F@linux.dev>
References: <20261028-fixes_hugetlb-v1-0-a0a033db180f@kernel.org>
 <20261028-fixes_hugetlb-v1-3-a0a033db180f@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 29, 2026, at 04:13, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> try_to_free_low() drops the hugetlb_lock while freeing lowmem folios.
> set_max_huge_pages() then resumes freeing folios using the
> min_count computed before that unlock. Reservations created in between
> can consequently lose their backing.
>=20
> Collect lowmem folios on the caller's existing page_list instead. Keep
> the hugetlb_lock held through both selection passes, and free the =
combined
> list at the caller's existing unlock point.
>=20
> Likely not stable-worthy.
>=20
> Fixes: 1121828a0c21 ("hugetlb: call update_and_free_page without =
hugetlb_lock")
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

