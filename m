Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2780442D763
	for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789202919; cv=pass; b=fyYGXKCH6JMv3JJLAJ5wSXTD8rd9gTyB1RhF/PC/PhsEEZaU4GRmXvSY10EsI4IyFSBJ3JftQxQGpL08iGB+TIFf4TaeiT0qjnBSShcY34J3kohMa0C55I18e5SvhUEM4Mp0bQ31uAqtAX22sjjSp5VN/SVb6y05j1clAKHHAcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789202919; c=relaxed/simple;
	bh=PEtxQYkjYgQRxaF03D30N0xMCnigd147rHHH7QHltEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kh1AeQq6rEjEefxADKDaFGk7ZFLN6sfqFY/PuGvGLxI6ddNr/unzz7gAEEFYP1TIbug6lXFHq3nQv+Y56Fddm2I9JTSR08Mot1F/Vh3mGc7YT/OAw79afIS75oFPzOzkLg/Nb/ls6ZSzw67VihZS30BJmuYgCYehmLNQCqGkq9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhX9cfsT; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhX9cfsT"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so2535791a12.2
        for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 01:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789202916; cv=none;
        d=google.com; s=arc-20260327;
        b=HdRVbqpsT3zu0wQp+v88xOEEPQuj5WkEdmh5P9kgSpPSm1Pvk9QbyuwnGvKmcUgo+2
         JrzTyWquijWS+zRK07aC7WRQ17b7d06Y3RY4aB53yNPW0+9Agm+yyDleF4nb9v3wR65M
         9dyMg+oWnNtWRR0qLE2wY/oeFXYsKuZ/24aqEEEpUtSBm94zL7xr/R1UESy6nqWBIiE4
         JByxKtBmuEwtHvz4sNsBgMSCHT6EVKgBv7K6xwtxNYTJWDEGp+bvhETe5mbHd+7uGEtI
         pXE+4wKiah1Fs7wi/8msy/b0+x6sa6ki4Y1eOp0nfReVcc/xyT76UsQ8blWQBw2Zy4k1
         XSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I4VBvSxEGrUfJJhcCbVvt54AZ/dw8YbEqxSSPOGIQHY=;
        fh=VJJU6sIvQahOScl4xKJRK1vb4o6Lf6jgjiaAuO/N6FY=;
        b=Gh/cXY3HNWfWiJcVLno7ySn9a6dhMvrdOk6DatIgj1ZbR4y2jP2fIGRbyV3LGVG5KH
         3Bm3oBuyLV43d+pAPu0O1bwHmEamq8YqaraPzdMiKHQ0RlbWVY3wC1KUJClbAbOu5sc1
         y7Ax2GHPjWfmS+2ZvSRojpehXKmAVLDfsbNi5XJl4U6aBBeMeQ2CLYG1C2yEapP2DzcP
         cQGfYXrLcaHU0jVAmFgeUNAR1MQSW9XbrF1t8aRaqQ6PSp0OzkZZl3QtOMmA4ZBisUTU
         Xyij0y2X0KgLoHWb3oiA5dJQ9GsYyiocCGRAN3EV/PMsOt92CCV0rLcD65ZEzBKuHsdu
         BHMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789202916; x=1789807716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I4VBvSxEGrUfJJhcCbVvt54AZ/dw8YbEqxSSPOGIQHY=;
        b=EhX9cfsTA8wuzqlx4v0gI7INYdvOI07HVCKskWVxtYxlHU3ehzVsoxO1P1oohG3jYi
         nhYfe2s/cBhfDjlnSZV2gp56s9x3/hoj3XQ5wY2lk5ixBD8B1YDl0Q9UCRnb3Cw6VLes
         x7lY9ZCYQ/LZ1OHTtHj0WXhsqx+ip4fZRzU68j8MwYJ/R3nxiRx94JN6H0e1HaNpaCMc
         0cAb0UxJRiGOPdvbiUZ3iecH08hEB1wnwjZYuFn7r5uCpHfOkBa8dl/NyUpw8BvCob9+
         GBE95j0TpbLAMoXNeeuZi8bkIL45PNSe66OlTXqDAbwvMMVYzQARcSvHuB4ARFwcVeen
         /YgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789202916; x=1789807716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4VBvSxEGrUfJJhcCbVvt54AZ/dw8YbEqxSSPOGIQHY=;
        b=NJ6aIUgqCK+hB2vNHKk7RenFxpkUGQJkhRfTo/cBMKPot9o9kIKq+pFjGdtcedrKSn
         4f/DqDgYh8DpfV4NawOw71BUU2yPaDDrR427+v9kC7H5nERz+C9yEspDQ441n7iCGHHm
         PB7gGL+aENxcsz2g7bi7Y+P9NBFpQii+ttbxvlO739nTu5sAPeRYtcbITTJghWsgwAAK
         /38MaWkHFcHpJBTI6PLFzchcZ+mqNuHBUGwmyFNls8Az9tNOQnu3AmYnIs/C28oQ5Tgh
         Ffi+6m2iDs+earWv9poTuZuVRu8vbGG1Jn3KUsYGXIpniMqmCeQdPKg6lwL1XvSuFC6x
         JfmA==
