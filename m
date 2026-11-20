Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167374;
	b=zG8yplDnkwmAdpXJHa8yJ27cFiuwURMFM/qUbmd5IetnNvd1WHNgNGa+f5dFdsPv9IlU
	 tkaLViDIKwip8ZxRXSeAz3/6zIxTdLQOMa8t2pK7ptLaGVfCYGBqGRd9nCce4o6yZxdrc
	 KLZIG5slPb+8O+feyhSqh0U/P0Xhp5HqZPgO9MoM11azHLRegd4apEp8RhmHKr0qrltJM
	 Bw45AoIO4NF5gha7DlG7nrNlgj9V6ccZASf3ZaIXI8TN+wY2oOFmU0TACc4mbAJ3v9vUp
	 EQWS+BGAiB5enlIT24/ZKnN4mqSJs0wE281YrLSJb6nmQrcVA+z7N0ftQmKedbGxAqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wSiOMe0tD0Y2SxFczJlUDeasF0l1x/LWEx9aDUyyir8=;
	b=jl21vhZ1txOTZZ3NFh+tpYuIFxvfoBUA8twG+pRQIPHi2Kt/Aqk871a9AfU0BhMFyRnT
	 ACJPu37bfLRUErHdcU0/fW6KPIhSdlkVjr8lRVIHwodmyPu+oHfXkkCDMW36HdgH1Swcd
	 dwuu3G6uwv26hjmPJdnQEgSxOzYzwhovLJ6TpR3flxjNROJrP3ZRt1d1/2cJiDtWCJVPx
	 c9Dk2/eaCoyTo6c2DmWdQDvVq/EHxr6AUcmc0Q1/aoc4Jn1XLMKfwzkCObIWrMVsWvNhF
	 vv48fXBQRB7j3TkZn7vicE06ZBCbpXah5MjBIGcs5CmGF4wNOiTsZ96nBQagQAYsScQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VM3KnwM6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717F1606A326
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 09:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 717F1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VM3KnwM6
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50cc8e0f84so112955966b.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 01:36:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795167373; cv=none;
        d=google.com; s=arc-20260327;
        b=C4r0FreM4XnhD2kyaDIjUmmYXU/vG7xN9pSd07Vi/NugMAmgMjHnGKpzwesdJREmte
         5tdnVGbL0t+bNMlannIyC9fK9SpZgyT/BlJtb3905VRTTw6RME92OrywYSS0CbOgH1xa
         TIMXT/ai+US3OurmIqHlTdKTdahLR1wcWz277GkwOJlqjJhwoInyOH6MMltEMwRh+QHK
         NYXTo0igGSAv1lrQkPX642AzEuyyKHXn6H2HIUPJi5aZjnWgNO2yGF87xbqAbjbWi7q2
         m5vyZixzV/vr0jMDXEtPjvxQJh1oJ+I1TM3s8sMcjinzMJfjFNxXbo4vVNfHhvs+308v
         PpuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wSiOMe0tD0Y2SxFczJlUDeasF0l1x/LWEx9aDUyyir8=;
        fh=fiDvO2+fjTEun9JxNciEI/2TMd6RNwVnkoK+ZZMND0w=;
        b=SV55eUfWRtiiXLifisq431PCRspsnaKvAp02dTf+y35osT62/UBRVCU9xMoqi1i0oz
         B8a5o9YM5TILq4Ob8acM/BSr/wl9UEeHvaC5zedtrVx9iFDiFnlLLUEaj8b9YEBc6+E5
         fssuCU6V5hR1k+2p9AMYfTqn7B4a7sB4DKo/7XIuGDBse0qzf8WSZJ+V1NaJ70WG2yRk
         08xHzcJWid5A0VBw1NKLzGxBbVEU2YkOmRrkHtKwYTsDGhoCg8AMGiO+VvNhT719bF4r
         +dShUvB3VuQnDy21/JzgFefKY5PHcT9EZ/+p6a8YBt43nvbj+nDmd6/G4Un2HCdir5Sy
         ugbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167373; x=1795772173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wSiOMe0tD0Y2SxFczJlUDeasF0l1x/LWEx9aDUyyir8=;
        b=VM3KnwM6AUN5/1TidF8zbilAlicnuueyvE/LyvJfaeJnvgFr02HNKww70Tz7vQkqnU
         5/YutVl7o0kzxFtaWIvGqh5W1k2zCFmGIQywVNhUs7eLfPrtJL+ppOog6GHQZfR9XM9E
         IFNP+LomdvxpZiH5uYLNiocZvMHn2hze68Dj3eSvEEB7xiSCWMTmNnwOPri3jto7VtjB
         6r20b2CR/FQkYRv266zNBuPEsQb1xepdGE5U1sUPZZZjwtbrcvT2iCgLiswv+QWHKxst
         FDEM4juBe4DJna3J3dCNxtVevCcAJyssXTziVmF4k4Q6ZW7zc/1Drcq6ZP2k3K2PNNBd
         /Pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167373; x=1795772173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSiOMe0tD0Y2SxFczJlUDeasF0l1x/LWEx9aDUyyir8=;
        b=C+kyUpREhgPs0Sb1i9Ipr6acHwyU109T8gH/Pu1ES4+E+uOp9NJuPsp4j2oGiamIqo
         FNs9bRZUvU7GsrEWnyV+URg7jAM+6PZRaup51c9DHurw/sC0P0/h7xuknTaZs45X5XG4
         ljcjJNSGPKk0E2ZnHFrzjbjHZwI1NXx/+nWoxEyAQP0muWzlXhzbHVTAzctyZ5qe1gci
         2klpHFqGMqtDtV46Rmyp5MHEUBCz7nV9jvlvXvRJBD3rzsUgcKKPIh1LU+i3Y9nZz1E7
         gXfl8cNbssBjP11Cc/d4/pq3l7zo4R5vZ6vNsZvbgF4dlvjwoSpeaIzXcDQi/rhpn2Bk
         F6Uw==
