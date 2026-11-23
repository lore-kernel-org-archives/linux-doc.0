Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795398207;
	b=LzL7LoWClfjQjGXzP1ku0pvGTAZiLZXTyoLB4d2cg/4apgFb2C6wC8caFA6WaUtBzxdT
	 +8u2NMa3BEBbPvs8KdlJ/5vYcnn1PuTPygt5+uxRmhLAJpEKw2tYkO7dMyeYIUUFGRSh4
	 d2FmX9LXx7JOQXH6/U2Qoz0QGNkvfI2QAFNiaM+pF7Uy/M5OBfVmRPvpf68hBR2ulVr0P
	 dGbOelx1rZxuf4PZpjsHJCOGnqdwH0pF/MkcU0Rp78Tp9v5CAYZzIqQtzX99PjgLaWKZT
	 YdaJmuTpOgvlf9Pk9FytBGXThDhXTMJCvChMQb+q0Il/TYQa9fvxk06HBttDWbuUdvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BrVQwSIPnVhHdrsgKZy8tODX9WT1tDuIYLyA3zVqg3w=;
	b=Fr5oEc8M25jhvmmx+LggQG6Lxc/m0rIVUN3n3PQdrDNIHgu8BH41xeEAXeSEgCu3nCKe
	 QNWyzjcRDCAMq7u2Ab6KDJ3ZotaTsy3woS96OEK639ct+8dPcgDZmduT6HtMQ6xnICPhd
	 xfbVEUrIV7yjJprGzrPHcMS4SodMb+d0vZdtvqDQ4wLwkWJTfe6XbNL+KAqILU8q/+R6x
	 0QQ23OZiNEgVe5BPAMUv/vjmEW89Zkb6Y9Q04pMgyRU3HbIZIuu4cgjXUsfSEJ7htZbr1
	 OJ+6At7TXLfKLQ+66yKRkClj0IYiwWCNz7CFJs0t/Uis7ehxtO7OFDQEXSTNgraxlwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IGoAg5tG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8102E606A31E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 01:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8102E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IGoAg5tG
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so23214405e9.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 17:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795398205; cv=none;
        d=google.com; s=arc-20260327;
        b=jOl/x3xsiTwgR9LucmhNpEwQbYuF2+ST30HStBybRsCVRSDnNeaqPbZDpDUXG7oD7r
         Xl2t3iA0kUxyOGr2+Xmv6v2AisaNMik7RV8+c6ZAZ4jWsGz2kzqS3dLH77iLptlYCwt+
         agNUOoR5DXvhUqr8BN9R2sKfhjuyIMPlosntfzj1MDc5JGZJLGoBvSjdBKlw96YB7zi7
         bGYMkpoQSWpGqPyP9LsAuOPcX1bh1QQs/uknzr/2dyhZoYiDfrHwTnZ2UxBlqXNxevWT
         DvaDcun92mYXl/YmW63wbJpljWNqnHTNt4+Esn3zJKUB3b4PiHSECb1tF8d9fgf03rsg
         ziYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BrVQwSIPnVhHdrsgKZy8tODX9WT1tDuIYLyA3zVqg3w=;
        fh=YpoIQcGZzK/BGmb2kPAPZtSBB8aZWAG+yCPSOr+hGMg=;
        b=IL//v5HEUxyLojVQCV61Pk8cZQT2mJRDfkijyEq6BouhbyRGlbWYt+6SF/X8kcEf2x
         OubM0R9J2keM7P9bh1x+EUIFFpoyBxXZSI84Rt8f3eno1jL0tzqh/U4/QuCuxdBrMnHH
         2llI+xUm01dnJLzyMI1fTT/Pwsg1c2fO8ReLGMzYLD1As416Y1esLrtHY3qNdK3gLRXe
         h5ApoelkUyFksMh2pmzdeRAcTwnnfs+G3TM0kyIJ7QTB7Ko8bG0ag80kHVJmcJZq06UO
         kD58b5P48Tmp63mV5IhEfuMVmqxf1JiYpnoReDThotcbSG2fXZn+8o97gJM/6gYT3P8O
         bKVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795398205; x=1796003005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BrVQwSIPnVhHdrsgKZy8tODX9WT1tDuIYLyA3zVqg3w=;
        b=IGoAg5tGSlsFW3Yk2c+abGP3gmEAFuEi8j/bd7Ecqf96yRpcx4UHUPxBRRvyBu3FqM
         lE1v41tlfMMxOsYpkgVzeK3Ci1JDi3viDdZBdXJpDyNLN3Z1O70suye1/hL0rVaf4UUG
         jG1k3ywZ/hdlsFYQggU3iDIV92foavnmliY/dZaa0cQhSXZsYWVaYms0xoU9ibkxqjkz
         dIMQ4o1TJv1EWlXKW++a7gpd4P4BhTUtPUC+KkIvZJ4eOmbfkKL2rF+LFBcMWxRmrKNC
         zVwoC8H0SJ1TUzlLYGbw6IIseyYRLTE7w291p6gxXkSLEMjqQNxqcJhpS8t2jWjyFKQM
         NV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795398205; x=1796003005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BrVQwSIPnVhHdrsgKZy8tODX9WT1tDuIYLyA3zVqg3w=;
        b=qq+2XfiSxACM8s5fxK+YjAdzqLeuz3Iex9Bda5xoKqFtz1hGg71+be4an+juTEtyU4
         w4l1MLh4CmT1PMT7puExeqSpNNszGzOmcj/masVyCwUOvE5ErQZP6Gl4wN3TSXcMalt0
         ENVApNouFEiSNPiE9U4WrtXKr03dDPZeghcv133kYxzU7EG9cgs3wjJJmUXmwcAjm2WR
         NMK1atzsYjtTpiO1Hr01LZGTpR8GD7z8pJfWD+Wau+R17IXAF3w6J4G0KvD98+4npr/O
         JCSLHy9nVa7etXiPcA7A18ov3AeYJ9OdCxESmfdqbJ7IS0AE+Mdp7aYKqXVUemb3/Dfw
         jifQ==
