Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A868E18FC99
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 21:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729288662; cv=none; b=p5gEDAGRdSS/hUv8wYDZHN0UJtf7AuPSH7N3qT5Heyf9+0dndHXkkUorzIBLhIHSoRfa0qrJhWVVqi0jfhz6DbQm7T91RNtc24OmWr4KfTTtAaLwhStoOrGcRfyYH/tUhdT41ShastLfiPIrb0E+oMau7X57bl1NZkmHEIvF1BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729288662; c=relaxed/simple;
	bh=HCZMsZpAQBrxa2AhPMoCIWeOljEcR4s8Q7G7h64K6Jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AxuKQIx+uLeY9iL6PzOdR5D/jpEmgAxtK6qg/DQXul6Hvg+rZNC9/yKQChXD/3D3UwhWGDrS3HU0nTS8dd9S4T+oRYCP4EWvdY6tI72WP2PPvjig/3vIAbBsZYIvAGLkW7kLDE/PGaEzspZyCSnfYPkvnvtGz5AfjQMJ6h0alN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K9tIgy1U; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K9tIgy1U"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a3b3f4b2afso62005ab.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 14:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729288660; x=1729893460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2RHdVaLA/1r8YT6FR6xHNJRT28I3khxJDB21yaB3p8=;
        b=K9tIgy1UwstLT7B+m+w3UC64utCCowIDBYXM0Sos7svGkhS4qlp7VstOTyFs+l7l88
         2AZecz1nNu2ZKr8Sa+FhZ0YA3jbVgtqV0vBEzPbl9d6rUh4isPBamLfnKDgbMPTJZVlX
         ydCxENjWTKg5mKah1ZjOjJ9cipFXfx2QwAtbXapM7gHC0mx9CLGwZDv58V23YvyJ89x5
         HsGlWNxYi8FenCELbrkrwJElukuQ8N6G6DrAWiIT0znQmcZ3YMDmrT8dgx4Mbk2beq5y
         yGJTuTjK9zvZOB7CC8VsFZ5F3faK4MVlxIbbZrj15v1dIQM9xqRDjLcqw9NMG4JYcH1j
         wvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729288660; x=1729893460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2RHdVaLA/1r8YT6FR6xHNJRT28I3khxJDB21yaB3p8=;
        b=WZXzbux/3ufDF8I7SnR7g1mf3Y31GLB1BIp4lh2S4BSFZa8gDpj1Z/n3XMjE+vrJ3V
         c2IPJj1iU86om8L0+X4Dl+wjydSxYZwYqzCe7Y7OKsN4PiBAsmFCOKg+ux1ZWc1/SwEy
         9itljZmltLv/tPGZfP3296OtwCN411F4Ae+MuzOv0Ui0iDB7YpGv0FvaV88wTt36gEpI
         LaDicQzKuUa4cnpaESx4vCmAvZKg66uovr3gU+W3/vG+bpZTp2s0QTlfjAkIcVtEZi6T
         OaNlC3j3ieOUrReVIwN6I+7vm7jC2zxqz7lhPmKGBPz5tHD5v0ryWJGHpiTdazmgtFaK
         F2Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUWBU4wzWi5ynjOvrQ2uMwI+Er9bhHbso9DxgL+Q2ByGtVt+7RBYiDf933NRJ0QpAZc+ypVMtODdec=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi8MJZlq0Ysj1a94Z8Ypfc5cWhFvPs5DAWFIOHzczeC7KgNgz6
	2OIT1uTCq3f79i7ESGsMMTybgx6WdQQhXyIOubxTMH2zkrLMUmqKLr6UZxdK4MFPGexMosZVMaX
	U8degSZXiuPfEP3NqDxgJujTlWYgM+/HKaC0F
X-Google-Smtp-Source: AGHT+IHfPiH22npnOGXJz9+1tdq9zNcHnLzDebicv89VSjhYktk+2yqwb46rCfuG1C6oqvQbOj8a9Ynzf6qXh2Xd8h8=
X-Received: by 2002:a05:6e02:1522:b0:3a0:b643:7892 with SMTP id
 e9e14a558f8ab-3a3fa3d7e53mr317555ab.21.1729288659388; Fri, 18 Oct 2024
 14:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014203646.1952505-1-surenb@google.com> <20241014203646.1952505-6-surenb@google.com>
 <CAJD7tkY0zzwX1BCbayKSXSxwKEGiEJzzKggP8dJccdajsr_bKw@mail.gmail.com>
 <cd848c5f-50cd-4834-a6dc-dff16c586e49@nvidia.com> <6a2a84f5-8474-432f-b97e-18552a9d993c@redhat.com>
 <CAJuCfpGkuaCh+PxKbzMbu-81oeEdzcfjFThoRk+-Cezf0oJWZg@mail.gmail.com>
 <9c81a8bb-18e5-4851-9925-769bf8535e46@redhat.com> <CAJuCfpH-YqwEi1aqUAF3rCZGByFpvKVSfDckATtCFm=J_4+QOw@mail.gmail.com>
 <ZxJcryjDUk_LzOuj@tiehlicka> <CAJuCfpGV3hwCRJj6D-SnSOc+VEe5=_045R1aGJEuYCL7WESsrg@mail.gmail.com>
 <ZxKWBfQ_Lps93fY1@tiehlicka> <CAJuCfpHa9qjugR+a3cs6Cud4PUcPWdvc+OgKTJ1qnryyJ9+WXA@mail.gmail.com>
