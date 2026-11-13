Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606433;
	b=J70RzxCioCAep05qMkcQ1pKCzDX2uWiW95fEI96B9L3waprWreRdOnV1jNBnfvoegipt
	 kS6jQMgZmesFj/UKvxZ4t3SvKzJmDfOn22jay5a69eDFhF0U9xfilyBuQv+7ZEjWE9/V0
	 VHgkURAKENHGZLRzjRwkRRXcqw4pqwMATT+NWfCj344RxvwQtzhQdVk2JYS5xE70xk3vP
	 bIn8jxEH650jSYUrZr9pKg1l+fy7ZSemDxgjKzSPuMAf1tI6YhrBYhr4uZb/59RxUvyOo
	 7hi6T7ufecgPFM55O0YA8W9fpFkptUbv1Slj67wuf1fBdklJriR3IfoR1hTza0eF2kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=kmWJl7xpM9EiZrdM4st9QmllTAXM7O1m5Iu9qvicGyw=;
	b=1T2b2r2v283mM4x/i4grIO570IAoqlnxag6yE9FndilheF/A9iZgXE3q7XjKEv/BGH5m
	 FO12StbFihZqxgKJgnR+nirJDblcnzIEYQth2Dr6/RwiiVDgkD80buMoemMQ4eesC9WP8
	 2LUVMSIrUgQbd5fMaCywFe7PggbzrfNJ2l4cPL8kXx3SPkAWGoWJTZuHOmlpqKSQBbm4f
	 c0jzM+W2IuYESB7+eIAARIeCKkrKZMN8p1hBV/TPFMi83vWxkootnj1ybXMwm71/Lc71v
	 BD8Sx/deFAavowf4A/UtN6b7FavGzNTLGN/8jtGyoX8cNtM1ak80Aek4wU3Kc6MmnxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=eaa0H2aL;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D97606A338
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 21:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D97606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=eaa0H2aL
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-94961ed97bcso47385885a.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 13:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794606432; x=1795211232; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kmWJl7xpM9EiZrdM4st9QmllTAXM7O1m5Iu9qvicGyw=;
        b=eaa0H2aLTwIv1fF9DlES7zpndhp3z4IRgePEZs2NN4KH8l196BoqVtJMOQoreLCYNB
         pOsyMZrWiiWWEYh99FWQcRzLwUkmUQG0Z6hXXczle32dIaNGY3hVRAwAZF4u+LqQGeDl
         HW/Qi7lP/gayyA5HyH4yHz9T2KcK3IAp4jj2dA1Q8qWqf67B8DNQa36x3Wf1p+BqoYeV
         09E1Oth2PXXi3zYvT0jz0Q46Ub14UsGzxUIXD4+zxf0zDuIBi9HdIfF7bPAV5OJw1wez
         IQ1H4vTfGvCU94LsWlmfOA1MvRSD4iIueptYlFuflsyzxqnZzZl++fo1JvUP6RClXRoD
         h3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606432; x=1795211232;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmWJl7xpM9EiZrdM4st9QmllTAXM7O1m5Iu9qvicGyw=;
        b=WsxISrcfFKJ/gjuAkVzTkE34K4Z89YP/NNuyIJX9JWAjjiDrcVUBGbAbU6+IO/lZzd
         lzvE0UkV7twjPzPJBg/EII+XBavtmfgkrhVDJXLBhQUDciKkLcVijb1wUVJHRiP9t1Hi
         mRHbBluSLpvefGcDIEGtUiz8LP5qxQ9WhHdz+ONWT19FCPpwmNAQ/gXQtr4Tqdckz4Ki
         4BONlneB+mqydQWZuPA65mUBrVWVfa5OKeYYC5saR8LN9frsurbsnQC62NlmrTvPo1cf
         hK/8T9ciIH0o/L/uUrtaTtA2Mwx+Iz9v45rzJZEkcjqlLq5njDZJ1Xbd9P1+oHbxLFtz
         HCBw==
X-Forwarded-Encrypted: i=1; AL+hErGvdwvMcqOPdq/Urm9SP9swGsMlxiDkV/hD9uKClKUTbxLYEYbO02ktt0XjPtnw7EvAJfY3PM6ETt4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SBzek60OkEkK3+6uEQ0i8PeAkHCkiXoui96futDmd4ucLb7cN
	OAEgOxWXOCKW8Ypxz39D4NsifxsXSKAdcnkNdPR8tQ2GmR8z2DoyOUneKi/aEzQGUJQ=
