Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795201173;
	b=CpaMyX9RSHgMDtuMSv+5St7avhOpJmmukctXG76faN7xUvnMfaQS1aLhMj2yEHPJMgjg
	 myenNR2X+qxofzquD7qF8OUqtIDKXebYOvsE2p2eKcBdsrYxa6krTCKcB2z3TxPiEptrv
	 +a9IDHh8/ulox6geRp9exAhm6eiKKvoAUrCx59Oy6TwVEJz+wNv9Tu+IOxmkb5OsSzAMH
	 BlRi5Ef+jfFpY1zIjFNsyVOvwTQWAfMyVSp50qdA1GInigZlURPSAtNzPqjtACRAot401
	 H8zfmrPKFqfElmVzA+XCbjpLNj0EQgLkxfTPGyJe9HsEdsMEwXDN8uyzG60v5qaxqbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HosGK91lY5NUAihehXToRlYUq99RrmyKQTS41pe1Lzo=;
	b=AF9hzv7HIm1jrmBt0iHhVrWeajUBIPPK7Eu0NtIL2RaygQpWFV0vYKzKCQPlmzhsvT65
	 MkFykXOyCWueY5wyc1l7ohfGoL07rp9789F/0fm7kTnwYx4SYn1fq1YN47Xeu8atzEPoa
	 gF+mItunQvuuiF1zkxroWDFr0A6cSDhSfhlXBD3OW0Ztwsks6pN9Saz36MqZ6JZtrSHOx
	 d/Bb9fGH1c5G9EjGq9pSGp+b0lCUFFCfXLrzPUUc+H938GccG8LjZkgNHQj42NQqAs9AH
	 E3fxNzuQgFnrw10lP3Q/hZ5Zng+vy1GDDiy28sYtJdbfWdu9tbCdl/FTkSvUpR1vNCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S7NNG66y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEB160A2626
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 18:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EEB160A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S7NNG66y
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4322d310e7so216743166b.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 10:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795201170; cv=none;
        d=google.com; s=arc-20260327;
        b=fcdLl/NA1Ue2DC8RFGislJV/ulAiyqIYFu1WBTaDTlu0OSd/MkTDVG9nxmdpGLIUxP
         YU0Bkvn53IclIQD04E+FBTjkHQ8J0u6qR8bE9i1t5IuT0afcVCaf5goA+zojjWFs71cx
         ZjB81bixSx9bpp1aFUhS2DOsBPY6V6agZkCIuEHGkGibIBtjeL7x4bxW1xHwUTUTgxTF
         Ag4WSiyv4vVK/APl58cSsjniyWt0cmAjhb6VrsRyEg0KIQs5y9Cx5vuaNEcGYZU5l3yU
         wbdTl5cB1hdK1WwvXQAtXrdGtwdcdCw9eENysXPJgP/TQRYqz+cgMkoebRo7rswVJqVF
         Icpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HosGK91lY5NUAihehXToRlYUq99RrmyKQTS41pe1Lzo=;
        fh=E91UNwsxhN6V28Y1KVIbvy1vfYLJzQ3cDrRIICAUCl0=;
        b=ZFDW8NKs2fAdJpnyUJi/i/1tgHR8VJQ+Oehid3G6y62ifRlldYIGit7QBdjJAdcVFc
         +rLT8/mqNaC/0knSJy63pzGc+zrnWGVu163g8f6BpmZSVr2U+F3UkFg/oQ8ObylrlQUP
         9zMTyNMf69eq2pILkLzy8QT+W48hPX+oBe40nPHkqZZCCGYgywjdaWQmRcI8pTemsMmy
         5mkhlm1EW4j6H/4gz6kxTGFfh2IT/1+GLH8tDD5nponfeVmx+zzfDwwW1PmhTRlPiQSd
         OewQ7PGrxJxBfvdwtsWRaoqAldrlhfP5XuK7sdnNk3LfluL+isuNuK/bcgNuq8c7Lr6c
         N93A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201170; x=1795805970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HosGK91lY5NUAihehXToRlYUq99RrmyKQTS41pe1Lzo=;
        b=S7NNG66yuOi5NaavR/meFJVshGZm5H5zs0nAfj6dfCf5rT+S7wx/C83Uy26+o53Da2
         9cTRyloNbploywJcAmfLftj1tlJgazcywC+I6yyM0rpXS2UAYQpewHEZXbyTTWTUSVzK
         IsC2HTC2MUryr78v+U5aaXQrB52Vy0k9xUTUBxBhUE+C7x0/k5UqCzMH3qSNBxXyN3E6
         JlA3eR1+D+U0CufqmsrsJT0SDcl7vxEbYu1ambpQZtWtXBcFOsXWk/PIP3LsEq2E2KXk
         uTqvuIEvT7NV76bliWQ7WXgQsHkf/UmmEk6A/W8MQ368WsJmFQev9DR+wJuDnGBdP0Ng
         PZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201170; x=1795805970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HosGK91lY5NUAihehXToRlYUq99RrmyKQTS41pe1Lzo=;
        b=LHYdt7TOFWTX9B9bRuSYzR8WxLNKB+po6d/HZMjqoja2zadQq/H3rSaaSp66tGsefl
         0bueTn/OGR7JKUmtEyPSvUh8wf40ZdoQTngDZPcU8qzOS61DJT7BZ6S/TIa+MjgKbQRE
         QcbGHagpvLNrSMXAtWtAAdVolobW6lIhAXYMazMveS6I57gxIHQzdgc/IlCznQ8mSKWR
         sBraoGdBS864Jo0WAyg+40wl2bFgVI3pxsHOulnXtKXLbUs3Gamw50u6I4QZKvyPJPmx
         ASGVFbaNksr+M4qHn+pzjxbhDN5wSTJ/bL3B4Qm6918pormv5nn2o2I8wnwhZOjr9Ca1
         B3OQ==
