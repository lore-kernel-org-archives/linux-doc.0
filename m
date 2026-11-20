Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795192251;
	b=ue9Ghb0jMAI3xnkM8b1BXcwzULvb/qvWMIoHE95G0p6zThSbQSKA8/qF+ObKpweILdkP
	 EOvYzw7fBEROpFIwk5gnY3RfIfpSgM0e+Dlpsar9ETD9w62mpg5s4kYbmqgOi8oNWmC+Z
	 +4/r1qoj2EqWEaANBCis0w9FhdOTOZDYFKqNN04YKLLCTLsLeOm5teOWT9RCHExiwEEY6
	 PsnUUwM07g1xUf6BhNn60QStUhMtOXmnMr7X4k3rl4/1lfQh4M8B5pBEbbaSPNmuCnGYK
	 Qc0vJMMx9PjNONimj7fF0XNMyT0fscX6A/7RAXCI0k2N7WKA20eKwELzfmAE1CLbrEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cpX1M32t+57fqMIQ7LfIycrRgmXhRXFNCGI027Dqdn4=;
	b=ugSQ/tdx7r1erhOohl8Ig7xvfCS2dSI34Fkuo6ChYvR3xZxXPy+J2p+Ht51jb7nlmTXG
	 rtEZLVYUP6tkPoRo5GOEf2Wz3EqEXVLj4hxJEeOB2gAoTsa7+OomUb6FZ9fy9CboVV7bY
	 2CQj6f7GMemTRcQrxYt5P0Sna7yT1jsAaZJJ3XKKbWMx+lInfuDVLSIZDIrPOCLkuMJa5
	 IYRTOHkAxp8WqrrLKtPnpFhR+BTNVVSDsFy8akmZU83GSJuiGpVtoPn5J7fVBfK4MNZrs
	 /wwXeZwjY3pjG8d6jvrsaHoSQzEPEqDi0As9Kbz/lzYnMWU2yVbNJiTRm4a4DG988Ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkFR55X7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9216360A262B
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 16:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9216360A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkFR55X7
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so8502765e9.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 08:30:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795192247; cv=none;
        d=google.com; s=arc-20260327;
        b=eM4u1lvBWVs3G3W8VAls00ggZJsITlczcAZHztzR7wcYvxNXajbHD2hovMen3h154l
         HJoBZX+2JtWGGc/SSjRuld/mDEHloQ4SX7DewXO8FT8dLM+p1zwnG9/5Cd1+kojztLCS
         CwSGFCHDlLLzWck5lJs8ffn0ibIMWzLEnFTONmrLSTWEjTgA4sr1PCelKEzsL46ugVi8
         /NaDz0mSMYc2hmLDnXEmKdtJp/JByo0Oz6m/hh5fhYfcbhaAOWWijR++4PB+t9RpOVWd
         qj9/Gp1PJXoA2WPRb/rS8w/X6g/1VKG9sGVKAieaZvwrkLHpRBHF1IgT5LqFM8hiZ5+L
         ndyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cpX1M32t+57fqMIQ7LfIycrRgmXhRXFNCGI027Dqdn4=;
        fh=2t9G5y2UVQJf4XNt5KydSdPGs3qU5fFXX79dZa9ZK54=;
        b=JXuTgKHpQ64m7cdWVtqZROvQEc5qiidT8WfvHxvwCGz2eu9g7uuvKe9cCUn79LvfGl
         FibX1n3JojCWOIyK76RvnFZpuVGgxMWOgzgR1KrQJa1L6uqPPqUkAK1B+GYYVYOYgv/7
         rlDaTBCscKW5ZF1XxJDYdLEeAXZQRTW/tbfOhylHMTr+wpx2a8h9MejAXOItAjCy/mYG
         0Y+zqJhps+byI7fHyJNrmuWoONkgfGOZKm5gbb7ENPPJcIDcHN6flYZpcaRP+BUu9c7B
         5y0CcYGjmqFDLuDImaN4lIesBJEslSe8zxTqAsdFpkd/rVxHfvFrNeZPwtCTTa5IRYSM
         tyiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795192247; x=1795797047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpX1M32t+57fqMIQ7LfIycrRgmXhRXFNCGI027Dqdn4=;
        b=hkFR55X7tHxCv67GbrOSqM2bPtx+GkeIUPQLEHomrHxzgFa82hZAB2RX2T0iI/PZgg
         hptGCk5mOaRyI2iibg04Zzw8JbtTGfYGS47JYazV4ocpaVqSqKnb587cJdqkKekDERx2
         HwzYJ6EaGHRQVezBfSSutZgSoHivL+TmiPk8FYJ92/ziEExu/nH2hVDnnJ5ZY/Hm4SbP
         GDIpghhBZQH1YhgkcqaRyuXx1HoyHiDv6t6e5vUxPVnAwJjOlO83uIqkllYwj/ycZ9LC
         SekPR1aEx9s/uzYKrXaZvObY13ti1zAnUX5aR1Ol0P2eKGFSDQN9nUM08uSHWcIEUg+P
         SWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192247; x=1795797047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpX1M32t+57fqMIQ7LfIycrRgmXhRXFNCGI027Dqdn4=;
        b=qTa5T33rGeZFKNt6RgZbfJ2Wc1AW1JSHn8DC3POxk0tH7+rbSAHvaEsczV5YzdYUMy
         UyZW37UYAa1V2gUesCpJBaKYzCv7G8+fywJ6lgFD/xYux3QuQTY5rQinYlX/W54Dnp0Q
         GMxu/P+ZC77P0oUEntDAM/mXNv3JUIBwOr7MKu8ieTn10gvLGpz9sXVkVrx/gHxu0eB8
         aChvRMkfdQiSKeaki6ncwoPqnWZKWS+HjycNLSNVYfSKmg8nB/l517TZmEb0BqKhQAUq
         anOh2j/7sy4LR6TbIu7GJi3XGcFxKzPJaTlNALfzE1lztViN5HMc5cJcWJy5hjwr/4iO
         XSGg==
