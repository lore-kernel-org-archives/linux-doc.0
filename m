Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEC93093CA
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430319; cv=none; b=Ty+Bt3tyNMrtldRz1aZrvPp80MimWK3mCkHI29mogvqEi6a2XsxKwe3Zg8HTDCrsrHzzIDEqaCrfzFl5nUkZ5zJg1HHU2u6aTMhgz2nqbJAzZHVBIjkWYKgEhyQwtGNBldaiHrVtme1b8l8jC/4O6P/SeZACNjAL8pTDhFeF/es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430319; c=relaxed/simple;
	bh=HDDBJEUGG08qvPrt90w1UW+14TOaO/pVign3zqHVNV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWBMskSQUrE13alMu3FYojWoyGSgYqjueK4CJtvoS3MFNMX0cPI9OUXXK06rxcnEWp7t/7bvYrSj57bw8/PdBdSeMtodFekuR3YiCRclst8g/iRp5NDQRwyABKnzgVWtqPad0LVRURR26K49ayirUtRNnTCoNvww5fVbDfdMUbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C7t94W4P; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C7t94W4P"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-87be45cba29so30898806d6.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 01:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760430317; x=1761035117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xedia4qpks7I7EdQJJs0YGYLRIvZhKtcLLcwC48lucU=;
        b=C7t94W4PAvH672uEregUaYcwuoeRCm/Zj4DNQDs1wJXKE04/ZWxqpNi1sg2htkB/ZM
         5NvsvOb3SosIBZ7mTnjvuktjaorlToQWt37zsaefQUQwJo2aQlpkYKGeDJzq+dpoVEUd
         YUrNvdX+ZV8Yz6kN2+DLp/CisfUXql4C24rwrYsAND+NauYpXjhQzNgNeFzoqmTBahoz
         s5/JVUv9xQ1liMYvWuRHP1YQSvT9rDzXOH/ySvVKqQOJ1lZkAxLdcqvaILDZihqNV/bk
         Iz5Gm4GdBv57G6Cuv+jp+P2ihgDlEz3tyu2WgRWZq/8sRCpkrZjB0FsnuqJz5UOUB+M+
         gmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430317; x=1761035117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xedia4qpks7I7EdQJJs0YGYLRIvZhKtcLLcwC48lucU=;
        b=T4Y5B5rmASQ+rR7ed5naqy6I+Hy7Ui845dAQRt3H3KcaDrKRPWHixeVRFxsdgGwhvt
         edwyDZPsclvYbjJ0e7RtdELTQbjgy+x/RKHHy43WVtGF/Lhf5O5TZi5JmZzBUsrVfhwb
         HwznIzfSTE50HdJi9519S6BV9hlA7cxoJhyaF3TO5EaWNBra2VOGJbfhjgalPLR4Rczg
         0nqfW2rBsSdwjl2Rqnmam4XX4kWj/aCh56dhds63BE3MFyBQjks+popZHEObXWH3Abi1
         WimcbkY0HlRkHYOC2xtH4Fy5cowFMTWerWFA0HntmBymFKyzRf6MYk8yijudwlWqA6J/
         lzog==
X-Forwarded-Encrypted: i=1; AJvYcCXhv2svW8JdHgGzdtMIFMWbkFCZT20bbkXIWgT9xV+JBhO6IRp2J86pUNIfaaq+wyeNHzpcjyoukk4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyru1vffNVIv/KOCHB9t9tYgc3ln+ZP/xaDjjZ5abqwCsYRQCic
	HXtjoQp6SxFnJwieJnJZ/ZIb6H+taTQUgpuGg0p+xEKq3FcGhOouqzLe2L3mquejqMct9dWbQjz
	vd7WqZCTAnaR22QGGedEbZ1rb+A/bYh4IqoWLwRsT
X-Gm-Gg: ASbGnctISC704rgFRQ/LdyOaz+8v9QImtYmZ6u98Ocn8it6JczB85E2lvXCM8qvuosA
	JYFuSB7YgvHAb5D8BkinJ3ynYRJK/cekqJyUqfSlIZR09do6WNE5J6b0x0HgXKiP+ActOz43m2s
	UfOFO8WE7sRfwZBoQmgf2pnKweo+N1JBv5/XMlvz8KsiTFIc9Dnw6wMk66jhSdIUAks2Pavmk3Y
	dkvejAPAhiwQ/jM/YMdr2tiCAbuaozq
