Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD40E44389
	for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 16:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708361738; cv=none; b=a9RO5pHcHbWmOVoK3+petXkVdwVjGCUo0eVuFk5rg6dP/uesT7uCIU/KP27muqF0ZOZoTq+oR2VD6iceKtPWZfzswHNbYNXeLYpfutoGW5bgltWuVL63GxqCj7xy6SJCYS2TMYIJjoGwfzA2KUlDF0nNf0NQnA9/47lFK6ywxDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708361738; c=relaxed/simple;
	bh=L2Wk+KfPMqWFy+4dwx61nIYX1yKhjaAyyhWHKrdqFeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JwsRUKDxMv550zliVs5btoLjiAbkeN/pgqmfSu66pVc6i0C+/BzIEFVWBWij+h97FO/bj76TC10OwDNzHrdPVPZ7Vnqa5r6bGzZWE1BLMcU4T1llX996Z24BqbOYrTu/Zl0NEggnH9tYMpZ+I9MEG7Nct3KTn3OEa9+2jx6a9yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oPNel+AE; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oPNel+AE"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso4210694276.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 08:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708361735; x=1708966535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MC1JxayV7V5FEwBjiEEHat04AtMi8UdAlknxmmQHPbY=;
        b=oPNel+AEfT6QxnlSUjYSEDUu1xpgigNIII6ykI90ZiS+CFEeAPyhQzauHwzAZhmT/Z
         7+HGhQOEZmCKoVJ/bNLPexUgfbJBlNLdT1fandymrCGc9RzqTOGAJnWAeV8zXlgfkYLY
         uOza4Y1kGzK602hUWp1AQag6eO5m3UGPqv6uHZYA18nImWYTS0wRh42S3St8WqdT2I8C
         qngA6NGvvwTIXoUQWiOaZBlSQgV72HUCTe1AfMCBpNZuP9sSItKJyjD5R2UE3p5E8NMH
         WKQlTGEKjZPqM/DbJaD9p2CAfZWWFR/O2ybkpT5p+VjSDS3B4NZgWJcmyWzOpwpZjybT
         rdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708361736; x=1708966536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MC1JxayV7V5FEwBjiEEHat04AtMi8UdAlknxmmQHPbY=;
        b=Xx7ywqfAXEjqJOGk50DX5kCBUtNRLGY4+WCvL8QkPZ3RtfKu6Q7BSJq4dh8OY3mpUV
         rQHgO/kNDFhx+Pbs1xHsFasR4SfJJgvdyWrGPf5vvwhhzlXmrM7DVSlI3Kz8kTBw5ydJ
         WQQwqexCnhnPMpFMsKx05Hb/5CrYLPv2JVEWl4uH/4xsgQoV8EHaTVUVoEwACYQl3Qzk
         PPIH1RxjjGGrLJia8IlX475opuv0k+x1mNC1iAxWXSgAfLaCCZ+iUv/O+amZkBFp105A
         OiuYMxj4aE9DVLv7x7psmQtbu8+gOKI4wqRkSGR706+3oLbHFiB2aznylyq3atWUgj/R
         JO3w==
X-Forwarded-Encrypted: i=1; AJvYcCVYqzeWi7hENnaRarZWJhE41cKoULq7rGOUBgG36J5wzIl2AN+NHJsT8n+86M6wMQS3VKH0luBOep2iNpRNk8Y1bo+Ci5C/P0vg
X-Gm-Message-State: AOJu0Yzq5s2Vj/lEQeAMmsE0qJ29E1FbkaZ/EVSJ6363La0A1eeLnHn4
	11j8QJJkbS+6KLywhmtUPTaIg2534SaDdyDztzacQm2AH9EL3hAF5VZ8MqKD7hQVB1ee6spSKk2
	Atg5rg6ixYvzZxTXIj9Z7Zl7NLilMRjJUM/7P
X-Google-Smtp-Source: AGHT+IE9e4H9CxOF/Wkt1BmMwgF6wG5QNpfKFX5SyoOVKH5zyjhHqyJSbZUQlTjCIfZiNsAQiQ1++39gCNndnejh6es=
X-Received: by 2002:a25:d68b:0:b0:dc6:aed5:718a with SMTP id
 n133-20020a25d68b000000b00dc6aed5718amr10952783ybg.26.1708361735183; Mon, 19
 Feb 2024 08:55:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com> <20240212213922.783301-33-surenb@google.com>
 <f0a56027-472d-44a6-aba5-912bd50ee3ae@suse.cz> <CAJuCfpGUTu7uhcR-23=0d3Wnn8ZbDtNwTaFnukd9qYYVHS9aSA@mail.gmail.com>
 <5bd3761f-217d-45bb-bcd2-797f82c8a44f@suse.cz>
