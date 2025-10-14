Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AEC305E2D
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 20:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760473081; cv=none; b=pgE8O+2omDTOSKfqd3RsqVOaSKq5HZa+HmM55x+CNJyFnHKiEpx+EytxdsScXO5JzuSRrQ5mQYBaKTggSOo9D4erdhaj6ljoeEqRrS1TRbJ2GiX/0QqGqS9cohxlCrVwso6vIWV8WkKoYFNsMmcvtUqBGBZ/l3KetWFqk89WHuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760473081; c=relaxed/simple;
	bh=srKo3S0lx/URRHGbZXp1TkwheQoh4KkTklwf9Xdi4pE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q5oG5GvwiFNJcTHLiLW5RUCwppuvZy74N/polZ3rh3oH7FXdRmRL6q2FofXmlNfYdPsqusI5J/Y0Bo6ZGp3r0GGBYGHHHAmI/pRCrc9mzx4ttGzguLHyYyEkTgtvZjjdaXoHuW17mgq5+D47jLxyg15OGbnh+conOfFuCJPUo44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTYMvXjj; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTYMvXjj"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7f04816589bso746763985a.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 13:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760473079; x=1761077879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bT/7SpttvoyPFfDZkD0MSIyAHcwC7WHYJHOJLI1G790=;
        b=LTYMvXjjsk5yZMqLtZFv1oNQEC6A6bVCAakPhssE187+bc+fEr0LXwuk06TmbzfGpe
         RtL8h7b4pzM8QorMiRrT0Ohiatyzh4XfkPMd5ssVwXvDj5BolNznHQOW0kdSJAwRRnka
         aCIDMw7xxOIlg4m15853s8kYoBFlfOyItCCfUL8NoIvO50X0rHssSekCKqXmpadw5NS3
         kFZHP3x04NJcHjcLR5oCqvS6jf93na+0jNZ6aPD+V7OHt5MeQK8Ml+XvQcjHD03+pks4
         OwXM0acPnZN8Abk6eogZmd6TfrBY1R2IbozIU7CFx+ScFpalCnwQ1XiBF1r5VofL6Ng6
         shWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760473079; x=1761077879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bT/7SpttvoyPFfDZkD0MSIyAHcwC7WHYJHOJLI1G790=;
        b=SZJgdUEbqv9R8iS0k5EbHVCxOsC+thN3EzRVc2D2EjuzwECy2HCQ9LvG5hi+sYnjYF
         vl0ErGgnr4HPlu0It8vlWKooDkWDRJIiqJZnIFfJJHRskAn3DojjHBVTNy4FL5uUiNRR
         uhe8l5OluVaypYO1WeeH0cmByRydTII4Dvb0iZQjnqfR/fYXv0sEABq347j2WHfkZZor
         qRNKPzGmpaRHcLCVVzy+EW7AkCnQOrknx5oK+NlhXOW5ZWWUrXxhxuEupdHV4z82UdiE
         W3b6tJmdw9oKutI7afj+fMbLccb0yhnpJwm+o9XIUn3O3zbWPvNd76LdwGZBtEx/1VLa
         zi7A==
X-Forwarded-Encrypted: i=1; AJvYcCW5+MtvVL88tQS4xdQna/4kzlrusKa/7s+oLjggQj47vh6l5IKs5YAVxEr8ope/AWqU/mfCkbr6Fb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQEbCwvPfugDcVpEHbxY2cVNXGiUDOymLJ9iKi51sE/o8kjXlY
	/7uZmKjtZYzLAu2ir1h9bu1fbPzu2lZp9sT4pp5wcNoKxFrZMKJmnQusIa1OpWgS/kyLE++0Bkt
	WrJwSbG1OJ3Mbd5WHZRDTPzqP2TDKpBo=
X-Gm-Gg: ASbGncuf4X4j0sw3SMx/x1s64EOdU01QC7f/ZsNr2cn9xW5sQ3DXpSn/C18H8CzCIzC
	aM0aMqVrHShFAbpTrRaePeSAX2S2XCEGYgvRpf4wTMUpn82aow3w5W4UkFrw1V8Xjjbzf2SFd7F
	jR0BprLm11hDmnjhkdVpv/RNewWwhevFxmh9VBtpeYOi8bnK+FnyXq+kxEtGN7zHctpeXZBqA5P
	sI8pIkRRCA5nyZJy95jPdbZyKAQYGNjl/wszwxvUokE1BBBqJdu3C4xNi8jQ5ns2d+M