X-Forwarded-Encrypted: i=1; AL+hErHeEdXh1xcm7livt8tbUnRJoRgiJzlqp9kEDnYvXRgwjdyQ6TGY+CNa49YgIPYKBMfyYOuc5b8qHV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nVCRbrTN7dN7ThXvwpup/0cXjSlii1ldp9LuWI/yRNltEyZbz
	XgHASPeJ76RTFaFpmsK2mYoTcyvEH+hJeypTqTgAGymcVIKKSj/PUbetKe7SddrWPqbuCrOVXBN
	Y3IE3h8dIyD2OB/AFlB8oGg/UoexPFpk=
X-Gm-Gg: AYBFou3ujgTTlz8lhibBopZKSXzN9i9cVNwoQ4DOsIGsONAO1oeRI5TcUUd+wBCGF2K
	k4XnVP7S9piaGZ/Ce9ePcnGaPQgVsWegtbkPbNQbXHwhtK+Vfp0RNB0A6miJhEuQcEIEthNSvwz
	M1L4DhbXJXwi4b1DJ2P2trcm4GMtaE+pfO7/FO0un6ZFs2eVFwREMGQxOk8nEWU4pHj1RcDsBGv
	7vAxGtcMpaXc30H8xhFzm8d2OXbrSMm5esKOk+PUiVaA7oKyTSrJjIywJckm7Z9XhE6PkE6PIfn
	CU8fHgW6UKosipHcLrKz7phGG6+wt8DR/zU2EFXkeIUreQrVLgR+U2BsiRwSzBPh49w60A0+15h
	zDn+ce5A8xUXK8NA8XGiNc9wV6HyqKy/G2S/3lf2dW/jxR9hgK1DjhB0=
