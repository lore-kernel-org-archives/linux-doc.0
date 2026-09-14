Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDA2369D40
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401833; cv=pass; b=isPLmm63JaYofkBujzPbnylNAKn+94vVWhFpoHsnFI1rXosM6hF24yTUauPuU66B+uzSi+2SZtO/Mj+kzkoMwjbhVtPB8cr5r6FaoU3syvRDCiKINH2dOJTrAE2Hhwv2AWMse5V1Ir2RdvaLxOUYnTmAp/aj0TiDG7K/S9tFy4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401833; c=relaxed/simple;
	bh=FByMlc/emSXGXV9S7XSFRcqt0CPXtzEIwlSZLpyOX+0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jh31AigXVVGWHW7P5h9+b1IXfcZmtCyIi/NAhBpVvdBdIE5AXxrZqHmDtmk6edqiYcXNpaWukvjHhSWP/xm+1f22wzrV7DwMs4PQBEQGyWSMTWcWr/4GgzwvwMsn4Hrd9JJC1wdSrRUouqNhYXS+M+xnUENraSsQc/SLqAs7GGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G8BCyd5F; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G8BCyd5F"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148cso26632066d6.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 09:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789401830; cv=none;
        d=google.com; s=arc-20260327;
        b=G5JrEHS4YIsMVEt6HuwZbaiShzkN11lv70gtAjrCKnqwijxYQPcQ2HzQ8T87SezniG
         aiuzuBcQgPaffcdqpnwoiH88fmpMzb0Qb11ZkPo9p5gmD/yGpZXf6gEee62IacVZJoOV
         aXesD36h/Ka1SjueYqBIDGdh6afmZa0uN49VpcHkyCiLJgY8jJubLL1BjB3svRnp6ab6
         zz90dwL2cdpzSp5NRP60YpEKdkbcaKdNH6wjvcrOLj9e2WhrvIiG3FjBuMx6eNW/ScaG
         mlNr4d4Yq9mOHqRQamuI7pJ8NtLxDsDfMMwwQnCGPIUcIZQpp29kIryff9XaQGEGTics
         6ZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Lykhn1ziLcNrm34dqlEZxk1CMrWoLDAjyXD14b56Sf8=;
        fh=LpJRmby3cAWjUtNDv4sHyVtB4B9gN/18svtqjF48IEs=;
        b=g5CF2tug8RManpzuVqmYTis7Mo1A41InECLgLnSEcghravK1jzGYaR01nWZvssDvGR
         Qk7m90pmFVYETcKMxqN1yq+18eoVHkBaBlFqxrLnfaNxi7H5/YI9YevXVCn8REmRrxfO
         MjgGXRfveNnde6HS33Do0a7yDn5Uv5ijAmP2G71AMsii5+PfCE4JJrawt3bOL7auggxR
         5IedM0teBqopvlHN/tWs2D7/Ew1BBKOVCh+CaFj1ht82TiAnkfXAxuXiLib+Ai1K0O3n
         tQz3/VOta1kj+CkJpUyb9F2rSfET1XtyaV3SyK6IoqqjBcj61GmabqtMVIai7arZO0+T
         Jsig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789401830; x=1790006630; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lykhn1ziLcNrm34dqlEZxk1CMrWoLDAjyXD14b56Sf8=;
        b=G8BCyd5F3tfqasY7zLpFUXdHyXp2Ou0tGvhdOOxMSCztu4/VrqfDAg/64B/O07OV0K
         IP31OD4j9SFUhaV+3lXVaJX8ZugwUMK6EgPAfEKBQnDeIKNPuYcpJsoN91cWvBPtb/ve
         iDkHqzWqSht78XWwwwNPRaJ+2YLBpnjRcHY8HQ2DD4TVBKgdm1BlZG4eM8zswOQ93Ykw
         ddggY9nhHzTQEaPLAEG5NeZW+tQ4OCuBNFjaoIFcIxdM+KPvu7AZ5gKhPmNH70HaziEY
         9xmrRbHF38WIP47ETV1DOOC26MjbQp3t/Lv8yqB6lc0Hu+aNBrPirrI73xtN9loy31gG
         mnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401830; x=1790006630;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lykhn1ziLcNrm34dqlEZxk1CMrWoLDAjyXD14b56Sf8=;
        b=mwK8/QsyQOQUkxHNG6cb4fJjKYpt9t86MO7pFZY9lHf/Yy90G++Wh4pTs/8S3P/dZE
         JanMnde/+G306Ms+ZDowD8jmSSOESgTSdi+UKGm+D0nrV707DRnkttWR1f+GKXKsmUS5
         RR8UNYoGMUp8sQUfKYD5pszAqsNSYDlLH3CEMiRnyWutflyV4uy5EkPIZRM64y+RyM1i
         4bHP18PzTjQCAp4P1SHdTk+9XWUMfTiuwbJIVpIgBug8cwdzJTtoXxKdJ9Yuj/Zz8kzQ
         j/hgXUuqYJlDRWctn5TH5eBe3TBVrgwWTY/4HqjToCJjPuq+xbgIsaCQRvVO6D1tbEX/
         nUAA==
