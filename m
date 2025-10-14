Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B002BFC8F
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 10:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760437159; cv=none; b=Sra7fwn/WjNRpjsBp0eAZA9J8zdvhKffpUKgSY7zIU6If/T3KdkcltzDMZNeCEeRQwaktWwUOYrCORp3xwZoZ1O8TU460SffFGNrFTjwcYj2sPONRbVohHuC9jcv3roq1s+FLgw/mPdthGwanweDLZCPfS7PWkKkXSwvXCKbTP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760437159; c=relaxed/simple;
	bh=XX+rZvIXhJtvIL7uOxz4xW1dsb6uuqCSyoLnZXBNsS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mf45c0yb6A+hjqIv0dZEA5HxLIxRstr796Xv/iRPT3P51P8aHEARvT3N3S2EvruNmdsa1mlbYOJZ+PXKS7UOaNkxfsbgn1HL7DtN3mBDhW/l9YGfXmsNxlRgrSq11ueuC+ceqy31MBVFitB6XUO2CHvXuiBeJoVZa8J8S7dBHfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEVRacHY; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEVRacHY"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8582a34639aso386192085a.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760437157; x=1761041957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GhdPCYEOIPlUxhGKbw+Pmeq+R0XeZpDT4H4TE9DD8w=;
        b=YEVRacHYlyKqcZVQlt+WexZtwvOXk9UVLKgP64Ayn+4XASsRHsLO+WmxzMgxa2qbwb
         +Klo+CPTmMljRK0NC93SlWyo5I4DN2CKOt3jcNoKRC5ECZJTJArIWynlreEyj2O0aWPX
         p0hN2N8LMUamDTzii5ftX0BvrfmtK8DTOiGJduZvwkTtW3PohHRrKUoEmBsy5FZOGGlk
         DG0B5gYdfYNHcrmNwarcueAnlXBzroNzwe177n2SIWa8SkA7JGyh0N+XznpVRx7AMnrI
         a+5rbFzUlJqyuE6YgYQo8rTXcJ5icnTxVVZyGdePtHzc7bRYSdKtD7jzy520WkJB+hox
         iPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760437157; x=1761041957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GhdPCYEOIPlUxhGKbw+Pmeq+R0XeZpDT4H4TE9DD8w=;
        b=EfZeDTx6Peo9rNxiduwBc15+eW9+lJWucMlGO8NhVJAilH/dsq3EssZz79ltEfuGqH
         lTIyxJQTmA5J7vsTYd63Liv/saVvIeo1VXc904iVirbM8VnaUw0VJKyUQHf+rNji4F5X
         1U0ngO+3p/k8oNK2syRlnRsvaZLO7DYscA0bfyCcl4Xq2Wu/WlTOpEmKDFGebFF4Lyzj
         Ui622dDSr/oN3TFcuYfwq8/XB2y+NRDg3z944o7Xbd7cox0ura0t29pdLS0MS8/AOtEm
         eXLhKPFiSgTbT06L6EjgvbypJ6d7IwyxihZQDF6M8Wg7Et8WE/l8nsk9JuKhspd0Ypel
         edoA==
X-Forwarded-Encrypted: i=1; AJvYcCX1sVv9Iyp8l/6HFdabJLC204ub3sPfRLL4Cft7hMPJEmk6WuVHt5kfTMqHeLpFpcgqiwMJ7MGrWDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyStEt2+aOVzpY4riAfsXqUpYPIU7FyhBb+/Cjqoj/PmUqV0Ibm
	95F2Tt4YoY+IlNW8OhWs3czLhfk+5NrEpnwiNtM/G0/fjmCqgMsRBIcYL7nR7os5+R4W1jhgqmP
	Nc/+8Sgn1RGxHZBhGnQWqjAj8XUO4QuY=
X-Gm-Gg: ASbGnctH9SXXJmyngOqNtq1/5aIk+qFIG9da2guv2/DBgqKXqRSDjt/HSMuESAI+350
	vZ6jq052gSSKz0Z5L9iRhpNJnhagxFTgb9QQDy579gqRH2xb1xwxrA27wto6OHpUUyTLgl1Ku3R
	aLbrW3RG6wOx1dJRLhhRTuIkp1gm8xu2SC4ocfiNyeUOrHrunW4/flOr6tvF1/PIC4FcvgnqEkh
	g71xEbozwLBC2yX8x3F1spYlwbASzCk0O5dqGl81jUOt+LIv1JvuzsVzNfX3cI3RHji
