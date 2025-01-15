Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5685A6FB9;
	Wed, 15 Jan 2025 05:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736920335; cv=none; b=YFR2ROmfBXdRxJI5P//vBe0jhcxcMrCpup1E340UNvawyJf1p7dz2DnRVphD3+5bIq1MHuObvw5d6BDo5gZKS9h0MzHntGSAa4wzROvdybGoaQcd55Ii2HQzxd719dX4NT+yaHMcg181Xjg0Ax2CZjmOqR+lSKqPTqQZK5EbN/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736920335; c=relaxed/simple;
	bh=Y1wSGSoHk+uepLb9SM8jRuNa8hKiASBBGeDEXPuKzrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRI/VqakXvU71fvKWFaE4CsX4Q+UrHVPDghTkSubnQy5NTJRQUd+azrghG8vej+Vbn6f0F0kKtzCZMjFbBmw/lOXOmsz4aKrEH2MRruaHzq/MKiHVB0i61LEW+p6aJ5FAOenUtJo2Nb7qjBK0ef/OlcAoW2f37UgbT2JARMZU2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=biddYOrq; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="biddYOrq"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso11090905a12.0;
        Tue, 14 Jan 2025 21:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736920331; x=1737525131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmGLYzBd/8HTvUy3bEAkBES8q2NWj3KZPvLFJGSKkbg=;
        b=biddYOrqPcU0V8FMK14CsTNqc9Zj3UFywkVos20etACGS4tU8EnLciii+F0IAwPOAi
         GxPez621rSq2SlpAoauiax2SWEFM0GJ4ZwqZ38AdYObaidE17PYEWws9j0F9ssZ09It9
         ZQKQ9naU2WVbjV17xH5tnqlUPzUfmFhEO0c4POcDjGqmFYQ1tpCbGm+lb580lRWqcDSW
         WsAzemKVKpAcf2Ofb2VJ8pAIo+wt04+UsU8+RqKp8zBIvFBVPL4FGIRdZr8LSGlcJk47
         IMJybC5zWMTe5nP5hDZJEKVSSo1wPh5oi4CNdf/3iWqUueyyS1MjCvccDwk4nw2iDGbR
         31ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736920331; x=1737525131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmGLYzBd/8HTvUy3bEAkBES8q2NWj3KZPvLFJGSKkbg=;
        b=fzeglsJYz+NG5d5zOI58BeD7J7bT0SH+TycR9Y0mAIS33Od/mHclduxTCI4EnlcYXL
         FtJriDHnGjv1+iEV8uSerU0r25PnM/w7TaOTRqgaiyJh8q9TXzMAso1jsPYqI3VfXqg8
         aNQuxSem6aZ4c9kpRE9NiWatQnEElKEKKaiEnY3KyUuG7ES9lSmCJBeaYlHPa/tfObyf
         v/w8BYKXA4qastn3HdgxyD8X4eu2pKvBStmlg8NcEcS0X/sFM4F1gIklUFAYQ+yR2mYT
         nxFhX00/dbvgx29qlw39TQWpqrrpnQoCDyU2M7ysDvKp1m9OOodoRdTTlJewTzrr3YOP
         BAmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHX34/p7k0BC829YagxiqVDMMlBzlr2YTjH5GbbkarjLdMKkqF0Yq5U607qu0x3XFHFwXQm9qEjbg=@vger.kernel.org, AJvYcCWWufeL+Jjkfm7bU6TuvHX6M5AyBlXw8WSc2NIcLYCjfezSKp0Go9xQa+ES8Mse2cuaRqxte9ea35VaVf+F@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1CKCcNqILAGJllQkTtRq1qwWl92Qk/CtFPNmlhhZmEdTPmhpM
	pdozvYhSXaeRb8T1/Jq+bMcteGQCwDaDgmZWJhA7Kn4VmQG5cnbdS98r9OR1SJ4yQq6/Px4GmVV
	5196DVETwL0oTwZK1nHO0zI8yhTs=
X-Gm-Gg: ASbGncvLMatyj734fgnELVW8vShnLttMQV1wT2pSGBVEpMnfufcp/m3buR7YDRaYCSq
	8yEJC0Ft36TsdB+7HqD+YnoXqJ7z0xbVBs3Mu
