Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4687F1FF1A5
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736351494; cv=none; b=QVr8OXrI4pHRs3gnWv/Zqs33r16dDuM1dOxOvqzh9Gq0sDXr2kW+0S8PLUkKqL1Xmn/+t5tKQRKp0yiP7GK76F4ataW1Tr0g1gpUB6XiWw45KkPLuSGau+/IzvOZo7709hzhB6oVFrA8yBZ10ETk7eWngo2A9IknJ4vRolkhlwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736351494; c=relaxed/simple;
	bh=TKgw7m0QIb5AAiFZXRq8+htE+EzFKV7W1FcD3O3sgRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=k8zQ8tlwocs9cUj8ima4dI6xzO5GEYv1ql7KDs3Ogy3gOwngWiJATo/PllYTabkA57wm234R/FHiKN45yAiaLNz+FQev7NDEgtyb9TbjGzqejuDn8mUQY03N+IbAqeHevxNxnMTWfPkYTQj7LGiy5tG3aWDFeFUJIXnw4b/vP8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MvbSGSot; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MvbSGSot"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4678c9310afso225391cf.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 07:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736351492; x=1736956292; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67I/eii2fGSHYgJGbfX3cBs1DaiGogWYfZocV6dT03s=;
        b=MvbSGSotJuYx7tManSzM7HU/g93xXlpRQvD7v9u4UJbPd4VI7F6qlZlwv1g3LlIMef
         J4Ul0Cjz1zS0J5xzRLbXtJPBOpmb6jCWJ7a38WinI9mxBj6/CrlM7/pQWF2Y6OCeD1hB
         zzXQUVUekt9gTS4uMWcZHrAWeVl14IjkZ0gVT7DujcRtpEwDNvcB8y7EnE4NzHsyTC3m
         ZMDzLUD62bunKOFm+vJPFDk43IPKNHiYqNT/vPhfPg1LIBI0KwqRiejj/lpodTbRAyrt
         hvuSyIiQsZYTvuVizUDiGOvcOUjJEfnZhZLpVY5PtthmK1soN2hKX3rTkYcAtP4u9oRf
         tQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736351492; x=1736956292;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67I/eii2fGSHYgJGbfX3cBs1DaiGogWYfZocV6dT03s=;
        b=LH4HWSTRAnlHwjjaRz64vqwBMasr1FKVkUvPluh5CU8SpBqurozyQBOo9NwT5m/Uly
         hlxEb2Qjk07/qXWSRgKDenkgdmaEVl3D7MFq83PAkaSf+9JnPUdjnGJ4Ts+iqjxbT64h
         CHAwaO9GUSL2EV7yDDf0v7ajp+MadodGXBjNwoleuuy5MQL6Jm6CHpdRS2jHqFSjQTMj
         TE9Dp5qOC3nE1NV3jPUpluK50323vyghoTd5GD9WzYYtkJlAnH/p/0p/Jvff0p1KJjqB
         f64JSGRLLXLG/2a3q6c1V+RGc0pFDzB2kSTV2gWsWr7QkMoRgeZJ01hUbN9aH2bZqqtm
         Y5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/E62JOcqOpCwdv1cKhgJt1pRcZqFDJ2mKMPT1ujKcS2YNRN2Jx+SZRim5/brbOkOin3Yp2GBWqQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXfXLO5cieNDRCRGMkSPaBMi3LA1ksDvlx5LsyicGkjcjk3Cbq
	WSlAUK+fH6X3Hc7HbztydBQkqEiWdCcRdlAOValbGJ1sLXQkxcBzSgZEsvf2xk/hHnnB1boN0Qa
	njR65jF8Rq8WCq0mJWIHsMkh90JAVYP4yjSXY
X-Gm-Gg: ASbGncssNkIswbWninBQHUAybRTV9aCgL5wKxKiGktJ8azhkjHBNop6UEBrXHrjj77a
	8y4BZ04XODLkDixIwakHm+89xW/O+1bxjIF9Ok9X6FcQFwGXf9ZrrwftyqBz8z5lHON+U
X-Google-Smtp-Source: AGHT+IGAjJ69c3xdt/cOeIDTYcJcuvF5lN4zzXqs2+83I6HeZnTzndRU6K9Q+Ky+4IOkHYETzRAEvkJAbjt6S8+JRdw=
X-Received: by 2002:a05:622a:5ca:b0:467:7ef7:88a3 with SMTP id
 d75a77b69052e-46c70c493a3mr4075591cf.16.1736351491758; Wed, 08 Jan 2025
 07:51:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226200335.1250078-1-surenb@google.com> <xzbyr4v4jhxjovjsbsqikapqddkwyh3sudm3dd3rvxjgcoayda@xqyebxeynnya>
 <CAJuCfpFKWZBLHbgH1dDNPo+6jnz4j4e9qOeKVh2Qy4JYuic71w@mail.gmail.com>