In-Reply-To: <5bd3761f-217d-45bb-bcd2-797f82c8a44f@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 19 Feb 2024 08:55:22 -0800
Message-ID: <CAJuCfpHRqiV2LZEnCB0hwwoexw+8U_XzqH1f+LwLjsQxmXR3Tw@mail.gmail.com>
Subject: Re: [PATCH v3 32/35] codetag: debug: skip objext checking when it's
 for objext itself
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 1:17=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 2/19/24 02:04, Suren Baghdasaryan wrote:
> > On Fri, Feb 16, 2024 at 6:39=E2=80=AFPM Vlastimil Babka <vbabka@suse.cz=
> wrote:
> >>
> >> On 2/12/24 22:39, Suren Baghdasaryan wrote:
> >> > objext objects are created with __GFP_NO_OBJ_EXT flag and therefore =
have
> >> > no corresponding objext themselves (otherwise we would get an infini=
te
> >> > recursion). When freeing these objects their codetag will be empty a=
nd
> >> > when CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled this will lead to f=
alse
> >> > warnings. Introduce CODETAG_EMPTY special codetag value to mark
> >> > allocations which intentionally lack codetag to avoid these warnings=
.
> >> > Set objext codetags to CODETAG_EMPTY before freeing to indicate that
> >> > the codetag is expected to be empty.
> >> >
> >> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >> > ---
> >> >  include/linux/alloc_tag.h | 26 ++++++++++++++++++++++++++
> >> >  mm/slab.h                 | 25 +++++++++++++++++++++++++
> >> >  mm/slab_common.c          |  1 +
> >> >  mm/slub.c                 |  8 ++++++++
> >> >  4 files changed, 60 insertions(+)
> >> >
> >> > diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
> >> > index 0a5973c4ad77..1f3207097b03 100644
> >>
> >> ...
> >>
> >> > index c4bd0d5348cb..cf332a839bf4 100644
> >> > --- a/mm/slab.h
> >> > +++ b/mm/slab.h
> >> > @@ -567,6 +567,31 @@ static inline struct slabobj_ext *slab_obj_exts=
(struct slab *slab)
> >> >  int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
> >> >                       gfp_t gfp, bool new_slab);
> >> >
> >> > +
> >> > +#ifdef CONFIG_MEM_ALLOC_PROFILING_DEBUG
> >> > +
> >> > +static inline void mark_objexts_empty(struct slabobj_ext *obj_exts)
> >> > +{
> >> > +     struct slabobj_ext *slab_exts;
> >> > +     struct slab *obj_exts_slab;
> >> > +
> >> > +     obj_exts_slab =3D virt_to_slab(obj_exts);
> >> > +     slab_exts =3D slab_obj_exts(obj_exts_slab);
> >> > +     if (slab_exts) {
> >> > +             unsigned int offs =3D obj_to_index(obj_exts_slab->slab=
_cache,
> >> > +                                              obj_exts_slab, obj_ex=
ts);
> >> > +             /* codetag should be NULL */
> >> > +             WARN_ON(slab_exts[offs].ref.ct);
> >> > +             set_codetag_empty(&slab_exts[offs].ref);
> >> > +     }
> >> > +}
> >> > +
> >> > +#else /* CONFIG_MEM_ALLOC_PROFILING_DEBUG */
> >> > +
> >> > +static inline void mark_objexts_empty(struct slabobj_ext *obj_exts)=
 {}
> >> > +
> >> > +#endif /* CONFIG_MEM_ALLOC_PROFILING_DEBUG */
> >> > +
> >>
> >> I assume with alloc_slab_obj_exts() moved to slub.c, mark_objexts_empt=
y()
> >> could move there too.
> >
> > No, I think mark_objexts_empty() belongs here. This patch introduced
> > the function and uses it. Makes sense to me to keep it all together.
>
> Hi,
>
> here I didn't mean moving between patches, but files. alloc_slab_obj_exts=
()
> in slub.c means all callers of mark_objexts_empty() are in slub.c so it
> doesn't need to be in slab.h

Ah, I see. I misunderstood your comment. Yes, after slab/slob cleanup
this makes sense.

>
> Also same thing with mark_failed_objexts_alloc() and
> handle_failed_objexts_alloc() in patch 34/35.

Ack. Thanks!

>
