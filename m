Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B4A2F6569
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 16:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760546361; cv=none; b=I0HRQF5HrQnzYh9r9cfQD6HyLOpwuBWkiRThKOFr4Yr9clOMCZGwZwq+eMJE86HOpT/anZMrf12a5QyOpNFMsEM+0XwVD19tWa/RwB5aQ4g/S0+VproD05q0GlJ0fImQyXIAlrEvXHzUPxpuQ9+6RmY4Vs/GcOpPVa3OQ6+ya/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760546361; c=relaxed/simple;
	bh=XqB6na94/mJ0K/OgZi4TZF9h11JKDuGh6I2jheNoFF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9Gfcap5e1OrqlyvChBsGo0nXEO6xlh4PPLe0T/h9OOXEEpGggZ/f7/eZo6vsmhSJ0vGROdolf6al/wbnMfzJXz2S8OFyvDmtkmL1GPz854hKn3GaZtvKjFafKgafUP4WGVK4j31wqpYYXrxRhLQ11RYouQxPHDVwwOw48UKM0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AjrJX9q5; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AjrJX9q5"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62fa84c6916so242a12.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 09:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760546357; x=1761151157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzhM5CGB+RoDFW8y/0jUZz7oHPU/o/zMoGAuCJ5t4mg=;
        b=AjrJX9q56DrwDqINUhv9JXvl0DG4lhaE87MOvGDP3UBT4PWbbytMdKEVFxdHRMxzfX
         vwDiHPY/NS2QGIdAfl0jntd0bDacMId8coqk8o3jy4bS68VAGnEx9v//dNCAVtFL7YJG
         QJ4jOxGqnV84ZZa16IPB1n8mZNQwNDn9uilABWbrgxnUFKa6UOoOdvKh9bbW6dcNg+Q5
         FSOSx1X8ehgEDA12EsZ0DsHZQ7m7taIm9dxCkck1NHZFxIqhiq+CtPDoFKIEejTXvTvs
         tlkRRl1nBxys3Th9hWpiGKVauoMghPpOZybJ4Tl/sE1zlwUcgpU+VgXj095NEPS7T1gd
         mqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760546357; x=1761151157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzhM5CGB+RoDFW8y/0jUZz7oHPU/o/zMoGAuCJ5t4mg=;
        b=WFeTIec/ZTyIm2Ra3s6ySaWn1r4KHBW4GFDlQWYiyrWoNQtpdTY09h3XPl6P9gXZPF
         H93HRknshrPo0uYpWf8O4dennBUK68KQ2r7ZXv2jyk05REhu+0MIw0ftVxWr/tUMu4fY
         rCSyC5Ws6ZOqYFbFRe5zpCbeQRdegyTKRqYRGPWgMt+yjhYBE+JjCjMysOqBFhooEF1e
         4cQiCuB6PgPedLF2VoC2i8Nq7nM1rOx2D6OChfnyJNpiAIbJI8H0N9z753KtIHAoK1Tq
         hzUWXhOx71sIAaQsrdU2N+HoxXM3+GtlIT35ujXhLiMNemwI92FyWYykSwcSP6OOU1j8
         KF5g==
X-Forwarded-Encrypted: i=1; AJvYcCXCbjSBjJx+0WuUmS5lYJxW3zlH75StmTjZjeI+lodjpdR053tTWCmkRnT+gydJnJns1gHaXpKDN7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNZdsfZuAJRbtUrMp7zXGW6d/FBxH4U+JytmabmhOzZ0fVN48x
	MU8nO0irYrnnDz91hnYA2yMfVdTjeTtKE64BQZBkyDI+N9qKy9zQZ9iWbiLAyC4pwoBHtHtEMzc
	G+kOt3Y55WhKUcrnBawCBCfXEcea5xYk9FkLqWysT
X-Gm-Gg: ASbGncsaONLU7AW9oHoI4LhUzko0sPtjlrfD0ToAC0qwKYA96T0d1F77lzfAFQctKmD
	9yHATBI/vRKHcCupJlKu8MbHfz0PbncP6YFdIra6igT6pNcgamZXxjZTLC7CjQ5RpLNHgF9xq7j
	JtdV2dsG99tNdrcvhCTSkTht0XtcC29hV4FvR31Z//oIRpYi6zerelZSCb5mH+Qc8uMqZS2czfy
	JDa6v9SM9i/H7FyMPuXVy1xW/hupTuLrEPbj/uMNK8aKcEUdQtJNMiwRFElonA=
