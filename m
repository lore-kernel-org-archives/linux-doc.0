Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3A22475F7
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 16:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284093; cv=pass; b=fjODRKb++OXrzFKnLH26Wi1KPXTnrXa3tyv639ybS1ymQCoHXnLH0AoPq260/fa82Pv7x/6kT4BBio/yGqYol7uW6fyZ5RgPXxkj07q258zodOTa8E+4+cfd42iDUFxptVTnFk2I+ynnJe9xva8Oz7yjmiXqq54wf/NqkRvHjXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284093; c=relaxed/simple;
	bh=qfm+jxRDid/tXrKxPwqn57nuEjBnj1DDrZrU+wNae2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W+aWDm9D1IPvXKN7wQSHY6JjTpn8NOVlIoLuydU6w4IU1z+SIPVbiKkkl45xJkdjoqS3hGklt1cHXatSNRDh7hP1tuDJDVWvV9h7PZW9tVR/WRn6Yzxtxpk3JtruljAUAH9O453FZKB6qbCUjKLZKln0Dl4xpaxsnVLR3dK5x5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQw/Tj+l; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQw/Tj+l"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so52912766b.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 09:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774284090; cv=none;
        d=google.com; s=arc-20240605;
        b=itLo07BXnVntLRMP7xCJBOLYPgCA8mFgH+XSdZWslu5ozA9FzwbKwOiGRmbgmtLbRi
         VnbnlNkkbU+bcXM2CSNYKyveWgPWw73b3e1tYwKTbpeK+yd6UFdauk9ib5Q6QlfDWLHP
         goD85RJafyNnQhFNQzehu0PMHb8or3ykyrLHI3SOtvt/L5Ccvu4b0mYBtXrxhbzS3EIQ
         pVaVOU6VKT36A0l2aYil+bR7YnHej8w5f7JPTPgHHDjiG/CU8ijgjvEicY+VzmNWamuu
         LnZkn7jmzrBDVqqZsDjKUFVQ3YyNQGN9F2zTVOH2O03UHHe49KVtPz0vt51bNcmsrzAH
         ZIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vmCa6NJatdq+42qe8sVhhvk4aoBatMqzy8mT5DZOBUc=;
        fh=7eqdhajhRxoWPad+yOTxKEYDJCYp0GyMhqU8BEkqigw=;
        b=B462p8O0NpIrHY836mEgf3YB+NtIT2Vmdkir6OQiPwB6VSKzBeIfoKho5Aaogx3Kdk
         3nRNJr9QfJXkmCjuYvwE1dh9Wcbkpp88FWGUerjDd5GcOg/cAAcXdQzb8SFg7UY7FM8P
         PDbkVRZf2jzsZhRpP8LPiCZ2CEEo/Nb95HTzh/G+D47HsHTSgH73cjKxx/w+W4dHQLw1
         HL+cCBDCxdi7ax/9kTmRG9wwY155maTZuERKBrIm2U/NyxO73Vs9Wch4tQ4BjFEwqv27
         Z5EM+AeoO9V5ENRyYNUpL4lMu1C3A80tXmBz/4idhHMn/3rSYz04s5Yd1y/oD91akdQx
         wSGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774284090; x=1774888890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmCa6NJatdq+42qe8sVhhvk4aoBatMqzy8mT5DZOBUc=;
        b=AQw/Tj+lI1htlIyduQK+LigMZe4ERziEeLn9lfuqmPjqbBpqoeZRLKp4k1oAAvbfwY
         vHjjcuo48HwT0/yCLIP/DM2xX8DfnBxfd24mR+HqP88YTe4n3uj9SkaHV2YKOejJz3Y5
         olgr6ZYJqiVHo9Y3fSwDb/cE9O60ZexePMb4qPWGnKphqQqnHUuchODbk5TEFJfugPJL
         OwboUfm0V38awswDw1iSbJZv+S4YeJJgiYXuhEH7E4M58WtUxYyWS9gI7ZDGWRgp0Wcl
         7uq9ChgUTp5SPI52gxLQxHooBcJj8toMw8+Yhtw07Mbl+xd5wfVzvj3fhhZicjXDUuSn
         ww0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774284090; x=1774888890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vmCa6NJatdq+42qe8sVhhvk4aoBatMqzy8mT5DZOBUc=;
        b=nhN/JNhGHxwWmRZUMHWh0TYmbiXZjM6X+trJeo4HiidwRsHndv2+OhPQpveA7PN6aw
         2tqmMTRTwTzJ5Pz+NtSzC2D0iKVaas3XV3crS+uWbzBtBsYRQUrxUcEJrejxLQ4U7TGB
         q0nwJXTxxQhIca8IweRr72bcF2PSqirSVJUUjVHFsq0QJSZGEIT3eFVbDnxQPHlnadvB
         WxQ2TRG6Q87PIi/9uOMyPsQ2Gn3Yd8jtB5Ia2PyyMpJcSm+3tYdlumXGOjKoT5Lvwoig
         wEJnTJUdB1pk1QCsXbO81H0p8C+MfSaNjExNNJv29cCX2Vz2HFoGjmIZA2a8BQLUg3k+
         WOug==
