Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191645;
	b=sgI7i0a9sAR3Hfh4ntcv2ZMNlk7mBJ68PaYrBJcM4W6doWEWCm/VdjBZOpINeAzbmwE9
	 Z+BI6i6y0BjrzSGfv62HeikHlkkOL2uSIYusN8aYEcx1bfoUXnt0VU0bZ7QQiGTAOJZbb
	 5EK7WRQxrC5/J+ufix5cNLn9k3t4oDgKZlyKvg0fBECAhHvGT/9NK2kP4PrlBu94T/ViY
	 sdpDkw9Lwa+usdX88dflGf2lDYMXrtQ4qrNDHOv0+NeQHeijDmYEH9pY/033+ACCdgHs+
	 wMjJwQYUltpp20VMNv08p09XqUvdlwG6DoUNcI9OMzbmpswYifAS431u64DMnZRBwdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nFviYrq5o1Aunl789XsU4c1vTFdvhxxqWOma4Om+z08=;
	b=xntNaD2VJvdU6A+6aUFDKo4RFcVHRNwXleo0o3fXEUcgmPibvNAnmPag2A1n1OUR++BC
	 KLEcUN+2BW1hSZBsSw+97mRpGYsZpSR08ZrCtLEpL6E2j8YYHoprdVj3XLC/ZxNI13KNi
	 G8+7XrmKF1EfRsw5nxj+BG2//YaMLbjrCNCu7cjMznWpM1TJgDa5uKo0Qr50lgAbQSVlC
	 kfsRyCPwL/RdyBq+fX0keWb9jfWgpIwy2pVzPw6B+0u753moQuLkfHSfmeE5oYrgs0qYG
	 yH3Gxxjwi16BLyEAn84sDE7tCPdHC3YLf84OW7L9U0K1R5ewBOdrLxJIcFK3OZccCcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZA5Lm80;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B853E606A331
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 16:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B853E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZA5Lm80
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so17448095e9.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 08:20:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795191643; cv=none;
        d=google.com; s=arc-20260327;
        b=OGnbfuoSIBVrvvMyzyGFocZPUe9yDM3Tgh1YDzmisG4uWLaZ4CQfbB24gBYbUw/VD4
         521TR2EH7hQjRvBUwdSJPyxNqGxcAWXIEIU5ao+2bpbE+hPO5wqSQ4nTXiS7lnwrhaFF
         pRk5QVcwvNYRgHaILxSK+dR6hvUYsCqANrk0a25rgFCvAgy6G171C6z/fHSYWXAO5mjZ
         MFVE27+pfFfe19Y1CfTwSnJ02iASgsfV6ZsIvi8AHdcNVwBnUlap6WNA4UrDCH7TuPzz
         S8LpN+fFnn533/bAzNYKj5KoLGJj/ErWlgwC+1oDfJ3K3qCFFNxwLY6RVWzXMcUlIoRi
         dKxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nFviYrq5o1Aunl789XsU4c1vTFdvhxxqWOma4Om+z08=;
        fh=0nTEapXtmuT3JIKhdlySfUzyHEBzPeyQ0C42793c0nc=;
        b=sISOqrnoj9n3IWv/Y5R9vVh0xUUVd3884UDXiF2eiyxjKvjyY8a1QMRqBR9i8HxTLU
         H2Y+iGNFw1bmR5d48tOxDA2+l9r4WCdLetC8KDu/7FOBs96i1wVnV9psyo6Dnf6qhKCB
         xTsP6AN+CeIHhyogPln7kYPwvwesOfdBOEKHn4bVBY6f52VdVis4uL1eFfTQSkYSW05Y
         7dDN5s2NNuuBmI5vsDjyoHF76hqExykUKY3Nhv4CCXnHW3jcoAobZ2Ym3/k0L2F5gK3N
         +NdwmW8Txadn+8PJ9OtesIGEXiQLk6pwpNHF99esnNu68NVnNrtTe0szLzYWz8sNQOzt
         mwbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191643; x=1795796443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nFviYrq5o1Aunl789XsU4c1vTFdvhxxqWOma4Om+z08=;
        b=xZA5Lm80+LmwnUw/ns35xz13xjfstKAn+btE7x5CEnUfuPMX9rtmTlrF1HCNHn3wTA
         PBf7UOKGidfFBVxjBDPe/Ylm1BLDpT69s8c3/6YvhqNPnvEZ4Z4t8jq5XHgiSbtXcf3G
         ljZcejKzQgNKLnk/3S4a7Mgu0GlyteWhwqPwUQpQTnDOZiaINidP3xqmE4vxE8s2Opds
         YFLlC0yro7uc1n+fM+UlN5PrtKMKNzD5PEAZYSfXMgDU/ub5SI9IK5H2rT4SRp6LQ736
         0vD9WMMa213cajcUFtNGIDK0Qhn6c7Mko4FoV8RHP7DouH34MmkI1r3kWdVXK2qW2Ulc
         m8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191643; x=1795796443;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFviYrq5o1Aunl789XsU4c1vTFdvhxxqWOma4Om+z08=;
        b=NNswlRQG0AUo4YbXoSMNEfywhA2JRze6VFTEOBoKQ501Kpnv7bLtVzFv+wki2ednbU
         XurdwrAdpSXxbFINVNhoukllKpF/AwicrLFKZDtUqzHfFk+REjBdFxbYzNBQX8YFOluj
         r97XeLtzIBZZlYaDa1WggWddOO/AOlhv0ho+VeRt/TyTI2Ro3zzyPtgf+ycCJsy8uGPB
         aYrlVjfJiJyAlYOFxpK2FxBW5zN1TP084+hgz6ZTa4W17UKqZs5IMjmW/fjQh0IRJS4k
         rwoGxDxZj0oIFAGWU+lCJIVoqa5vl0c4jF+Y1JFubxQAdGo8ZHF+ZaKR3mzobF8XR5C6
         yhSA==
