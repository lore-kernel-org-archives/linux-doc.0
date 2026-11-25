Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795648428;
	b=qNAOMyfpxin7rzN07qwMOB1gqB84E9YcYy4DVJ4gRN6A6nmMEs4FCFAv9K0ROy2wl4ts
	 MJW6Z5vsfyCu3qPwt+U5NECSPxUIYLnM1Kl52sE3q7wVTZfKM6U19skcFSwLmHF74dwqd
	 BzngqcgJIMLzDn+N5zE4IXRgpHs5kYOVe+EvWGLdCzFNxdVXuZVqsWwzWoItfDa72NqJZ
	 YPwYY9VOjG64M2nOhUTQ0wNIY2KhyJLXrNOu5O55WltWiKwqt+7SbC2kbTzCFWC7m1kN6
	 H8B80gElPrH9NoMCqa4bJoLEt/BHP/IaUin/odaCqNp+o1lSzvIbfLVEBaaB9vvd0Ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bmbARk3XHehA8pJF1qNbcXvK1JM9BX8FvFU7vWFVqag=;
	b=OveRxXnFd+Swys+YSkEn1CrGsZMLapKtDmdQj0UnzBGZZvac8dg2kT1HPp3LijuELKiN
	 R9aZq10hWN7Ph/fjBYc/y1M/DqtDKCG1j7tL5xyYZlqjFKNTXf1lX08xn1QzpKqFrFEuQ
	 V8btwpmvVhDNE0/H6WdFHEuXFK0Oe7kAdETpAhSm1iba88nw6TSL9xonH419praHZtHpY
	 zjfluKrs1UL0gfHmqNGy+M1Cs8KZTYBaNvygwKNkDZsC0mVYu2K2XsFN5My6kJ1snKAAG
	 6j2Ax1nGKnLdDXDihWggRKXJQHqe7K3CuSgg9WiYWxriHI3twocbum6XlRnu8ZToPRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SKxm+SOB;
	arc=fail smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BC4606A321
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 23:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05BC4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SKxm+SOB
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a018493d57so303585e9.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 15:13:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795648426; cv=none;
        d=google.com; s=arc-20260327;
        b=DMoiLvki6RGH165NTTK5V6JEKS1PVuyJ1iNp1s+/ujtCwrbNKltRuG/2NzEc19BBnr
         fVcYkdtDzSJh89vgO0xleFackFkNCNUkidMyBTl9lJQVwGhn5tY2+Vv+NxJav8GsxfSU
         PAkAFnijoFtwOG7MkWqpF4XbHhnC/U3bwnml8IZasJYZMJrV5jZwXtDfEgvF58VyPTxG
         kYQeCwz5ekSdDH6FjS6uragPVXj5H/9KrgZ0/F9Gkl7Ez8y33EUYRCMK3QXrKFZyjpu7
         YjO4UrmSCZO4bVJwNaqLBpHyzUCUQpYm2F8LvJbekB2B8Hk/gWOMzq36z2H1b9VpluTl
         +hkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bmbARk3XHehA8pJF1qNbcXvK1JM9BX8FvFU7vWFVqag=;
        fh=Bp4NAh8VXrRJawBvhgUxFAY3L2vSE22WkKzakb+k3OY=;
        b=Hl0NYQEPlYftLx8+qAZ8sjCRrYl22jTf6HD+VMcMbRjkos6uKoqiH7R8yaLUKox8nK
         2uJ4VrG6TyjYnAlLpRe81uowiJbSr9X5GEh0/22Scyima8xHtmmQnaArfwKRCeiX2xD+
         LGmNae7X6MG8nVovyQAnFWwPJnpvRPgtcLpzE1nEfnP7nOG7syHnC+gAuyttBzHU4HpA
         muTrkrqdKi09j8TF4ZZiA2atAJLZS3aCh9jKN37KdNUZNwhLYZWAO4Uc/bau353XERqd
         GQ2cEVOty/A0QoZcqBo2AutOp18MhDtn0YjqtNFhO5hmh12ObkBZnatgvGS7n1LDxIl0
         DrXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795648426; x=1796253226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bmbARk3XHehA8pJF1qNbcXvK1JM9BX8FvFU7vWFVqag=;
        b=SKxm+SOBB2ex/3j7AvV3T8YCOiYE5m3HgMGKpVoiU7GWNsXILHhg2MYsqT8e48n447
         3niUHGYlUJjgaE8qahNqsQA9/LJvBYAY/hs8KDbDqJjbsPi2KHAzQ0WUDY1PdH9HaSHE
         6JvuRmyYaTX7TwrNM7VBtsCvx7+iTh9uSXjROu8IqxPp0KApXfhZgpjZqIkP0C4iEH5m
         duqemOKs35oQuCy4TFOu9lUoYFPtIofX1QF4ccSvT54gOpIzT5/Y2A2pEKG4q6nWxkf1
         5OBBy3+F2DbM0Y25RYM3i7eUo27n5QvgdsE9QZYyQ+SpyGWyU4w9qKWCBsIBk9spnEN4
         83lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648426; x=1796253226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmbARk3XHehA8pJF1qNbcXvK1JM9BX8FvFU7vWFVqag=;
        b=BXIn2nv2XEPZd82MAIQSfYfV3BbeNuh9RerDhshPlumHSjoz4o5OATg6yI+pnzt0jM
         pMN8g1Tc3KreJiq9SSsAVwOprTLLhLpodYtYtpMgPCBfA1fOlA4BzfFxc1wLnT80GgyS
         Iv2Tur/Tq/UyYhQCY1aN6lKczJ3fzQE3TBBKRYRkkt9y1LRwYc3k7uGxiB/Pbt4YKxcg
         M0y9bp8V+YPY9RaRxnxZGmWbz5IGfZ359A0eaYnuEePeqReRXvNE0nCFpyGD91LTsJYZ
         0RCnK5R1HpyEmM/CJ7SDv8hOoGDvUfzbxu4hCjKCTZ1QfqfstcFhvF7KHXZRf4iW3DAb
         OVng==