X-Google-Smtp-Source: AGHT+IHkG+3MijbAqPzBuX6WT5qM1UH5wFEx4+o96mRJarvePfqJF8HiiyZhUvW6BxCxk3W2HxXrCx44GyONpuhGsYg=
X-Received: by 2002:a05:620a:1a82:b0:864:c4b9:da16 with SMTP id
 af79cd13be357-883570ce5e8mr3684480185a.73.1760437156675; Tue, 14 Oct 2025
 03:19:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013101636.69220-1-21cnbao@gmail.com> <aO11jqD6jgNs5h8K@casper.infradead.org>
 <CAGsJ_4x9=Be2Prbjia8-p97zAsoqjsPHkZOfXwz74Z_T=RjKAA@mail.gmail.com>
 <CANn89iJpNqZJwA0qKMNB41gKDrWBCaS+CashB9=v1omhJncGBw@mail.gmail.com>
 <CAGsJ_4xGSrfori6RvC9qYEgRhVe3bJKYfgUM6fZ0bX3cjfe74Q@mail.gmail.com> <CANn89iKSW-kk-h-B0f1oijwYiCWYOAO0jDrf+Z+fbOfAMJMUbA@mail.gmail.com>
In-Reply-To: <CANn89iKSW-kk-h-B0f1oijwYiCWYOAO0jDrf+Z+fbOfAMJMUbA@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 14 Oct 2025 18:19:05 +0800
X-Gm-Features: AS18NWC6N5v2tw8omBV7hBy3g3GX8bmzsyDFnwNBZ4EEXltiuUXlhijttlnObnI
Message-ID: <CAGsJ_4wJHpD10ECtWJtEWHkEyP67sNxHeivkWoA5k5++BCfccA@mail.gmail.com>
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

> >
> > >
> > > I think you are missing something to control how much memory  can be
> > > pushed on each TCP socket ?
> > >
> > > What is tcp_wmem on your phones ? What about tcp_mem ?
> > >
> > > Have you looked at /proc/sys/net/ipv4/tcp_notsent_lowat
> >
> > # cat /proc/sys/net/ipv4/tcp_wmem
> > 524288  1048576 6710886
>
> Ouch. That is insane tcp_wmem[0] .
>
> Please stick to 4096, or risk OOM of various sorts.
>
> >
> > # cat /proc/sys/net/ipv4/tcp_notsent_lowat
> > 4294967295
> >
> > Any thoughts on these settings?
>
> Please look at
> https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt
>
> tcp_notsent_lowat - UNSIGNED INTEGER
> A TCP socket can control the amount of unsent bytes in its write queue,
> thanks to TCP_NOTSENT_LOWAT socket option. poll()/select()/epoll()
> reports POLLOUT events if the amount of unsent bytes is below a per
> socket value, and if the write queue is not full. sendmsg() will
> also not add new buffers if the limit is hit.
>
> This global variable controls the amount of unsent data for
> sockets not using TCP_NOTSENT_LOWAT. For these sockets, a change
> to the global variable has immediate effect.
>
>
> Setting this sysctl to 2MB can effectively reduce the amount of memory
> in TCP write queues by 66 %,
> or allow you to increase tcp_wmem[2] so that only flows needing big
> BDP can get it.

We obtained these settings from our hardware vendors.

It might be worth exploring these settings further, but I can=E2=80=99t qui=
te see
their connection to high-order allocations, since high-order allocations ar=
e
kernel macros.

#define SKB_FRAG_PAGE_ORDER     get_order(32768)
#define PAGE_FRAG_CACHE_MAX_SIZE        __ALIGN_MASK(32768, ~PAGE_MASK)
#define PAGE_FRAG_CACHE_MAX_ORDER       get_order(PAGE_FRAG_CACHE_MAX_SIZE)

Is there anything I=E2=80=99m missing?

Thanks
Barry
