Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658720;
	b=HYd+1uCY1f3aDNPOgiBH6yAQ7Ork03X6llNgM6+7OgIT1kfG9RO+NvuufXG2lv/oknT2
	 iz5lj6MTczCHb8SMUm2i8gLYVBCbufe5ROcKLC13VNLfB6yzYlCyBAyBvgNrwGgxcIfSW
	 sZ1BrNcE4Nm6Vnp6E62f1mHUHVNhsCK0qXPAgSFcO8Xii6vkTCYW2ICZ78NJoK3FmBqkF
	 q9raAWc77NTzV3vefF/0aDkI2n9o0lk8X6fiWgYvuMpTIt2656AZtJuMvwlSjW4TDKdj+
	 N5tAo/PrkzqoGI0QWvV2LAQtZJtZ7aHBEcxIl0pBRnFfO6tChP4QllTzRkVNQ8Y4xLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658720;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=5f8HopAilRekX4oDmbEUHNnRptZx1Qep0LVLshbVfgc=;
	b=0b4Zb/74iQ219J11rDE0VKVYREcjeVbc5qGRnOCAINebHWKkB4YwLvLJxD8BfC+uKkRb
	 RJuSRds5uowXT7ooMUd1MUwIHQtpeDuf10t3NiL8nzo4msRqlvbYr4aN89fUuEFVlnAVq
	 uPHvubMoKqGBXTqVDb2sL541Blh4Fc/F5D+PC6WFAxO4PVYsfpFDZaYCs7RhaDj7F4gWJ
	 syrvKMrcRu4SUnmnTc7AsWQsrvQdL0muMTgaKKcxCS0iPT4mz8hH+WMGc/PqjLKtQ+goT
	 UjapHG3j+jMFXmIHr85Q1D4D+WawRevOIRy161M/psZGLGJRWi3w0XOaAUht72Hz6wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZQnT2Dwd;
	arc=none smtp.remote-ip=95.215.58.162
Received: from mta1.migadu.com (out-162.mta1.migadu.com [95.215.58.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F0A606A326
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 02:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2F0A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZQnT2Dwd
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5f8HopAilRekX4oDmbEUHNnRptZx1Qep0LVLshbVfgc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795658717; v=1; x=1796263517;
 b=ZQnT2Dwd4OZHvVTwdB+ZOAhxiIQZ514z1N2rUUTvnQYjr9MULJRHrTUmxrahjznEPZqNmMoL
 ZtAM01J4woT4VYWvbM5HSERLVNGHbKspuEhx7A1r0J6qgn8KEjr+GtZJxZGqD0ZyCRiyDIbBUB7
 stJckE0FmD73ku1/3AZAocCg=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4765b56b99f04d54;
	Thu, 26 Nov 2026 02:05:10 +0000
X-Mizu-Trace-ID: 4765b56b99f04d54
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
Subject: Re: [PATCH 04/21] mm/memfd: mark new hugetlb folios migratable
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261125-hugetlb_fixes_2-v1-4-db27fd2f71a8@kernel.org>
Date: Thu, 26 Nov 2026 10:04:48 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jinmeng Zhou <jinmengzhou22@gmail.com>,
 Hongfu Li <lihongfu@kylinos.cn>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Dave Airlie <airlied@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Mike Rapoport <rppt@kernel.org>,
 Mel Gorman <mel@csn.ul.ie>,
 Dave McCracken <dave.mccracken@oracle.com>,
 Andy Whitcroft <apw@shadowen.org>,
 Adam Litke <agl@us.ibm.com>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Rik van Riel <riel@surriel.com>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Harry Yoo <harry@kernel.org>,
 Jann Horn <jannh@google.com>,
 Lance Yang <lance.yang@linux.dev>,
 James Houghton <jthoughton@google.com>,
 Yang Shi <shy828301@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Pedro Falcato <pfalcato@suse.de>,
 Gregory Price <gourry@gourry.net>,
 Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Byungchul Park <byungchul@sk.com>,
 Alistair Popple <apopple@nvidia.com>,
 Wanpeng Li <liwanp@linux.vnet.ibm.com>,
 Andi Kleen <ak@linux.intel.com>,
 Kenneth W Chen <kenneth.w.chen@intel.com>,
 Hugh Dickins <hugh@veritas.com>,
 Michal Hocko <mhocko@suse.com>,
 David Rientjes <rientjes@google.com>,
 Joern Engel <joern@logfs.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Michal Hocko <mhocko@suse.cz>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
 KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Sasha Levin <sasha.levin@oracle.com>,
 Guillaume Morin <guillaume@morinfr.org>,
 Wanpeng Li <liwp.linux@gmail.com>,
 linux-mm@kvack.org,
 Jason Gunthorpe <jgg@ziepe.ca>,
 linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@osdl.org>,
 linux-doc@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <98C27A06-0FE2-428A-9B13-63E9CB0C648E@linux.dev>
References: <20261125-hugetlb_fixes_2-v1-0-db27fd2f71a8@kernel.org>
 <20261125-hugetlb_fixes_2-v1-4-db27fd2f71a8@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 26, 2026, at 06:33, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> memfd_alloc_folio() adds a new hugetlb folio to the page cache, but
> never sets it migratable, unlike hugetlb_no_page() and
> hugetlbfs_fallocate().
>=20
> Later faults will find it as an existing folio and never set the
> migratable flag.
>=20
> Such a folio can never be isolated for migration, even once it is no
> longer pinned, which breaks memory offlining, alloc_contig_range() and
> memory failure handling.
>=20
> Let's fix it by setting the new folio migratable after adding it to =
the
> page cache, like hugetlbfs_fallocate() already does.
>=20
> This has low urgency.
>=20
> Fixes: 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios() for pinning =
memfd folios")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Muchun Song (ByteDance) <muchun.song@linux.dev>


