Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCC722156C
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 04:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777004170; cv=pass; b=SQ610A2ply2fcgN6JpawIE/7EOxI5paDN7+8iZJnPoVIN7ixQ+o1zNkC6QHoVnaTs3kSkX9BL1jrOx3qPehnKk35fyoQsTrJnuZQWwRgiD8WwlVi2Vw4KGba6k2O8DzWo7im1sNGHaWYpKl4U7wrZVyAYdmOX04U34RioJKCibY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777004170; c=relaxed/simple;
	bh=oMJoD6eFWUzy/CojiSR3e6UD5DqEouSLYBTdudhICzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TBIBQ4dxD1kMk5eraFY0HcKAcQjOpGcueYRjHYiHX/4xOHZ0IYBOoYCvj8MX76MPulbOtOQKQgUAb5772vtu1T/r1lKQqoG8Q6KE5GRtQMQMJ0l4tULfGMLALEzFr1s/T+csVG8zgqWlzPsdNu72/gUc8QcWLMQzzr8NpuXidWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2+UmzKi; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2+UmzKi"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67893fba9c3so2091251a12.2
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 21:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777004167; cv=none;
        d=google.com; s=arc-20240605;
        b=V7qvrlvGqXMaFT6CqNXBkLjfcqTljvrUKL4p+3Mb+XY6jnCGfBmm1qVB97kykpSKXq
         z0sm0L6lI0Og4wG7zJ+lJzxf4r+0K34/e42aOa6PWO3l1d4ts8ALdgHPXQbeaN7lP3zR
         qF5s8gFFG6pQpYDBvgyv6sprC0jgz/9e+9iI2IyvL41BU7CgzjaLu/jvw5aiUcJErnm+
         zmllo/lH7P3tU0ZKpA8k1psUKWbGi2sBUjaA0D8HX4uzxefn/p1q6s+B+50mmfLWMVV1
         3oGu1HcU/+eUskgCbZELkdVYHmzm9x+7lfS2Nhzelm3LMEd8jtfXQz4pj21WNU1fUc7V
         kb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oMJoD6eFWUzy/CojiSR3e6UD5DqEouSLYBTdudhICzA=;
        fh=aQZ2BS7g038WiH3UJAPeJaPRkEgZy6HsP//MTiD91Q0=;
        b=N3Mz7oET0CqNOyedZzJBOTWjKY8U0eszBt0GUNz2IBtVZaP4XahcvEKoseVgodG3AK
         99KdO9gbmMoXOFDD4LjirmY+Z6nPTpPuCgHkuKL8QTLWzPn4gM6cL/+CIpaew/rTw+uU
         816eSSn7ewK+SKcfdq5yis5u6gMTw63FUvJUq84d2YMuUcGCJ9lLTAuzKpUK6vJZqTAC
         6rJidbcSxsUtzU7PU+PWWrCNx4k8vb/PIWURdFxWaTLOntbSXN5RUmRXLN/epZcpuu6I
         C228AqMLBRri01tsUCPA0Wx8+xj8F87LgoKo+1J4ZK0NRQ7p71c/624JujRA+1+g3g/x
         yCwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777004167; x=1777608967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMJoD6eFWUzy/CojiSR3e6UD5DqEouSLYBTdudhICzA=;
        b=L2+UmzKioJNWV4vcQdznhpNv6iXWw4TRAlZWZLKNBsyaKBGbr0xuXS5Vk55tbhYEAn
         aZeKgu/iO6Y18b+HXWgRVm9ZC2vlW6fuJrhXL6xnR6JM+0K+rlDbbL4nyZv4JYYDZHBw
         KqCMsXg+oj573jfNyXEEvWjgFD8+vGc9bTEH5f/LiYkGJl2RnpBSPSyBNr0pob4lLxOw
         wxZzH4jXgEp8zWVVCdFarGOp4qj04NVMyEaDzGLYaEIZphQZCYCYHqrjAXTC/Hy9ZgEl
         +1CzJNMeFY3wJdVSv5fxydgbFegktRBK9pTvuwO3rgzHcon9BMncI1e8qJaqTxtsOVj9
         Lcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777004167; x=1777608967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oMJoD6eFWUzy/CojiSR3e6UD5DqEouSLYBTdudhICzA=;
        b=qVynU8y9oX5V26mWiQmU9z39e0fxzEFrsc1lWLfR+QwV0B9liL2USgSLA170r6ylUL
         3aabMjAaiu4w0RirT62LlFxeJQYULARain3dRzpMvJ/m9B9F4OXwMb6NcdrbWduCxk0v
         bd321L0/3lqEmxkRD1cvIcTL555SZ8J/97Hnq2Y2oOuXHYVFw38MhSx9ISv27gKTkPu1
         Y3QtITAHdKzX4XYkwvyf2br3lOxIWBcaiiko604i0KLntwvw7sdbTahj6tUlcH1Ue2pG
         gtQeEwx1p12AEj5iIOMPPkdtytA2YAMAEbtN/7MhVq7l8jT6SkeLM6/Y7WMOx0QzT0qd
         Vrpw==
X-Forwarded-Encrypted: i=1; AFNElJ+4UTZ2l4zFeyW3eZQ4saJoJkHC1uJwADGTlSceBujHeYb8/mz1Q/78AkM913PVBoRgziD9mCYZvv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlWxevgf+paudeFb2U+1PQRubnm+zCB/XfwR5hXWA6+uiTeCQl
	fJ/CD6I1aFUnGx0aNUN5P/3b1+do08bMRON6C2XIpuBtlR41mNAZmMvKqyv6014t276rHl2sH2z
	VqRoDYE+tGf1D+ukKg9u/yL57c5yGs3M=