X-Forwarded-Encrypted: i=1; AJvYcCWkyL1HxExXMHf+nIYH27YNX2UchtPMvtcKPh/NgBdK0gTwkvvSVqXAD5Fa9rxpv/otGhINbNDHeR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaoIs9aKElujPaz+6zzO39dKKaYokydanhsq1QGYJ4oT5gW6TF
	8fBF0mgS3wz3XcUUJ5CKeuAgxby15qM1XLJFHYdj7GBSoCcgKfk5BDu3vsizwVmP7VOUm8ULT9G
	n7D4Q8vxyV+AoFhHgQXmb4g3n8IJ7vZc=
X-Gm-Gg: ATEYQzxRdITqVf9mHGYvf2dhlizLUZK5xx1HafX7P5dyZx0kERKL+5ehdoVwGRpIQGs
	M3Z111IWxnBu61e9xxlJQZZONiM/deKfSgoRN2zF2EKE7euQX7fGFwCsgr97C6wSpNq2Q8jaVSj
	Jp6u134LVnwwP1OUZv8CcenTNb6a5Ebrkcu9BesUyun3UDOdooU33FBQHru3EVRTh+PdbPojS0A
	b06LQC8GN1tNpFaVtdKR4DdnK5mdgPIdRTwuq9reWk776wiehoBYdjtqdwP8GQxTP8ZZSPEoNRX
	v9aUpayh5ArFEX22ar2WFqFVZVya8SP9g8VSJgjm
X-Received: by 2002:a17:906:c398:b0:b97:1009:7536 with SMTP id
 a640c23a62f3a-b982f286a8fmr671723566b.15.1774284089391; Mon, 23 Mar 2026
 09:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320192735.748051-1-nphamcs@gmail.com> <CAMgjq7AiUr_Ntj51qoqvV+=XbEATjr7S4MH+rgD32T5pHfF7mg@mail.gmail.com>
 <CAKEwX=PBjMVfMvKkNfqbgiw7o10NFyZBSB62ODzsqogv-WDYKQ@mail.gmail.com>
In-Reply-To: <CAKEwX=PBjMVfMvKkNfqbgiw7o10NFyZBSB62ODzsqogv-WDYKQ@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 24 Mar 2026 00:40:52 +0800
X-Gm-Features: AQROBzD1kpskNn11W5HqnEfFhEQur5XfLuCkDmtbLopJRo-HyQHAInVqxx1Q2Xw
Message-ID: <CAMgjq7AzySv801qDxfc8mEkEsFDv4P=_qw0rNOTe0n+qy7Fz6A@mail.gmail.com>
Subject: Re: [PATCH v5 00/21] Virtual Swap Space
To: Nhat Pham <nphamcs@gmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, apopple@nvidia.com, 
	axelrasmussen@google.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	bhe@redhat.com, byungchul@sk.com, cgroups@vger.kernel.org, 
	chengming.zhou@linux.dev, chrisl@kernel.org, corbet@lwn.net, david@kernel.org, 
	dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, 
	jannh@google.com, joshua.hahnjy@gmail.com, lance.yang@linux.dev, 
	lenb@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	matthew.brost@intel.com, mhocko@suse.com, muchun.song@linux.dev, 
	npache@redhat.com, pavel@kernel.org, peterx@redhat.com, peterz@infradead.org, 
	pfalcato@suse.de, rafael@kernel.org, rakie.kim@sk.com, 
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com, 
	shakeel.butt@linux.dev, shikemeng@huaweicloud.com, surenb@google.com, 
	tglx@kernel.org, vbabka@suse.cz, weixugc@google.com, 
	ying.huang@linux.alibaba.com, yosry.ahmed@linux.dev, yuanchu@google.com, 
	zhengqi.arch@bytedance.com, ziy@nvidia.com, kernel-team@meta.com, 
	riel@surriel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:33=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Mon, Mar 23, 2026 at 6:09=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > On Sat, Mar 21, 2026 at 3:29=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> w=
