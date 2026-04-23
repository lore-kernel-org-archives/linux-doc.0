Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F42C311C35
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 06:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776925025; cv=pass; b=Fpd9NkjXfLRzBgYvRJgklGfzja40LYb1Pags1RTcHVo0izwNpPrIOvGodaqKZOYpShNuwBE/Ikj/EcDXaD5x1aQXXCP/bsfyU/CqvsalAA5KrGevPghh/mGvWaEJ9jup5zEx5Wtn9w1jlvbWQZnKWWyhxkVZVxvFqCJNNlN2yg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776925025; c=relaxed/simple;
	bh=6qrM7qsAzBHvv/VI+HqLPPP6FQ3qhsBu/FQQBvDaXwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHgtX+iLq45swlRpkT+2MNY4iIwHwLddBvoasaLWctETm/Awa5kyZUw5+BtP2CHn8oOhdCRzjvOL0EhAlk4oLphZoqlnmXMJ1e2keenpDS3583VWS4DGTuqy5460yCl6c9RGdgfAQXuyYTQWMc6a6NNK3FNWJnYiCPff2KeaAQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiE0EZ3N; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiE0EZ3N"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66e8cf72a93so7509134a12.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 23:17:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776925022; cv=none;
        d=google.com; s=arc-20240605;
        b=YSbAxNg6DfaFstDMi7GhWEhdV0aBJ/pkIePM3tm29aXxKMhmaUBIcdv48ZiRIHEuOh
         rh0f9rB2iM1Q5UZ+XmFPZKTxwTjXrYRPoaRTyDMLxLksCKlTW+VdWebsxuKwzy7hvd5B
         fyMLph9TjtN0S6d38gh3EWQBuVxNCYPZbvK+vtaNlsx8s679YA3LkBzj894oNfXj9YuG
         hupxBaQQeoMfUGUgZGP8UJFTiZOo34KjWWronlFW3NDcpJuSXNO3rkfjBBgVZ+lnqE43
         ZC4ySsEsXX2oHaQCnRQjbu9+E6++uEIkwKpIiK379YMPNRCD/045opGiX6varZYv7ebI
         dNpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6qrM7qsAzBHvv/VI+HqLPPP6FQ3qhsBu/FQQBvDaXwA=;
        fh=QNNnfzCJqDqlm87zO1SB3c5dj2Sy7bzX1c4nsJWnvCY=;
        b=T5uyv1YWpQnWbtaTtkYm2MP2niO5GTmqeO//Q5o5K4hVvYGE9Dn8qKGyD96Rl8wgVG
         TTZ+qL9DDGO/6LCJimTYT9XMbSrWYtHOHgpVylx+xaqvNjmK77cRblKKyLBcd/AZZF6Y
         c5I4GCSlRSSlpG5FmFR0ES7nDj7WO9wczbJWEbR+x1PsrrX6rKxL7eTIaHwfTxhfpRWB
         oqeKvN5D+l7OasNUJZ8BAcAs11DDJDC2WUDMgadaNkd7AfGkWuVUAKD83b2srt8xNbW2
         3e0qviR/AsxMonXkPJ4oSBa+te+YHiWJ384jqWqocPgRH1WpuufWIq508R7qVQZM7i9u
         v5pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776925022; x=1777529822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qrM7qsAzBHvv/VI+HqLPPP6FQ3qhsBu/FQQBvDaXwA=;
        b=QiE0EZ3N0WWs7sjQT9MKYZYIZ2U2YU8qiddqC3SrIzrCXbfj8HCaw2vtaizUqRInkU
         Db0O/lsAUrxbyaAYQ/jnJsfimlP4cx9vLzkw4pv39xmnQXluTdCju+RER4AneGVUNApW
         Zn7lMi5mJ9IWQORoaX+LE0IZxboXD9p0RAVd9vE+TuXLkXsCNjtESrLdM1Q4O1Olo9YB
         k7FuW/QSR+r/o6CdHwr6PQhwzuMKasKKH9ewgYj//5aSimW8dTmAa3UaB86UVPt8aikV
         JLeue3Rlv6+WBg3VnWKJreSuSkCO1pjkwUKXsNXZ7r4uFhH8zBpPILM5rPgbxyN1LWjc
         rm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776925022; x=1777529822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6qrM7qsAzBHvv/VI+HqLPPP6FQ3qhsBu/FQQBvDaXwA=;
        b=tOacO2qOxTo38Yani0yQvMwU0Xtyll5xt67YD/I8p/3Agy3aXn1JUn18BLa0PZvQGm
         Kv/3r6VJN7iyw+jGS8a2ID5xX3F/G3r1s2jJjLOP9bU3+Vl1vQxpPXk/U3Al5Z70tCqE
         s8BE3fJLqV7nclnDcejoIlEkKYxtUI1pSgCoHFaIswUt+5Fe+yk7yEFavZY8Nb2xuQwW
         kpog8rD0FQu7cte30ZHhEK9fj+al+HzBSVWDNXwMbkGDvzEGFArf+YPnCB7hxhvaaS+C
         0AWzjxSMXa2bYism7qQgmh3UOz1ntABjPei4VTHo9DQqaG5AuX4HrBIjdSWEJVGRX0UE
         ZVbg==
