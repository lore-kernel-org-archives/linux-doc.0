Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D2947124E
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 16:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402254; cv=pass; b=nkaHtNLWzMXHf/NW4QoDHbMYkQ2wMbE4QiAvt/kxPyBTdBjCnbVn6Xd3gTB6FwGaM7q2M5VclnV9pk9Tob1l+189IS1osAOswmw6YHRvGrfOJciLugeXmYE0kphXX5BeW6lwSGnzAEeQx4KuYCt5ve34xX8thMt1w1YSdidrcaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402254; c=relaxed/simple;
	bh=ynN4ATH+92kqx24zHVCCIK4upKdL2BGsB5dzD19o/CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EjFiQ41IG4RXYKgUAms/4CJxYseq4kxlBZOXu8nAy6PYbzctorn+jw6z4QTFOnUq1+iUXvlxPKUtQr/VFZnJgwDVXBAbAdNsEuMbnnTzeDeWvZrem54bDaYclODwJ7qAdTsR2QxoKF9vFZ/vad5f9Rc2NWAK6+dzTS9wGjffVwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOXtvHwv; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOXtvHwv"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso13271415e9.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 09:10:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789402250; cv=none;
        d=google.com; s=arc-20260327;
        b=eiJpdSzhtGWqhIYgVTVh7FzABsU4lcVIdJPa/faunPFMuwkn5GnPjtMS0FKQ9Tb7Vz
         SmPgiWx9nES1j/3CjqMoaKutidQ8Dj7/22zs5tzk80SawBfkXL5ANBEY/vu5Xz4qI78B
         7XOJffYuySqmTcm63ATPPfNNOGJFr9XFJQ1gy8RLT4fbWJAPuQhhNTL8KHuzMZxVSsPw
         fTbNuBYoqiSgY4M4fx67ZeyV8sGfg43q0rq+fxusb/bS76WaTVEIlJ37GOVwtEXGrDj8
         69EfcS7aNbFJh+A5daoQjT6GmMHXVJkWQOncybaAI3SVE+czeiAY6umXTQjtPxQr9+mD
         AW9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JVDJIFTFgLvCCjRsRRk9CSdls4G/cg4o7is/ZxTdK6I=;
        fh=fKmZDYpjN5SLWdE7kJZ/bXZFTQCEepCtFOBh/HbPNcM=;
        b=eEjo5txEar0RkJ5FcCJKdwDmX9RLiIIMRJtVOKl/EmgWUTgg6soJi1dRHu0aTlJS/X
         DVzfHBrvHTAQkgMmuPRZk/EE/6MD7tGboTrn3wJhUZdbtGmboijPCdGUSKrDxyir4OIw
         wsqKw8+xhruvZheivSfN2t/+hlx1/XKDl4KTN8M+xAHitHYHo9LeyGsUVbhCK7Ph6cDb
         0GG3TNdVoUsPZKpdvJGszy9emY1FphqHxxZQoJgyVsf6FXQpZg103gvW0Szv9mdAp38I
         fsKP8DKrDVc1tpy76wKP3PDPXMAG6q14VA1BCybJPXnwVdihjYchwQglEY2Q27ZAh2Dn
         8yUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789402250; x=1790007050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JVDJIFTFgLvCCjRsRRk9CSdls4G/cg4o7is/ZxTdK6I=;
        b=rOXtvHwv40Jr+RFB237IqvvDrxZHHbFimOteqcQo+b2v89LwUpQvaDnYTFsVrnkLCo
         H/4lXn3jXep5qC1ZrVZH948Gsp7QtJAmlYGD3Wpw0LWZTJtCIdzVBJxcLJeJUH4EYs7i
         CDEb80RK9Gicgk6gfftIY5d8DU4HfUD85MwFbwCgn6dv6PSXScjGF8h1eeaqk5KD5dBK
         ZjTJhYToaTNXfFlA8JYaaT4zJamNwN7eX1v2qkApywwSJ6IWQU3YU3VVj9MlaIuoYur5
         JosWP0GxPxTSq8F1iTRHKGCEv//0Svr1+xYmRxrcxS5eR08gT3l20Rp9IcPASomD97nY
         N0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789402250; x=1790007050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVDJIFTFgLvCCjRsRRk9CSdls4G/cg4o7is/ZxTdK6I=;
        b=FeykATJIfhu+3KTNOqv1DeujWMdl/2hXZ9/Yl9krjEzu3MXB5P7ci0ICsguKXCC9V1
         StgPx3Tp8SZq/vxngslYxlEv2UeEEL7yCY3sWLjHSk6GZpxf7w+swb9y5uOavXL6mPNB
         BmNG9O6W7pgP9mWmhHp928jvQDGY0ifTnJd/tbdCV9r0WW5zovpY+a97RWEtWUsRBz5S
         Koh6aHsdTinBOYBQvyyA6QmUr1gj2kKyZeVCEeVcsyOgH5PpMopbznK4gw/d4P0oHJQT
         cnexrX6j2ae803ZPocfZe+mAE9VKrgtQfOQR3p3H1VdW0oiYF5QDlXkil4+emlwFH7Z8
         Nmdw==
X-Forwarded-Encrypted: i=1; AKwUvBz9bu9UfOXKdNICUolvAz3oWUXW1r6m1eaf7KnoroUg1U2zStL45K9HSw//nSi6xs3/NiS9LbDNkhE=@vger.kernel.org
X-Gm-Message-State: AFuF++kYgJnHJrVK+G3sHDJ854xtnZzC2FbAZC+W0kq9GMlzHE/ctXGx
	49W7dZskG41mlVa6Di+bDCG32WRIHETnDiIaUrREl1lA4uWntlo004F3cscAYF3Qpuv9WEelIeT
	ATyTurOO9wwOTSY3onZKJgHtDEiSUXFA=