X-Received: by 2002:a17:907:6c17:b0:c51:3cb6:5b11 with SMTP id
 a640c23a62f3a-c513cb65d73mr206830066b.49.1795167372628; Fri, 20 Nov 2026
 01:36:12 -0800 (PST)
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
 <20261119-mglru-fg-v5-6-9eee2fe97a2d@tencent.com> <CAN_Opa_jb1pN=-Z+4WRoXVDSe0YfppeY319iagMdQoMgtOQSSg@mail.gmail.com>
In-Reply-To: <CAN_Opa_jb1pN=-Z+4WRoXVDSe0YfppeY319iagMdQoMgtOQSSg@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 20 Nov 2026 17:35:35 +0800
X-Gm-Features: Aa3M54pbohOCQbswSkwv-YDHDqEuETdr2HZyOy_eh_9wY3LvfDu8zJdBWDbyUx8
Message-ID: <CAMgjq7DbK8sc7-0CTOj5iZBmkLmG7ggj75mdTxVkunGzmi=NWQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/17] mm/mglru: frequency guided workingset promotion (MGLRU-FG)
To: KunWu Chan <kunwu.chan@gmail.com>
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

On Fri, Nov 20, 2026 at 4:09=E2=80=AFPM KunWu Chan <kunwu.chan@gmail.com> w=
rote:
> > +/**
> > + * folio_inc_lru_refs - Update the folio's LRU refs and lazily promote=
 it.
> > + * @folio: The folio being accessed.
> > + * @flags: The type of ref: FD access, or mapped access optionally wit=
h
> > + * executable access.
> > + *
> > + * Used by both cache access (flags =3D=3D 0) and page table access (f=
lags =3D=3D
> > + * LRU_REF_MAPPED, optionally with LRU_REF_EXEC).
> > + * Context: The caller must keep the folio alive by a reference or the=
 page
> > + * table lock of a mapped folio.
> > + */
> > +void folio_inc_lru_refs(struct folio *folio, unsigned int flags)
> > +{
> > +       int max_gen;
> > +       int type, refs, old_gen, gen;
> > +       unsigned long new_flags, old_flags, max_seq;
> > +       struct lru_gen_folio *lrugen;
> > +       struct lruvec *lruvec =3D NULL;
> > +
> > +       type =3D folio_is_file_lru(folio);
> > +       old_flags =3D READ_ONCE(*folio_flags(folio, 0));
> > +       do {
> > +               new_flags =3D old_flags;
> > +               old_gen =3D lru_get_gen_flags(old_flags);
> > +               refs =3D lru_get_refs_flags(old_flags) + 1;
> > +               gen =3D old_gen;
> > +               if (old_gen < 0)
> > +                       goto out;
> > +               /*
> > +                * Lock the lruvec if the folio is on-list. We are alre=
ady
> > +                * doing lazy promotion so in theory we don't need this=
,
> > +                * but for now, concurrent aging would still corrupt th=
e
> > +                * size counters.  This is a temporary limitation and
> > +                * will be lifted very soon, so the lock here is not a
> > +                * performance concern.
> > +                */
> > +               if (!lruvec) {
> > +                       lruvec =3D lruvec_live_lock_irq(folio_lruvec(fo=
lio));
> > +                       lrugen =3D &lruvec->lrugen;
> >                 }
>
> Can we do the lookup under RCU and preserve IRQ state here?
> filemap_read() can reach folio_lruvec() without RCU held. On non-RT,
> lruvec_unlock_irq() can re-enable IRQs while KVM's hva_to_pfn_retry()
> still holds gpc->lock.

Thanks for the careful review!

We can, but not in this commit, and in a later patch we did convert to
RCU convention, so this lock is just an intermediate state because it
may race with aging hence race with the active / inactive number
update. In a later commit we changed how inactive/active is reported
for MGLRU so this is no longer needed. We are basically lockless after
this whole series (I mean, RCU lock only).

Perhaps I should add a TODO in the comment here so reviewers won't got conf=
used.