X-Forwarded-Encrypted: i=1; AL+hErHxgK++gVgRjysAu9o2+QEU27+K+esy3HITcfOT0ns9hvNsOF4Ew8F1za4HELxafSUfDgI1MMEuIfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UpqwP1qYE5q+npv2wQW66GG9pauRqSxKrNfb3kM2JeXLimt6d
	fAlUCEM2uBq8uDdFDpf9Sn6rYq+wdjK/23PnFmRgdni4zsPXQslWceng1YC9yn30U9CWa8evLgr
	QDCeNCty92oK5ZSuUpjGitw5o8piirbY=
X-Gm-Gg: AYBFou0GR85JviPKaApH6cTF61l2HrIA6nNq/5NJ83JTyLKEa0lttaECDkdhiVgrtfR
	f70eyhe7BWl2cDJx6/mwLmEiURhATltrsNbsK/wUotzDOnzwPlok3e9XhBbVL3xv+UmZFqTt6EH
	ZCqE8tpnl9vMDEelRBayx+AxggxVW9aIYMcFQJ32JAaQRjqbJbxhJbKVHj4jnyHVSBQFFFJHpfY
	7W83Ef8/f+F5vIyYHkAEdlOAVJ+p7W8OU75xn+bEi2yIDw9L0eu/AsA34ndo634rh2FArW5wO7c
	Da1CPr9Q22hIyRhB5kSmEQRxaM/eVp7/AoV1fac/+wcCBGFC3NylYP4vZGONE2OfgKVRbJAG/yp
	rZTQTniVR719BRXc/SaXaxKFp96vBxgRQ0sjB9aQCxe1EfPdA7Hcj5I92CNULxQScmmeA7QWunw
	pnunUqbVAKoSn4NjFlVrU=
X-Received: by 2002:a05:600c:a08b:b0:4bb:6651:9eda with SMTP id
 5b1f17b1804b1-4bb88922ca4mr75440565e9.14.1795192245903; Fri, 20 Nov 2026
 08:30:45 -0800 (PST)
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
 <20261119-mglru-fg-v5-15-9eee2fe97a2d@tencent.com> <CAN_Opa8jGstV=s9S=c842XFJ_H8m5txc6eJDH2AF=KuJSHAe6Q@mail.gmail.com>
 <CAMgjq7C+7=k9f9HVtYn_VwB96TZAJ=D8cbMh0mV7wCsW3m0ZWA@mail.gmail.com>