X-Forwarded-Encrypted: i=1; AL+hErHRwTmZAbvkcOZwbq6P1uc7qoU3Mtf9LJbZfCFPqE5fUocxZlz59OSR15x2+27TBVt0sq5oI6o2rL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z++t/HOqVKorlOSYGVe6YziyuC5SabKRSjQkFhYRT4yVBN3IUQp
	nALRc2GKdieL63OuO0GHq6ToACAe7C3MFXNhrKfcOyeonNM5j+LxYIbEgHk71F3/NBSaUHYLyhY
	2+ygPoKwuCWw/noDHr/R1jYv1WQLZHrg=
X-Gm-Gg: AZFdTZeoluy7kLbNg9xSrAGez2G0X050K5gtDz1yv9EZIi/7qVZzhCcEjuiGT7CDzHl
	UTcyQUZOaqYN98b8y13bQ9Qeo90OArJiLH/vdyy7MyrYiZIzN9Q222Z7TQrZ0DvmWecdWvQRz58
	Pyp/FbwyM9C9/4Y0Yr5BQ4hVjOSKybW7GcYEFSESjTEBPmGVAaY5M09ir4MRY2wrGw8USnqnO3u
	yGe4b1UFXmXDNpv3L8E5JlRix3653X8+qGyIDQuieyXN/DS58qgjDRFV9MCdpVc/jS/LGTHMW1j
	dnRDFbGBnruosf+k//t10moCPhZYQ/SyC4acsrU+WcLQJ9RMHBmdaBGkbrdgwyEDrvkzP6ISoEz
	xvMz3SosC0x5/2SMRlHs5wepOKBugdKn+GqmIJbUQrkRzJEHfn8eq5Q5OXGv89X1ZZRBvLA==