X-Gm-Gg: AYBFou3gvAKdLAgEYXip97R+QrvjtyW/sCCGIcZL7GrZ4RWuRkcqIiEvikJSS2sIzxE
	gJuvwIcL7Xh9FgmzuUAGckOVm65r2j4Y+6+cgO8//NpXs6Q0HivdyLgGvZ/AEidtmH9AfC6bI6x
	lAxtgSr7YqrmdN7mRb6/5cuOln0zf5w2BqC3IicUGFKw6QI6ERlH0vIX+oZ3ko0tlldk1HVBms7
	QwGvB3mdhPG6PVB6sPyFvWlGGv6ccZ2VFXGrwP4H2qyBvM1sfz9QZYhbQ6vxZ7902lswuJD6+mF
	8qGKBA8QoZJklVv4NQuvCGaPGJFDTsiGQC/y9YAYdNRUQ7n5Rm6El6BAWsfdrXQXSjS+a3l0gwx
	34cYTQ7cc7sn/ydlwogi705rCGOhuKKi6csPqH3yPeOYVxxnqvlbO4MlOYCTuV0fvyRo2uEEmmr
	PxSpAzZDxEqzQ7yl6aIYltdJxkFwuS7vQkBTGyxA7T2V8GCzZHOydO43y295e0YmhhNwShyPHo3
	veVLIC6x+HgcYunc9soL2dZ8lWmXHlUegb2l64DF1VcPOmkEUPe9qBtTY3mnN8uMS/o7znyRLci
	WqLiCgu3x/uL8gVJRb/u5EMv1wfWc9zayLU+qhDnRWMplfYLmtj8+uZAXn76PCJroFcOMODyGVX
	6j8/X3Kg=
X-Received: by 2002:a05:620a:4042:b0:93f:3120:6c6d with SMTP id af79cd13be357-9494bb56dfbmr651566785a.35.1794606432092;
        Fri, 13 Nov 2026 13:47:12 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b5c1dsm279333985a.33.2026.11.13.13.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:47:11 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 05/15] mm/hugetlb: keep surplus folios when the pool
 shrinks
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@suse.de>, 
 Andy Whitcroft <apw@canonical.com>, Miaohe Lin <linmiaohe@huawei.com>, 
 Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Dave Airlie <airlied@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Peter Xu <peterx@redhat.com>, 
 Breno Leitao <leitao@debian.org>, Will Deacon <will@kernel.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Gerd Hoffmann <kraxel@redhat.com>, linux-doc@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>, stable@kernel.org
In-Reply-To: <20261028-fixes_hugetlb-v1-5-a0a033db180f@kernel.org>
References: <20261028-fixes_hugetlb-v1-0-a0a033db180f@kernel.org>
 <20261028-fixes_hugetlb-v1-5-a0a033db180f@kernel.org>
Date: Fri, 13 Nov 2026 16:47:10 -0500
Message-Id: <179460643069.482102.17806419339613384754.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-28 21:13 +0100, David Hildenbrand (Arm) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> Surplus folios are accounted per node. When shrinking the pool,
> set_max_huge_pages() removes free folios through
> remove_pool_hugetlb_folio() and accounts them as persistent folios.
> 
> It can select a node whose folios are all surplus and leave its surplus
> count larger than its total count. Free surplus folios can back
> reservations created by gather_surplus_pages().
> 
> For example, with nr_overcommit_hugepages = 8 on two nodes:
> 
>   (node columns show total/free/surplus)
> 
>                                       total free surp   node0   node1
>   mmap() of one page, bound to node 0     1    1    1   1 1 1   0 0 0
>   node1/nr_hugepages = 7                  8    8    1   1 1 1   7 7 0
>   nr_hugepages = 6                        7    7    1   0 0 1   7 7 0
>   munmap()                                7    7    1   0 0 1   7 7 0
>   nr_hugepages = 0                        1    1    1   0 0 1   1 1 0
> 
> After shrinking to six persistent folios, node 0 has no folios but its
> surplus count is still one. Releasing the reservation cannot clear that
> count, and shrinking the pool to zero leaves one free page on node 1.
> 
> A later write to node0/nr_hugepages underflows the unsigned per-node
> persistent count: 0 - 1, resulting in allocation of many folios.
> 
> Use persistent_huge_pages_node() to skip nodes with no persistent folios,
> as adjust_pool_surplus() does. This also excludes temporary folios.
> 
> Fixes: e4e574b767ba ("hugetlb: Try to grow hugetlb pool for MAP_SHARED mappings")
> Cc: stable@kernel.org
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> [ david: cleanup code and description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reproduced the total=0, surplus=1 issue and subsequent underflow, and
verified this patch fixes the issue.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

