Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC0C2DC333
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 08:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760429862; cv=none; b=WqOlBBboD5Oyrb1HDsAsWoIwOb5avpy9sd68N08SoI8mlSXL7p8qOHWDhIrwKQL+xjloJQdkdtC1llnjpTW96FOmKTf5r5xzQS5ZQAGq8WX4i0fiIsJjD6ebYBzOxrGsAJZoivD+wSMgV+5ONIJP6d3EOBdbpgs+q6jxtDeiJSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760429862; c=relaxed/simple;
	bh=ZenOGeLl3E07i4+rFBn+dvevjdsbRCIJ235ulzP9wXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l6Q7mBMWlJpFFXv4yLxSY1qBd1DFkQm55IWOKkBngxFvUj3Lj8kmVjzd5+VY75EkbeEGptS6hAW6kjGT8iR6hfHlZalM5UMULs+oZEn0QNRyoUxr3EYFGbsmYAbywYztgRBpmUoKa6Ru2gk+4ziR5/hcABgutnnmxPri0UBP0R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgyuLe8E; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgyuLe8E"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-905b08b09f5so1185028241.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 01:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760429860; x=1761034660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hB5XUi1+cDwXRPWde5CzSKgVrGaXvz4WI2PJ/mRCG6U=;
        b=bgyuLe8ExLUhNGvtBKCIGR1wNkk2Xc0z0JCYLYkJFQ4uugGucHzJIFAlC/8sHbJzWo
         AhM57hqCDwsFeyRbrFzw4bgufX+sSPq+i4V392HFVmN2p1IobGdw1ilLJck2hhh085LN
         2XyfgVU5eWwIvf5SYbB1b3nusA16BrmfUpPfh9usHfvjgF5YVs6SOR6GYzLXIXG+XYTg
         mWtzlL84GGWlG4+efMubetaMcLIDNHDAngbZ5Ptrhl9vR3ybOzsyFWxRivIsnouRnnm0
         thVYt2k7RXbLCSgnyE10z1xr2KqiTxLYOVtOzY5qX3CMWQFj5cjLsp9CCAFe6RFOGM2y
         96xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760429860; x=1761034660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hB5XUi1+cDwXRPWde5CzSKgVrGaXvz4WI2PJ/mRCG6U=;
        b=s/iCrZePBVYgBkWan0I/0nk6H84giBXipP5unOMKu/euvmJdZQXY+WhQHlQN07TYMC
         np35jfKa8+YAJBEuy5QQi4clDm8fVdMAlDgbbBTvqqXBperrvSfHmyNUm3B4bxTKvUCR
         sSRSrrfzYmrhEt03+aEuBDZvetRbVzURm0z1os6WdQpy/+8t9MEwdmkd4GNAUZ9KL506
         kVE3o6fXKK87cSJv91mYUI62tU3lO1AJo70EWAYra3VkGkzXe1Q7rZwg26PY0msxmEEt
         zEcVIz/Ko3p25ZyQnPGp481XTOnfytLL0Y24yjS+9A1QVyH5KO0Es+k2HR9bYD0dEkiU
         4ZJA==
X-Forwarded-Encrypted: i=1; AJvYcCXkOmuBdN2inl3onN2sbvdeORSOONmYqiiY6IISzMBBwLOqtxHeH9yyYWYG/yR9RBirzMAsB80sutw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym0TC1WQw2Y59EI+BdNaq8ZDVZkHqVYx9nsha76fe3iFX58l4G
	84bxEnwWKGz8VEdiMz+eQxaKtZ1fNgwe4TSppNvjOHOta0OvcCzNN1nJ5mZB/4kmEuFg8mNWx0i
	AjRxI7PNxYh+RQdAnwIh15pCn6Lv5N9g=
X-Gm-Gg: ASbGncvsQGdf4rCmvWA4wHcEmQJmRgHWFDbmyrl+heJJEWia+b8X9NuJct/OsfJtYca
	sijL06gxy+/hwpRL9o6xMp0veN8mR8hJpO4OZ8WLefE0z3w4QtZG3+Y0JUuGGnaiMjWr31B9ZdD
	al7fLldnOC6HHtDiVF7tM67N71Z9bkIDjEkh7kJaLA7M2oCKuCH2WCRyKGmU32eCoIxnkrxB3vh
	PtLGQ2+xJHmI3ts2D2///eb5Uk8EnaUiJvbwhpgx1D1fWf+U8RYe05VVERmmiuXwd6d