X-Forwarded-Encrypted: i=1; AKwUvBwH6wgSQRgkzNiuNhAZdy8v4gMJcOJS8CPKiVnuLuUoC4VxTcmr4KbrxkeQ4EJKI65mD2NRIBENsvA=@vger.kernel.org
X-Gm-Message-State: AFuF++kQlxpG3oQxHoOtziTmY31dg4StHxJdv5LgXhf6q6vg3XLFcB8T
	MAs4OD8/FGOCY/jp+Rw2VGAvo0Lr1nvjN7gaacaNiuWUJ7tOVmGvsKi8FL+aeI5GDEDblzWAosz
	pwVCFgRFUG4aElaIIsm9l0ef444X9gAs=
X-Gm-Gg: AYBFou39v9lRfb2CunMVaYQUtwWvrOs4wQVx55YG6ptm0dTBhil41K+fWlxnjcTugne
	HxNQqB05312RJ9bAwJ6MLRTwqkBAEwmwXjLRVv5/FzVvfYR2JlsPBX+yJyEMxRCJSMswqoCmZi7
	Tj282ByceJuXxgwJAZjdIer4etdtNtVM/aEnToXTv1yBj7Dz787YlpjPTa+O0bsK6DOrcKsMkUc
	Lg4R7c5a0JG0fU+1TBfhF5ri0A+oY9BXBBgLhxYjx76dacrsxPyro43ZGM1LCXYgBk5KToaVbhS
	RiEmQu/2gE1XLKb5EXjtX5otLemjAPFd2lzfO8Yeijrxi7KC7ybjAJAKhaIObb7EGzVbHtgK2Lf
	ltHaUdUB07dw/Rg==
X-Received: by 2002:a05:6402:354a:b0:6a9:93c0:113e with SMTP id
 4fb4d7f45d1cf-6a9b5603d6cmr3580548a12.9.1789202916079; Sat, 12 Sep 2026
 01:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>
 <CAKEwX=O8i+OsP6BJXNZNk07hveN9HDT+PoyMTAU6gOc-xp0Ppg@mail.gmail.com>
 <CAMgjq7BQeQQOZMDPFJ+8LS2N4t3x53r6Nm+9o0_pi92oVUgjgQ@mail.gmail.com>
 <CAKEwX=MS-7C96i4tzBijHN=-xuZgny_wQEa_0YjfHzhoNysdYQ@mail.gmail.com>
 <CAMgjq7B7Mc7vpQN0gBknsSrfZWXdif5L7nU29YskG9mzS-_jsA@mail.gmail.com> <CAKEwX=PxZ68_4240DC8HjcqPRE0bQWGmouoqapqqTQ2b0xqpvg@mail.gmail.com>
In-Reply-To: <CAKEwX=PxZ68_4240DC8HjcqPRE0bQWGmouoqapqqTQ2b0xqpvg@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 12 Sep 2026 16:47:59 +0800
X-Gm-Features: AcwNN1Vvr5dRguutvcgehjz-XZkuALg4SjwQULHioJZ7yEPwdeM7nc8UPMPMn9E
Message-ID: <CAMgjq7D40KGRjwpFMH4x4fhJ18OQyZwPtovhc8Hm3Y7+__d4Lw@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Nhat Pham <nphamcs@gmail.com>
Cc: YoungJun Park <youngjun.park@lge.com>, Chris Li <chrisl@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
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

