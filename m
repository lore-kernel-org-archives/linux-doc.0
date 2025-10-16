Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22A8302CDB
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 08:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760602728; cv=none; b=PN9tpy/696RYU33bTn8YV6jer3Mi+rOSCcYzOkqzZs9REOVg2JlesSods7eLuSTXxYEgzFAl/B14Bcq7clQLkHS/3uIvm7+WuTBChu1auI3KM7LY5d2gPvkFCBshovmEeZRw3qPCX/pof6d5gx7GfpzrSw/JcmyKMP+tWX1UBus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760602728; c=relaxed/simple;
	bh=YHky9NJmU5RI/PX1MdgC/LSD2GIkMokTbTvw2kfRtCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pYMKim/aOKlkGbX/1K3NN2i9i8oxRBdPHPSuoIkiVk2j+Zf9towkAPbLgCicVWBYsa4SqXsEUFznwSIZrsiSG8T80ff3TSP5vXpRTJrAZnDy4f70gJyOudu2c7E1OR2tcx/weTEqW/4PRTHtXJhP/8DO4eqgacQsRBDUpUj9IOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etUeZPzb; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etUeZPzb"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7815092cd22so5428887b3.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 01:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760602725; x=1761207525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgHYOgNqUKqEBxe2gRboRiYdQxE4NjF5ePcPPbuQMg4=;
        b=etUeZPzbCirYmFFDYVpbD0LLU5/8ZVfii3caD+IIcgeyXWgjk4jjZTJFk5WRs0R0Wv
         NTyTh6ZtlYw7CQGZ7SEAB2gwOHfu7QLOdBaWT7ueaH5xWq20IBtbgxRks4Y68Rski5iu
         n83ZTDc6PAhE7bMYuKVHJTEbn4qw60Ka2Dobmn5m5J7uEk5vWVnvWtvzzYm9TBNhyu6Y
         eGC+DlfPQUqVS8+8ou9P9J6ZqwNKUa2y9rBk5X4YNyw/bhetm4sgiaBxN163dM8TcUjg
         4835FLPHRdDTnNLBjA8OIx4oG5CMUoqLVi1mSijUyfaXTiA80IFaC/U3RCasCJ2SamMH
         FxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760602725; x=1761207525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgHYOgNqUKqEBxe2gRboRiYdQxE4NjF5ePcPPbuQMg4=;
        b=CAyNPRCve8NQk26kQAbdtBBrLhM9yg36sFwS/Wj5zKZTiG6Lq0erC4dDKOI+dw5IIC
         HhzkhzgEZQ+smKuyTkfwxof7WbLLHR6AZVwi4ITf4UY7h3yAwqUnwpBQRM+63FCLZMkv
         LlQe6Iz8/bJvUG1EJdt3yqmmcDwJYXRpGU/Vki9kasdtq1U4UOxnYocI36QMwhCTTnvK
         nEPyWLnOXIV95K1oa7ttBidcJ1VUTAv/lgGu6IRgVqTtBRbLBvsJhtbQ2OTLTTcNHXLz
         1yWZ0vgTU4LRgyUeLJaIoHlowBdZ7NGkAWuSoddJpT5A8WMzspQn/BGz0K/D9YAAp01u
         V28g==
X-Forwarded-Encrypted: i=1; AJvYcCWoL/UrE2K5u1I4Jot2+FE/O2GFrwj2IqTCzLa2wDL+7L94XU89lXtjbKr3iZyOphWCVJpBOvvfySU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHNqcqpDxBlWMj667s7EYH9qho37GnQ7+9Egrti0l8mWIr4Bm9
	4vbUrbdcx3Kg72jfz+pn+11GYQxjXuKwuHzzYg1u/h2/YUOB5kxlEgCwtq60Wnh5luDP9y4Vadh
	ZwemXIF7kpP6+Y+aQFI15H2mkBIZO2e8=
X-Gm-Gg: ASbGncuig2Iyo1nZ6vgtYq4QtWHsuzq/YdR9RU5u0Na5P2vnIENP0lcAINO33tngb+m
	6V6EkODoc6p5hK4bRUZBkQsmaO9o98ULVS348c/XTZb9NeuKSTidLn0uqEBKvlAt1+9WLk9/hmw
	KrB+pKhr1n+R9523BK/F/dC5/4pz4T+oZxUKoIhObBvQxCvwt6jfcsFByenDNU3bfmeNXhleh9v
	X5SMGoXpTeKZiBJbgsutAnz+872Jf+SqS7hDmvp2pmrly84v2T61rghN82IJQbxapmTdfA5
