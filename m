Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336C912D761
	for <linux-doc@vger.kernel.org>; Mon, 26 Feb 2024 17:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708969746; cv=none; b=PIuo92tGXi3CCEGoYCBp01bk/z3NlKQ83BZrogjmGFWIEXPsL3LbCd/XBFN+FIgyLadLkR5vBpWPrDWpR3CBbh8BvYNsRndQVNkSCI0u+cus11oo0VnNzUjkJLgdwmgjN4rx+bJ04ThoKNMYeM5Fo03cv+y+NuAduaYWqOTAYAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708969746; c=relaxed/simple;
	bh=kjTgbrtrQFudnQ2Ks1fdChZ9nj/O1JwPt17wu4Lp+yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OoZVUebJBJ0w36to9CUtOv8FhelNT6z6n/oTbHGaiUUB5AQ3WHJQdF3jRw4p6kKiaDBvvmMlo2SWqhht7sJbxL+GG5zT3kE2kXb4gUp8P5DkIiLYIOLzuC9mpEsTXhjSaDfMmcVCjLXxwUBNcSZg+SRiKWRgCF/D3WEIK7b5qfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hP9OIcFV; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hP9OIcFV"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d094bc2244so39060141fa.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Feb 2024 09:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708969742; x=1709574542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2MfOrnw8vcrCKgg1+LRA9aXdiQ7KcRVPoPiOl2oNZk=;
        b=hP9OIcFV8jpUShnxeslMiAvpz9MYr4tlHQgGAiB/uQsoiXp2YN7SpuvUYlV7BTtJXh
         3tyKDObZ2pjgcya3OwjDzXqRWIiuxm82tD+07TgN2VNq+qhds3dJh5i1comzh13NC6mV
         e2v/i6HUMvz37TzYs73p3u+2WiGt16xPvR1x1iYENDunXFfxsXzBU8K8Bo49mQ+Uwfdm
         GvIW5IkKJIy2eAdhTPc1jDEO2gw4P0UHuhZMN70drFN/VOAwOykIz5ChMhnl6czkzuko
         e6MT9tBbwxIBvYY/SroHkfWBHhzEULDceiTAOd159hS5VDt5wN3DNoQ+dl09n1XfrZCo
         17qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969742; x=1709574542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2MfOrnw8vcrCKgg1+LRA9aXdiQ7KcRVPoPiOl2oNZk=;
        b=XvjjjvvnL92UFTMy27wpsslnW9Fcx0GIJNpi917rX6mzakFaIsMcg78fLFoImY6Qr4
         CusY5sGl2vHegVMjfOnffauASbidmZQJZskRpuKAYzvPmNRsFr6XXtGpMr5SOJX566tZ
         mfgQZz+gXrC5eBjTSQh0et3g5PYxsTJjozSUun027tKUakv2UQpKONQXjrog8tT4Bih8
         K56NMOSE1grGlYO2Hg2+8rl6zsx6Wcx9e+BKfemTQZFkYpV8inLQ3hl/5jlTbhfqYPZa
         wpWkG2gdFRdhFVyFVVWATJ++HCfhF7CABJ6cAWcmkWysy/J85wI/ZpHKpJFD6V0x8d7B
         aDkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGXkL/6EyRLDzP0cQ0RYy0CIzBh5oG/SfyeH9qV4U47iJ+3MhBqf/wNYbFHObdhvSHKUK52Fpg9J6UtUSZDo5JqgFnIu6egdZB
X-Gm-Message-State: AOJu0YwC5H45Hs4ztTflZG2eKN325vDNAlLT1IN87zUoo8Y5SERaMsYa
	ikl5Ws42l5sLoZDtr9aUxWGRgVpKTq3W47ZzSwwaCgea0NaW7MNTt2vsjCEz+b/X2HFzRVLu9Cd
	xirtugZpklcgLvuDJRsjQEppDy7q3VWui0bAD
X-Google-Smtp-Source: AGHT+IGMkZ+7cEJwol9OFFnPnlkwO7m64F/71T4BMwZRitgeDSyoz1rib12v0dNYQtXiC2DOXiB0AGgmNnmExOErSa0=
X-Received: by 2002:a2e:b889:0:b0:2d2:6676:3b0f with SMTP id
 r9-20020a2eb889000000b002d266763b0fmr6282519ljp.22.1708969741996; Mon, 26 Feb
 2024 09:49:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com> <20240221194052.927623-6-surenb@google.com>
 <f68e7f17-c288-4dc9-9ae9-78015983f99c@suse.cz>
In-Reply-To: <f68e7f17-c288-4dc9-9ae9-78015983f99c@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 26 Feb 2024 09:48:46 -0800
Message-ID: <CAJuCfpEQPgg6-TD+-PEsVRXnK=T0Ak6TvMiwz7DbS-q9YxsVcg@mail.gmail.com>
Subject: Re: [PATCH v4 05/36] fs: Convert alloc_inode_sb() to a macro
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
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
	cgroups@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 7:44=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 2/21/24 20:40, Suren Baghdasaryan wrote:
> > From: Kent Overstreet <kent.overstreet@linux.dev>
> >
> > We're introducing alloc tagging, which tracks memory allocations by
> > callsite. Converting alloc_inode_sb() to a macro means allocations will
> > be tracked by its caller, which is a bit more useful.
> >
> > Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > ---
> >  include/linux/fs.h | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/include/linux/fs.h b/include/linux/fs.h
> > index 023f37c60709..08d8246399c3 100644
> > --- a/include/linux/fs.h
> > +++ b/include/linux/fs.h
> > @@ -3010,11 +3010,7 @@ int setattr_should_drop_sgid(struct mnt_idmap *i=
dmap,
> >   * This must be used for allocating filesystems specific inodes to set
> >   * up the inode reclaim context correctly.
> >   */
> > -static inline void *
> > -alloc_inode_sb(struct super_block *sb, struct kmem_cache *cache, gfp_t=
 gfp)
>
> A __always_inline wouldn't have the same effect? Just wondering.

I think inlining it would still keep __LINE__ and __FILE__ pointing to
this location in the header instead of the location where the call
happens. If we change alloc_inode_sb() to inline we will have to wrap
it with alloc_hook() and call kmem_cache_alloc_lru_noprof() inside it.
Doable but this change seems much simpler.

>
> > -{
> > -     return kmem_cache_alloc_lru(cache, &sb->s_inode_lru, gfp);
> > -}
> > +#define alloc_inode_sb(_sb, _cache, _gfp) kmem_cache_alloc_lru(_cache,=
 &_sb->s_inode_lru, _gfp)
> >
> >  extern void __insert_inode_hash(struct inode *, unsigned long hashval)=
;
> >  static inline void insert_inode_hash(struct inode *inode)
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
