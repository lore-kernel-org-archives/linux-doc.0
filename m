Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793221025;
	b=ewNTsEUDeN8t68xaNJxOJpuxDwE0loJPMD6dWDCiO4xWyM2snDNMgLB17M0yh/J8piPA
	 n+dI52Ak3fvvqHvyiPA6mAKrZzEQNvgEc9DSwHHuhVnV4Ipr9AxiFBKU054efEHchCQC/
	 0GQdeT3qEaM4X4GERYsjoiCDcH+x5yPiJi5iF0TF/EpVGXcenrvAtxBf3ZBF+ntag65dH
	 BHX4ZuwvLnGFZZqp6IcHEZdjxObWI4ut+ZskpyFPBk0Trs+yCuj7iPPs7n3gBoTjeoxL3
	 HeTiym3aV70EjezItpwzxUOYyvrzLxq4w66+1XcXH00PmBBEM4gbkR8G8no5Fg7XDaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793221025;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1l/q9mD+UZ0LKwfpiCWXfsaYI4tdxarEWoloUn1RTbM=;
	b=4EaTPvIwobXds4vDRjWqH12i/9S/C+jeXoHxqZmavuoOqi/IiwCbPBWn6Rxsn9JJjLKA
	 Bwv1twYOf9nsvaQwcOzxYvl49vS5A5RS6ZL8iwl6wVJNwBnmP1btqHV9DnrZrG8PTABNS
	 RLGiay8u3vfQTx40tMAxI1ZkIZr8r7u2m+X0qo2sVOTeGY77T2BGjjidWbJmXW+lrtyBw
	 Erhi0SyI06RLJy6LtiqPyOf5Fu+idgSBKWtyc1YTPUGo7Ev7Rs4Mvi6XphrC2n8dRri/D
	 yvLSsuFWL1uF8KjPR3FfvWawe7f3Bbau4+DLBfld0c5OKPj54ywn6DnPHsSE8DcIyXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bAo252W2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4139606A31C
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 20:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bAo252W2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CEB1F031E2
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 20:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793221024;
	bh=1l/q9mD+UZ0LKwfpiCWXfsaYI4tdxarEWoloUn1RTbM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bAo252W2QRAa0s7Lc6LTKanJY7VuCqKvL/jR9XT+digCiXnXgxe5eLnXt+/xNB/eX
	 gjy38nCEHhsg0t3L/oArc3iiBY78AdM5qcvIXWUK9XwJKMkOwy9AZ58OqTvMiblN1u
	 /YaXNQXWG6Ia2Xygw/XoeAGnHi/dzUyCye/CZ0KeMxeTNgLe6+CJ/lR/nqU9sic8nV
	 ljX5F6nDUyALjT/gHm5plnrchivHSxJUTzl6CWXCwzriV5JPqimffxqS+w8jxRi/N0
	 l9GsCUeVInL0lP72tfzIldZKaJEnBirPtG4i5mZo9i3jsfLlBv5xMRmto4dd7leZVz
	 ETwHT8m8sWE9g==
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c7b00a75fso16262286d6.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 13:57:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByGI2TG9Pm94VoiSM26h/fiTLOehrJz6e9EtwQurdwgsmAkf5+Uq8qyAh1XI+SkUZA5W1Bpz5bm2gg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5QmlODoHcboOzVvAEZKdhLvyFzmvbFR/4m39McxZE6feVz11L
	PLfXshtCn+2Afm7Of021wladr94YKgOM1m4ObS06PCcUgrIIrC3eppXS2P+FLQi0fFNNm/DAIjn
	cF2bNFZl7dA5VRQcczxmEtjPmA3YHnwc=
X-Received: by 2002:a05:620a:2849:b0:93e:5821:2c5c with SMTP id
 af79cd13be357-94408cf1bf6mr528393385a.60.1793221023470; Wed, 28 Oct 2026
 13:57:03 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028010611.3929937-1-tjmercier@google.com>
 <20261028010611.3929937-3-tjmercier@google.com> <auHMXBwnwuRwHLmo@KASONG-MC4>
In-Reply-To: <auHMXBwnwuRwHLmo@KASONG-MC4>
From: Barry Song <baohua@kernel.org>
Date: Thu, 29 Oct 2026 04:56:52 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zuGRjH+=1JxH4BYEC-vJumKjkhXPse0jW_nKEzQXXVmg@mail.gmail.com>
X-Gm-Features: AclHuK_r9gV6TTj6VxggfDw1Rx1dq7FXiQbSIh4_WBWn2_zzCiGKkwAo5h87zro
Message-ID: <CAGsJ_4zuGRjH+=1JxH4BYEC-vJumKjkhXPse0jW_nKEzQXXVmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/mglru: stop rotating offlined memcgs to the old generation
To: Kairui Song <ryncsn@gmail.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, roman.gushchin@linux.dev, muchun.song@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 6:43=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Tue, Oct 27, 2026 at 06:06:06PM +0800, T.J. Mercier wrote:
> > lru_gen_offline_memcg() moves an offlining memcg to the head of the old
> > generation of the memcg LRU (MEMCG_LRU_OLD), so that global reclaim
> > visits it first and evicts the folios it left behind.
> >
> > Since commit f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of
> > dying memory cgroup for LRU folios"), those folios are reparented to th=
e
> > parent before lru_gen_offline_memcg() runs, and nothing can be added
> > back to the offlined memcg's lruvec afterwards. Putting an empty
> > offlined memcg at the head of the old generation no longer serves any
> > purpose and only delays reclaim from the memcgs that still have memory
> > due to additional shrink_many() iteration.
> >
> > Remove lru_gen_offline_memcg(), so that an offlined memcg is rotated
> > like any other memcg below the reclaimable size threshold until
> > lru_gen_release_memcg() takes it off the memcg LRU. MEMCG_LRU_OLD has n=
o
> > other user, so remove the op and update the memcg LRU comment as well.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > ---
> >  Documentation/mm/multigen_lru.rst |  4 +---
> >  include/linux/mmzone.h            | 14 +++-----------
> >  mm/memcontrol.c                   |  1 -
> >  mm/vmscan.c                       | 20 +-------------------
> >  4 files changed, 5 insertions(+), 34 deletions(-)
> >
>
> ...
>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 636152d8c94d..45a2c1021f4f 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -4538,7 +4538,6 @@ bool lru_gen_look_around(struct page_vma_mapped_w=
alk *pvmw, unsigned int nr)
> >  enum {
> >       MEMCG_LRU_NOP,
> >       MEMCG_LRU_TAIL,
> > -     MEMCG_LRU_OLD,
> >       MEMCG_LRU_YOUNG,
> >  };
>
> I think there could be other usage of this LRU_OLD macro, but indeed
> offline is the only user currently, removing it is cleaner.

I'm imagining an Android use case where, after LMKD or similar
userspace killers implemented by various OEMs kill an application,
we may want to prioritize reclaiming its memory by making it more
likely to be scanned and reclaimed, while the killed application's
memcg still exists - not offlined.

Similarly, a foreground application might benefit from a lower
chance of being scanned and reclaimed. This suggests that Android
background-to-foreground transitions, or LMKD itself, could
potentially leverage the reordering of memcg LRUs.

But anyway, this is not a reason to keep
MEMCG_LRU_OLD for now.

>
> And everything looks good to me, thanks!
>
> Reviewed-by: Kairui Song <kasong@tencent.com>

+1

Reviewed-by: Barry Song <baohua@kernel.org>