X-Google-Smtp-Source: AGHT+IE2XZuUpY6yf1dVWPffNJkuGfhZwF35m+45ndZ/A0W69WaedUjJkm4TDgb9gRxsnIAXSMksxOG9bcF7EYiqZu4=
X-Received: by 2002:ac8:6f1a:0:b0:4b3:2dc:8b84 with SMTP id
 d75a77b69052e-4e6ead513b5mr378830371cf.47.1760430316382; Tue, 14 Oct 2025
 01:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANn89i+wikOQQrGFXu=L3nKPG62rsBmWer5WpLg5wmBN+RdMqA@mail.gmail.com>
 <20251014035846.1519-1-21cnbao@gmail.com> <CANn89iKCZyYi+J=5t2sdmvtERnknkwXrGi4QRzM9btYUywkDfw@mail.gmail.com>
 <CAGsJ_4ySSn6B+x+4zE0Ld1+AM4q-WnS0LfxzWw22oXr7n5NZ=g@mail.gmail.com>
 <CANn89i+j_CZM9Q=xTkSq-7cjeRkt29JikD3WqvmPihDrUHBQEQ@mail.gmail.com> <CAGsJ_4xC=5nCSOv9P7ySONeXwdXN-YK2V+4OZ2zdCOeYiQHvzQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4xC=5nCSOv9P7ySONeXwdXN-YK2V+4OZ2zdCOeYiQHvzQ@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 14 Oct 2025 01:25:05 -0700
X-Gm-Features: AS18NWCsffjFXuh9SOpm483ZoDLgHXwm8ssjSph3yipxi4Ti2I03tEtjJ8_KnP0
Message-ID: <CANn89iK0OWswFFHH10PLzFdcFxZXodWorR5YJSdPq+P6+Qsu1Q@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: net: disable kswapd for high-order network buffer allocation
To: Barry Song <21cnbao@gmail.com>
Cc: corbet@lwn.net, davem@davemloft.net, hannes@cmpxchg.org, horms@kernel.org, 
	jackmanb@google.com, kuba@kernel.org, kuniyu@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linyunsheng@huawei.com, mhocko@suse.com, netdev@vger.kernel.org, 
	pabeni@redhat.com, surenb@google.com, v-songbaohua@oppo.com, vbabka@suse.cz, 
	willemb@google.com, zhouhuacai@oppo.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 1:17=E2=80=AFAM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Tue, Oct 14, 2025 at 3:01=E2=80=AFPM Eric Dumazet <edumazet@google.com=
> wrote:
> >
> > On Mon, Oct 13, 2025 at 11:43=E2=80=AFPM Barry Song <21cnbao@gmail.com>=
 wrote:
> > >
> > > > >
> > > > > A problem with the existing sysctl is that it only covers the TX =
path;
> > > > > for the RX path, we also observe that kswapd consumes significant=
 power.
> > > > > I could add the patch below to make it support the RX path, but i=
t feels
> > > > > like a bit of a layer violation, since the RX path code resides i=
n mm
> > > > > and is intended to serve generic users rather than networking, ev=
en
> > > > > though the current callers are primarily network-related.
> > > >
> > > > You might have a buggy driver.
> > >
> > > We are observing the RX path as follows:
> > >
> > > do_softirq
> > >     taskset_hi_action
> > >        kalPacketAlloc
> > >            __netdev_alloc_skb
> > >                page_frag_alloc_align
> > >                    __page_frag_cache_refill
> > >
> > > This appears to be a fairly common stack.
> > >
> > > So it is a buggy driver?
> >
> > No idea, kalPacketAlloc is not in upstream trees.
> >
> > It apparently needs high order allocations. It will fail at some point.
> >
> > >
> > > >
> > > > High performance drivers use order-0 allocations only.
> > > >
> > >
> > > Do you have an example of high-performance drivers that use only orde=
r-0 memory?
> >
> > About all drivers using XDP, and/or using napi_get_frags()
> >
> > XDP has been using order-0 pages from the very beginning.
>
> Thanks! But there are still many drivers using netdev_alloc_skb()=E2=80=
=94we
> shouldn=E2=80=99t overlook them, right?
>
> net % git grep netdev_alloc_skb | wc -l
>      359

Only the ones that are using 16KB allocations like some WAN drivers :)

Some networks use MTU=3D9000

If a hardware does not provide SG support on receive, a kmalloc()
based will use 16KB of memory.

By using a frag allocator, we can pack 3 allocations per 32KB instead of 2.

TCP can go 50% faster.

If memory is short, it will fail no matter what.