In-Reply-To: <CAJuCfpHa9qjugR+a3cs6Cud4PUcPWdvc+OgKTJ1qnryyJ9+WXA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 18 Oct 2024 14:57:26 -0700
Message-ID: <CAJuCfpHFmmZhSrWo0iWST9+DGbwJZYdZx7zjHSHJLs_QY-7UbA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] alloc_tag: config to store page allocation tag
 refs in page flags
To: Michal Hocko <mhocko@suse.com>
Cc: David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, 
	Yosry Ahmed <yosryahmed@google.com>, akpm@linux-foundation.org, 
	kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de, mcgrof@kernel.org, 
	rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, tglx@linutronix.de, 
	bp@alien8.de, xiongwei.song@windriver.com, ardb@kernel.org, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, pasha.tatashin@soleen.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	yuzhao@google.com, vvvvvv@google.com, rostedt@goodmis.org, 
	iamjoonsoo.kim@lge.com, rientjes@google.com, minchan@google.com, 
	kaleshsingh@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 10:45=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Fri, Oct 18, 2024 at 10:08=E2=80=AFAM Michal Hocko <mhocko@suse.com> w=
rote:
> >
> > On Fri 18-10-24 09:04:24, Suren Baghdasaryan wrote:
> > > On Fri, Oct 18, 2024 at 6:03=E2=80=AFAM Michal Hocko <mhocko@suse.com=
> wrote:
> > > >
> > > > On Tue 15-10-24 08:58:59, Suren Baghdasaryan wrote:
> > > > > On Tue, Oct 15, 2024 at 8:42=E2=80=AFAM David Hildenbrand <david@=
redhat.com> wrote:
> > > > [...]
> > > > > > Right, I think what John is concerned about (and me as well) is=
 that
> > > > > > once a new feature really needs a page flag, there will be obje=
ction
> > > > > > like "no you can't, we need them for allocation tags otherwise =
that
> > > > > > feature will be degraded".
> > > > >
> > > > > I do understand your concern but IMHO the possibility of degradin=
g a
> > > > > feature should not be a reason to always operate at degraded capa=
city
> > > > > (which is what we have today). If one is really concerned about
> > > > > possible future regression they can set
> > > > > CONFIG_PGALLOC_TAG_USE_PAGEFLAGS=3Dn and keep what we have today.=
 That's
> > > > > why I'm strongly advocating that we do need
> > > > > CONFIG_PGALLOC_TAG_USE_PAGEFLAGS so that the user has control ove=
r how
> > > > > this scarce resource is used.
> > > >
> > > > I really do not think users will know how/why to setup this and I w=
ouldn't
> > > > even bother them thinking about that at all TBH.
> > > >
> > > > This is an implementation detail. It is fine to reuse unused flags =
space
> > > > as a storage as a performance optimization but why do you want user=
s to
> > > > bother with that? Why would they ever want to say N here?
> > >
> > > In this patch you can find a couple of warnings that look like this:
> > >
> > > pr_warn("With module %s there are too many tags to fit in %d page fla=
g
> > > bits. Memory profiling is disabled!\n", mod->name,
> > > NR_UNUSED_PAGEFLAG_BITS);
> > > emitted when we run out of page flag bits during a module loading,
> > >
> > > pr_err("%s: alignment %lu is incompatible with allocation tag
> > > indexing, disable CONFIG_PGALLOC_TAG_USE_PAGEFLAGS",  mod->name,
> > > align);
> > > emitted when the arch-specific section alignment is incompatible with
> > > alloc_tag indexing.
> >
> > You are asking users to workaround implementation issue by configuratio=
n
> > which sounds like a really bad idea. Why cannot you make the fallback
> > automatic?
>
> Automatic fallback is possible during boot, when we decide whether to
> enable page extensions or not. So, if during boot we decide to disable
> page extensions and use page flags, we can't go back and re-enable
> page extensions after boot is complete. Since there is a possibility
> that we run out of page flags at runtime when we load a new module,
> this leaves this case when we can't reference the module tags and we
> can't fall back to page extensions, so we have to disable memory
> profiling.
> I could keep page extensions always on just in case this happens but
> that's a lot of memory waste to handle a rare case...

After thinking more about this, I suggest a couple of changes that
IMHO would make configuration simpler:
1. Change the CONFIG_PGALLOC_TAG_USE_PAGEFLAGS to an early boot
parameter. Today we have a "mem_profiling" parameter to enable/disable
memory profiling. I suggest adding "mem_profiling_use_pgflags" to
switch the current behavior of using page extensions to use page
flags. We keep the current behavior of using page extensions as
default (mem_profiling_use_pgflags=3D0) because it always works even
though it has higher overhead.
2. No auto-fallback. If mem_profiling_use_pgflags=3D1 and we don't have
enough page flags (at boot time or later when we load a module), we
simply disable memory profiling with a warning.

I think this would be less confusing for users and will avoid David's
example when performance is unexpectedly degraded. The default option
will work for everyone as it does today and advanced users who want to
minimize the overhead can set mem_profiling_use_pgflags=3D1 to check if
that works for their system.
WDYT?

>
> >
> > --
> > Michal Hocko
> > SUSE Labs
