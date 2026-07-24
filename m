Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A9B3C9880
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 22:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784931767; cv=none; b=Am3AyxLPDRrjcZGMZrHmf/Kz8xNyUIazkYvLQJo7exOSCEzwB/BGYwRIf59SEIB7ZfbQKY5f7YjAaxvUdI+Gf8lAYiWrBL1eKnja+9R7vE3IAdisUe1NoQ89GbEsN7GgOcp9MqskNJBCuTOtLvIN0JgPMr6P7kzeO9HC4gqfC9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784931767; c=relaxed/simple;
	bh=OXZKDQ87kQqy8zSD4SMdY4M6jHe3cDz0dPfx73Mi5sU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMNXbdqRvuYmNEjseghzQ/DoJDPkLii0kU52pXHFeQlAfbCVVk+zeUKH+CIGyITIxhlIydGO0a4InFP8HNpHECq+0IJ05eI5kScUimqZv65a2LPVCLP/XuG3N7IcjCw4qgV4epEhgAI3nhrpZKDNRzem+93I51uLaFl2XrDtitc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jX0NIuST; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jX0NIuST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84F61F00ADB
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 22:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784931765;
	bh=OXZKDQ87kQqy8zSD4SMdY4M6jHe3cDz0dPfx73Mi5sU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jX0NIuST7H7h4aKAPJAsCqGkVwC7H3437UBy3bFE5wsiTdrixGUpvAjGuhZ4YgGOj
	 6rjxAyJ/tLJ7KRw7fue9YeK4aXKQHhHT0vY1a7A8IU9Ry6TK9ivv7XqgsC12QRiEKs
	 bFmkmgLBC7LaFcEu7+XE9lzsN66c2r1ZsM7HzvpchQ2tK58mycdX5Smobmv3QtFV0G
	 W8t7Llz06hxUfIGnzbZTIzFTvnFUc+LDdhNJ2U9JBQsri9WvsrMUsubyG9vi7orHCg
	 jWEs+o/o5QW+t9hBxBPwkXPkntjDgGLYLolo4KJzm5vjX6/QZn0ZwIZSxw/JmyFzoX
	 Z0n47iAZ56Iwg==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69f7af97316so1388430a12.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 15:22:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rowqs+eUTfrfMmvxKMSFDwJf2PFrWZqM+HOpAZ9D6hsyYC5W0KID9qisU+f7gUL4J3nyBy2sJTwB+0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7f6JUD0s2eubxTbdOplihRGH72BUkCDkQ4olIm70Z1D3/UUbv
	4P2KsOvn+I/GnHRO5bca9eyEH5IRQ38sY21NuI0eniujZFwA3BxWm6tWASfJBg1r/0uWYpFtyCU
	ax8dCxgbuHoXPP5H0DX1phvxgVPewmR4=
X-Received: by 2002:a17:906:794a:b0:c1c:4858:c19f with SMTP id
 a640c23a62f3a-c1f1eabc1f5mr9842466b.5.1784931764726; Fri, 24 Jul 2026
 15:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-3-jiahao.kernel@gmail.com> <amF7_GB5Rl6OJmt4@cmpxchg.org>
 <CAO9r8zPaUPddYoLz8o+g+xkb-zdkfyB+LqaDOrkzqFSePEV-xA@mail.gmail.com>
 <amIdU1lFxqxTI3Gc@cmpxchg.org> <CAO9r8zPepaekOgaDaVBWyB_F05Ezvz+AJZ8M5+NGQ4BmiJNBkQ@mail.gmail.com>
 <d8de419d-0077-c47c-a5f1-37c229a853ed@gmail.com> <CAO9r8zNq3bRN+mumA5tcdizStpgoqTc++FYuGjvL8spbv4Q8YQ@mail.gmail.com>
 <CAKEwX=MG0F1+my1krUiOrHCn-Lypq2gq-g8Rv07Mz7sC=YEKaw@mail.gmail.com>
 <CAO9r8zOH93mfdjHq+Ljm7X+ykZS_rjzAvp9OBCzo+uyTbM1fDQ@mail.gmail.com> <amO-hwo8OGV5Goz0@cmpxchg.org>
In-Reply-To: <amO-hwo8OGV5Goz0@cmpxchg.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 24 Jul 2026 15:22:32 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMgVmgQET+PUGexAgNqCZavA2YoTTXKSbWWoUv=A=ytSQ@mail.gmail.com>
X-Gm-Features: AUfX_mxJB29BzNphsC7-RiJPu217rkOtkTuaNG2bcSLXzPxEK8QFDnuX2f3Sw9k
Message-ID: <CAO9r8zMgVmgQET+PUGexAgNqCZavA2YoTTXKSbWWoUv=A=ytSQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Nhat Pham <nphamcs@gmail.com>, Hao Jia <jiahao.kernel@gmail.com>, 
	akpm@linux-foundation.org, tj@kernel.org, shakeel.butt@linux.dev, 
	mhocko@kernel.org, mkoutny@suse.com, chengming.zhou@linux.dev, 
	muchun.song@linux.dev, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 12:35=E2=80=AFPM Johannes Weiner <hannes@cmpxchg.or=
g> wrote:
>
> On Fri, Jul 24, 2026 at 11:39:41AM -0700, Yosry Ahmed wrote:
> > On Fri, Jul 24, 2026 at 11:37=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> =
wrote:
> > >
> > > On Fri, Jul 24, 2026 at 10:57=E2=80=AFAM Yosry Ahmed <yosry@kernel.or=
g> wrote:
> > > >
> > > > The numbers generally look good, the store rejection rate is
> > > > decreasing and we are naturally doing more writeback which makes
> > > > sense. The store rejection rate actually increases when the batch s=
ize
> > > > increases to 64, maybe aggressive writeback is more likely to fail =
and
> > > > cause a store rejection, so that also makes sense.
> > > >
> > > > The only part I can't immediately reason about is pswpin. How are w=
e
> > > > reading from physical swap more than we ever wrote to it?
> > >
> > > The same page can be swapped out once, and swap in multiple times :)
> > >
> > > Unlike zswap, physical swap in is not necessarily exclusive. You load
> > > the page in memory, but if the swapfile is not full, etc. etc. you
> > > don't invalidate the copy of the data on the swapfile. At reclaim
> > > time, we notice the page is not dirty, so we just skip (z)swapout.
> >
> > Oh right, I forgot about that, thanks.
> >
> > I still don't fully understand why pswpin is significantly increased
> > with batching here. I would hope that with less LRU inversion we end
> > up with less disk swapin. Probably the test access patterns are just
> > too random compared to real workloads?
>
> Maybe more time in zswap for those tail entries left behind with the
> smaller batch?
>
> That's a 32 entry window that could zswpin with the smaller batch but
> pswpin with the larger one.

Oh I was talking about going from no batching to batch=3D32. pspwin
increased by 387,400 (~30%). We are writing back 272,880 more pages
but we also have 209,837 less store rejections. So overall ~ 63,043
more pages should end up on disk, which doesn't explain the increase
in pspwin.

The only explanation I can think of is that the test is just randomly
accessing memory, so it ends up accessing colder memory that we moved
to disk more than hotter memory that we kept in zswap. IOW, the access
patterns do not conform to a "normal" workload that benefits from the
LRU.