X-Google-Smtp-Source: AGHT+IGxmoG8Ccu0fwFqII8pVxFif1L1J0ZO6KSkmjvdddns6A1FdUfmmMnvfjb81GB6dzBXVwm4+YNWJUiqEfk5lws=
X-Received: by 2002:a05:6402:4023:b0:5d0:e2c8:dc8d with SMTP id
 4fb4d7f45d1cf-5d972e1b962mr25035685a12.20.1736920331359; Tue, 14 Jan 2025
 21:52:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-17-surenb@google.com>
 <20250115022703.hqbqdqawvqgrfgxb@master> <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
 <CAGudoHH9-h68S-YV4TObYMRDFe99xAO7Nu3tXF8h_Kds2-MWCw@mail.gmail.com> <CAJuCfpEDfjyfPjck_3VO5vV4RX0K1UYvHe_R8pSv+6iXN=3wsg@mail.gmail.com>
In-Reply-To: <CAJuCfpEDfjyfPjck_3VO5vV4RX0K1UYvHe_R8pSv+6iXN=3wsg@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 15 Jan 2025 06:51:59 +0100
X-Gm-Features: AbW1kvZ5CpX3eNZPkDqD4zGxHnE10tW1NxlAYlM41wuq5tTv7-tM-cRKeFs76x8
Message-ID: <CAGudoHE2aPNThzAK9UrZYAo8CrRTFfu_VuSeyq5r2EhB7x4w0A@mail.gmail.com>
Subject: Re: [PATCH v9 16/17] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: Suren Baghdasaryan <surenb@google.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org, 
	peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 6:47=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Tue, Jan 14, 2025 at 8:00=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com>=
 wrote:
> >
> > On Wed, Jan 15, 2025 at 4:15=E2=80=AFAM Suren Baghdasaryan <surenb@goog=
le.com> wrote:
> > >
> > > On Tue, Jan 14, 2025 at 6:27=E2=80=AFPM Wei Yang <richard.weiyang@gma=
il.com> wrote:
> > > >
> > > > On Fri, Jan 10, 2025 at 08:26:03PM -0800, Suren Baghdasaryan wrote:
> > > >
> > > > >diff --git a/kernel/fork.c b/kernel/fork.c
> > > > >index 9d9275783cf8..151b40627c14 100644
> > > > >--- a/kernel/fork.c
> > > > >+++ b/kernel/fork.c
> > > > >@@ -449,6 +449,42 @@ struct vm_area_struct *vm_area_alloc(struct m=
m_struct *mm)
> > > > >       return vma;
> > > > > }
> > > > >
> > > > >+static void vm_area_init_from(const struct vm_area_struct *src,
> > > > >+                            struct vm_area_struct *dest)
> > > > >+{
> > [snip]
> > > > Would this be difficult to maintain? We should make sure not miss o=
r overwrite
> > > > anything.
> > >
> > > Yeah, it is less maintainable than a simple memcpy() but I did not
> > > find a better alternative. I added a warning above the struct
> > > vm_area_struct definition to update this function every time we chang=
e
> > > that structure. Not sure if there is anything else I can do to help
> > > with this.
> > >
> >
> > Bare minimum this could have a BUILD_BUG_ON in below the func for the
> > known-covered size. But it would have to be conditional on arch and
> > some macros, somewhat nasty.
> >
> > KASAN or KMSAN (I don't remember which) can be used to find missing
> > copies. To that end the target struct could be marked as fully
> > uninitialized before copy and have a full read performed from it
> > afterwards -- guaranteed to trip over any field which any field not
> > explicitly covered (including padding though). I don't know what magic
> > macros can be used to do in Linux, I am saying the support to get this
> > result is there. I understand most people don't use this, but this
> > still should be enough to trip over buggy patches in -next.
>
> If my previous suggestion does not fly I'll start digging into KASAN
> to see how we can use it. Thanks for the tip.
>
> >
> > Finally, the struct could have macros delimiting copy/non-copy
> > sections (with macros expanding to field names), for illustrative
> > purposes:
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index 332cee285662..25063a3970c8 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -677,6 +677,7 @@ struct vma_numab_state {
> >   * getting a stable reference.
> >   */
> >  struct vm_area_struct {
> > +#define vma_start_copy0 vm_rcu
> >         /* The first cache line has the info for VMA tree walking. */
> >
> >         union {
> > @@ -731,6 +732,7 @@ struct vm_area_struct {
> >         /* Unstable RCU readers are allowed to read this. */
> >         struct vma_lock *vm_lock;
> >  #endif
> > +#define vma_end_copy1 vm_lock
> >
> >         /*
> >          * For areas with an address space and backing store,
> >
> > then you would do everything with a series of calls
>
> I'm not sure... My proposed approach with offsetof() I think is a bit
> cleaner than adding macros to denote copy sections. WDYT?
>

another non-copy field may show up down the road and then the person
adding it is going to be a sad panda. wont happen if the "infra" is
there.

but I concede this is not a big deal and i'm not going to bikeshed about it=
.

--=20
Mateusz Guzik <mjguzik gmail.com>