In-Reply-To: <CAMgjq7C+7=k9f9HVtYn_VwB96TZAJ=D8cbMh0mV7wCsW3m0ZWA@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sat, 21 Nov 2026 00:30:33 +0800
X-Gm-Features: Aa3M54q95jyZhEq-i_M7PwZnXUeHoRjlmXeb1GTLAqkufRChUjHRglY7D5BoOUY
Message-ID: <CAN_Opa_+xnmx7JTYxSRyn+itcfJZqeZz2mgBjTTKF13UKqO8rQ@mail.gmail.com>
Subject: Re: [PATCH v5 15/17] mm/mglru: folio LRU refs based active/inactive
 number accounting
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

On Fri, Nov 20, 2026 at 7:21=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Fri, Nov 20, 2026 at 5:30=E2=80=AFPM KunWu Chan <kunwu.chan@gmail.com>=
 wrote:
> >
> > On Thu, Nov 19, 2026 at 5:04=E2=80=AFAM Kairui Song via B4 Relay
> > <devnull+kasong.tencent.com@kernel.org> wrote:
> > >
> > > From: Kairui Song <kasong@tencent.com>
> > >
> > > Currently the active/inactive LRU sizes exported through /proc/vmstat
> > > and memory.stat are derived from the generation window: folios in the
> > > two newest generations are accounted as active, the rest as inactive.
> > > This causes several problems:
> > >
> > > - Unmapped file folios can stay in older gens despite repeated use,
> > >   so active files can be under-reported, unlike classical LRU.
> > >
> > > - The reading is jumpy: on aging, the second-newest gen, previously
> > >   active, becomes inactive all at once, causing a huge drop of active
> > >   folios without any change in use.
> > >
> > > - The reading is reversed on swapless machines. When swapping is
> > >   disabled or unavailable, MGLRU ages anon by moving the gens directl=
y
> > >   without walking or touching any folio, to reduce the overhead. So
> > >   inactive anon folios can suddenly count as active, or vice versa,
> > >   despite no change in their hotness.
> > >
> > > With frequency guided promotion, hotness is already tracked per folio=
 by
> > > its referenced count, so we can do folio level accounting instead: a
> > > folio is active once its refs reach LRU_REFS_ACTIVATED (currently
> > > LRU_REFS_PROTECTED).
> > >
> > > On reaching this threshold, folios are accounted to the active part.
> > > On forced per-folio aging or PID protection, refs are capped at
> > > LRU_REFS_WORKINGSET, dropping active folios to the inactive part.
> > > Note that on swapless machines anon refs are not reset by aging (the
> > > shortcut skips the per-folio walk), but the counts no longer oscillat=
e
> > > as the generation indices wrap.
> > >
> > > The accounting is now per folio and lruvec independent, so no size
> > > adjustment is needed when reparenting a dying memcg: the hierarchical
> > > stats keep the counts in the parent automatically.
> > >
> > > folio_migrate_lru_refs() also gains off-LRU VM_WARN_ON_ONCE checks an=
d
> > > __folio_set_lru_refs() warns when the folio is still on an LRU list.
> > >
> > > The latter uses lru_get_gen_flags(), so that helper now has to move o=
ut of
> > > the CONFIG_LRU_GEN block and is built with the option off, where
> > > LRU_GEN_WIDTH is 0 and LRU_GEN_MASK is zero.  Keep the decoded value =
in
> > > int so the subtraction of the one-off encoding cannot fold to ULONG_M=
AX
> > > before it happens: that is -Woverflow, and fatal with CONFIG_WERROR.
> > >
> > > Signed-off-by: Kairui Song <kasong@tencent.com>
> > > ---
> > >  Documentation/admin-guide/mm/multigen_lru.rst |   4 +-
> > >  include/linux/mm_inline.h                     | 118 +++++++-------
> > >  include/linux/mmzone.h                        |  23 ++-
> > >  mm/folio.c                                    |  39 +----
> > >  mm/madvise.c                                  |   2 +-
> > >  mm/vmscan.c                                   | 218 ++++++++++++++++=
+---------
> > >  mm/workingset.c                               |   2 +-
> > >  7 files changed, 230 insertions(+), 176 deletions(-)
> > >
> > > diff --git a/Documentation/admin-guide/mm/multigen_lru.rst b/Document=
ation/admin-guide/mm/multigen_lru.rst
> > > index 9cb54b4ff5d9..808d2e97b3f3 100644
> > > --- a/Documentation/admin-guide/mm/multigen_lru.rst
> > > +++ b/Documentation/admin-guide/mm/multigen_lru.rst
> > > @@ -149,8 +149,8 @@ generations less than or equal to ``min_gen_nr``.
> > >      ``- memcg_id node_id min_gen_nr [swappiness [nr_to_reclaim]]``
> > >
> > >  ``min_gen_nr`` should be less than ``max_gen_nr-1``, since
> > > -``max_gen_nr`` and ``max_gen_nr-1`` are not fully aged (equivalent t=
o
> > > -the active list) and therefore cannot be evicted. ``swappiness``
> > > +``max_gen_nr`` and ``max_gen_nr-1`` are not fully aged and therefore
> > > +cannot be evicted. ``swappiness``
> > >  overrides the default value in ``/proc/sys/vm/swappiness`` and the v=
alid
> > >  range is [0-200, max], with max being exclusively used for the recla=
mation
> > >  of anonymous memory. ``nr_to_reclaim`` limits the number of pages to=
 evict.
> > > diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> > > index 14aab2b1ed08..77f514143266 100644
> > > --- a/include/linux/mm_inline.h
> > > +++ b/include/linux/mm_inline.h
> > > @@ -105,6 +105,22 @@ static __always_inline enum lru_list folio_lru_l=
ist(const struct folio *folio)
> > >         return lru;
> > >  }
> > >
> > > +/**
> > > + * lru_get_gen_flags - Return the LRU generation number from folio f=
lags.
> > > + * @flags: folio flags
> > > + *
> > > + * Returns: A number between 0 and (MAX_NR_GENS - 1), inclusive. Ret=
urns
> > > + * -1 if the flags indicate the folio is off the list (e.g., isolate=
d).
> > > + */
> > > +static inline int lru_get_gen_flags(unsigned long flags)
> > > +{
> > > +       int gen =3D (int)((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF);
> > > +
> > > +       /* The gen is stored offset by one, so zero means off-list */
> > > +       VM_WARN_ON_ONCE(gen > MAX_NR_GENS);
> > > +       return gen - 1;
> > > +}
> > > +
> > >  #ifdef CONFIG_LRU_GEN
> > >
> > >  static inline bool lru_gen_switching(void)
> > > @@ -168,22 +184,6 @@ static inline void lru_set_gen_flags(unsigned lo=
ng *flags, int gen)
> > >         *flags |=3D (gen + 1UL) << LRU_GEN_PGOFF;
> > >  }
> > >
> > > -/**
> > > - * lru_get_gen_flags - Return the LRU generation number from folio f=
lags.
> > > - * @flags: folio flags
> > > - *
> > > - * Returns: A number between 0 and (MAX_NR_GENS - 1), inclusive. Ret=
urns
> > > - * -1 if the flags indicate the folio is off the list (e.g., isolate=
d).
> > > - */
> > > -static inline int lru_get_gen_flags(unsigned long flags)
> > > -{
> > > -       int gen =3D ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
> > > -
> > > -       /* Exclude the legal -1 from the unsigned MAX_NR_GENS compari=
son */
> > > -       VM_WARN_ON_ONCE(gen !=3D -1 && gen >=3D MAX_NR_GENS);
> > > -       return gen;
> > > -}
> > > -
> > >  static inline int folio_lru_gen(const struct folio *folio)
> > >  {
> > >         return lru_get_gen_flags(READ_ONCE(*const_folio_flags(folio, =
0)));
> > > @@ -247,12 +247,21 @@ static inline bool lru_refs_is_workingset(unsig=
ned int refs)
> > >         return refs >=3D LRU_REFS_WORKINGSET;
> > >  }
> > >
> > > -static inline void folio_set_lru_refs(struct folio *folio, unsigned =
int refs)
> > > +/**
> > > + * __folio_set_lru_refs - Set a folio's LRU refs.
> > > + * @folio: the folio
> > > + * @refs: the new referenced count (0 .. LRU_REFS_MAX)
> > > + *
> > > + * Set the folio's LRU refs.  The folio must be off the LRU list (e.=
g.,
> > > + * isolated), or use folio_inc_lru_refs or folio_reset_lru_refs inst=
ead.
> > > + */
> > > +static inline void __folio_set_lru_refs(struct folio *folio, unsigne=
d int refs)
> > >  {
> > >         unsigned long new_flags, old_flags =3D READ_ONCE(*folio_flags=
(folio, 0));
> > >
> > >         do {
> > >                 new_flags =3D old_flags;
> > > +               VM_WARN_ON_ONCE(lru_get_gen_flags(old_flags) !=3D -1)=
;
> > >                 lru_set_refs_flags(&new_flags, refs);
> > >                 if (new_flags =3D=3D old_flags)
> > >                         break;
> > > @@ -261,12 +270,18 @@ static inline void folio_set_lru_refs(struct fo=
lio *folio, unsigned int refs)
> > >
> > >  #ifdef CONFIG_LRU_GEN
> > >  void folio_inc_lru_refs(struct folio *folio, unsigned int flags);
> > > +bool folio_reset_lru_refs(struct folio *folio);
> > >  #else
> > >  static inline void folio_inc_lru_refs(struct folio *folio, unsigned =
int flags)
> > >  {
> > >         /* Should not be called with !CONFIG_LRU_GEN */
> > >         WARN_ON_ONCE(1);
> > >  }
> > > +
> > > +static inline bool folio_reset_lru_refs(struct folio *folio)
> > > +{
> > > +       return false;
> > > +}
> > >  #endif
> > >
> > >  /**
> > > @@ -280,10 +295,18 @@ static inline void folio_inc_lru_refs(struct fo=
lio *folio, unsigned int flags)
> > >   */
> > >  static inline void folio_migrate_lru_refs(struct folio *new, const s=
truct folio *old)
> > >  {
> > > -       folio_set_lru_refs(new, folio_lru_refs(old));
> > > +       VM_WARN_ON_ONCE_FOLIO(folio_test_lru(old), old);
> > > +       VM_WARN_ON_ONCE_FOLIO(folio_test_lru(new), new);
> > > +       __folio_set_lru_refs(new, folio_lru_refs(old));
> > >  }
> > >
> > >  #ifdef CONFIG_LRU_GEN
> > > +static inline bool lru_refs_is_active(unsigned int refs)
> > > +{
> > > +       VM_WARN_ON_ONCE(refs > LRU_REFS_MAX);
> > > +       return refs >=3D LRU_REFS_ACTIVATED;
> > > +}
> > > +
> > >  static inline bool lru_gen_is_old(struct lruvec *lruvec, int type, i=
nt gen)
> > >  {
> > >         unsigned long min_seq =3D READ_ONCE(lruvec->lrugen.min_seq[ty=
pe]);
> > > @@ -294,23 +317,12 @@ static inline bool lru_gen_is_old(struct lruvec=
 *lruvec, int type, int gen)
> > >                gen =3D=3D lru_gen_from_seq(min_seq + 1);
> > >  }
> > >
> > > -static inline bool lru_gen_is_active(const struct lruvec *lruvec, in=
t gen)
> > > -{
> > > -       unsigned long max_seq =3D READ_ONCE(lruvec->lrugen.max_seq);
> > > -
> > > -       VM_WARN_ON_ONCE(gen >=3D MAX_NR_GENS);
> > > -
> > > -       /* see the comment on MIN_NR_GENS */
> > > -       return gen =3D=3D lru_gen_from_seq(max_seq) || gen =3D=3D lru=
_gen_from_seq(max_seq - 1);
> > > -}
> > > -
> > >  static inline void lru_gen_update_size(struct lruvec *lruvec, struct=
 folio *folio,
> > >                                        int old_gen, int new_gen)
> > >  {
> > >         int type =3D folio_is_file_lru(folio);
> > >         int zone =3D folio_zonenum(folio);
> > >         int delta =3D folio_nr_pages(folio);
> > > -       enum lru_list lru =3D type * LRU_INACTIVE_FILE;
> > >         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> > >
> > >         VM_WARN_ON_ONCE(old_gen !=3D -1 && old_gen >=3D MAX_NR_GENS);
> > > @@ -321,19 +333,6 @@ static inline void lru_gen_update_size(struct lr=
uvec *lruvec, struct folio *foli
> > >                 atomic_long_sub(delta, &lrugen->nr_pages[old_gen][typ=
e][zone]);
> > >         if (new_gen >=3D 0)
> > >                 atomic_long_add(delta, &lrugen->nr_pages[new_gen][typ=
e][zone]);
> > > -
> > > -       /* return now if not a promotion */
> > > -       if (old_gen < 0 || new_gen < 0)
> > > -               return;
> > > -
> > > -       /* promotion */
> > > -       if (!lru_gen_is_active(lruvec, old_gen) && lru_gen_is_active(=
lruvec, new_gen)) {
> > > -               __update_lru_size(lruvec, lru, zone, -delta);
> > > -               __update_lru_size(lruvec, lru + LRU_ACTIVE, zone, del=
ta);
> > > -       }
> > > -
> > > -       /* demotion requires isolation, e.g., lru_deactivate_fn() */
> > > -       VM_WARN_ON_ONCE(lru_gen_is_active(lruvec, old_gen) && !lru_ge=
n_is_active(lruvec, new_gen));
> > >  }
> > >
> > >  static inline unsigned long lru_gen_folio_seq(const struct lruvec *l=
ruvec,
> > > @@ -376,7 +375,8 @@ static inline bool __lru_gen_add_folio(struct lru=
vec *lruvec, struct folio *foli
> > >  {
> > >         unsigned long seq;
> > >         unsigned long flags;
> > > -       int gen =3D folio_lru_gen(folio);
> > > +       unsigned int refs;
> > > +       int gen;
> > >         int type =3D folio_is_file_lru(folio);
> > >         int zone =3D folio_zonenum(folio);
> > >         int delta =3D folio_nr_pages(folio);
> > > @@ -384,7 +384,7 @@ static inline bool __lru_gen_add_folio(struct lru=
vec *lruvec, struct folio *foli
> > >         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> > >
> > >         BUILD_BUG_ON(BIT(LRU_GEN_WIDTH - 1) !=3D MAX_NR_GENS);
> > > -       VM_WARN_ON_ONCE_FOLIO(gen !=3D -1, folio);
> > > +       VM_WARN_ON_ONCE_FOLIO(folio_lru_gen(folio) !=3D -1, folio);
> > >
> > >         if (folio_test_unevictable(folio) || !lrugen->enabled)
> > >                 return false;
> > > @@ -395,10 +395,12 @@ static inline bool __lru_gen_add_folio(struct l=
ruvec *lruvec, struct folio *foli
> > >         gen =3D lru_gen_from_seq(seq);
> > >         flags =3D (gen + 1UL) << LRU_GEN_PGOFF;
> > >         /* see the comment on MIN_NR_GENS about PG_active */
> > > -       set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK | BIT(PG_ac=
tive), flags);
> > > +       flags =3D set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK |=
 BIT(PG_active), flags);
> > > +       /* use the refs from the atomic snapshot to avoid raced updat=
e */
> > > +       refs =3D lru_get_refs_flags(flags);
> > >
> > >         lru_gen_update_size(lruvec, folio, -1, gen);
> > > -       if (lru_gen_is_active(lruvec, gen))
> > > +       if (lru_refs_is_active(refs))
> > >                 lru +=3D LRU_ACTIVE;
> > >         __update_lru_size(lruvec, lru, zone, delta);
> > >
> > > @@ -425,24 +427,33 @@ static inline bool lru_gen_add_rejected_folio(s=
truct lruvec *lruvec, struct foli
> > >  static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct f=
olio *folio, bool reclaiming)
> > >  {
> > >         unsigned long flags;
> > > -       int gen =3D folio_lru_gen(folio);
> > > +       unsigned int refs;
> > > +       int gen;
> > >         int zone =3D folio_zonenum(folio);
> > >         int delta =3D folio_nr_pages(folio);
> > >         enum lru_list lru =3D folio_is_file_lru(folio) * LRU_INACTIVE=
_FILE;
> > > +       unsigned long max_seq =3D READ_ONCE(lruvec->lrugen.max_seq);
> > >
> > > +       /* Keep LRU_REFS_FLAGS: refs carry access history across isol=
ation */
> > > +       flags =3D set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK, =
0);
> > > +       gen =3D lru_get_gen_flags(flags);
> > > +       refs =3D lru_get_refs_flags(flags);
> > >         if (gen < 0)
> > >                 return false;
> > >
> > >         VM_WARN_ON_ONCE_FOLIO(folio_test_active(folio), folio);
> > >         VM_WARN_ON_ONCE_FOLIO(folio_test_unevictable(folio), folio);
> > >
> > > -       /* for folio_migrate_flags() */
> > > -       flags =3D !reclaiming && lru_gen_is_active(lruvec, gen) ? BIT=
(PG_active) : 0;
> > > -       flags =3D set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK, =
flags);
> > > -       gen =3D ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
> > > +       /*
> > > +        * See the comment in lru_gen_folio_seq.  For migration, comp=
action,
> > > +        * or any other isolation of a hot folio, try best to retain =
its gen
> > > +        * info. Ideally we would keep the full gen info.
> > > +        */
> > > +       if (!reclaiming && ((max_seq - gen) % MAX_NR_GENS) < MIN_NR_G=
ENS)
> > > +               folio_set_active(folio);
> > >
> > >         lru_gen_update_size(lruvec, folio, gen, -1);
> > > -       if (lru_gen_is_active(lruvec, gen))
> > > +       if (lru_refs_is_active(refs))
> > >                 lru +=3D LRU_ACTIVE;
> > >         __update_lru_size(lruvec, lru, zone, -delta);
> > >         list_del(&folio->lru);
> > > @@ -499,6 +510,7 @@ static __always_inline void folio_inc_lru_refs_fa=
st(struct folio *folio)
> > >                 return;
> > >         }
> > >
> > > +       BUILD_BUG_ON(LRU_REFS_REFERENCED >=3D LRU_REFS_ACTIVATED);
> > >         old_flags =3D READ_ONCE(*folio_flags(folio, 0));
> > >         do {
> > >                 if (lru_get_refs_flags(old_flags))
> > > @@ -534,7 +546,7 @@ static inline bool folio_check_lru_refs(const str=
uct folio *folio)
> > >  static inline void folio_clear_lru_refs(struct folio *folio)
> > >  {
> > >         if (lru_gen_enabled())
> > > -               folio_set_lru_refs(folio, 0);
> > > +               folio_reset_lru_refs(folio);
> > >         else
> > >                 folio_clear_referenced(folio);
> > >  }
> >
> > Can clear_refs race with disabling MGLRU? Once the static key is
> > off, it can drop refs from 3 to 2 on a folio still on a gen list.
> > The drain then subtracts it from inactive, though it was counted
> > as active.
>
> Thanks for the very careful review!
>
> I think we are fine, folio_reset_lru_refs checks gen >=3D 0 before
> touching things, gen >=3D 0 means the folio is manged by MGLRU, right?
> The worst could happen is we clear PG_workingset for CLRU, which
> really doesn't matter, one metric off by one folio for a very short
> period and self healing, not a measurable thing even if you do that on
> purpose.

Thanks, Kairui. The refs-based accounting makes sense to me.

I meant the else branch in folio_clear_lru_refs(). The static key
can already be off while the folio is still on a gen list. If
clear_refs drops refs from 3 to 2 there, where do we subtract
those pages from the active count?

Thanks,
Kunwu