X-Gm-Gg: AYBFou0MhtW+x2VvOsn8h6pXgMSjiI1yiHmT60vok2ScSYCmsqbKMx/xkAq9i2+Plmw
	PIx1RSbJ6CHZmCzspb/k9gfWvwqXPnUszfz0cmQauKA1wbRjWbLAZsYOjmytEj/GR345DvR7IFR
	m/qxG8os6GcX6dbvMSwi1u/2ALSonTVoVEn0wXlawyBCWEBAOFMdBafPhmdRjFRf5rqTASD5rKW
	5SKG29WoLibiBL0zk3zu1h+3VBoZAe9wzOUxK1swhImoCHinXHapA6CPFdrQ/CtKc+Ce8hMshbz
	LhCuRZqG5zUEEjfiMciawYn3f6UD5nIOK4MA2kswePwa0R3ZGBICoZdPKlltLwIORI1Cmj0KrJD
	9IG/j+7bYKIYL7sTZfZuQAA==
X-Received: by 2002:a05:600c:37cd:b0:49c:fa20:cc08 with SMTP id
 5b1f17b1804b1-49e7a67cdcfmr47809235e9.31.1789402250147; Mon, 14 Sep 2026
 09:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>
 <aqBT_35E-eSoN_zj@cmpxchg.org> <CAKEwX=N4aaq_oD2agTUNrUNXhaYGeQ9vxu+dywFvEFgWFi4uQg@mail.gmail.com>
 <CAMgjq7AfNBUpMamcv29JFzpX=7ApNYVLtPjWT4Sm8cXjSLYL9g@mail.gmail.com>
In-Reply-To: <CAMgjq7AfNBUpMamcv29JFzpX=7ApNYVLtPjWT4Sm8cXjSLYL9g@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 14 Sep 2026 09:10:38 -0700
X-Gm-Features: AcwNN1UhGBQM2G8axnieeGvN4-f-Y8NhL0mjIZlCfhdtBbLfiYUWAueMcYwHRoQ
Message-ID: <CAKEwX=NZo8DNg70uhhd6CM0BfHH1RAkfuSQwVeTg+77a5-r5DA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Kairui Song <ryncsn@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 2:01=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Thu, Sep 10, 2026 at 12:42=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wr=
ote:
> >
> > On Tue, Sep 8, 2026 at 11:30=E2=80=AFAM Johannes Weiner <hannes@cmpxchg=
.org> wrote:
> > >
> > > On Mon, Sep 07, 2026 at 01:51:31PM +0800, Kairui Song wrote:
> > > > Where I've ended up is that unbounded growth is a real concern. On =
a
> > > > host with no memcg limit (root cgroup, and most desktop and embedde=
d
> > > > setups), an unlimited pool means usage can keep growing, with no
> > > > admin visible ceiling at all. I'm not attached to xswap's percent o=
f RAM
> > > > knob specifically, but I do think some kind of bound makes sense.
> > >
> > > Swap space is just process virtual address space, no?
> > >
> > > Swap entries already have one or more page table entries pointing to
> > > them, which in turn are managed by trees of vm_area_structs. That
> > > means rlimits apply, overcommit protection applies, and OOM killer
> > > attribution works as well (oom_badness()).
> >
> > I tested this theory. I spinned up a process, and let it spam 0-filled
> > memory + swap these pages out continually.
> >
> > As you predicted, oom-killer picked it up eventually. The host was
> > (and is) intact otherwise :)
>
> Good to know the kill path works. But I think the accounting side cuts th=
e
> other way? Won't that conversely underestimate the host's ability to
> handle memory alloc? Not to mention a lot of application are
> swap  space aware, some built in logics like e.g. with vm_enough_memory:
>
> On a 1G machine with vswap enabled:
> [    0.241906] vswap: created virtual swap device (2199023255040 pages)
>
> a 2G sparse anonymous allocation fails:
> [   46.044002] __vm_enough_memory: pid: 1129, comm: search_agent,
> bytes: 2147483648 not enough memory for the allocation.
>
> The default "Heuristic overcommit handling" policy is meant to handle
> seriously wild allocation (as documented, and it's named as
> OVERCOMMIT_GUESS).
> totalram_pages() + total_swap_pages
>
> Is the limit, the heuristic exists only to make "a seriously wild
> allocation fail" (as documented). But on a vswap-only machine,
> reasonable allocations fail. Common swap devices, zram, or xswap don't
> have this problem. One could argue that the size there is just an
> optimistic guess, the compression ratio is not controllable. But that
> heuristic is a guess by design, and a plausible number serves it fine.
> "Unlimited" seems break that.

Oh yeah that needs fixing - thanks for digging that one out!

I'm not sure the answer is keeping "totalram_pages() +
total_swap_pages" though. That makes some amount of sense when the
backend is disk swap - 1 swap slot =3D=3D 1 page in memory, so it
represents a concrete amount. With compression swap backend in the
picture it's very murky.

I think what Johannes proposed makes a lot of sense. Maybe also
keeping physical swap pages in:

pages =3D totalram_pages() + total_swap_pages
if (vswap_is_enabled() && zswap_is_enabled())
   pages +=3D 2 * totalram_pages();

i.e just RAM x 3 + physical swap pages. I think this is a
"good-enough" gate. If users truly believe their memory is more
compressible than that (and for some reason they really need big
allocations like this), yes I think they should with the overcommit
mode :)

I'll include this heuristics in v5.