X-Received: by 2002:a17:907:9692:b0:c31:fb29:a137 with SMTP id
 a640c23a62f3a-c513aac2909mr393877966b.21.1795201169545; Fri, 20 Nov 2026
 10:59:29 -0800 (PST)
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
 <CAMgjq7C+7=k9f9HVtYn_VwB96TZAJ=D8cbMh0mV7wCsW3m0ZWA@mail.gmail.com> <CAN_Opa_+xnmx7JTYxSRyn+itcfJZqeZz2mgBjTTKF13UKqO8rQ@mail.gmail.com>
In-Reply-To: <CAN_Opa_+xnmx7JTYxSRyn+itcfJZqeZz2mgBjTTKF13UKqO8rQ@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 21 Nov 2026 02:58:52 +0800
X-Gm-Features: Aa3M54pSH4Hgl_AeoY-tGRvtdwMoJ9NsLp-IVrP2x4fpxJKW7EMLjNNqwMZjt_M
Message-ID: <CAMgjq7B-_UwERJjZ4AH2KRwuOD8hKnJGxmQBFxw79NBe6XisrA@mail.gmail.com>
Subject: Re: [PATCH v5 15/17] mm/mglru: folio LRU refs based active/inactive
 number accounting
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

On Sat, Nov 21, 2026 at 12:30=E2=80=AFAM KunWu Chan <kunwu.chan@gmail.com> =
wrote:
>
> On Fri, Nov 20, 2026 at 7:21=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > On Fri, Nov 20, 2026 at 5:30=E2=80=AFPM KunWu Chan <kunwu.chan@gmail.co=
m> wrote:
> > >
> > > On Thu, Nov 19, 2026 at 5:04=E2=80=AFAM Kairui Song via B4 Relay
> > > <devnull+kasong.tencent.com@kernel.org> wrote:
> > > >
> > > > From: Kairui Song <kasong@tencent.com>
> > > >
> > > > Currently the active/inactive LRU sizes exported through /proc/vmst=
at
> > > > and memory.stat are derived from the generation window: folios in t=
he
> > > > two newest generations are accounted as active, the rest as inactiv=
e.
> > > > This causes several problems:
> > > >
> > > > - Unmapped file folios can stay in older gens despite repeated use,
> > > >   so active files can be under-reported, unlike classical LRU.
> > > >
> > > > - The reading is jumpy: on aging, the second-newest gen, previously
> > > >   active, becomes inactive all at once, causing a huge drop of acti=
ve
> > > >   folios without any change in use.
> > > >
> > > > - The reading is reversed on swapless machines. When swapping is
> > > >   disabled or unavailable, MGLRU ages anon by moving the gens direc=
tly
> > > >   without walking or touching any folio, to reduce the overhead. So
> > > >   inactive anon folios can suddenly count as active, or vice versa,
> > > >   despite no change in their hotness.
> > > >
> > > > With frequency guided promotion, hotness is already tracked per fol=
io by
> > > > its referenced count, so we can do folio level accounting instead: =
a
> > > > folio is active once its refs reach LRU_REFS_ACTIVATED (currently
> > > > LRU_REFS_PROTECTED).
> > > >
> > > > On reaching this threshold, folios are accounted to the active part=
.
> > > > On forced per-folio aging or PID protection, refs are capped at
> > > > LRU_REFS_WORKINGSET, dropping active folios to the inactive part.
> > > > Note that on swapless machines anon refs are not reset by aging (th=
e
> > > > shortcut skips the per-folio walk), but the counts no longer oscill=
ate
> > > > as the generation indices wrap.
> > > >
> > > > The accounting is now per folio and lruvec independent, so no size
> > > > adjustment is needed when reparenting a dying memcg: the hierarchic=
al
> > > > stats keep the counts in the parent automatically.
> > > >
> > > > folio_migrate_lru_refs() also gains off-LRU VM_WARN_ON_ONCE checks =
and
> > > > __folio_set_lru_refs() warns when the folio is still on an LRU list=
.
> > > >
> > > > The latter uses lru_get_gen_flags(), so that helper now has to move=
 out of