On Sat, Sep 12, 2026 at 3:04=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Fri, Sep 11, 2026 at 11:14=E2=80=AFAM Kairui Song <ryncsn@gmail.com> w=
rote:
> >
> > > Would something like this fix it for you? ZRAM users will not get
> > > vswap indirection overhead at all, because it would bypass vswap :)
> > > Down the line we can revisit this decision - for e.g, if there is a
> > > use case for vswap-on-top-of-swapfile. There might be other interface
> > > that makes more sense.
> >
> > Hmm, this interface looks confusing though. you mean tangles vswap
> > with zswap through the cgroup's zswap limit? I originally expected
> > this to be a problem solved by tiering, skipping certain tiers seems
> > much more intuitive. Maybe Youngjun have some idea here?
>
> It wouldn't be confusing if this is something users don't have to
> think about at all :) My point is that we don't have a use case where
> we need userspace input on vswap-enablement on a per-cgroup basis yet,

Ha, you really can't assume that for everyone :), we even have
workloads working at different compression levels, and the tiering
series shows different cgroups working on different devices, there has
been pathes enabling per-cgroup swap device a decade ago.

> > > Potentially, but we have many users at Meta. There's a huge diversity
> > > of machine types, workingset size, access patterns (both frequency an=
d
> > > file:anon split), compressibility, etc.
> >
> > You can just set the number as 8PB? :)
>
> Sure, but with the vmalloc-array approach, there is more metadata
> overhead even if we have not allocated the backing page of the
> clusters yet. This will be annoying on the smaller size machines
> (O(dozen of GB)) to also pay the overhead of 8PB-swap space metadata
> reservation.

Not al all? With VM_SPARSE, you literally have zero overhead, unless
you really use these slots.

And even if you really use these slots, the overhead in both CPU and
memory is lower than Xarray, if I did the math right. I just ran a
quick test with Baoquan's Xswap, forcing it to start with 8PB on boot;
it was smooth as batter on a 1GB box and still worked fine after heavy
anon memory pressure.

See below (8PB xswap device with almost no metadata overhead, the only
overhead comes from zswap so I reduced the tree number but that can be
easily merged into clusters as we discussed before):

### Before XSWAP
# free -m
               total        used        free      shared  buff/cache   avai=
lable
Mem:            1464         405         756           1         544       =
 1058
Swap:              0           0           0

### Create a XSWAP device, I hardcoded the max size in code to 8PB,
### and use fewer ZSWAP trees:
# echo 0 > /sys/kernel/mm/xswap/create
[  140.289280] xswap: adding extendable swap type 0 (prio -1, init 733
clusters =3D 375295 pages, max 2199023255552 pages)
# free -m
               total        used        free      shared  buff/cache   avai=
lable
Mem:            1464         407         755           1         545       =
 1057
Swap:           1465           0        1465

### Lift the ceiling to 8PB:
# echo 4294967296 > /sys/kernel/debug/xswap/type0_cluster_limit
# free -m
               total        used        free      shared  buff/cache   avai=
lable
Mem:            1464         403         756           1         547       =
 1060
Swap:     8589934591           0  8589934591

### Run memhog:
# time memhog 12G
...
________________________________________________________
Executed in    4.36 secs    fish           external
   usr time    0.46 secs    0.00 millis    0.46 secs
   sys time    3.77 secs    3.80 millis    3.76 secs

### After memhog:
# free -m
               total        used        free      shared  buff/cache   avai=
lable
Mem:            1464         336        1136           0         222       =
 1127
Swap:     8589934591          31  8589934560

The only different from vswap now is that you just hides everything :)
(writeback is not hard to add)

> https://lore.kernel.org/all/CAKEwX=3DNYoMH8pTKeCvA=3DXHFmmNVMeDz3mxbhp5q6=
-PxSTJ5wOg@mail.gmail.com/

Right I saw that, but 64 bit of private id will make shadows really
awkward, not for SWAP but for file folios and file mappings, swap
table is actully fine since memcg_table is standaone, and we can
workaround the hieratical refault distance issue in other ways (e.g.
record the reclaim level instead of memcgid direct). I think 24 bit is
good for now? As I've never see anyone ran into issues
with even 16 bits in production.