X-Forwarded-Encrypted: i=1; AL+hErFHBHogF6SJVpw+OTmdNMhjydZmiLYy5U8P9zi/eJNUqeIwpZ9AuktqEvH8NKd6JdYbhMmPnvfvqsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/Qve406W3gPnUKjOdzYXx19C9Fk9T5kD7CaFmQIom/mfYbsQu
	JVF8TIB9etf4TtG+Ag+5CI5a3KI4QRyOggaly5YUhJcojsGLilwTXGN3fkjmmwmkA2XPC76EJHX
	O2Wnwfpr9Hu52MZAeoxY5xMM+MEkeEiA=
X-Gm-Gg: AYBFou1J6VFf0nnsA2olMeZ7iVuSR5jW3vcBWksGNq65bxMPZ60YQZnIO6fmFm070Qx
	vz/UoJwoEXk65DnLuA4x02hLXP3QKyvP04LFJBBLwqucOrwEHRQgh8Nr1QFI1vmfJOn6k/3Anl9
	ktYvgEbAKGkfQN0L8AodQoyeLSq67wSeyzntBchu9BrYgHJvQ8Gpi+O5fuwohfhRM220S2H6b9R
	BGBbg6WrB3J60GjNATerir1y83TmL7fkPitDi5m3EYenjAmz5t3QJPs4m7+XHqiJU/3st8+tbfM
	9gcdv/UT313Vp7vBkYokVp4Xeuk/Tx8UgIeYmMnJ0YVKZ0/frfjgSkthcxJ82jHRx+D7LX1AIjZ
	g4vu3wHXvtNsyOe0YUnwve1fRayUaOFQ9AMBf74OUTdNfCmGxlGW1NwUYNw7JUN+tCZDj0QvCG4
	FGy0nFdb6qkXgjK57dsnQ=
X-Received: by 2002:a05:600c:37c6:b0:4a1:88df:8a2a with SMTP id
 5b1f17b1804b1-4bb88812a84mr79631575e9.13.1795191642448; Fri, 20 Nov 2026
 08:20:42 -0800 (PST)
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
 <CAMgjq7DbK8sc7-0CTOj5iZBmkLmG7ggj75mdTxVkunGzmi=NWQ@mail.gmail.com>
