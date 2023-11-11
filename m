Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377421C29D
	for <linux-doc@vger.kernel.org>; Sat, 11 Nov 2023 18:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZO32iDzt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3054C433C7
	for <linux-doc@vger.kernel.org>; Sat, 11 Nov 2023 18:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699726953;
	bh=CW5tpNdFHXddseGoEXwpAJxkp57G2fy3axYjwxjjpHo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZO32iDztMvq6aVkH3CzD0/r8MBcZaGFWO9eAU3Fq/0ZfNRrV8BpJOACzV+DIPoyUG
	 IT5GS/ncvux3wNqf1bUBAp/M/c4GaEQFY93g+dBXrAyeP1M/jyz603cvZlLK9U1ZlA
	 A539Yo8f45/h3KpDGlJy6QWg6z+ogtKq/MRI/c/jmymjKb10ez4nbOzp1U7abQKmzm
	 m0NJvEJ+wKmwOzLTesmf6SmGJ5yKW8zbGjBVLLnniJA3MHeMXIx7rNUMzpbAwEFoIz
	 W6+17450o2XA9mU1lTuekTAeL1zaZeCpYxUDmdkUDbYOquNyi6aBF3YAklbVqTUYPp
	 yWsGFiSiQaCPw==
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cc329ce84cso27883325ad.2
        for <linux-doc@vger.kernel.org>; Sat, 11 Nov 2023 10:22:33 -0800 (PST)
X-Gm-Message-State: AOJu0YyUFLZM/8lpGAuy2GMns68pHZxRjr3/TV0onCzlkxuW8YQPLTPJ
	iHbj8QfYdKnkV7Ca+w5vQcYhw/bJnSAZvpzi14uyMA==
X-Google-Smtp-Source: AGHT+IFRst9RU625qAGHUXiFdwUcqInfH7cBpB6bfU2QT9KP7GwFE+6fAD0QjOLiwzcDhmCQ5NB2iGC3TieCzx5Ci+c=
X-Received: by 2002:a17:90a:eac9:b0:27d:9f6:47a3 with SMTP id
 ev9-20020a17090aeac900b0027d09f647a3mr2745035pjb.31.1699726932330; Sat, 11
 Nov 2023 10:22:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106231158.380730-1-nphamcs@gmail.com> <CAF8kJuPXBLpG2d4sje6ntrA+U-AnLzu3sNpJK02YxNcg04YNng@mail.gmail.com>
 <CAKEwX=OgN_xQWrp_OYkK1BRq3DFW4he9OSycdjBm0BNy+vpPAg@mail.gmail.com>
In-Reply-To: <CAKEwX=OgN_xQWrp_OYkK1BRq3DFW4he9OSycdjBm0BNy+vpPAg@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Sat, 11 Nov 2023 10:22:00 -0800
X-Gmail-Original-Message-ID: <CAF8kJuN--EUY95O1jpV39yv5FDu0OYanY6SZeBPk5ng4kRyrjA@mail.gmail.com>
Message-ID: <CAF8kJuN--EUY95O1jpV39yv5FDu0OYanY6SZeBPk5ng4kRyrjA@mail.gmail.com>
Subject: Re: [PATCH v4] zswap: memcontrol: implement zswap writeback disabling
To: Nhat Pham <nphamcs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, tj@kernel.org, lizefan.x@bytedance.com, 
	Johannes Weiner <hannes@cmpxchg.org>, Domenico Cerasuolo <cerasuolodomenico@gmail.com>, 
	Yosry Ahmed <yosryahmed@google.com>, Seth Jennings <sjenning@redhat.com>, 
	Dan Streetman <ddstreet@ieee.org>, Vitaly Wool <vitaly.wool@konsulko.com>, mhocko@kernel.org, 
	roman.gushchin@linux.dev, Shakeel Butt <shakeelb@google.com>, muchun.song@linux.dev, 
	Hugh Dickins <hughd@google.com>, corbet@lwn.net, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm <linux-mm@kvack.org>, kernel-team@meta.com, 
	LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 4:10=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
> > I notice the bool is between two integers.
> > mem_cgroup structure has a few bool sprinkle in different locations.
> > Arrange them together might save a few padding bytes. We can also
> > consider using bit fields.
> > It is a very minor point, the condition also exists before your change.
>
> This sounds like an optimization worthy of its own patch. Two random
> thoughts however:

Sure. I consider this a very minor point as well.

>
> a) Can this be done at the compiler level? I believe you can reduce
> the padding required by sorting the fields of a struct by its size, corre=
ct?
> That sounds like a job that a compiler should do for us...

According to the C standard, the struct member should be layered out
in the order it was declared. There are too many codes that assume the
first member has the same address of the struct. Consider we use
struct for DMA descriptor as well, where the memory layout needs to
match the underlying hardware. Re-ordering the members will be really
bad there. There are gcc extensions to do structure member
randomization. But the randomization layout is determined by the
randomization seed. The compiler actually doesn't have the flexibility
to rearrange the member orders to reduce the padding either.

>
> b) Re: the bitfield idea, some of the fields are CONFIG-dependent (well
> like this one). Might be a bit hairier to do it...

You can declare the bit field under preprocessor condition as well,
just like a normal declare. Can you clarify why it is more hairier?
The bitfield does not have a pointer address associated with it, the
compiler can actually move the bit field bits around. You get the
compiler to do it for you in this case.

>
> >
> > >  #endif /* _LINUX_ZSWAP_H */
> > > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > > index e43b5aba8efc..9cb3ea912cbe 100644
> > > --- a/mm/memcontrol.c
> > > +++ b/mm/memcontrol.c
> > > @@ -5545,6 +5545,11 @@ mem_cgroup_css_alloc(struct cgroup_subsys_stat=
e *parent_css)
> > >         WRITE_ONCE(memcg->soft_limit, PAGE_COUNTER_MAX);
> > >  #if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
> > >         memcg->zswap_max =3D PAGE_COUNTER_MAX;
> > > +
> > > +       if (parent)
> > > +               WRITE_ONCE(memcg->zswap_writeback, READ_ONCE(parent->=
zswap_writeback));
> > > +       else
> > > +               WRITE_ONCE(memcg->zswap_writeback, true);
> >
> > You can combine this two WRITE_ONCE to one
> >
> > bool writeback =3D !parent ||   READ_ONCE(parent->zswap_writeback);
> > WRITE_ONCE(memcg->zswap_writeback, writeback);
> >
>
> Yeah I originally did something similar, but then decided to do the if-el=
se
> instead. Honest no strong preference here - just felt that the if-else wa=
s
> cleaner at that moment.

One WRITE_ONCE will produce slightly better machine code as less
memory store instructions. Normally the compiler is allowed to do the
common expression elimination to merge the write. However here it has
explicite WRITE_ONCE, so the compiler has to place two memory stores
instructions, because you have two WRITE_ONCE. My suggestion will only
have one memory store instruction. I agree it is micro optimization.

Chris