X-Forwarded-Encrypted: i=1; AL+hErGAmc6EezLk6zgLJSn/iDL0mL0fjnKSZacHBjL998H3WVNDiQMbikehPAb4vEximwWTMBzewB9EHbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9htN9kZW5ZGPi/7RisBhm9Ima4nHBKHxW3sbH2Lc+mKtz3lLji
	WOKY9x+tPbJVlCbGR1So8/0RulGUvwqP6GEdgV2ndRbmtUVJN7HG6pGpV+AF8v1CqLmx93u+MA8
	5FT06l+q0KhI1CrQ9+zL0Kd3QGBvobIFQ945yUipD
X-Gm-Gg: AZFdTZcKc1N/UoSBq/wtQ4Bl5qUbH4KcmOxrJI4h0r+l8yzLgGiIee+LGnO3r89fzKX
	DAob6soolxhONP8MjZj1RNRG8JiVMnp518VuacFuhPW3qdkHAaD/7YU94+ikK0EKvazsNS/XBkR
	tzXKel3dQzLDYMqrxyBJz8tUlkBQOlW5WmkC+VC6iLZNDw474YOFPcsizjhCkw64iPd3Wy0sH5I
	Q0YzL7PwbpHgDSMAv8VV4RNnoMui37OI6gF0E5GwjM1myDM/E56cJKx0G3RVP4TDvZagVC2XTn1
	RgU0Rtk79R4ZAw/9+4tVgGA08j447D7BwtHpUoVfMYPkig6WYhLuYgPuZaQhCBlVSzhUgbGcKFG
	TtWE/kRZ/v44FdNIXNlOttPK3RbhlYiXvm31THRwFeGB0MmcJyzIpOfL92pKnQBa4pds7PQ==
X-Received: by 2002:a05:600c:26cb:b0:4a1:fb0b:1c9c with SMTP id
 5b1f17b1804b1-4bb9169f045mr2044145e9.10.1795648425836; Wed, 25 Nov 2026
 15:13:45 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-hugetlb_fixes_2-v1-0-db27fd2f71a8@kernel.org> <20261125-hugetlb_fixes_2-v1-7-db27fd2f71a8@kernel.org>