> > > > the CONFIG_LRU_GEN block and is built with the option off, where
> > > > LRU_GEN_WIDTH is 0 and LRU_GEN_MASK is zero.  Keep the decoded valu=
e in
> > > > int so the subtraction of the one-off encoding cannot fold to ULONG=
_MAX
> > > > before it happens: that is -Woverflow, and fatal with CONFIG_WERROR=
.
> > > >
> > > > Signed-off-by: Kairui Song <kasong@tencent.com>
> > > > ---
> > > >  Documentation/admin-guide/mm/multigen_lru.rst |   4 +-
> > > >  include/linux/mm_inline.h                     | 118 +++++++-------
> > > >  include/linux/mmzone.h                        |  23 ++-
> > > >  mm/folio.c                                    |  39 +----
> > > >  mm/madvise.c                                  |   2 +-
> > > >  mm/vmscan.c                                   | 218 ++++++++++++++=
+++---------
> > > >  mm/workingset.c                               |   2 +-
> > > >  7 files changed, 230 insertions(+), 176 deletions(-)
> > > >
> > > > diff --git a/Documentation/admin-guide/mm/multigen_lru.rst b/Docume=
ntation/admin-guide/mm/multigen_lru.rst
> > > > index 9cb54b4ff5d9..808d2e97b3f3 100644
> > > > --- a/Documentation/admin-guide/mm/multigen_lru.rst
> > > > +++ b/Documentation/admin-guide/mm/multigen_lru.rst
> > > > @@ -149,8 +149,8 @@ generations less than or equal to ``min_gen_nr`=
`.
> > > >      ``- memcg_id node_id min_gen_nr [swappiness [nr_to_reclaim]]``
> > > >
> > > >  ``min_gen_nr`` should be less than ``max_gen_nr-1``, since
> > > > -``max_gen_nr`` and ``max_gen_nr-1`` are not fully aged (equivalent=
 to
> > > > -the active list) and therefore cannot be evicted. ``swappiness``
> > > > +``max_gen_nr`` and ``max_gen_nr-1`` are not fully aged and therefo=
re
> > > > +cannot be evicted. ``swappiness``
> > > >  overrides the default value in ``/proc/sys/vm/swappiness`` and the=
 valid