X-Google-Smtp-Source: AGHT+IFH4oKwfJUV2I14NgjtJXb6mfnAhJ8zEp3LCF9Bae6duG9Q+7fuIKrLdNF8ldj1eCYSNIUxprx9xOI5hm+x8qg=
X-Received: by 2002:a05:620a:1aa7:b0:863:42ea:d687 with SMTP id
 af79cd13be357-88352d9a142mr3213016685a.78.1760473078522; Tue, 14 Oct 2025
 13:17:58 -0700 (PDT)
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
 <CAGsJ_4wJHpD10ECtWJtEWHkEyP67sNxHeivkWoA5k5++BCfccA@mail.gmail.com> <CANn89iKC_y6Fae9E5ETOE46y-RCqD6cLHnp=7GynL_=sh3noKg@mail.gmail.com>
In-Reply-To: <CANn89iKC_y6Fae9E5ETOE46y-RCqD6cLHnp=7GynL_=sh3noKg@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 15 Oct 2025 04:17:44 +0800
X-Gm-Features: AS18NWA_1i8a6vTg05EcWS4a7WFXDki8J6oo80AKS6W-CO7YvxmVpyAKLiA8th8
Message-ID: <CAGsJ_4x5v=M0=jYGOqy1rHL9aVg-76OgiE0qQMdEu70FhZcmUg@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: net: disable kswapd for high-order network buffer allocation
To: Eric Dumazet <edumazet@google.com>
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

On Tue, Oct 14, 2025 at 6:39=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Tue, Oct 14, 2025 at 3:19=E2=80=AFAM Barry Song <21cnbao@gmail.com> wr=
ote:
> >
> > > >
> > > > >
> > > > > I think you are missing something to control how much memory  can=
 be
> > > > > pushed on each TCP socket ?
> > > > >
> > > > > What is tcp_wmem on your phones ? What about tcp_mem ?
> > > > >
> > > > > Have you looked at /proc/sys/net/ipv4/tcp_notsent_lowat
> > > >
> > > > # cat /proc/sys/net/ipv4/tcp_wmem
> > > > 524288  1048576 6710886
> > >
> > > Ouch. That is insane tcp_wmem[0] .
> > >
> > > Please stick to 4096, or risk OOM of various sorts.
> > >
> > > >
> > > > # cat /proc/sys/net/ipv4/tcp_notsent_lowat
> > > > 4294967295
> > > >
> > > > Any thoughts on these settings?
> > >
> > > Please look at
> > > https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt
> > >
> > > tcp_notsent_lowat - UNSIGNED INTEGER
> > > A TCP socket can control the amount of unsent bytes in its write queu=
e,
> > > thanks to TCP_NOTSENT_LOWAT socket option. poll()/select()/epoll()
> > > reports POLLOUT events if the amount of unsent bytes is below a per
> > > socket value, and if the write queue is not full. sendmsg() will
> > > also not add new buffers if the limit is hit.
> > >
> > > This global variable controls the amount of unsent data for
> > > sockets not using TCP_NOTSENT_LOWAT. For these sockets, a change
> > > to the global variable has immediate effect.
> > >
> > >
> > > Setting this sysctl to 2MB can effectively reduce the amount of memor=
y
> > > in TCP write queues by 66 %,
> > > or allow you to increase tcp_wmem[2] so that only flows needing big
> > > BDP can get it.
> >
> > We obtained these settings from our hardware vendors.
>
> Tell them they are wrong.

Well, we checked Qualcomm and MTK, and it seems both set these values
relatively high. In other words, all the AOSP products we examined also
use high values for these settings. Nobody is using tcp_wmem[0]=3D4096.

We=E2=80=99ll need some time to understand why these are configured this wa=
y in
AOSP hardware.

>
> >
> > It might be worth exploring these settings further, but I can=E2=80=99t=
 quite see
> > their connection to high-order allocations, since high-order allocation=
s are
> > kernel macros.
> >
> > #define SKB_FRAG_PAGE_ORDER     get_order(32768)
> > #define PAGE_FRAG_CACHE_MAX_SIZE        __ALIGN_MASK(32768, ~PAGE_MASK)
> > #define PAGE_FRAG_CACHE_MAX_ORDER       get_order(PAGE_FRAG_CACHE_MAX_S=
IZE)
> >
> > Is there anything I=E2=80=99m missing?
>
> What is your question exactly ? You read these macros just fine. What
> is your point ?

My question is whether these settings influence how often high-order
allocations occur. In other words, would lowering these values make
high-order allocations less frequent? If so, why?
I=E2=80=99m not a network expert, apologies if the question sounds naive.

>
> We had in the past something dynamic that we removed
>
> commit d9b2938aabf757da2d40153489b251d4fc3fdd18
> Author: Eric Dumazet <edumazet@google.com>
> Date:   Wed Aug 27 20:49:34 2014 -0700
>
>     net: attempt a single high order allocation

Thanks
Barry