X-Forwarded-Encrypted: i=1; AL+hErFUnXbs12kkXZygeEQv/xwGiBVYhy6FbssyD50UO/lT0NPmlZuS3rILGNKGgeHOkCf3ZY85GT4Fi7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+lri+XWZzHAZupYd+SbFqP/t9LR6fnhkOfuwL+p3CZZ99mjHK
	NRPBRMo7JZnZrBLs6pC/1hvr9jgXSrrS+nrBrUmkviehP5jU/Xo1gvf79Y4cWcyAudnTGgr8Iv8
	iqdYOoIO4EHeEqII8Zdhs2un8eKNwFgs=
X-Gm-Gg: AZFdTZdw3ffh8lGrqORSvSExIbiua18SXeGFOExOGiZcRLtDV2/3QNm//Fuu7VFJRs3
	CmyjW0eycuC44yXmSylqWqJ32Q/P4tFbDmohdrxNqTtIO9Jr4PVDYbO/qX4lDTYFucCMOj6RWpA
	CQXmxGKzZ9038o1JC8orFke3wWUudys7U3KVzZsgoBWEfeGhuTmG7InEeJc9pameG9oZtcxPo6Y
	hlcBEIEw4d588718MRSGyM0PRlKU5f8K049TQc7oAK1+Ty1H6Gca1cn0uNelerqV/+gFiOXv9/4
	dhRDmZfeBNF2UN2OO67GPDsoUp57HDI3NS0rBZnxNqCH8ucivGPZk4uf6uyJ5M4kjiivcFmXJjz
	B5jzaDGKSiPAvbRv0p0SCCxMj6MzTexRbPPpRGYGbLJPCRIQNP4oz+EsQzTZtiCEndFMBPVc/ia
	I75UfcibMR2sDlTHJLPoTabl+WjuNzljj2VXNBB16F5A6ugbzsI+8H/MKp+KnL6CgoK1TO9KBPP
	g==
X-Received: by 2002:a05:600c:8b11:b0:4bb:6871:8f21 with SMTP id
 5b1f17b1804b1-4bb88822346mr213653915e9.23.1795398204221; Sun, 22 Nov 2026
 17:43:24 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
 <20261119-mglru-fg-v5-16-9eee2fe97a2d@tencent.com> <CAN_Opa-+nb0vxQ+HsENCG2fEEMZoxG9Sy_DBC4CLkWjNLzDWKw@mail.gmail.com>
 <CAMgjq7CEdWvv8m9GtWMG=8OFy+1Sehx3HBJt2D=9hntwvfbf6w@mail.gmail.com>
