Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4676B2F7AD2
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 10:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760438362; cv=none; b=X2OHYfq5VEHTbe04fmP1nlIPkVT7kQevvvFTgfQb9y8OrfJvaZEi9piMUXnzZ9srhOrKK0HZF8fkSkWRaZR3S5cRfLGxrzBdpQhzq46xBqrxsVvk7z5NhqYWFBkM+ED6bk7mfb3nkHmhW6F05Yw2c4soeV0FUxpj4q7TAn5wTLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760438362; c=relaxed/simple;
	bh=q9P0PZo6cOuJ7XhtTvcQVZCsmpjkgC3FXXL1ZL3FWEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EuIeIgt/bo08omDepsPTdYNR9SFqHJBSlIJak6Z6LOTRJdUQjnNMpvmX0DWygLrDguDIE+hePLzEnSD3s76MFXrOc2/aFY5nZOLrCExJFaCcNJgr8bxxKpWe1Vg8Nn2JqMF8fmD4TiKvttCNDkt8Get65vNJ5D3PHJFZEX7GCLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=utz2bd//; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="utz2bd//"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-7960d69f14bso39269536d6.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 03:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760438359; x=1761043159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8i8HbdVZPfionD4pRoeQJ/6YsnBufC3F7NgJEHPSzVE=;
        b=utz2bd//LCgSaXSDGqKeiciqIpkP6tI+Dub1kST75Ar63td5RhjZn1LRHLph1ddm0o
         W3WmFyGkBnLnL7YpmQiRw2jddQOs7rjCJuLFO0hyJuVQmIDuqyjtWYUO8Z3vKP5yTntx
         Mb2/ByOmHYXtDRDunQDEalMcJ1Z6lk7aZWSVBv374gfDw1mQsd4qlcb+l3fTh55fBwQP
         ZtCmjg2Ad6mLufGgehVeLuglw7VbhXtW1NBvqdLWwIWTIAFBy77RoeeZlGmQHc4Hi5Vg
         ZU2guXOswWdCXlJHfaSaGsLuWYUOmPvB3rvnA63We7uJmzbOjBs62xXm8d0BZ7CccGf6
         jSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760438359; x=1761043159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8i8HbdVZPfionD4pRoeQJ/6YsnBufC3F7NgJEHPSzVE=;
        b=P3nJ0mLRMgL8W1Y57WAb3DRAFQYDszykC0i1XUMg5keCIZXDkjoBZ+sdX0hqSV02xd
         qQJCvogomAFg/++Wv2paE2DcGr7Hq8VgxsNrZHmi1PaoUS0tinsyXJ0vPX/12L2zbII7
         GRdipm7v1C3Luy+6Fg1mFfRFJwiKt/N95U5BO+6HGril8k4s4r9GE08Ewmsn/Vhrk6j/
         EwX8qI8uTw0JStXvLjjQE14wDMqVZQ4xtXmREOQmZtr4rnJm707TaYPnxL9jC2Z24c60
         ejN83XtY9Excv9JAS/qArAjbUnvbIGihoGj0nL5//bPfuBRFIK9OTHXKq5l+WBH63CgH
         Xilw==
X-Forwarded-Encrypted: i=1; AJvYcCXxtQracJezCQbt7leGZBCZ/eI8i0rylAbKCJLBkYxq/169wGYVCvEtW/g/S+7Z++zijx93F7qKA2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ9ZmF6umkJoCfF8wlSmoAD5ORqhiSrBnZQrPyCaWi3Qh10bpk
	JAAaOKy4oZNDMpfmx3+6ZnlKqUg0TdaWcWgC90463KJdrcjkTOPyltmtbNbRXakxGkOiMtreL1t
	Oqcikdq/1dBJEvuelmouTSxmULUXpw6WX5TE9QAAH
X-Gm-Gg: ASbGncuPefHuZq5aUnl+7emnzMiGaT6ure1RPqkGF/z9xn2cAkjaT85aJktn4koz+tf
	gdIL08aacXj0bEWfKC6MToHM2BLzV+rSa1vWVOPryguxR2JGOemaiR/QQUP82kHM/LMUA5iuzSM
	DAK4uh2700bDOwk7Ked+ZgaV9GGzjdpuMZobkvVI/3Lcp6gv12hvlr3R+Wbg6FjtuLQDOwlAUy+
	FDkETZidInflVpHUal4exeMbttTbexy