X-Forwarded-Encrypted: i=1; AFNElJ+zNWNZYJkXOSBte3awVNyO9MTRXTp2DW/cNCs+b4I/0VZiXm65rDKDs7NDifM2lAfu9D76C5sxMqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZIqSaI2fGMw9DYveAZq73/g6AApaG1uSJESw26hlwsLqM3HgX
	pBxsZTZ8JTPhVpKr0gs+CFShOW/j8FS5xJdimtw9pWUSaZVk+nKp0bDhjIQzBWCp2tmPfPUdw/q
	ueJF84k4wy5MCe1znihwpIyuVMXov6AM=
X-Gm-Gg: AeBDieug8avadTHUdXbLM///A+xqaLGgVSuKGv0+6tJXzQPCsU/BHEd3F4JJGUkzJKh
	P5a8BSmueZ2sIt1wOlgsfpjqQ8vRLwHv6jX77tAiUsn4hBwwXNhaX/j3XGmSQW7Tz4TptRLyy0T
	62pYY167N77A5kNVN5LRcNUB+3qHCc4McEcR0/actjhA5A2KGDLAwLKtiptlVOsfQP/ED83IMD6
	JrJE/QVSVrlz26bsWRrvxURrpgY5xD+5y1MAWQGNzuqeGREsAD5ScZk0Nar8a0rq2cwbm4M5a6u
	qlt7Dg1UG9sor+lgK1jtVjfmdxHUs9BKWjbW8sKDOMHDZcJ0+GY=
X-Received: by 2002:a05:6402:24cd:b0:66b:aa56:ee5c with SMTP id
 4fb4d7f45d1cf-672bffd3a22mr10256938a12.28.1776925021636; Wed, 22 Apr 2026
 23:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320192735.748051-1-nphamcs@gmail.com> <aegUoOiUbjUAH5aT@google.com>
 <CAMgjq7C53WRS5oYxO157mX7JxhfoPoi34k+taiKLrMah-b-iRg@mail.gmail.com> <aektdlD4npMVThu3@google.com>
In-Reply-To: <aektdlD4npMVThu3@google.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 23 Apr 2026 14:16:24 +0800
X-Gm-Features: AQROBzBVGp3guci_2n97e7eFyFpR7BCikY1iYf4lyc9Y4ueJzJNdB9B8Zs-KyXM
Message-ID: <CAMgjq7DRrz4Hdy-s4y-C=3BmPt50LKOfdWjjf2mWmCybdRaJ4w@mail.gmail.com>
Subject: Re: [PATCH v5 00/21] Virtual Swap Space
To: Yosry Ahmed <yosry@kernel.org>
Cc: Nhat Pham <nphamcs@gmail.com>, Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	apopple@nvidia.com, axelrasmussen@google.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, bhe@redhat.com, byungchul@sk.com, 
	cgroups@vger.kernel.org, chengming.zhou@linux.dev, chrisl@kernel.org, 
	corbet@lwn.net, david@kernel.org, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jannh@google.com, 
	joshua.hahnjy@gmail.com, lance.yang@linux.dev, lenb@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com, matthew.brost@intel.com, 
	mhocko@suse.com, muchun.song@linux.dev, npache@redhat.com, pavel@kernel.org, 
	peterx@redhat.com, peterz@infradead.org, pfalcato@suse.de, rafael@kernel.org, 
	rakie.kim@sk.com, roman.gushchin@linux.dev, rppt@kernel.org, 
	ryan.roberts@arm.com, shakeel.butt@linux.dev, shikemeng@huaweicloud.com, 
	surenb@google.com, tglx@kernel.org, vbabka@suse.cz, weixugc@google.com, 
	ying.huang@linux.alibaba.com, yosry.ahmed@linux.dev, yuanchu@google.com, 
	zhengqi.arch@bytedance.com, ziy@nvidia.com, kernel-team@meta.com, 
	riel@surriel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 4:27=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Wed, Apr 22, 2026 at 10:18:35AM +0800, Kairui Song wrote:
> > On Wed, Apr 22, 2026 at 8:26=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > On Fri, Mar 20, 2026 at 12:27:14PM -0700, Nhat Pham wrote:
> > > >
> > > > This patch series implements the virtual swap space idea, based on =
Yosry's
> > > > proposals at LSFMMBPF 2023 (see [1], [2], [3]), as well as valuable
> > > > inputs from Johannes Weiner. The same idea (with different
> > > > implementation details) has been floated by Rik van Riel since at l=
east
> > > > 2011 (see [8]).
> > >
> > > Unfortuantely, I haven't been able to keep up with virtual swap and s=
wap
> > > table development, as my time is mostly being spent elsewhere these
> > > days. I do have a question tho, which might have already been answere=
d
> > > or is too naive/stupid -- so apologies in advance.
> >
> > Hi Yosry,
> >
> > Not a stupid question at all=E2=80=94it's actually spot on. :)
> >
> > >
> > > Given the recent advancements in the swap table and that most metadat=
a
> > > and the swap cache are already being pulled into it, is it possible t=
o
> > > use the swap table in the virtual swap layer instead of the xarray?
> > >
> > > Basically pull the swap table one layer higher, and have it point to
> > > either a zswap entry or a physical swap slot (or others in the future=
)?
> > > If my understanding is correct, we kinda get the best of both worlds =
and
> > > reuse the integration already done by the swap table with the swap
> > > cache, as well as the lock paritioning.
> > >
> > > In this world, the clusters would be in the virtual swap space, and w=
e'd
> > > create the clusters on-demand as needed.
> > >
> > > Does this even work or make the least amount of sense (I guess the
> > > question is for both Nhat and Kairui)?
> > >
> >
> > Yes, this absolutely works. In fact, I previously posted a working RFC
> > based on this idea. In that series, clusters are dynamically
> > allocated, allowing the swap space to be dynamically sized
> > (essentially infinite) while reusing all the existing infrastructure:
> > https://lore.kernel.org/all/20260220-swap-table-p4-v1-0-104795d19815@te=
ncent.com/
>
> There are a few aspects that I don't agree with in this RFC, and I think
> Nhat and Johannes raised most of them. Mostly that I don't want to
> expose ghost swapfiles or similar to userspace.
>
> I think userspace's view of swapfiles should remain the same and reflect
> the physical swap slots. The virtual swap layer should be completely
> transparent in this case. Userspace shouldn't need to configure it in
> any way.

That approach is definitely doable. For example, with that RFC we
could simply drop the interface I introduced and enable it via a
different knob, and that would be very close to it. :)

Using a swapfile to represent the virtual layer externally just made
it more flexible. I agree that the RFC design was a bit confusing and
could be improved. There is no technical difficulty in hiding it from
userspace; it's mostly a design choice. And even if we don't use a
swapfile to represent it internally, all the other infrastructure can
still be reused without much modification.

Using a swapfile does have its benefits, though. For example, the
virtual layer could act as an ordinary tier following YoungJun's
design:
https://lore.kernel.org/linux-mm/20260421055323.940344-1-youngjun.park@lge.=
com/
It also means we wouldn't need to introduce things like a new,
virtual-specific swapoff mechanism.

> In an ideal world, the only noticeable change from userspace is that
> with zswap, compressed pages would stop using slots in the swapfile and
> charging the memcg for them -- and that zswap would work even without a
> swapfile, by just enabling it. This is admittedly a user-visible
> behavioral change, but I am hoping that's a good one that we can live
> with.

Totally agree with the ideal end goal for zswap. just not sure if
that's the right place to start for this usage, zswap doesn't always
apply. For instance, we have SSDs with built-in compression,
software-based storage stacks with built-in compression and
deduplication, swap over RDMA, and, most notably, ZRAM users. They
don't necessarily need zswap or a virtual layer, and the upper layer
better be as much simplified as possible.

> If there are real concerns about this, we can discuss things like a knob
> or config option to keep charging zswap pages as swap slots (ew..) or
> only allow zswap with a real swapfile (double ew..). But I am really
> hoping we can get away with changing the semantics without doing this.
>
> We can add extra interfaces for virtual swap as needed, e.g. virtual
> swapoff that you mentioned to clear the swap cache, or stats about the
> virtual swap space (which translates to memory overhead).

Good suggestions.

> > It cleans up a lot of allocation and ordering, as well as memcg
> > swap lookups. Since some of these problems were also observed in the
> > vss discussion, I think this will make things easier for all of us:
> > https://lore.kernel.org/all/20260421-swap-table-p4-v3-0-2f23759a76bc@te=
ncent.com/
>
> Yeah I saw that (but didn't really have time to do anything else about
> it). Splitting this out is definitely the right thing to do, and the
> series looks great from a very high level. Awesome work, as usual :)

Thanks!