In-Reply-To: <CAMgjq7CEdWvv8m9GtWMG=8OFy+1Sehx3HBJt2D=9hntwvfbf6w@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 23 Nov 2026 09:43:12 +0800
X-Gm-Features: Aa3M54oNBYyw9pCyIXqZNWTI0hkUvgld-jGgCS21qlijWr31Z0q9q7Y9XszeYmQ
Message-ID: <CAN_Opa8L3Ygfu5o7Y8ZD9GTmiEygCXpq2TzAJtwgQChdyb2dSQ@mail.gmail.com>
Subject: Re: [PATCH v5 16/17] mm/mglru: make folio_inc_lru_refs lruvec lockless
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 11:33=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> On Fri, Nov 20, 2026 at 5:42=E2=80=AFPM KunWu Chan <kunwu.chan@gmail.com>=
 wrote:
> >
> > On Thu, Nov 19, 2026 at 5:04=E2=80=AFAM Kairui Song via B4 Relay
> > <devnull+kasong.tencent.com@kernel.org> wrote:
> > >
> > > From: Kairui Song <kasong@tencent.com>
> > >
> > > The lruvec spinlock in folio_inc_lru_refs was only taken to keep
> > > concurrent aging from corrupting the size counters.  This is no
> > > longer needed: the per-generation counters are atomic, and the
> > > active/inactive ABI counters are updated per folio and linearized by
> > > the CAS on the folio flags, so concurrent aging can no longer corrupt
> > > them.  The same argument is what lets folio_reset_lru_refs() update
> > > the counters without the lruvec lock.
> > >
> > > Use folio_lruvec_live_get()/folio_lruvec_live_put() to hold the RCU
> > > read lock around the lruvec lookup, and drop the spinlock entirely.
> > >
> > > Without the lock, aging can advance max_seq while a promotion is in
> > > flight.  Generations are indexed by seq % MAX_NR_GENS, so the folio
> > > flags can return to the value read earlier and the cmpxchg succeeds
> > > with a target gen computed from a stale max_seq.  Recheck max_seq aft=
er
> > > a gen-changing cmpxchg: if it moved, account the committed update and
> > > retry with LRU_REF_FORCE, which promotes the folio to the newest gen.
> > > The retry may count the access twice, which is acceptable and avoids
> > > folio_activate(), whose LRU lock causes latency jitter.  smp_rmb()
> > > orders the flags read, including the one returned by a failed
> > > cmpxchg(), before the max_seq read.
> > >
> > > Also simplify the post-CAS accounting guards: gen is only assigned
> > > non-negative values after the old_gen < 0 early exit, so gen !=3D old=
_gen
> > > implies gen >=3D 0, and lru_gen_update_size() needs no explicit guard=
.
> > > The active/inactive ABI update keeps its gen >=3D 0 check because an
> > > off-LRU folio has no lruvec to update.
> > >
> > > Signed-off-by: Kairui Song <kasong@tencent.com>
> > > ---
> > >  include/linux/mm_inline.h | 10 +++++-----
> > >  include/linux/mmzone.h    |  3 ++-
> > >  mm/vmscan.c               | 51 +++++++++++++++++++++++++++++--------=
----------
> > >  3 files changed, 39 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> > > index 77f514143266..2c6cbd0df686 100644
> > > --- a/include/linux/mm_inline.h
> > > +++ b/include/linux/mm_inline.h
> > > @@ -317,10 +317,9 @@ static inline bool lru_gen_is_old(struct lruvec =
*lruvec, int type, int gen)
> > >                gen =3D=3D lru_gen_from_seq(min_seq + 1);
> > >  }
> > >
> > > -static inline void lru_gen_update_size(struct lruvec *lruvec, struct=
 folio *folio,
> > > -                                      int old_gen, int new_gen)
> > > +static inline void lru_gen_update_size(struct lruvec *lruvec, int ty=
pe,
> > > +                                      struct folio *folio, int old_g=
en, int new_gen)
> > >  {
> > > -       int type =3D folio_is_file_lru(folio);
> > >         int zone =3D folio_zonenum(folio);
> > >         int delta =3D folio_nr_pages(folio);
> > >         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> > > @@ -399,7 +398,7 @@ static inline bool __lru_gen_add_folio(struct lru=
vec *lruvec, struct folio *foli
> > >         /* use the refs from the atomic snapshot to avoid raced updat=
e */
> > >         refs =3D lru_get_refs_flags(flags);
> > >
> > > -       lru_gen_update_size(lruvec, folio, -1, gen);
> > > +       lru_gen_update_size(lruvec, type, folio, -1, gen);
> > >         if (lru_refs_is_active(refs))
> > >                 lru +=3D LRU_ACTIVE;
> > >         __update_lru_size(lruvec, lru, zone, delta);
> > > @@ -429,6 +428,7 @@ static inline bool lru_gen_del_folio(struct lruve=
c *lruvec, struct folio *folio,
> > >         unsigned long flags;
> > >         unsigned int refs;
> > >         int gen;
> > > +       int type =3D folio_is_file_lru(folio);
> > >         int zone =3D folio_zonenum(folio);
> > >         int delta =3D folio_nr_pages(folio);
> > >         enum lru_list lru =3D folio_is_file_lru(folio) * LRU_INACTIVE=
_FILE;
> > > @@ -452,7 +452,7 @@ static inline bool lru_gen_del_folio(struct lruve=
c *lruvec, struct folio *folio,
> > >         if (!reclaiming && ((max_seq - gen) % MAX_NR_GENS) < MIN_NR_G=
ENS)
> > >                 folio_set_active(folio);
> > >
> > > -       lru_gen_update_size(lruvec, folio, gen, -1);
> > > +       lru_gen_update_size(lruvec, type, folio, gen, -1);
> > >         if (lru_refs_is_active(refs))
> > >                 lru +=3D LRU_ACTIVE;
> > >         __update_lru_size(lruvec, lru, zone, -delta);
> > > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > > index 2680e15b6de9..235fb04f8d78 100644
> > > --- a/include/linux/mmzone.h
> > > +++ b/include/linux/mmzone.h
> > > @@ -540,9 +540,10 @@ enum lruvec_flags {
> > >  #define LRU_TIER_MIN           0U
> > >  #define LRU_TIER_MAX           (MAX_NR_TIERS - 1)
> > >
> > > -/* Access source flags for folio_inc_lru_refs() */
> > > +/* Flags for folio_inc_lru_refs() */
> > >  #define LRU_REF_MAPPED         0x1U
> > >  #define LRU_REF_EXEC           0x2U
> > > +#define LRU_REF_FORCE          0x4U
> > >
> > >  #define LRU_REFS_REFERENCED    0x1
> > >  #define LRU_REFS_WORKINGSET    0x2
> > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > index 78a1b4de7076..4576a7a369e3 100644
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -876,37 +876,35 @@ void folio_inc_lru_refs(struct folio *folio, un=
signed int flags)
> > >         long nr_pages =3D folio_nr_pages(folio);
> > >         struct lru_gen_folio *lrugen;
> > >         struct lruvec *lruvec =3D NULL;
> > > +       bool aged =3D false;
> > >
> > > +retry:
> > >         old_flags =3D READ_ONCE(*folio_flags(folio, 0));
> > >         do {
> > >                 new_flags =3D old_flags;
> > >                 old_gen =3D lru_get_gen_flags(old_flags);
> > >                 old_refs =3D lru_get_refs_flags(old_flags);
> > > -               file =3D folio_flags_is_file_lru(&old_flags);
> > >                 refs =3D old_refs + 1;
> > >                 gen =3D old_gen;
> > > +               file =3D folio_flags_is_file_lru(&old_flags);
> > >                 if (old_gen < 0)
> > >                         goto out;
> > > -               /*
> > > -                * Lock the lruvec if the folio is on-list. We are al=
ready
> > > -                * doing lazy promotion so in theory we don't need th=
is,
> > > -                * but for now, concurrent aging would still corrupt =
the
> > > -                * size counters.  This is a temporary limitation and
> > > -                * will be lifted very soon, so the lock here is not =
a
> > > -                * performance concern.
> > > -                */
> > >                 if (!lruvec) {
> > > -                       lruvec =3D lruvec_live_lock_irq(folio_lruvec(=
folio));
> > > +                       lruvec =3D folio_lruvec_live_get(folio);
> > >                         lrugen =3D &lruvec->lrugen;
> > >                 }
> > > +               /*
> > > +                * Read the flags before max_seq, paired with the sto=
re of a
> > > +                * gen, which samples max_seq first.
> > > +                */
> > > +               smp_rmb();
> > >                 max_seq =3D READ_ONCE(lrugen->max_seq);
> > >                 max_gen =3D lru_gen_from_seq(max_seq);
> > >                 if (old_gen =3D=3D max_gen)
> > >                         goto out;
> > > -
> > > -               if (flags & (LRU_REF_MAPPED | LRU_REF_EXEC)) {
> > > -                       /* Promote second page table access or execut=
able */
> > > -                       if (refs > LRU_REFS_REFERENCED || flags & LRU=
_REF_EXEC)
> > > +               if (flags & (LRU_REF_MAPPED | LRU_REF_EXEC | LRU_REF_=
FORCE)) {
> > > +                       if (lru_refs_is_workingset(refs) ||
> > > +                           flags & (LRU_REF_EXEC | LRU_REF_FORCE))
> > >                                 gen =3D max_gen;
> > >                         /* First access only defers eviction of an ol=
d generation */
> > >                         else if (lru_gen_is_old(lruvec, file, old_gen=
))
> > > @@ -931,9 +929,19 @@ void folio_inc_lru_refs(struct folio *folio, uns=
igned int flags)
> > >                         break;
> > >         } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_=
flags));
> > >
> > > -       if (gen !=3D old_gen)
> > > -               lru_gen_update_size(lruvec, folio, old_gen, gen);
> > > -       if (lru_refs_is_active(old_refs) !=3D lru_refs_is_active(refs=
) && old_gen >=3D 0) {
> > > +       if (gen !=3D old_gen) {
> > > +               /*
> > > +                * Gen-index reuse can fool cmpxchg(). Retry lockless=
ly, accepting
> > > +                * an extra reference to avoid folio_activate() laten=
cy.
> > > +                */
> > > +               if (unlikely(READ_ONCE(lrugen->max_seq) !=3D max_seq)=
) {
> > > +                       flags =3D LRU_REF_FORCE;
> > > +                       aged =3D true;
> > > +               }
> > > +               lru_gen_update_size(lruvec, file, folio, old_gen, gen=
);
> > > +       }
> > > +
> > > +       if (lru_refs_is_active(old_refs) !=3D lru_refs_is_active(refs=
) && gen >=3D 0) {
> > >                 enum lru_list lru =3D file * LRU_INACTIVE_FILE;
> > >
> > >                 __update_lru_size(lruvec, lru + lru_refs_is_active(ol=
d_refs),
> > > @@ -941,8 +949,12 @@ void folio_inc_lru_refs(struct folio *folio, uns=
igned int flags)
> > >                 __update_lru_size(lruvec, lru + lru_refs_is_active(re=
fs),
> > >                                   folio_zonenum(folio), nr_pages);
> >
> > Could this leave the parent's local active count too high?
> > Isolation can debit the child's active count after the refs
> > 2 -> 3 CAS. If CSS_DYING is set before the stats update, the credit
> > can go to the parent. On SMP, reparenting can clamp the child's
> > negative local count to zero.
>
> Thanks again for the careful review.
>
> But hmm, I'm not sure what you mean by "too high". Maybe there is a
> temporary skew of counter due to various races, but we are fine with
> that, it will be consistent soon.
>
> The key here is update is gated on gen >=3D 0, and the gen is part of
> the CAS: only a folio that is actually on an MGLRU list has its
> refs-based active/inactive credit already accounted will be recredit
> the counter update here. An isolated folio has no lruvec to attribute
> it to, so nothing will be changed.
>
> And for reparenting, we are also following the ordering in the
> document: the updater holds rcu_read_lock() over the lruvec lookup and
> the counter update, and reparenting waits for a grace period, so
> either the memcg is already dying and we credit the parent, or the
> update lands on the child and is part of what reparenting moves
> afterwards.
>
> So the credit and the reparent move always cover the same folios and
> land on the same side: there is no path where the parent is credited
> for a folio it does not end up owning, and no debit that lands where
> the credit did not. I don't see anything to fix here.

Thanks for explaining, Kairui. I had isolation after the CAS in
mind, before the stats path rechecks CSS_DYING. I'm happy to leave
that for a follow-up.

Here's my tag for 16/17, also sent in the 15/17 thread.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