rote:
> > > This patch series is based on 6.19. There are a couple more
> > > swap-related changes in mainline that I would need to coordinate
> > > with, but I still want to send this out as an update for the
> > > regressions reported by Kairui Song in [15]. It's probably easier
> > > to just build this thing rather than dig through that series of
> > > emails to get the fix patch :)
> > >
> > > Changelog:
> > > * v4 -> v5:
> > >     * Fix a deadlock in memcg1_swapout (reported by syzbot [16]).
> > >     * Replace VM_WARN_ON(!spin_is_locked()) with lockdep_assert_held(=
),
> > >       and use guard(rcu) in vswap_cpu_dead
> > >       (reported by Peter Zijlstra [17]).
> > > * v3 -> v4:
> > >     * Fix poor swap free batching behavior to alleviate a regression
> > >       (reported by Kairui Song).
> >
>
> Hi Kairui! Thanks a lot for the testing big boss :) I will focus on
> the regression in this patch series - we can talk more about
> directions in another thread :)

Hi Nhat,

> Interesting. Normally "lots of zero-filled page" is a very beneficial
> case for vswap. You don't need a swapfile, or any zram/zswap metadata
> overhead - it's a native swap backend. If production workload has this
> many zero-filled pages, I think the numbers of vswap would be much
> less alarming - perhaps even matching memory overhead because you
> don't need to maintain a zram entry metadata (it's at least 2 words
> per zram entry right?), while there's no reverse map overhead induced
> (so it's 24 bytes on both side), and no need to do zram-side locking
> :)
>
> So I was surprised to see that it's not working out very well here. I
> checked the implementation of memhog - let me know if this is wrong
> place to look:
>
> https://man7.org/linux/man-pages/man8/memhog.8.html
> https://github.com/numactl/numactl/blob/master/memhog.c#L52
>
> I think this is what happened here: memhog was populating the memory
> 0xff, which triggers the full overhead of a swapfile-backed swap entry
> because even though it's "same-filled" it's not zero-filled! I was
> following Usama's observation - "less than 1% of the same-filled pages
> were non-zero" - and so I only handled the zero-filled case here:
>
> https://lore.kernel.org/all/20240530102126.357438-1-usamaarif642@gmail.co=
m/
>
> This sounds a bit artificial IMHO - as Usama pointed out above, I
> think most samefilled pages are zero pages, in real production
> workloads. However, if you think there are real use cases with a lot

I vaguely remember some workloads like Java or some JS engine
initialize their heap with fixed value, same fill might not be that
common but not a rare thing, it strongly depends on the workload.

> of non-zero samefilled pages, please let me know I can fix this real
> quick. We can support this in vswap with zero extra metadata overhead
> - change the VSWAP_ZERO swap entry type to VSWAP_SAME_FILLED, then use
> the backend field to store that value. I can send you a patch if
> you're interested.

Actually I don't think that's the main problem. For example, I just
wrote a few lines C bench program to zerofill ~50G of memory
and swapout sequentially:

Before:
Swapout: 4415467us
Swapin: 49573297us

After:
Swapout: 4955874us
Swapin: 56223658us

And vmstat:
cat /proc/vmstat | grep zero
thp_zero_page_alloc 0
thp_zero_page_alloc_failed 0
swpin_zero 12239329
swpout_zero 21516634

There are all zero filled pages, but still slower. And what's more, a
more critical issue, I just found the cgroup and global swap usage
accounting are both somehow broken for zero page swap,
maybe because you skipped some allocation? Users can
no longer see how many pages are swapped out. I don't think you can
break that, that's one major reason why we use a zero entry instead of
mapping to a zero readonly page. If that is acceptable, we can have
a very nice optimization right away with current swap.

That's still just an example. bypassing the accounting and still
slower is not a good sign. We should focus on the generic
performance and design.

Yet this is just another new found issue, there are many other parts
like the folio swap allocation may still occur even if a lower device
can no longer accept more whole folios, which I'm currently
unsure how it will affect swap.

> 1. Regarding pmem backend - I'm not sure if I can get my hands on one
> of these, but if you think SSD has the same characteristics maybe I
> can give that a try? The problem with SSD is for some reason variance
> tends to be pretty high, between iterations yes, but especially across
> reboots. Or maybe zram?

Yeah, ZRAM has a very similar number for some cases, but storage is
getting faster and faster and swap occurs through high speed networks
too. We definitely shouldn't ignore that.

> 2. What about the other numbers below? Are they also on pmem? FTR I
> was running most of my benchmarks on zswap, except for one kernel
> build benchmark on SSD.
>
> 3. Any other backends and setup you're interested in?
>
> BTW, sounds like you have a great benchmark suite - is it open source
> somewhere? If not, can you share it with us :) Vswap aside, I think
> this would be a good suite to run all swap related changes for every
> swap contributor.

I can try to post that somewhere, really nothing fancy just some
wrapper to make use of systemd for reboot and auto test. But all test
steps I mentioned before are already posted and publically available.
