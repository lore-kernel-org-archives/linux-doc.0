Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F28494827
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 15:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399621; cv=pass; b=qKnVmlk922sP+Jx5RtjUB+1+8owMuSeRRhV5kuitrPTkE6pVPCyyhE6l2FdwAx2qO1s6ftd6SeCwN/UVzyK7odFtzHs8waZV/0KQ4GbnD7KV0pNwGRFrd1NTLCJGx87e3hq9HpgqREfud2KuJP/BIXxRl8Ktnscn7Lq+hoDuok8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399621; c=relaxed/simple;
	bh=C5lqWZYRcdT+xV+Ag/2xtxUo/YeIYupOIT7BEys5X94=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVAJQsf+PgXjCKTXqMTBW8ikyLtv5vsbMKrdZi9ZBYdl3TGSxLQ9ua92M/n/VCr02AnjTxiu148SmyhOHlLHmZ582+OsrBNq2pz5vAraKundk6durJns+u3d996qHB6Lso0Lj5+O2jcfNNokfgCoOgICquqm/+Za7zpwsyOkNk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fcTukhZT; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fcTukhZT"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-90e92b99ab9so28763376d6.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 08:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789399618; cv=none;
        d=google.com; s=arc-20260327;
        b=ciWqg+HOC6DMGrmqGKun/hCfCG1zsnBli6g21l3uCL31aGr2q7PdofADm1ERebwTQN
         KO8zo7Oo1lSJnrAb1PaRvNnpoyscQchMMO3q6sAts6NqTAPab34LMclad+wUjRVc9hv/
         5V8AKmbb4mau75H0mKVo7R7o445gTO8M3X7QFUAZlj48+YxFnk/TwbnosEdcPaxLhAAT
         +9PjXi7r17b3v4CYqjwTKnwZbjKWMV1WGdjs7Fr7saTz0paY20QvuNRviMowl7Eu/EvC
         pYRrH0Ex2gVfkQN6E6kLiMpZYHpOroepwEMFgGNOhIAx9gTyD0wQadRRgf9iJz3PzAGK
         2tzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Mcn1aLlH7H+x4GqfxFrf2tZYu3mAVZpDuMSayy1t56g=;
        fh=VCgQyQQfJY+EKSvMi4lLaMGUNarLyHqGXhDJ3e//A0Y=;
        b=L8cTbLnr/MPJGomvTfoL1NqO4nZgqvjpe+9bKMQkphDs9WzfegBlzl5M11wXVaLLqi
         X4Q6ADoxiSUhFyqJRg+44vKmPfLbVyGbxkeZiOxoY3j/GUysh7+bv+vCzp6rzayzfYPK
         cworUkOIBBC9CzPL4awcRxAo9TVszdjYuExJF/TMxM5Uj/0x/TlVmclaFLU7rKdjM/MU
         heEIxGmIsu3AdC7BWZF6AKPSX7h1oMM6U558+J8YXHgTaJmCPyZUVV9jpVUtL3O/vu3Y
         gBnlsS7tpwQpvXZLxYHoxjdZ9gErO5/DthLJYwGkgHxbnSg/4h27UVFZRuocz5kM2pYE
         q9lA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789399618; x=1790004418; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mcn1aLlH7H+x4GqfxFrf2tZYu3mAVZpDuMSayy1t56g=;
        b=fcTukhZTA2LR0jf9Yp9pguMhcmysn0p9NvAxo5pqhyDWe+6sFrWv/7oA0vvvH8mutV
         wsIX0ZZIbtfuk2uazn3JkQ8Y7zo1eXqy35g2A4uPdRB2MMfVd6TkRR6mDipNwZoz6G1T
         cgTzPfJQQLhlZ5+72fQWhC0xf4pbjpW3bd4T8CYJ9SRSkFt6gmATkfopdZiyA8jVk52p
         CFbq9pCmnMQiovQ0WFnowvQk6c5N9fQmBnw3Bfen3bwq2N1y5sVtDES8y+hw0Eemdm7R
         a1rovPf9FpugAFdddcN4Om0Kbyxtdz98t/l801eQOokLSfnIknZtQcrxVyjFLydwMJQX
         L1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399618; x=1790004418;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mcn1aLlH7H+x4GqfxFrf2tZYu3mAVZpDuMSayy1t56g=;
        b=rA6k4pHe+a1gAIaxkQMfXfEnthp2bR1B/P3kltW0TId6ctbZNlIFgziV8lc0gkr8tG
         CERbD7dd1CoWj14KQJ6v5683zsfqtrA2BjtPWHK+zOeNAhavNoYwziQvgE9KQkrEdXgf
         6QEA3YUrVZbBDfROidRaDq/uwOjNqFyGWyiol6TiaEiIDO/ylTysCm6FIxvHDjNreRiQ
         0C37MmrsXgOnTBdZhTH4Tl21lgLRvQ88SBXdiPoUgO+VGMxR2NkNpo+20xh3zMUs/pz5
         1K/jvZk7tmypraKqp1+RFQSfboK5I1aduIxGtuBTDRjr/oL25GWBhvJIVBEha8q3UR9y
         y7MA==