X-Google-Smtp-Source: AGHT+IFiVuLYivP034AwNyXAkpK0U9cc8NbdifZyjw09pfdEvHJuVDozucJsWtjEL9bmQH3yJFcdpbpk6wFGjPz12kI=
X-Received: by 2002:a05:6402:3246:20b0:634:38d4:410a with SMTP id
 4fb4d7f45d1cf-63bebfa2921mr142406a12.2.1760546357234; Wed, 15 Oct 2025
 09:39:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013101636.69220-1-21cnbao@gmail.com> <aO11jqD6jgNs5h8K@casper.infradead.org>
 <CAGsJ_4x9=Be2Prbjia8-p97zAsoqjsPHkZOfXwz74Z_T=RjKAA@mail.gmail.com>
 <CANn89iJpNqZJwA0qKMNB41gKDrWBCaS+CashB9=v1omhJncGBw@mail.gmail.com>
 <CAGsJ_4xGSrfori6RvC9qYEgRhVe3bJKYfgUM6fZ0bX3cjfe74Q@mail.gmail.com>
 <CANn89iKSW-kk-h-B0f1oijwYiCWYOAO0jDrf+Z+fbOfAMJMUbA@mail.gmail.com>
 <CAGsJ_4wJHpD10ECtWJtEWHkEyP67sNxHeivkWoA5k5++BCfccA@mail.gmail.com>
 <CANn89iKC_y6Fae9E5ETOE46y-RCqD6cLHnp=7GynL_=sh3noKg@mail.gmail.com>
 <CAGsJ_4x5v=M0=jYGOqy1rHL9aVg-76OgiE0qQMdEu70FhZcmUg@mail.gmail.com>
 <CANn89iJYaNZ+fkKosRVx+8i17HJAB4th645ySMWQEAo6WoCg3w@mail.gmail.com> <CAGsJ_4wYrQuhGY6FuZJzQJjQfx6udRAbP4XZvEevknrpqnkv8g@mail.gmail.com>
In-Reply-To: <CAGsJ_4wYrQuhGY6FuZJzQJjQfx6udRAbP4XZvEevknrpqnkv8g@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 15 Oct 2025 09:39:03 -0700
X-Gm-Features: AS18NWDCakq1h-mH7wphh8y1dVf2NhsytSCg4Cqtn1Pb9vJqQi_9SQu-IJteMNE
Message-ID: <CAJuCfpGf8Hj1QAgNtbRwsBwTOZTidt9sGLwX8PYhiHWYyE9Z1A@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: net: disable kswapd for high-order network buffer allocation
To: Barry Song <21cnbao@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>, Matthew Wilcox <willy@infradead.org>, netdev@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Barry Song <v-songbaohua@oppo.com>, Jonathan Corbet <corbet@lwn.net>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Huacai Zhou <zhouhuacai@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 12:35=E2=80=AFAM Barry Song <21cnbao@gmail.com> wro=
te:
>
> On Wed, Oct 15, 2025 at 2:39=E2=80=AFPM Eric Dumazet <edumazet@google.com=
> wrote:
>
> > > >
> > > > Tell them they are wrong.
> > >
> > > Well, we checked Qualcomm and MTK, and it seems both set these values
> > > relatively high. In other words, all the AOSP products we examined al=
so
> > > use high values for these settings. Nobody is using tcp_wmem[0]=3D409=
6.
> > >
> >
> > The (fine and safe) default should be PAGE_SIZE.
> >
> > Perhaps they are dealing with systems with PAGE_SIZE=3D65536, but then
> > the skb_page_frag_refill() would be a non issue there, because it would
> > only allocate order-0 pages.
>
> I am 100% sure that all of them handle PAGE_SIZE=3D4096. Google is workin=
g on
> 16KB page size for Android, but it is not ready yet(Please correct me
> if 16KB has been
> ready, Suren).

It is ready but it is new, so it will take some time before we see it
in production devices.

>
> >
> > > We=E2=80=99ll need some time to understand why these are configured t=
his way in
> > > AOSP hardware.
> > >
> > > >
> > > > >
> > > > > It might be worth exploring these settings further, but I can=E2=
=80=99t quite see
> > > > > their connection to high-order allocations, since high-order allo=
cations are
> > > > > kernel macros.
> > > > >
> > > > > #define SKB_FRAG_PAGE_ORDER     get_order(32768)
> > > > > #define PAGE_FRAG_CACHE_MAX_SIZE        __ALIGN_MASK(32768, ~PAGE=
_MASK)
> > > > > #define PAGE_FRAG_CACHE_MAX_ORDER       get_order(PAGE_FRAG_CACHE=
_MAX_SIZE)
> > > > >
> > > > > Is there anything I=E2=80=99m missing?
> > > >
> > > > What is your question exactly ? You read these macros just fine. Wh=
at
> > > > is your point ?
> > >
> > > My question is whether these settings influence how often high-order
> > > allocations occur. In other words, would lowering these values make
> > > high-order allocations less frequent? If so, why?
> >
> > Because almost all of the buffers stored in TCP write queues are using
> > order-3 pages
> > on arches with 4K pages.
> >
> > I am a bit confused because you posted a patch changing skb_page_frag_r=
efill()
> > without realizing its first user is TCP.
> >
> > Look for sk_page_frag_refill() in tcp_sendmsg_locked()
>
> Sure. Let me review the code further. The problem was observed on the MM
> side, causing over-reclamation and phone heating, while the source of the
> allocations lies in network activity. I am not a network expert and may b=
e
> missing many network details, so I am raising this RFC to both lists to s=
ee
> if the network and MM folks can discuss together to find a solution.
>
> As you can see, the discussion has absolutely forked into two branches. :=
-)
>
> Thanks
> Barry
