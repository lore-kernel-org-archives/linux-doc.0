Received: from mail-qv2-f37.google.com (mail-qv2-f37.google.com [74.125.230.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA053D75BE
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 03:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700745; cv=pass; b=TYD4ZUir4VKGR7YbIUZlQxMoilAHJQr54H2rf0HM0ZaY6XghFVQWwdoc6xbEhUrz06988cFjKUwTlMwleoDF/zeWkYLH83pirTRgCzc4g17RMcuSCGETyDuUs3dcUSKPZAdhEWZmXwvzPrWNPoLpe2xlFkDh4hKUEN1bib40fm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700745; c=relaxed/simple;
	bh=N38wJ84hpW+KR88805c12LeXPbAQBzP4kHjDaLJHCnw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjwTnqgX5Jo/dArJXxFRNzqr+2P1jqHR9QYmvsTQnFoAo+6HI7Et1rYSzYEp1M+y8jCXXU6MLPCLWMWUfs8ygAhtDb5AdbsRgKHyEkdpwDkCDL8R0o4feymHv4i7GXwA2mi5YURrRX2GcDw4kKxsK3Z5ZtA29Pdmve68sJ1BdCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dYJn5rFx; arc=pass smtp.client-ip=74.125.230.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dYJn5rFx"
Received: by mail-qv2-f37.google.com with SMTP id 6a1803df08f44-91235f46716so3272196d6.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 20:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789700735; cv=none;
        d=google.com; s=arc-20260327;
        b=qXEci3YCU3J7oRZL6Y/vU39/8iYtnaAoxDhN5NueBqI7k2uEH+HaiUHb0vUIT7QSUM
         FCKa8YPjhb/6StG0k8XYoTa7F/oQMBBKa4W/BejuxJDVNlkoJ7Y3msMt1Env7clQDSV4
         HMmljf7alZK1YSNm180lx7aZcbo3wmTTOA/AnBVjSk2WAckNStkRDB1fnOxIBxLIGMpH
         BX4vD9XytmvRa/yYnnJgqonX3eNMuHbAA4CqG58tKJ8/kvKGBERyus6ck3WPOd0JEsBh
         8DJ2R5ax47v94fBDQb4q0idLjMYgo+csqr80mSNQWmdCqqX7OVRKqSvcqOV1pVaXNaTN
         zwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=8oNy2HuXVWsVzCazMXbHxpcJNwqU+Nw1U6v/odAHiSA=;
        fh=ljI6RKfnAv2oyWZbAHSEF2q3ARULcE9qhJanrX5F3wM=;
        b=MZHL5yqo1MSU8yoEtZcbNY6n29ZK59BCs6zP46k/qzi8o03+OOxN62tQbGhmTOyfUc
         yz57r4jeyVUtdZjPaASfpZUAdYzehqJGTZTIHdZVJ9o8toVUvce/8oEOZxTyUYSu4/C6
         i1dPbpFqctb8qOXhv2N3tX4jou4RqtW6mP98dFOEnsUuAmh8UdD+akyJxCrXTCu36gba
         kQ+GLrjkijat49piqJswV+dK21yVg6+uLmKulP7yDBGVmYT297t4+yQcY/ib30avBh+f
         55yfvzEsP1WWh1XEpo0vmGeag31+Fs+yTzRCEwq2RfnpI4esVt3YQPMdFDRs9QhpjlW9
         wA+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789700735; x=1790305535; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oNy2HuXVWsVzCazMXbHxpcJNwqU+Nw1U6v/odAHiSA=;
        b=dYJn5rFxL/nlsS6bvM77FMjg18LOAXizST+v2p1FPWXGiScLFlKEKcaJbeyRI1dBU9
         wMx16vrIrHLveQuPMG6SVkdjos7tCHK0F6uusewU0XRKna9KbVFPEYIKCrPcwhINl7Dt
         ZpWnxLQ2FphWD7GSpCBF1ul/rF4/MLYQc7IR4JPZrwFBuk6obkkzGmOvKnd8a0HbXj7h
         wGS+fsSw13enR5fKoLlPVFaTry+5H90FS3jjaK7y2bAgV4HWW3+do5eEyITaxkUZ0pir
         Fe9qxWgNQ7SfMIh3YHn0Zipb+wn7hYGWSVaH1zDTkq1Id+M6aRAg3amXA5pWoYrYAisT
         Gvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700735; x=1790305535;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oNy2HuXVWsVzCazMXbHxpcJNwqU+Nw1U6v/odAHiSA=;
        b=BB5438YQ+yJCn+naDsM8BgGrl+wcKzbGkF5mYVLFGiPaUZU1wxc6HPpx/u74kmaj1B
         2UUb2pIA/Xi9gYyhWTFIec5q456ZZB/QJtBZf5d8aTDDkJjaDk3q9nocO1EjPValttsP
         EeoOK28l62tcn+BCVsDkMMJezw3Fujg/oL0AM1qt1pAEb3brBEvEd7Yrf708XvCQKLVi
         QXlnaVp/k5kXlAhaX1wrJE7i3lo2oPAgabPQ+JFzkXuE1QrlxX/Dsbibx2ZIywDyIXaN
         zrbwqZq/UTOVfLmPZVUIK52GV5lj1IDEWg0s1W2+NUL+K5W4hBh4XiKPRaM+QiOFDjYw
         7CHA==
X-Forwarded-Encrypted: i=1; AKwUvBwWlbguWqvv70wwJf7G4+G8Y2yFpzIXO/OLCAVqnq6ufAwa5I52041XUuqmwRhr1lJav0o77liSz9Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lx6soyZkVipqHGWMv5LB1AptWc4lzLzXTj1TrCmOmUVigfomCy
	GubZW4gDtN+ItTyoaa2iAxYkFSCpQ142gnOGun+uxM1wLy/3P50lK1YAvEPzMkwyZXU9q+6sje8
	+dovwYAKTmxA+0s+Lz0SLR+3Tx0FsXJwmaVKLSER1
X-Gm-Gg: AYBFou22GzGQCAMRMeysuvcRjhrthiS0NgGQY2+DJcWi8H5pLVMxCnUi2F9Kcm6qlvk
	1B8G2+/gKNyfXVmSEB52cX9IILedOSPSRFtz96xY9vjcImrwj9DNH8cgBN1N3UTdQu6ZF1EOJe4
	1UDyKn5U9/aSdkUHrYryM8MePny7DSMBRMf1pkLNQiYcge9mMnmYjj945pftXE44Rb1SLYgeekA
	wvm+z97r2tCXX9kS1QASUyrwxhATzdAzUTIHCBZA5UULNwKJnCRZ4l42Gkc1zlMZNqCDbPBkYix
	tJJwrY1b50Wr/LNWBHXXDEOXBI1kuZ9clWCtLOwfvtnS+/T4RaQhMYbzn4b84+TY2yzcluDbpM6
	gLDwOh6LP9w==
X-Received: by 2002:a05:6214:570f:b0:912:517b:911 with SMTP id
 6a1803df08f44-91254cd050emr18449906d6.48.1789700734463; Thu, 17 Sep 2026
 20:05:34 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 20:05:33 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 20:05:33 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260916201307.5618114cbac4af52d98aecfa@linux-foundation.org>
References: <20260916-hugetlb-subpool-always-track-used-v3-0-38aae9b5ccdd@google.com>
 <20260916201307.5618114cbac4af52d98aecfa@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 20:05:33 -0700
X-Gm-Features: AcwNN1VMr0mS5JSTeCSWpRPDQdqCHdO4zh_QkNZo0USni7iz5fls9MH4L-TCxPM
Message-ID: <CAEvNRgExZM4ixMfrF_FMw2CTn6JqRX8s=cy0_-x5ypLxvQQuMQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fix HugeTLB subpool used_hpages tracking
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, Alex Shi <alexs@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hongxiang Lou <louhongxiang@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Michal Hocko <mhocko@kernel.org>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, Naoya Horiguchi <nao.horiguchi@gmail.com>, fvdl@google.com, 
	jthoughton@google.com, rientjes@google.com, vannapurve@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Andrew Morton <akpm@linux-foundation.org> writes:

> On Wed, 16 Sep 2026 16:39:00 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:
>
>> HugeTLB subpools currently only track used pages (used_hpages) when a
>> maximum size limit (max_hpages) is configured on the mount.
>>
>> ...
>>
>> This series addresses three problem areas resulting from untracked usage
>> and asymmetric error handling:
>
> These are rather serious-sounding problems.
>
> I'm seeing Fixes: for 10-year-old patches, for one last year and one
> this year.  The fourth patch doesn't identify what to fix.
>
> So if downstream people (-stable maintainers, others) follow our
> recommendations, some kernels will get two of these patches, other
> kernel versions will get three and some lucky kernels might get all
> four.  Are you confident that the patches can be split apart in this
> fashion and still produce a good result?  After all, we're sending
> downstream some patch combinations which we didn't test.
>
> Also, can you speculate about why these things took so long to
> discover?
>

I wouldn't have noticed these if Sashiko didn't point out these
pre-existing issues while I was trying to refactor alloc_hugetlb_folio()
in the earlier patch series.

Here are my guesses:

> 1. False restoration and premature subpool freeing (Patch 1):
>     + Global reservations (resv_huge_pages) are not decremented when
>       reservations are released, depleting available huge pages host-wide.

This requires min_size to be requested and NOT max_size, and it needs
an awkward partial truncation of the file.

>     + On unmount, subpool_is_free() checks (rsv_hpages == min_hpages).
>       Because of the false reservation restoration, this evaluates to true,
>       freeing the subpool while folios are still active in the page cache
>       and causing a use-after-free when they are later released.
>       (See Patch 1 for a detailed step-by-step trace.)

Unmounting masks the issue, because when the subpool is freed,
spool->rsv_hpages gets returned to the global hstate, restoring the
global state. The use-after-free doesn't actually happen unless a folio
outlives the subpool (not common), since free_huge_folio() is the one
that uses after the subpool is freed.

> 2. Reservation rollback races and underflow (Patches 2 & 4):
>     + On hugetlb_acct_memory() failure in hugetlb_reserve_pages(), the
>       error path manually calculates rollbacks using local variables.
>       This is race-prone when concurrent threads interact with the
>       subpool, risking reservation leaks or counter underflows.

I didn't reproduce the race here that could mess up global state, and
races probably hid this. I guess the messing up could go both ways so
perhaps on a machine with heavy load, future races offset the old error?

>     + On region_add() failure, prematurely releasing global reservations
>       forces error cleanup to attempt fresh allocations that can fail
>       under memory pressure.

I didn't write a reproducer for this one, but it's an edge case (memory
pressure causing huge page allocations to fail) of an edge case (OOM on
trying to allocate an entry for the resv_map). It might occur together
if the host is completely out of memory, but I think in that case people
worry more about the system OOM than fixing a HugeTLB bug.

> 3. Subpool usage leak on allocation failure (Patch 3):
>     + In alloc_hugetlb_folio(), when folio allocation fails and
>       gbl_chg == 1, the cleanup path skips hugepage_subpool_put_pages(),
>       permanently leaking used_hpages.

This is a failure path, which probably isn't executed that often. The
reproducer created a very small mount and was specially written to
trigger this edge case.

Overall, I was also second guessing myself: perhaps it was never the
intent to manage reservations by tracking used_hpages throughout, but in
09a95e29cb30 ("mm/hugetlb: optimize minimum size (min_size) accounting")
Mike noted that min size accounting "does not take into account used
pages within the filesystem", and the patch added a check for
used_hpages. Based on that, and the _original_ code documentation below:

	long used_hpages;	/* Used count against maximum, includes */
				/* both allocated and reserved pages. */

I think the original intent was for used_hpages to track both allocated
and reserved pages, and patch 1 restores the original intent, and also
simplifies the logic in many places.

> Ho hum, complicated.  Let's at least slap a Fixes: on [4/4].  My
> trillion-dollar sidekick suggests a9e443086489 ("hugetlb: disable
> region_add file_region coalescing").
>

Your trillion-dollar sidekick got the right patch but the wrong hash :)

Fixes: 0db9d74ed884 ("hugetlb: disable region_add file_region coalescing")

I'll also reply to the last patch with the above. If there are no
further revisions required, could you please add the above tag in for
me?

> Our other little friend is talking to us:
> 	https://sashiko.dev/#/patchset/20260916-hugetlb-subpool-always-track-used-v3-0-38aae9b5ccdd@google.com
>
> I'd like to queue this up promptly because it fixes things.  But let's
> seek additional review input and argue with Sashiko before taking that
> step.

I'll copy Sashiko's comments onto this patch series in replies. :)