X-Forwarded-Encrypted: i=1; AKwUvBzj01FFzOOK+VzWxFSj39al2ncO5o61piXbf6+3kZAH138+DTDANaMbTfMyr6LbFjAV7hl1USpBRik=@vger.kernel.org
X-Gm-Message-State: AFuF++mSx0IsavU+NQZ6+0syxZ/83l20oTV2bsTtbyyFEkDQZact0C2H
	73I34DtN9gmz6nIUW1XNWHGZBzd2T43MndS/5T2E+FQ2/oe4F6JhK1YidAyA+jHPM7RdWqnRmya
	y4ut7N+r6OFbmdOSZnfJXfZCSfNcwxXg4tYz6aGIE
X-Gm-Gg: AYBFou2CH0m4G10KUT0JAdnMpq8HbG8nG+/h8MUm+hffNeDhpUn6ABIxVqf+phz9aDd
	jpoAz/JUecX6JMambEIjaoR1u2KhsJAdwuEkCDj/t0+gVlCRAq2RKwT9zbB2S4V0KL2TikshtTw
	Ag2E5rbG/zLsvXCoFECfs5gnRxuYfinUiIRHCIv/otrNSzdSga0b5jgfHvVEgbwSSrUKwEpKy76
	KUVZZKhh50mLXVpdfgmPGLPLWSUUYfLH1zC6/EEWZ0tWPQzx+YfwSeDtB8rqewYUE2kOB8iiKUt
	dKHoE1JrX0Bacn3Oq5N13pgy2hY81OvWpw87VjhfRtrF12eEnzXPrNroZVQrriO+FzzGjSlXJ5C
	OzyL8CViiWw==
X-Received: by 2002:a05:6214:451a:b0:90e:9665:71b9 with SMTP id
 6a1803df08f44-9122e65b41emr46757376d6.27.1789399617103; Mon, 14 Sep 2026
 08:26:57 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 08:26:56 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 08:26:56 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260910195800.3459455-1-joshua.hahnjy@gmail.com>
References: <20260910195800.3459455-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 08:26:56 -0700
X-Gm-Features: AcwNN1WXsa-zr5yhxjh8RtbW6G0xYf0DGleOaP88Iype7y1bZYBjUUrEH2Yb5dI
Message-ID: <CAEvNRgHbzY30n1hz2vv7BiBMMhci+NEv_ubP1LjQNmBuu6Kjgw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mm: hugetlb: Fix subpool usage leak on allocation failure
To: Joshua Hahn <joshua.hahnjy@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, David Hildenbrand <david@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hongxiang Lou <louhongxiang@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, fvdl@google.com, jthoughton@google.com, 
	rientjes@google.com, vannapurve@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org, 
	Zhao Li <enderaoelyther@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Joshua Hahn <joshua.hahnjy@gmail.com> writes:

> */
> On Wed, 9 Sep 2026 15:54:59 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
>
>> On Wed, 09 Sep 2026 14:49:28 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:
>>
>> > From: Ackerley Tng <ackerleytng@google.com>
>> >
>> > When folio allocation fails early (e.g. buddy allocation failure or
>> > cgroup charging failure) and a reservation was not used (meaning an
>> > unreserved global page was needed), the subpool page acquired during the
>> > allocation attempt must still be returned.
>> >
>> > Currently, the subpool cleanup error path only returns the page to the
>> > subpool if a reservation was used. If no reservation was used, it skips
>> > releasing the page back to the subpool, permanently leaking the subpool's
>> > used pages counter.
>> >
>> > With subpools now always tracking used pages, always release the page
>> > back to the subpool whenever a subpool page was acquired.
>> >
>> > Opportunistically rename the local variables tracking global reservations
>> > needed and global reservations returned. This clarifies the accounting:
>> > a value of zero for needed global reservations indicates an existing
>> > reservation satisfies the allocation, while a non-zero value indicates
>> > new global pages are required.
>> >
>> > Adjust global reservations using the difference between reservations
>> > needed and reservations returned to properly handle races where concurrent
>> > threads interact with the same subpool.
>>
>> This one conflicts with "mm/hugetlb: fix max-only subpool accounting on
>> alloc_hugetlb_folio failure".
>> https://lore.kernel.org/20260428113037.88766-2-enderaoelyther@gmail.com.
>>
>>
>> > @@ -3074,13 +3074,10 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
>> >  	return folio;
>> >
>> >  out_subpool_put:
>> > -	/*
>> > -	 * put page to subpool iff the quota of subpool's rsv_hpages is used
>> > -	 * during hugepage_subpool_get_pages.
>> > -	 */
>> > -	if (map_chg && !gbl_chg) {
>> > -		gbl_reserve = hugepage_subpool_put_pages(spool, 1);
>> > -		hugetlb_acct_memory(h, -gbl_reserve);
>> > +	if (map_chg) {
>> > +		long gbl_resv_put = hugepage_subpool_put_pages(spool, 1);
>> > +
>> > +		hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);
>> >  	}
>> >
>> >  out_end_reservation:
>>
>> Here.
>>
>> I presently have Zhao Li's patch staged in mm.git's
>> mm-hotfixes-unstable branch, awaiting review.
>>
>> What to do?

My vote is to drop [2] from Zhao and switch over to this series.

>
> Hi Andrew, I hope you are having a good day!
>
> Yeah, I also noticed this too [1]. There are actually 4 proposed
> solutions for this in the mailing list which is a good indication that
> something is wrong here : -) But unfortunately it seems like there was
> no resolution the last time I pointed this out : -(
>
> I CC-ed all the authors previously on that chain but wasn't able to
> get a response, maybe we'll give it another shot here?
>
> Ackerley, Zhao, David, Song, hopefully we can align here.
>

[2] from Zhao could be one of the components to get -stable out of
trouble as Andrew requested at [3], but I think small changes on -stable
leave lots of gaps.

[2] does not address these issues with alloc_hugetlb_folio():

Firstly, there's a condition in the fix checking that min_hpages is not
requested and max_hpages is requested. That looks like if min_hpages
were requested, used_hpages wouldn't be restored even if it was being
tracked.

I could be wrong about the above, and we could also iterate on [2] to
cover the edge cases, but I think [2] would then just become bigger and
harder to understand.

Beyond that, [2] relies on local variables in alloc_hugetlb_folio() to
determine whether to update subpool tracking (a global state), so if
there's any kind of race between threads doing subpool get/put, any
local variable state would be updating the global subpool state wrongly.

> Personally I'm partial to Ackerley's approach here since I think the
> get/put semantics that he proposes is the easiest to understand for me.
>

I think it's hard to use smaller changes to fix the global state
changes, I'd prefer not digging to find all the edge cases in favor of a
cleaner fix.

I'm not super familiar with upstream backports to stable, but I'd rather
backport an understandable fix than more open-coding.

(Understandable is subjective, of course, I'm biased towards the fix
here.)

> It would be great if we could sort this out since I think it's been
> a while since we've had all of these proposals in flight.
>
> Thank you everyone!
> Joshua
>
> [1] https://lore.kernel.org/all/20260713144557.3845941-1-joshua.hahnjy@gmail.com/
[2] https://lore.kernel.org/20260428113037.88766-2-enderaoelyther@gmail.com
[3] https://lore.kernel.org/all/20260909155003.e6c2f4fe3c0bbee3b34578fd@linux-foundation.org/