X-Google-Smtp-Source: AGHT+IHVqXd5quXoFkL7TseeikvmflCG1zrHiGi4zY5UsuuarF4PtLzgSuWNSHW7MIFsJygYWpoqCYW0WFpL9IgIR0g=
X-Received: by 2002:a05:690e:4007:b0:63e:dbf:ab89 with SMTP id
 956f58d0204a3-63e0dbfaf6dmr985502d50.21.1760602724828; Thu, 16 Oct 2025
 01:18:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015141716.887-1-laoar.shao@gmail.com> <20251015141716.887-7-laoar.shao@gmail.com>
 <CAEf4BzZYk+LyR0WTQ+TinEqC0Av8MuO-tKxqhEFbOw=Gu+D_gQ@mail.gmail.com>
 <CALOAHbBFcn9fDr_OuT=_JU6ojMz-Rac0CPMYpPfUpF87EWy0kg@mail.gmail.com> <ebf60722-34e1-4607-b6a7-595fc2091998@lucifer.local>
In-Reply-To: <ebf60722-34e1-4607-b6a7-595fc2091998@lucifer.local>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 16 Oct 2025 16:18:08 +0800
X-Gm-Features: AS18NWD2AXGKlmvFo5UH1F2cQyeA_L5yHcpBAgeZL4_sZgqmARGxyWqYqUTXbrc
Message-ID: <CALOAHbDnJyou=MUwPBCEwWeeK+9w2MiOXjpkkcCALExfnsj=_A@mail.gmail.com>
Subject: Re: [RFC PATCH v10 mm-new 6/9] bpf: mark mm->owner as __safe_rcu_or_null
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>, akpm@linux-foundation.org, david@redhat.com, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, 
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, hannes@cmpxchg.org, 
	usamaarif642@gmail.com, gutierrez.asier@huawei-partners.com, 
	willy@infradead.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	ameryhung@gmail.com, rientjes@google.com, corbet@lwn.net, 21cnbao@gmail.com, 
	shakeel.butt@linux.dev, tj@kernel.org, lance.yang@linux.dev, 
	rdunlap@infradead.org, bpf@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 3:21=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Thu, Oct 16, 2025 at 02:42:43PM +0800, Yafang Shao wrote:
> > On Thu, Oct 16, 2025 at 12:36=E2=80=AFAM Andrii Nakryiko
> > <andrii.nakryiko@gmail.com> wrote:
> > >
> > > On Wed, Oct 15, 2025 at 7:18=E2=80=AFAM Yafang Shao <laoar.shao@gmail=
.com> wrote:
> > > >
> > > > When CONFIG_MEMCG is enabled, we can access mm->owner under RCU. Th=
e
> > > > owner can be NULL. With this change, BPF helpers can safely access
> > > > mm->owner to retrieve the associated task from the mm. We can then =
make
> > > > policy decision based on the task attribute.
> > > >
> > > > The typical use case is as follows,
> > > >
> > > >   bpf_rcu_read_lock(); // rcu lock must be held for rcu trusted fie=
ld
> > > >   @owner =3D @mm->owner; // mm_struct::owner is rcu trusted or null
> > > >   if (!@owner)
> > > >       goto out;
> > > >
> > > >   /* Do something based on the task attribute */
> > > >
> > > > out:
> > > >   bpf_rcu_read_unlock();
> > > >
> > > > Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> > > > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > > > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > ---
> > > >  kernel/bpf/verifier.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > >
> > > I thought you were going to send this and next patches outside of you=
r
> > > thp patch set to land them sooner, as they don't have dependency on
> > > the rest of the patches and are useful on their own?
> >
> > Thanks for your reminder.
> > They have been sent separately:
> >
> >   https://lore.kernel.org/bpf/20251016063929.13830-1-laoar.shao@gmail.c=
om/
>
> Could we respin this as a v2 without them then please so we can sensibly =
keep
> the two separate?

Sure, I will send a v2.

>
> Thanks!
>
> >
> > --
> > Regards
> > Yafang
>
> I do intend to have a look through the various conversations on this, jus=
t
> catching up after 2 weeks vacation :) in the kernel this is an eternity, =
even
> during the merge window it seems :P

Huh, we've been refactoring a bit too fast and furious since your last
review ;-)

--=20
Regards
Yafang
