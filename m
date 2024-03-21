Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F9F1369B5
	for <linux-doc@vger.kernel.org>; Thu, 21 Mar 2024 21:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711055597; cv=none; b=l458n/qXlQlX2/pBwpV/P4yO51432y8yZl7OM3UGGT3m4EK3JpauNobMir05AtH97ZP2IYn/urFOspCY2ztofY7U6FwX0HiFR+Xw7ymHvy8UPkYnY1lg6RqeFLJFfJN+yGqzQ5Rfvm8DJ3XDKyUpAjqJisr6DqyI4kqm54bvMrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711055597; c=relaxed/simple;
	bh=QdWLuurPKKnAKd/0efIBlHX1KMwle2RKzlVXv6YtTy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wjen8vQDCwqqaJ/mxR3QHEcyEdw3N9x+9cWZV/SqAMvzrqsYo9iDpkJqWegUHNr4mkYt20SlPzNVa/Wkjocw7YUCXAdK72GMuF7dDqIHblyoUrF5gP4TrI2tcWGGf1VzIbB5tJ2sm9xTxT9G0+7H2QSrCHb4z2EIDeRd5hj+VPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pL1V3BNr; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pL1V3BNr"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-db3a09e96daso1311757276.3
        for <linux-doc@vger.kernel.org>; Thu, 21 Mar 2024 14:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711055595; x=1711660395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebQxy1c2E58rfYFrtDF0LlwrADqhUaZL+Ah6PQaZrV4=;
        b=pL1V3BNroI1V+L0QVJtIF2Bfjxr9u0dSM7FcbmtcSrpqf8cfuKeIV6bglX3Zapnm4Q
         lW74BtRppnFUHzxeT+5zkNdcUymSOJwC6PJyUlISyZAmiTOVNcQHrl5bjQmLke0jshL1
         NoaQWgozgUIQKha6dpdZ7wLH1e3jUE1eGUBvvmjb8xf1hF+7Oy9NY0D0WqoNKwlbp/VX
         6WAstCHbwWZ9PX8I92qnHu+6mLPu3GOt2TbuZf5ASnUY8jDx1iYIiyLJJbVGDDDfMO9R
         SqxgQ5eQzWaKNUGvvJElpFJYTzu21KbktvnRr5gy36fzXVTf6Xmz6rgFuQFcDbZ7UXWI
         Qt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711055595; x=1711660395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebQxy1c2E58rfYFrtDF0LlwrADqhUaZL+Ah6PQaZrV4=;
        b=X243aXVYqo5pdnP8Lm2N24vWFVbQo/4ikT2VkFK0P2hg3cvwXOBQAyJp483zPgj2sa
         mvRy1llMToFwDb1FEIdvpzx6xk/i41TuMbkm9POTrj3hjdUV001AFesCm8PMiitByKYX
         SI8mowSpVuijj4qtpbbPc/BL//QbKpp1m4xNrDa4AV2MZ5U/3g4Kop5iJVNYZDd0rT4F
         pjYziCkZiSyReg+iIITf9p1mIJYL9IGzTXh3Cz0WicIPYKWnMQ36nWhT97KHi3x0C+VH
         opaMokziEEeGcz+ZlEsP+wSjaiPutFcG9dCYhrxCCqCpsRFO37gFtvOPfNhjcci3cC5u
         K4TA==
X-Forwarded-Encrypted: i=1; AJvYcCUmYwuUrchqmOWMVPaWFS0to5OcbIeQ/1I8YEBoD4W/dO8vaxmSWfxPBlObOrY5rYZaYv7yUsvL3zo85FKJW/7bxmI3eVwDX71j
X-Gm-Message-State: AOJu0Yy4hgS+cN01awo24dE1CKUlnXlG9z9KYK+AJ4TBgW0iDMI6UFJm
	jm6GL0ro2bIU80JeXV/Yi+0pwCP7tBata6Dq11kJzdnAra4jwLkRgAitlr6edi50kbmvoEOMUji
	PG/ZbpLdI9L0ogcUkghK641QbH8dVs7kCqqnE
X-Google-Smtp-Source: AGHT+IGpQFVT0N1V6MSTPFGK3hczVIPcNsqNEuin7eWXL8IMpmHm2qxsutqSmIFxZ5BpkxVe8WmaXZz7+fehjNgm2MU=
X-Received: by 2002:a25:f40f:0:b0:dc7:4367:2527 with SMTP id
 q15-20020a25f40f000000b00dc743672527mr366083ybd.49.1711055594451; Thu, 21 Mar
 2024 14:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321163705.3067592-1-surenb@google.com> <20240321163705.3067592-6-surenb@google.com>
 <20240321133147.6d05af5744f9d4da88234fb4@linux-foundation.org>
In-Reply-To: <20240321133147.6d05af5744f9d4da88234fb4@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 21 Mar 2024 14:13:03 -0700
Message-ID: <CAJuCfpFtXx=NH-Zykh+dfO2fAASV8eObLLxC4Fu_Zu2Y=idZuw@mail.gmail.com>
Subject: Re: [PATCH v6 05/37] fs: Convert alloc_inode_sb() to a macro
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, jhubbard@nvidia.com, tj@kernel.org, 
	muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org, 
	pasha.tatashin@soleen.com, yosryahmed@google.com, yuzhao@google.com, 
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com, 
	keescook@chromium.org, ndesaulniers@google.com, vvvvvv@google.com, 
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, 
	glider@google.com, elver@google.com, dvyukov@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, aliceryhl@google.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 1:31=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 21 Mar 2024 09:36:27 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > From: Kent Overstreet <kent.overstreet@linux.dev>
> >
> > We're introducing alloc tagging, which tracks memory allocations by
> > callsite. Converting alloc_inode_sb() to a macro means allocations will
> > be tracked by its caller, which is a bit more useful.
>
> I'd have thought that there would be many similar
> inlines-which-allocate-memory.  Such as, I dunno, jbd2_alloc_inode().
> Do we have to go converting things to macros as people report
> misleading or less useful results, or is there some more general
> solution to this?

Yeah, that's unfortunately inevitable. Even if we had compiler support
we would have to add annotations for such inlined functions.
For the given example of jbd2_alloc_inode() it's not so bad since it's
used only from one location but in general yes, that's something we
will have to improve as we find more such cases.

>
> > --- a/include/linux/fs.h
> > +++ b/include/linux/fs.h
> > @@ -3083,11 +3083,7 @@ int setattr_should_drop_sgid(struct mnt_idmap *i=
dmap,
> >   * This must be used for allocating filesystems specific inodes to set
> >   * up the inode reclaim context correctly.
> >   */
> > -static inline void *
> > -alloc_inode_sb(struct super_block *sb, struct kmem_cache *cache, gfp_t=
 gfp)
> > -{
> > -     return kmem_cache_alloc_lru(cache, &sb->s_inode_lru, gfp);
> > -}
> > +#define alloc_inode_sb(_sb, _cache, _gfp) kmem_cache_alloc_lru(_cache,=
 &_sb->s_inode_lru, _gfp)
>
> Parenthesizing __sb seems sensible here?

Ack.
Let's wait for more comments and then I'll post fixes.
Thanks!