X-Gm-Gg: AeBDieuwmMkXxkuB0CRP/PBEecjFNeo2oJV2TggzEA/VDDgurZEuru0/vpEvH5k/OKI
	n2CzYcKgGR/zjCbpQPSn1+OYLNJPfoMHG2vsDkFVTsUdptBcCEP1QYIQmrpGvsKAI5uPjI8EpzQ
	mpowQAhmDu9i5Yu6gBa1dNfwtGa1Fh8p95XqDZlGzLuCdY/t7yxQyrAEoOeGrqhkNGjfhgqeBan
	hyQypclHxY82DktI6jGmDPDCbTzCMAeRS3MqX9kd9yc+QtkPg4E/5JtxXaLj6XUMqy7PfvZ5RsC
	E7g5/8T9c53lhXtkwn2oyd6q5oxqUpUyD2TIgTEze1Ogt0M8cfAoT4F+MO/N
X-Received: by 2002:a05:6402:e9c:b0:672:8f26:8a9a with SMTP id
 4fb4d7f45d1cf-672bfd980ccmr11896233a12.8.1777004167137; Thu, 23 Apr 2026
 21:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320192735.748051-1-nphamcs@gmail.com> <aegUoOiUbjUAH5aT@google.com>
 <CAMgjq7C53WRS5oYxO157mX7JxhfoPoi34k+taiKLrMah-b-iRg@mail.gmail.com>
 <aektdlD4npMVThu3@google.com> <CAMgjq7DRrz4Hdy-s4y-C=3BmPt50LKOfdWjjf2mWmCybdRaJ4w@mail.gmail.com>
 <CAO9r8zPvApgxKiVy5NhiWup_m57huF3MTuPvo=iq5kAxjRZC8Q@mail.gmail.com>
In-Reply-To: <CAO9r8zPvApgxKiVy5NhiWup_m57huF3MTuPvo=iq5kAxjRZC8Q@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 24 Apr 2026 12:15:30 +0800
X-Gm-Features: AQROBzDNkzH6IklDt1vdQEkd4AMoZMIvTXZzrHzuAO6eatZU4lRXpIb_XntAKmY
Message-ID: <CAMgjq7AGzBubCkmv7LubBjPLN1DzL472d4zUm+sGxo8ZptMgRw@mail.gmail.com>
Subject: Re: [PATCH v5 00/21] Virtual Swap Space
To: Yosry Ahmed <yosry@kernel.org>
Cc: Nhat Pham <nphamcs@gmail.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	akpm@linux-foundation.org, Alistair Popple <apopple@nvidia.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Barry Song <baohua@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Baoquan He <bhe@redhat.com>, 
	Byungchul Park <byungchul@sk.com>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@kernel.org>, 
	Dev Jain <dev.jain@arm.com>, Gregory Price <gourry@gourry.net>, 
	Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Lance Yang <lance.yang@linux.dev>, lenb@kernel.org, 
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Brost <matthew.brost@intel.com>, 
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
	Mariano Pache <npache@redhat.com>, Pavel Machek <pavel@kernel.org>, Peter Xu <peterx@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Pedro Falcato <pfalcato@suse.de>, 
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Rakie Kim <rakie.kim@sk.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Suren Baghdasaryan <surenb@google.com>, tglx@kernel.org, 
	Vlastimil Babka <vbabka@suse.cz>, Wei Xu <weixugc@google.com>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Yuanchu Xie <yuanchu@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Zi Yan <ziy@nvidia.com>, 
	Meta kernel team <kernel-team@meta.com>, Rik van Riel <riel@surriel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yosry Ahmed <yosry@kernel.org> =E4=BA=8E 2026=E5=B9=B44=E6=9C=8824=E6=97=A5=
=E5=91=A8=E4=BA=94 04:48=E5=86=99=E9=81=93=EF=BC=9A
> > Using a swapfile does have its benefits, though. For example, the
> > virtual layer could act as an ordinary tier following YoungJun's
> > design:
> > https://lore.kernel.org/linux-mm/20260421055323.940344-1-youngjun.park@=
lge.com/
>
> Hmm I didn't look too closely at this but I don't understand how
> making it a swapfile helps with tiering? If anything, I think it makes
> tiering more difficult. For tiering to work, we need an
> abstraction/redirection layer, such that we don't need to update the
> page tables (or shmem pagecache) if we demote/promote pages. That is
> exactly the use case for a virtual swap layer. The page tables point
> at a virtual swap ID and the backend could change transparently (e.g.
> for zswap writeback, or tiering).
>
> If we make the virtual layer a swapfile, how do we demote/promote
> without updating page tables?
>
> IOW, I think the whole reason we want a virtual layer is to separate
> the backends, which would facilitate tiering. If the virtual layer is
> itself a swapfile, wouldn't it become one of the tiers?

That's exactly what I hoped, virtual layer being part of the tier.
Tier could be set up per task / cgroup. So is the virtual tier.

A standalone implementation of the virtual layer is more heavy than
being a swapfile. Actually I think at this point, it is the word
"swapfile" is misleading now. We may rename it to "swap mapping" or
something. A swap mapping could be physical or virtual. Virtual
mapping can realloc from physical ones (redirect), and swapoff of
physical ones just read its data into virtual mapping's swap cache.

I think it's actually functionally very similar to Nhat's design
already from a high level, the only difference is we don't need
standalone infra for virtual parts.

For swapoff or migration you don't need to touch the page table, same
as in this series, just update the virtual swap mapping to be cached
or update the entry, it's identical to what this series is doing.