X-Google-Smtp-Source: AGHT+IEFzNXw/v6xZVTk0phPdvVBFB9EdAErZ6ksdm/dcjAu+K9F+ebHYFJ1AyXwmjljbbFPU7Tg80KyboEacHc3cFc=
X-Received: by 2002:ac8:5d05:0:b0:4e4:2006:b009 with SMTP id
 d75a77b69052e-4e6eaccc55cmr307481031cf.17.1760438358741; Tue, 14 Oct 2025
 03:39:18 -0700 (PDT)
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
 <CANn89iKSW-kk-h-B0f1oijwYiCWYOAO0jDrf+Z+fbOfAMJMUbA@mail.gmail.com> <CAGsJ_4wJHpD10ECtWJtEWHkEyP67sNxHeivkWoA5k5++BCfccA@mail.gmail.com>
In-Reply-To: <CAGsJ_4wJHpD10ECtWJtEWHkEyP67sNxHeivkWoA5k5++BCfccA@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 14 Oct 2025 03:39:07 -0700
X-Gm-Features: AS18NWC6tSD-2fPgi67vs3tdqcGs5ZT4phYwNUo9MOM_IOY7jeMq3pOnwQALTO4
Message-ID: <CANn89iKC_y6Fae9E5ETOE46y-RCqD6cLHnp=7GynL_=sh3noKg@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: net: disable kswapd for high-order network buffer allocation
To: Barry Song <21cnbao@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, netdev@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Barry Song <v-songbaohua@oppo.com>, Jonathan Corbet <corbet@lwn.net>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Huacai Zhou <zhouhuacai@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 3:19=E2=80=AFAM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> > >
> > > >
> > > > I think you are missing something to control how much memory  can b=
e
> > > > pushed on each TCP socket ?
> > > >
> > > > What is tcp_wmem on your phones ? What about tcp_mem ?
> > > >
> > > > Have you looked at /proc/sys/net/ipv4/tcp_notsent_lowat
> > >
> > > # cat /proc/sys/net/ipv4/tcp_wmem
> > > 524288  1048576 6710886
> >
> > Ouch. That is insane tcp_wmem[0] .
> >
> > Please stick to 4096, or risk OOM of various sorts.
> >
> > >
> > > # cat /proc/sys/net/ipv4/tcp_notsent_lowat
> > > 4294967295
> > >
> > > Any thoughts on these settings?
> >
> > Please look at
> > https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt
> >
> > tcp_notsent_lowat - UNSIGNED INTEGER
> > A TCP socket can control the amount of unsent bytes in its write queue,
> > thanks to TCP_NOTSENT_LOWAT socket option. poll()/select()/epoll()
> > reports POLLOUT events if the amount of unsent bytes is below a per
> > socket value, and if the write queue is not full. sendmsg() will
> > also not add new buffers if the limit is hit.
> >
> > This global variable controls the amount of unsent data for
> > sockets not using TCP_NOTSENT_LOWAT. For these sockets, a change
> > to the global variable has immediate effect.
> >
> >
> > Setting this sysctl to 2MB can effectively reduce the amount of memory
> > in TCP write queues by 66 %,
> > or allow you to increase tcp_wmem[2] so that only flows needing big
> > BDP can get it.
>
> We obtained these settings from our hardware vendors.

Tell them they are wrong.

>
> It might be worth exploring these settings further, but I can=E2=80=99t q=
uite see
> their connection to high-order allocations, since high-order allocations =
are
> kernel macros.
>
> #define SKB_FRAG_PAGE_ORDER     get_order(32768)
> #define PAGE_FRAG_CACHE_MAX_SIZE        __ALIGN_MASK(32768, ~PAGE_MASK)
> #define PAGE_FRAG_CACHE_MAX_ORDER       get_order(PAGE_FRAG_CACHE_MAX_SIZ=
E)
>
> Is there anything I=E2=80=99m missing?

What is your question exactly ? You read these macros just fine. What
is your point ?

We had in the past something dynamic that we removed

commit d9b2938aabf757da2d40153489b251d4fc3fdd18
Author: Eric Dumazet <edumazet@google.com>
Date:   Wed Aug 27 20:49:34 2014 -0700

    net: attempt a single high order allocation