X-Forwarded-Encrypted: i=1; AKwUvBxJ3JU6u0glSD9/RrHELnp14Xjw/VlIJ/BwyQMvfnj+mH5IC7+rZxJQSkV7yVCfbmb7vQ/bksZkP10=@vger.kernel.org
X-Gm-Message-State: AFuF++nxEA/HYx/MNwisTbjj2OOE6Qi6nBhNLf/jyAJzGqywJKZJftZ+
	GYd+ubsl4iLaP4G8p9XPerqqMz5Jzzf3nwEHpB0QXI+mScZoXFCHWZzMtpJLCaFy9zo89SwW6sO
	qesA97PP5lL7rQc/x0cL3HgWwrMVWas/Z4Lc5i3qI
X-Gm-Gg: AYBFou2sGgc0zAouVyfdE7VbLxYzCoHSmq0ru33301q8GPHIlj2kCovG7dXi6vTo+SE
	C1QaPRCyqiWFRXUtmKL8i9LQXdY5+uK/tIprK5Ku6wLTql+YyNP+MFNwd7N0NNsb5NYY6J3bO/T
	uNE6wX2nUrFyLVZbXbnKyWBpmudVsktaHaAlepsuccmiCRabbIt+MrXNcYFF+vC67hXM/lRa9FW
	4/u3MGsMLjqYuthAG9oXqQ/bfZOEvrmQtgwclhc5uXobeFFw81jHHg9Pg+EqWQG0439HuAhALcq
	76u5zs/8tkRC4sxL5kmNdlxKiI9Erjf5VGiLxSckyGPfSsuLZ8MhM/Ox8Fcnd99QZ+GgxxN5l6n
	SPeNnOFD+MrsFPLFcsC/F
X-Received: by 2002:a05:6214:e88:b0:912:1fca:531d with SMTP id
 6a1803df08f44-9122e4cf515mr54297366d6.2.1789401828963; Mon, 14 Sep 2026
 09:03:48 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:03:48 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:03:47 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260911145000.3881046-1-joshua.hahnjy@gmail.com>
References: <20260911145000.3881046-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 09:03:47 -0700
X-Gm-Features: AcwNN1WkNy6DDp-4PGpy28TjQCRTCMJrc6530qqWtllOnWQcoumOeBgfLZrmLZs
Message-ID: <CAEvNRgF7-zY5CRaUHfswRW-31v147SbTHRzMKGdV4e+Gd3Uy8Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mm: hugetlb: Avoid re-allocating global
 reservations on region add failure
To: Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Hongxiang Lou <louhongxiang@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Michal Hocko <mhocko@kernel.org>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, fvdl@google.com, jthoughton@google.com, 
	rientjes@google.com, vannapurve@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Joshua Hahn <joshua.hahnjy@gmail.com> writes:

> On Wed, 09 Sep 2026 14:49:29 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:
>
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> When reserving huge pages for a shared mapping, reservations are first
>> requested from the subpool, and any remainder is accounted in global
>> reservations. When adding the file region entries fails later in the
>> process, the reservation attempt must be rolled back.
>>
>> Previously, this error path explicitly dropped the global reservations
>> that were just acquired before jumping to the cleanup label. The cleanup
>> label then returned the pages to the subpool. If concurrent activity in
>> the subpool allowed the subpool to absorb more reservations upon return
>> than it supplied initially, the cleanup label calculated a positive
>> difference and attempted to allocate new global reservations from scratch.
>>
>> This premature release was completely unnecessary because all requested
>> pages were already backed globally: partly by the mount guarantee and
>> partly by the global reservations just acquired. Prematurely dissolving
>> those reservations forced the cleanup path to attempt fresh buddy
>> allocations that could fail under memory pressure.
>>
>> Instead, track the number of global reservations actually accounted so
>> far. In the cleanup label, subtract the already-accounted amount from the
>> difference between requested and returned reservations. This ensures
>> that when global reservations were already acquired, the adjustment is
>> purely non-positive, dropping excess reservations without ever attempting
>> fresh allocations.
>>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  mm/hugetlb.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 652cfb55c6e6e..1151ad959ffd5 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -6678,6 +6678,7 @@ long hugetlb_reserve_pages(struct inode *inode,
>>  	struct hugepage_subpool *spool = subpool_inode(inode);
>>  	struct resv_map *resv_map;
>>  	struct hugetlb_cgroup *h_cg = NULL;
>> +	long gbl_resv_accted = 0;
>
> Sorry, I think I have a hard time with this variable name ;p (I know,
> even though the function is called huetlb_acct_memory) I get a little
> bit confused because I can't tell if it's meant to be "accepted"
> or "accounted".
>

Haha, didn't make the link between accted and accepted! In the next
revision I'll use gbl_resv_accounted instead.

> I know it puts the line below at 81 columns :p but maybe we can just
> split it across 2 lines?
>

I think this counts as an exception (more readable) so 1 line is okay?
Either way line wrapping shouldn't be a reason for using accted. I just
didn't make the connection between accted and accepted.

Thanks for reviewing!

>>  	long regions_needed = 0;
>>  	long gbl_resv_get;
>>  	long gbl_resv_put;
>> @@ -6768,6 +6769,7 @@ long hugetlb_reserve_pages(struct inode *inode,
>>  	err = hugetlb_acct_memory(h, gbl_resv_get);
>>  	if (err < 0)
>>  		goto out_put_pages;
>> +	gbl_resv_accted = gbl_resv_get;
>>
>>  	/*
>>  	 * Account for the reservations made. Shared mappings record regions
>> @@ -6784,7 +6786,6 @@ long hugetlb_reserve_pages(struct inode *inode,
>>  		add = region_add(resv_map, from, to, regions_needed, h, h_cg);
>>
>>  		if (unlikely(add < 0)) {
>> -			hugetlb_acct_memory(h, -gbl_resv_get);
>>  			err = add;
>>  			goto out_put_pages;
>>  		} else if (unlikely(chg > add)) {
>> @@ -6831,9 +6832,10 @@ long hugetlb_reserve_pages(struct inode *inode,
>>  	 * There may be a difference between the number of
>>  	 * reservations to consume and the number to restore now if
>>  	 * there are multiple threads interacting with the subpool -
>> -	 * restore the difference.
>> +	 * restore the difference, taking into account any global
>> +	 * reservations already acquired.
>>  	 */
>> -	hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);
>> +	hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put - gbl_resv_accted);
>>
>>  out_uncharge_cgroup:
>>  	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),
>>
>> --
>> 2.55.0.1007.g17ff1f9808-goog