> > > >  range is [0-200, max], with max being exclusively used for the rec=
lamation
> > > >  of anonymous memory. ``nr_to_reclaim`` limits the number of pages =
to evict.
> > > > diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> > > > index 14aab2b1ed08..77f514143266 100644
> > > > --- a/include/linux/mm_inline.h
> > > > +++ b/include/linux/mm_inline.h
> > > > @@ -105,6 +105,22 @@ static __always_inline enum lru_list folio_lru=
_list(const struct folio *folio)
> > > >         return lru;
> > > >  }
> > > >
> > > > +/**
> > > > + * lru_get_gen_flags - Return the LRU generation number from folio=
 flags.
> > > > + * @flags: folio flags
> > > > + *
> > > > + * Returns: A number between 0 and (MAX_NR_GENS - 1), inclusive. R=
eturns
> > > > + * -1 if the flags indicate the folio is off the list (e.g., isola=
ted).
> > > > + */
> > > > +static inline int lru_get_gen_flags(unsigned long flags)
> > > > +{
> > > > +       int gen =3D (int)((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF);
> > > > +
> > > > +       /* The gen is stored offset by one, so zero means off-list =
*/
> > > > +       VM_WARN_ON_ONCE(gen > MAX_NR_GENS);
> > > > +       return gen - 1;
> > > > +}
> > > > +
> > > >  #ifdef CONFIG_LRU_GEN
> > > >
> > > >  static inline bool lru_gen_switching(void)
> > > > @@ -168,22 +184,6 @@ static inline void lru_set_gen_flags(unsigned =
long *flags, int gen)
> > > >         *flags |=3D (gen + 1UL) << LRU_GEN_PGOFF;
> > > >  }
> > > >
> > > > -/**
> > > > - * lru_get_gen_flags - Return the LRU generation number from folio=
 flags.
> > > > - * @flags: folio flags
> > > > - *
> > > > - * Returns: A number between 0 and (MAX_NR_GENS - 1), inclusive. R=
eturns
> > > > - * -1 if the flags indicate the folio is off the list (e.g., isola=
ted).
> > > > - */
> > > > -static inline int lru_get_gen_flags(unsigned long flags)
> > > > -{
> > > > -       int gen =3D ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
> > > > -
> > > > -       /* Exclude the legal -1 from the unsigned MAX_NR_GENS compa=
rison */
> > > > -       VM_WARN_ON_ONCE(gen !=3D -1 && gen >=3D MAX_NR_GENS);
> > > > -       return gen;
> > > > -}
> > > > -
> > > >  static inline int folio_lru_gen(const struct folio *folio)
> > > >  {
> > > >         return lru_get_gen_flags(READ_ONCE(*const_folio_flags(folio=
, 0)));
> > > > @@ -247,12 +247,21 @@ static inline bool lru_refs_is_workingset(uns=
igned int refs)
> > > >         return refs >=3D LRU_REFS_WORKINGSET;
> > > >  }
> > > >
> > > > -static inline void folio_set_lru_refs(struct folio *folio, unsigne=
d int refs)
> > > > +/**
> > > > + * __folio_set_lru_refs - Set a folio's LRU refs.
> > > > + * @folio: the folio
> > > > + * @refs: the new referenced count (0 .. LRU_REFS_MAX)
> > > > + *
> > > > + * Set the folio's LRU refs.  The folio must be off the LRU list (=
e.g.,
> > > > + * isolated), or use folio_inc_lru_refs or folio_reset_lru_refs in=
stead.
> > > > + */
> > > > +static inline void __folio_set_lru_refs(struct folio *folio, unsig=
ned int refs)
> > > >  {
> > > >         unsigned long new_flags, old_flags =3D READ_ONCE(*folio_fla=
gs(folio, 0));
> > > >
> > > >         do {
> > > >                 new_flags =3D old_flags;
> > > > +               VM_WARN_ON_ONCE(lru_get_gen_flags(old_flags) !=3D -=
1);
> > > >                 lru_set_refs_flags(&new_flags, refs);
> > > >                 if (new_flags =3D=3D old_flags)
> > > >                         break;
> > > > @@ -261,12 +270,18 @@ static inline void folio_set_lru_refs(struct =
folio *folio, unsigned int refs)
> > > >
> > > >  #ifdef CONFIG_LRU_GEN
> > > >  void folio_inc_lru_refs(struct folio *folio, unsigned int flags);
> > > > +bool folio_reset_lru_refs(struct folio *folio);
> > > >  #else
> > > >  static inline void folio_inc_lru_refs(struct folio *folio, unsigne=
d int flags)
> > > >  {
> > > >         /* Should not be called with !CONFIG_LRU_GEN */
> > > >         WARN_ON_ONCE(1);
> > > >  }
> > > > +
> > > > +static inline bool folio_reset_lru_refs(struct folio *folio)
> > > > +{
> > > > +       return false;
> > > > +}
> > > >  #endif
> > > >
> > > >  /**
> > > > @@ -280,10 +295,18 @@ static inline void folio_inc_lru_refs(struct =
folio *folio, unsigned int flags)
> > > >   */
> > > >  static inline void folio_migrate_lru_refs(struct folio *new, const=
 struct folio *old)
> > > >  {
> > > > -       folio_set_lru_refs(new, folio_lru_refs(old));
> > > > +       VM_WARN_ON_ONCE_FOLIO(folio_test_lru(old), old);
> > > > +       VM_WARN_ON_ONCE_FOLIO(folio_test_lru(new), new);
> > > > +       __folio_set_lru_refs(new, folio_lru_refs(old));
> > > >  }
> > > >
> > > >  #ifdef CONFIG_LRU_GEN
> > > > +static inline bool lru_refs_is_active(unsigned int refs)
> > > > +{
> > > > +       VM_WARN_ON_ONCE(refs > LRU_REFS_MAX);
> > > > +       return refs >=3D LRU_REFS_ACTIVATED;
> > > > +}
> > > > +
> > > >  static inline bool lru_gen_is_old(struct lruvec *lruvec, int type,=
 int gen)
> > > >  {
> > > >         unsigned long min_seq =3D READ_ONCE(lruvec->lrugen.min_seq[=
type]);
> > > > @@ -294,23 +317,12 @@ static inline bool lru_gen_is_old(struct lruv=
ec *lruvec, int type, int gen)
> > > >                gen =3D=3D lru_gen_from_seq(min_seq + 1);
> > > >  }
> > > >
> > > > -static inline bool lru_gen_is_active(const struct lruvec *lruvec, =
int gen)
> > > > -{
> > > > -       unsigned long max_seq =3D READ_ONCE(lruvec->lrugen.max_seq)=
;
> > > > -
> > > > -       VM_WARN_ON_ONCE(gen >=3D MAX_NR_GENS);
> > > > -
> > > > -       /* see the comment on MIN_NR_GENS */
> > > > -       return gen =3D=3D lru_gen_from_seq(max_seq) || gen =3D=3D l=
ru_gen_from_seq(max_seq - 1);
> > > > -}
> > > > -
> > > >  static inline void lru_gen_update_size(struct lruvec *lruvec, stru=
ct folio *folio,
> > > >                                        int old_gen, int new_gen)
> > > >  {
> > > >         int type =3D folio_is_file_lru(folio);
> > > >         int zone =3D folio_zonenum(folio);
> > > >         int delta =3D folio_nr_pages(folio);
> > > > -       enum lru_list lru =3D type * LRU_INACTIVE_FILE;
> > > >         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> > > >
> > > >         VM_WARN_ON_ONCE(old_gen !=3D -1 && old_gen >=3D MAX_NR_GENS=
);
> > > > @@ -321,19 +333,6 @@ static inline void lru_gen_update_size(struct =
lruvec *lruvec, struct folio *foli
> > > >                 atomic_long_sub(delta, &lrugen->nr_pages[old_gen][t=
ype][zone]);
> > > >         if (new_gen >=3D 0)
> > > >                 atomic_long_add(delta, &lrugen->nr_pages[new_gen][t=
ype][zone]);
> > > > -
> > > > -       /* return now if not a promotion */
> > > > -       if (old_gen < 0 || new_gen < 0)
> > > > -               return;
> > > > -
> > > > -       /* promotion */
> > > > -       if (!lru_gen_is_active(lruvec, old_gen) && lru_gen_is_activ=
e(lruvec, new_gen)) {
> > > > -               __update_lru_size(lruvec, lru, zone, -delta);
> > > > -               __update_lru_size(lruvec, lru + LRU_ACTIVE, zone, d=
elta);
> > > > -       }
> > > > -
> > > > -       /* demotion requires isolation, e.g., lru_deactivate_fn() *=
/
> > > > -       VM_WARN_ON_ONCE(lru_gen_is_active(lruvec, old_gen) && !lru_=
gen_is_active(lruvec, new_gen));
> > > >  }
> > > >
> > > >  static inline unsigned long lru_gen_folio_seq(const struct lruvec =
*lruvec,
> > > > @@ -376,7 +375,8 @@ static inline bool __lru_gen_add_folio(struct l=
ruvec *lruvec, struct folio *foli
> > > >  {
> > > >         unsigned long seq;
> > > >         unsigned long flags;
> > > > -       int gen =3D folio_lru_gen(folio);
> > > > +       unsigned int refs;
> > > > +       int gen;
> > > >         int type =3D folio_is_file_lru(folio);
> > > >         int zone =3D folio_zonenum(folio);
> > > >         int delta =3D folio_nr_pages(folio);
> > > > @@ -384,7 +384,7 @@ static inline bool __lru_gen_add_folio(struct l=
ruvec *lruvec, struct folio *foli
> > > >         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> > > >
> > > >         BUILD_BUG_ON(BIT(LRU_GEN_WIDTH - 1) !=3D MAX_NR_GENS);
> > > > -       VM_WARN_ON_ONCE_FOLIO(gen !=3D -1, folio);
> > > > +       VM_WARN_ON_ONCE_FOLIO(folio_lru_gen(folio) !=3D -1, folio);
> > > >
> > > >         if (folio_test_unevictable(folio) || !lrugen->enabled)
> > > >                 return false;
> > > > @@ -395,10 +395,12 @@ static inline bool __lru_gen_add_folio(struct=
 lruvec *lruvec, struct folio *foli
> > > >         gen =3D lru_gen_from_seq(seq);
> > > >         flags =3D (gen + 1UL) << LRU_GEN_PGOFF;
> > > >         /* see the comment on MIN_NR_GENS about PG_active */
> > > > -       set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK | BIT(PG_=
active), flags);
> > > > +       flags =3D set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK=
 | BIT(PG_active), flags);
> > > > +       /* use the refs from the atomic snapshot to avoid raced upd=
ate */
> > > > +       refs =3D lru_get_refs_flags(flags);
> > > >
> > > >         lru_gen_update_size(lruvec, folio, -1, gen);
> > > > -       if (lru_gen_is_active(lruvec, gen))
> > > > +       if (lru_refs_is_active(refs))
> > > >                 lru +=3D LRU_ACTIVE;
> > > >         __update_lru_size(lruvec, lru, zone, delta);
> > > >
> > > > @@ -425,24 +427,33 @@ static inline bool lru_gen_add_rejected_folio=
(struct lruvec *lruvec, struct foli
> > > >  static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct=
 folio *folio, bool reclaiming)
> > > >  {
> > > >         unsigned long flags;
> > > > -       int gen =3D folio_lru_gen(folio);
> > > > +       unsigned int refs;
> > > > +       int gen;
> > > >         int zone =3D folio_zonenum(folio);
> > > >         int delta =3D folio_nr_pages(folio);
> > > >         enum lru_list lru =3D folio_is_file_lru(folio) * LRU_INACTI=
VE_FILE;
> > > > +       unsigned long max_seq =3D READ_ONCE(lruvec->lrugen.max_seq)=
;
> > > >
> > > > +       /* Keep LRU_REFS_FLAGS: refs carry access history across is=
olation */
> > > > +       flags =3D set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK=
, 0);
> > > > +       gen =3D lru_get_gen_flags(flags);
> > > > +       refs =3D lru_get_refs_flags(flags);
> > > >         if (gen < 0)
> > > >                 return false;
> > > >
> > > >         VM_WARN_ON_ONCE_FOLIO(folio_test_active(folio), folio);
> > > >         VM_WARN_ON_ONCE_FOLIO(folio_test_unevictable(folio), folio)=
;
> > > >
> > > > -       /* for folio_migrate_flags() */
> > > > -       flags =3D !reclaiming && lru_gen_is_active(lruvec, gen) ? B=
IT(PG_active) : 0;
> > > > -       flags =3D set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK=
, flags);
> > > > -       gen =3D ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
> > > > +       /*
> > > > +        * See the comment in lru_gen_folio_seq.  For migration, co=
mpaction,
> > > > +        * or any other isolation of a hot folio, try best to retai=
n its gen
> > > > +        * info. Ideally we would keep the full gen info.
> > > > +        */
> > > > +       if (!reclaiming && ((max_seq - gen) % MAX_NR_GENS) < MIN_NR=
_GENS)
> > > > +               folio_set_active(folio);
> > > >
> > > >         lru_gen_update_size(lruvec, folio, gen, -1);
> > > > -       if (lru_gen_is_active(lruvec, gen))
> > > > +       if (lru_refs_is_active(refs))
> > > >                 lru +=3D LRU_ACTIVE;
> > > >         __update_lru_size(lruvec, lru, zone, -delta);
> > > >         list_del(&folio->lru);
> > > > @@ -499,6 +510,7 @@ static __always_inline void folio_inc_lru_refs_=
fast(struct folio *folio)
> > > >                 return;
> > > >         }
> > > >
> > > > +       BUILD_BUG_ON(LRU_REFS_REFERENCED >=3D LRU_REFS_ACTIVATED);
> > > >         old_flags =3D READ_ONCE(*folio_flags(folio, 0));
> > > >         do {
> > > >                 if (lru_get_refs_flags(old_flags))
> > > > @@ -534,7 +546,7 @@ static inline bool folio_check_lru_refs(const s=
truct folio *folio)
> > > >  static inline void folio_clear_lru_refs(struct folio *folio)
> > > >  {
> > > >         if (lru_gen_enabled())
> > > > -               folio_set_lru_refs(folio, 0);
> > > > +               folio_reset_lru_refs(folio);
> > > >         else
> > > >                 folio_clear_referenced(folio);
> > > >  }
> > >
> > > Can clear_refs race with disabling MGLRU? Once the static key is
> > > off, it can drop refs from 3 to 2 on a folio still on a gen list.
> > > The drain then subtracts it from inactive, though it was counted
> > > as active.
> >
> > Thanks for the very careful review!
> >
> > I think we are fine, folio_reset_lru_refs checks gen >=3D 0 before
> > touching things, gen >=3D 0 means the folio is manged by MGLRU, right?
> > The worst could happen is we clear PG_workingset for CLRU, which
> > really doesn't matter, one metric off by one folio for a very short
> > period and self healing, not a measurable thing even if you do that on
> > purpose.
>
> Thanks, Kairui. The refs-based accounting makes sense to me.
>
> I meant the else branch in folio_clear_lru_refs(). The static key
> can already be off while the folio is still on a gen list. If
> clear_refs drops refs from 3 to 2 there, where do we subtract
> those pages from the active count?

Oh, that's a very good catch! I think we can do this (only changing
the refs reset parts, a few other part need similar adaptation too,
check gen <=3D 0 instead of lru_gen_enabled()):

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index a2442e49aca2..a97fa6b3b140 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -556,16 +556,14 @@ static inline bool folio_check_lru_refs(const
struct folio *folio)
 static inline void folio_clear_lru_refs(struct folio *folio)
 {
-    if (lru_gen_enabled())
+    if (folio_lru_refs(folio))
         folio_reset_lru_refs(folio);
-    else
-        folio_clear_referenced(folio);
 }

 /*
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 4576a7a369e3..3c21463039da 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -965,7 +965,7 @@ void folio_inc_lru_refs(struct folio *folio,
unsigned int flags)
  */
 bool folio_reset_lru_refs(struct folio *folio)
 {
     int type, gen;
     unsigned long seq, new_flags, old_flags;
     long nr_pages =3D folio_nr_pages(folio);
@@ -980,7 +980,15 @@ bool folio_reset_lru_refs(struct folio *folio)
         gen =3D lru_get_gen_flags(old_flags);
         if (!refs)
             break;
-        lru_set_refs_flags(&new_flags, 0);
+        if (gen < 0)
+            refs =3D refs & ~LRU_REFS_REFERENCED;
+        else
+            refs =3D 0;
+        lru_set_refs_flags(&new_flags, new_refs);
     } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));

     if (gen >=3D 0) {

---

In general we can check gen < 0 instead of lru_gen_enabled for a
stable refs manipulation. Switching is a very rare thing, and I hope
we can just delete that sometime later. Thanks for catching this!