In-Reply-To: <CAJuCfpFKWZBLHbgH1dDNPo+6jnz4j4e9qOeKVh2Qy4JYuic71w@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 8 Jan 2025 07:51:20 -0800
X-Gm-Features: AbW1kvYmq_53L3WCXY_lvkkNZXx9paTFerEl0V7tznZm7zknATJbTiu7mcbsBKw
Message-ID: <CAJuCfpHd2ze7QCg3Z34a2o1ziJ1ZxonByc_=gYSGxkjV7=8mXQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] fixup for mm/debug: print vm_refcnt state when
 dumping the vma
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 10:57=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Tue, Jan 7, 2025 at 10:50=E2=80=AFAM Liam R. Howlett <Liam.Howlett@ora=
cle.com> wrote:
> >
> > * Suren Baghdasaryan <surenb@google.com> [241226 15:03]:
> > > vma->vm_refcnt does not exist when CONFIG_PER_VMA_LOCK=3Dn, therefore
> > > when CONFIG_PER_VMA_LOCK=3Dn and CONFIG_DEBUG_VM=3Dy we need to avoid=
 its
> > > usage in dump_vma().
> >
> > It might be worth having a function that decodes the information in the
> > vma lock and outputs a string that spells out what is going on,
>
> You mean something like "attached, 2 reader(s), 0 writer(s)" instead
> of "refcnt 0x3" ?
>
> > and
> > another that just outputs "not supported" or something.
>
> Do you mean we should report "not supported" when CONFIG_PER_VMA_LOCK=3Dn=
?

Hi Liam,
I have v8 ready for posting except for this patch which I'm not clear
how you wanted to change. I thought printing the raw vm_refcnt for
debugging would be consistent with how we output other fields, like
vm_flags for example (without interpreting each bit).
 Could you please clarify, preferably with a sample output, how you
would like to see vm_refcnt printed? I can also keep this patch out of
the series for now if we are not sure yet how it should be displayed.
It's not critical and can be added later.
Thanks,
Suren.

>
> >
> > This has the benefit of spelling out the state and only having one plac=
e
> > to update in future dump_vma() changes.
> >
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202412270328.HiJX1mRt-l=
kp@intel.com/
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > ---
> > > Fixes https://lore.kernel.org/all/20241226170710.1159679-14-surenb@go=
ogle.com/
> > > posted over mm-unstable.
> > >
> > >  mm/debug.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/mm/debug.c b/mm/debug.c
> > > index 68b3ba3cf603..9c4cbc3733b0 100644
> > > --- a/mm/debug.c
> > > +++ b/mm/debug.c
> > > @@ -178,6 +178,7 @@ EXPORT_SYMBOL(dump_page);
> > >
> > >  void dump_vma(const struct vm_area_struct *vma)
> > >  {
> > > +#ifdef CONFIG_PER_VMA_LOCK
> > >       pr_emerg("vma %px start %px end %px mm %px\n"
> > >               "prot %lx anon_vma %px vm_ops %px\n"
> > >               "pgoff %lx file %px private_data %px\n"
> > > @@ -187,6 +188,17 @@ void dump_vma(const struct vm_area_struct *vma)
> > >               vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> > >               vma->vm_file, vma->vm_private_data,
> > >               vma->vm_flags, &vma->vm_flags, refcount_read(&vma->vm_r=
efcnt));
> > > +#else
> > > +     pr_emerg("vma %px start %px end %px mm %px\n"
> > > +             "prot %lx anon_vma %px vm_ops %px\n"
> > > +             "pgoff %lx file %px private_data %px\n"
> > > +             "flags: %#lx(%pGv)\n",
> > > +             vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->v=
m_mm,
> > > +             (unsigned long)pgprot_val(vma->vm_page_prot),
> > > +             vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> > > +             vma->vm_file, vma->vm_private_data,
> > > +             vma->vm_flags, &vma->vm_flags);
> > > +#endif
> > >  }
> > >  EXPORT_SYMBOL(dump_vma);
> > >
> > > --
> > > 2.47.1.613.gc27f4b7a9f-goog
> > >