In-Reply-To: <CAMgjq7DbK8sc7-0CTOj5iZBmkLmG7ggj75mdTxVkunGzmi=NWQ@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sat, 21 Nov 2026 00:20:30 +0800
X-Gm-Features: Aa3M54pZxa4hRHw0Lgws3rEOfSeNigcJ3vp4dRWPeqYAT3KKSQ-I1gkfiyUitiM
Message-ID: <CAN_Opa93a7Z0wmPxLGFeKF+BssvZeioFHU6tcnBioXTQKWKP-g@mail.gmail.com>
Subject: Re: [PATCH v5 06/17] mm/mglru: frequency guided workingset promotion (MGLRU-FG)
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

On Fri, Nov 20, 2026 at 5:36=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Fri, Nov 20, 2026 at 4:09=E2=80=AFPM KunWu Chan <kunwu.chan@gmail.com>=
 wrote:
> > > +/**
> > > + * folio_inc_lru_refs - Update the folio's LRU refs and lazily promo=
te it.
> > > + * @folio: The folio being accessed.
> > > + * @flags: The type of ref: FD access, or mapped access optionally w=
ith
> > > + * executable access.
> > > + *
> > > + * Used by both cache access (flags =3D=3D 0) and page table access =
(flags =3D=3D
> > > + * LRU_REF_MAPPED, optionally with LRU_REF_EXEC).
> > > + * Context: The caller must keep the folio alive by a reference or t=
he page
> > > + * table lock of a mapped folio.
> > > + */
> > > +void folio_inc_lru_refs(struct folio *folio, unsigned int flags)
> > > +{
> > > +       int max_gen;
> > > +       int type, refs, old_gen, gen;
> > > +       unsigned long new_flags, old_flags, max_seq;
> > > +       struct lru_gen_folio *lrugen;
> > > +       struct lruvec *lruvec =3D NULL;
> > > +
> > > +       type =3D folio_is_file_lru(folio);
> > > +       old_flags =3D READ_ONCE(*folio_flags(folio, 0));
> > > +       do {
> > > +               new_flags =3D old_flags;
> > > +               old_gen =3D lru_get_gen_flags(old_flags);
> > > +               refs =3D lru_get_refs_flags(old_flags) + 1;
> > > +               gen =3D old_gen;
> > > +               if (old_gen < 0)
> > > +                       goto out;
> > > +               /*
> > > +                * Lock the lruvec if the folio is on-list. We are al=
ready
> > > +                * doing lazy promotion so in theory we don't need th=
is,
> > > +                * but for now, concurrent aging would still corrupt =
the
> > > +                * size counters.  This is a temporary limitation and
> > > +                * will be lifted very soon, so the lock here is not =
a
> > > +                * performance concern.
> > > +                */
> > > +               if (!lruvec) {
> > > +                       lruvec =3D lruvec_live_lock_irq(folio_lruvec(=
folio));
> > > +                       lrugen =3D &lruvec->lrugen;
> > >                 }
> >
> > Can we do the lookup under RCU and preserve IRQ state here?
> > filemap_read() can reach folio_lruvec() without RCU held. On non-RT,
> > lruvec_unlock_irq() can re-enable IRQs while KVM's hva_to_pfn_retry()
> > still holds gpc->lock.
>
> Thanks for the careful review!
>
> We can, but not in this commit, and in a later patch we did convert to
> RCU convention, so this lock is just an intermediate state because it
> may race with aging hence race with the active / inactive number
> update. In a later commit we changed how inactive/active is reported
> for MGLRU so this is no longer needed. We are basically lockless after
> this whole series (I mean, RCU lock only).
>
> Perhaps I should add a TODO in the comment here so reviewers won't got co=
nfused.

Thanks, Kairui. Keeping the temporary lock for the accounting
makes sense to me.

Kunwu