In-Reply-To: <20261125-hugetlb_fixes_2-v1-7-db27fd2f71a8@kernel.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Wed, 25 Nov 2026 15:13:32 -0800
X-Gm-Features: Aa3M54o0VivDc1V8RDqLgeYd6VEevBgWlfFAdGAu_CvY1Dn7_qwvILYBeMeboYQ
Message-ID: <CACw3F51O9kQut0+uOCgP4BEB6VmsmhFVLFxvLXGJPeD-dk0n5Q@mail.gmail.com>
Subject: Re: [PATCH 07/21] hugetlbfs: don't zero poisoned pages in a hole punch
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Jinmeng Zhou <jinmengzhou22@gmail.com>, 
	Hongfu Li <lihongfu@kylinos.cn>, Andrea Arcangeli <aarcange@redhat.com>, 
	Mike Kravetz <mike.kravetz@oracle.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Dave Airlie <airlied@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Mike Rapoport <rppt@kernel.org>, Mel Gorman <mel@csn.ul.ie>, 
	Dave McCracken <dave.mccracken@oracle.com>, Andy Whitcroft <apw@shadowen.org>, 
	Adam Litke <agl@us.ibm.com>, Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, 
	James Houghton <jthoughton@google.com>, Yang Shi <shy828301@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Pedro Falcato <pfalcato@suse.de>, Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Matthew Brost <matthew.brost@intel.com>, 
	Byungchul Park <byungchul@sk.com>, Alistair Popple <apopple@nvidia.com>, 
	Wanpeng Li <liwanp@linux.vnet.ibm.com>, Andi Kleen <ak@linux.intel.com>, 
	Kenneth W Chen <kenneth.w.chen@intel.com>, Hugh Dickins <hugh@veritas.com>, 
	Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>, Joern Engel <joern@logfs.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Michal Hocko <mhocko@suse.cz>, 
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, 
	KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Sasha Levin <sasha.levin@oracle.com>, 
	Guillaume Morin <guillaume@morinfr.org>, Wanpeng Li <liwp.linux@gmail.com>, linux-mm@kvack.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Andrew Morton <akpm@osdl.org>, linux-doc@vger.kernel.org, stable@vger.kernel.org, 
	Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 2:35=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> Since commit 8625147cafaa ("hugetlbfs: don't delete error page from
> pagecache"), a poisoned hugetlb folio stays in the page cache, and we
> must not access its poisoned pages.
>
> However, hugetlbfs_zero_partial_page() zeroes the partial folio of an
> unaligned hole punch without checking for poison, which can cause
> issues like machine-checks.
>
> Let's fix it by simply not zeroing poisoned folios. We don't really care
> about their content: the folio can no longer be mapped, and read() only
> returns data up to the first poisoned page.
>
> Only zeroing the pages that are not poisoned would need more thought, as
> we cannot reliably identify the poisoned pages; that is future work.
>
> Note that a folio that gets poisoned concurrently, after we checked it,
> can still be zeroed, and sync'ing with memory failure handling is also
> left as future work.
>
> This has low urgency, as it requires a hole punch on a poisoned folio.
>
> Fixes: 8625147cafaa ("hugetlbfs: don't delete error page from pagecache")
> Cc: <stable@vger.kernel.org>
> Reported-by: Chris Mason <mason@kernel.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  fs/hugetlbfs/inode.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index 2e8672ae2fd52..5437a55d14f1c 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -656,7 +656,8 @@ static void hugetlbfs_zero_partial_page(struct hstate=
 *h,
>         if (!end)
>                 end =3D huge_page_size(h);
>
> -       folio_zero_segment(folio, (size_t)start, (size_t)end);
> +       if (!folio_test_hwpoison(folio))
> +               folio_zero_segment(folio, (size_t)start, (size_t)end);

Clean fix, LGTM.

Reviewed-by: Jiaqi Yan <jiaqiyan@google.com>

>
>         folio_unlock(folio);
>         folio_put(folio);
>
> --
> 2.56.1
>
>