X-Google-Smtp-Source: AGHT+IE74/+9NMWbvU+qO/+W07sc5FWF1iW+Jodkjrw6Ldi09g2hF8G7tsWXqr3Kth9KAyQqpDa/9zGf3F+nkghdsOo=
X-Received: by 2002:a05:6102:f07:b0:4fc:1a18:aaa2 with SMTP id
 ada2fe7eead31-5d5e2217442mr8155988137.5.1760429859483; Tue, 14 Oct 2025
 01:17:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANn89i+wikOQQrGFXu=L3nKPG62rsBmWer5WpLg5wmBN+RdMqA@mail.gmail.com>
 <20251014035846.1519-1-21cnbao@gmail.com> <CANn89iKCZyYi+J=5t2sdmvtERnknkwXrGi4QRzM9btYUywkDfw@mail.gmail.com>
 <CAGsJ_4ySSn6B+x+4zE0Ld1+AM4q-WnS0LfxzWw22oXr7n5NZ=g@mail.gmail.com> <CANn89i+j_CZM9Q=xTkSq-7cjeRkt29JikD3WqvmPihDrUHBQEQ@mail.gmail.com>
In-Reply-To: <CANn89i+j_CZM9Q=xTkSq-7cjeRkt29JikD3WqvmPihDrUHBQEQ@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 14 Oct 2025 16:17:21 +0800
X-Gm-Features: AS18NWDxwbBeHYYzY9zkajM9730iY7yUrkf_deZ_-1VTrKeqK4m8413YWm5g-Tc
Message-ID: <CAGsJ_4xC=5nCSOv9P7ySONeXwdXN-YK2V+4OZ2zdCOeYiQHvzQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: net: disable kswapd for high-order network buffer allocation
To: Eric Dumazet <edumazet@google.com>
Cc: corbet@lwn.net, davem@davemloft.net, hannes@cmpxchg.org, horms@kernel.org, 
	jackmanb@google.com, kuba@kernel.org, kuniyu@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linyunsheng@huawei.com, mhocko@suse.com, netdev@vger.kernel.org, 
	pabeni@redhat.com, surenb@google.com, v-songbaohua@oppo.com, vbabka@suse.cz, 
	willemb@google.com, zhouhuacai@oppo.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 3:01=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Mon, Oct 13, 2025 at 11:43=E2=80=AFPM Barry Song <21cnbao@gmail.com> w=
rote:
> >
> > > >
> > > > A problem with the existing sysctl is that it only covers the TX pa=
th;
> > > > for the RX path, we also observe that kswapd consumes significant p=
ower.
> > > > I could add the patch below to make it support the RX path, but it =
feels
> > > > like a bit of a layer violation, since the RX path code resides in =
mm
> > > > and is intended to serve generic users rather than networking, even
> > > > though the current callers are primarily network-related.
> > >
> > > You might have a buggy driver.
> >
> > We are observing the RX path as follows:
> >
> > do_softirq
> >     taskset_hi_action
> >        kalPacketAlloc
> >            __netdev_alloc_skb
> >                page_frag_alloc_align
> >                    __page_frag_cache_refill
> >
> > This appears to be a fairly common stack.
> >
> > So it is a buggy driver?
>
> No idea, kalPacketAlloc is not in upstream trees.
>
> It apparently needs high order allocations. It will fail at some point.
>
> >
> > >
> > > High performance drivers use order-0 allocations only.
> > >
> >
> > Do you have an example of high-performance drivers that use only order-=
0 memory?
>
> About all drivers using XDP, and/or using napi_get_frags()
>
> XDP has been using order-0 pages from the very beginning.

Thanks! But there are still many drivers using netdev_alloc_skb()=E2=80=94w=
e
shouldn=E2=80=99t overlook them, right?

net % git grep netdev_alloc_skb | wc -l
     359

Thanks
Barry
