Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC991C3F27
	for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2024 19:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733946044; cv=none; b=E0qFPgeuwjM2/pQpEf8wKuoO5+azcpi8gw+FJ9d+mKJLkfwfiL45Ca+40psrxgrrW4laTUStGgn+iQHsCIiq3Kz4bhMxlc65lLFBW5whC0yYSyJ0ijP8q13WVLu3tjToMXU9t0WY8ggu5xh0/IZcQfc2keENqu782C7H7VrPuSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733946044; c=relaxed/simple;
	bh=PlOFHIOkZBBtJiIhHKVfkhxd1vmGGBDqDG2mNZd9mWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msmi01NyeUddVfESJ/dYFHZrMxLYIhxZfjX44QKnWKnO5aVUxwaaue/MYxO6O8moJMlsBXHqSCSnZ8CAE2rtrBDjMkVsACk0TfZjkeqANX/THANiNyfh3K3mysPasV22the3goGWOF5WwT20UNLAz80IWDnA2jaNlmrVrl5ZQHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m7P30MkC; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m7P30MkC"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467896541e1so39391cf.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2024 11:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733946042; x=1734550842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAi2sZAVOfaezM6vHnfZEQr2lBUdILrViUkilAOY9a4=;
        b=m7P30MkCCIal9GAw+XyrFNUWBt90/+NyWJvMlFWTBcEg74CunZ7teavsu3Crxsp+r0
         xNzlUncJwBcA4eY9yu+FS1q3JOB9mYI+MAHVRz1dtfOxqwgQUHeU7R2FOLOML21dyPg2
         tqVd7NwgvMZhBxMJ0aUtP8A4TcewXyjgXfb2WOZdJIs40sE1FNQ0xmPFxHlCuAYuJCFz
         F/8j6StDCkUZm4P+EUGAFakeUCdOcCsYY2fmhZVI8uExxGqjDL9I92jnYhk1QA6qGgle
         i+D2Biq6rRd0GcB4ejbiglbEPRkPuEf7J6aLwHlguwT4wax7g09BdBT+vEOugaOmssYS
         9JZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733946042; x=1734550842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAi2sZAVOfaezM6vHnfZEQr2lBUdILrViUkilAOY9a4=;
        b=u/PDy9rPmMQXGPArQvexCclGiYgFxmyTvYSVJyNTWWgEwcuQCQASo4Y0WPXM4Kw0ja
         zexpABAmWTXx4WauPO2n9LTFtLHl8Q56zksY6Z5xeldOig95E5XfL+ZxWhl4eIIzjp1b
         hbq5j+Yr5fCyEExg+I1w9/NV0zh6P/yh0cyOOwyKLoVL+ltFaIw3jSdHl0Crterdp/cH
         0o6R/LhNIK7sOTFHQ034vBCUHjcDcgTIchEaIVFftW63ADaKloA/axtnPMJPIAg2oCDY
         EdYlRnmQQG281JdwBIYFssrovlxFyptW2Y7vC0f6Ip0W8J478nE584ygsP78+6pnQL1M
         RSQw==
X-Forwarded-Encrypted: i=1; AJvYcCUSzPa6sldVhOA+VuhS39kdf1FZlHPCO+0aGA+CuSZZnuKr9/EChmbxRy6S1MtXj4VCBqP5nIJmKcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKSFhdredhiew7hqUn6/kPOaNNnJmzNfC+Vt43k7572dVSeo4l
	/ud0Rf1LiRr8ORJOdY7/e6gf/578YM/QIDMSnQPJz5G84MAz/vVF2b6Aeig7EBQ36rmT4M02Sgf
	ptkiqXaVeay4Ix0RHz4LkukNLaFc+CuhB8FSA
X-Gm-Gg: ASbGncuq5GXhHi9FCjgrA05WRypkyfwvL3tyqFMOJY71jdlzk9SDVVEWKKWLd0vp15p
	m83gWWGaBv0LmZyhT49OhEia69VOstYgBMb4=
X-Google-Smtp-Source: AGHT+IHe0a/olZGmNb2j063xWVYnWyQiRtYgcQ2KPzSRgRc1IuQoCoKKCfBfPKLaAI8hJccI+cZOsKhE0JwynGSCsXg=
X-Received: by 2002:a05:622a:1f89:b0:461:358e:d635 with SMTP id
 d75a77b69052e-46796e2f498mr396471cf.18.1733946041952; Wed, 11 Dec 2024
 11:40:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209172308.1212819-1-almasrymina@google.com>
 <20241209172308.1212819-5-almasrymina@google.com> <20241210194745.7a0a319e@kernel.org>
In-Reply-To: <20241210194745.7a0a319e@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 11 Dec 2024 11:40:30 -0800
Message-ID: <CAHS8izM45fsLyPxJy-Q9cxXzz-Pb1dHOw0yCHmJTqU8puRTwKg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/5] page_pool: disable sync for cpu for
 dmabuf memory provider
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Willem de Bruijn <willemb@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 7:47=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon,  9 Dec 2024 17:23:07 +0000 Mina Almasry wrote:
> > -static inline void page_pool_dma_sync_for_cpu(const struct page_pool *=
pool,
> > -                                           const struct page *page,
> > -                                           u32 offset, u32 dma_sync_si=
ze)
> > +static inline void
> > +page_pool_dma_sync_netmem_for_cpu(const struct page_pool *pool,
> > +                               const netmem_ref netmem, u32 offset,
> > +                               u32 dma_sync_size)
> >  {
> > +     if (pool->mp_priv)
>
> Let's add a dedicated bit to skip sync. The io-uring support feels
> quite close. Let's not force those guys to have to rejig this.
>

OK.

> > +             return;
> > +
> >       dma_sync_single_range_for_cpu(pool->p.dev,
> > -                                   page_pool_get_dma_addr(page),
> > +                                   page_pool_get_dma_addr_netmem(netme=
m),
> >                                     offset + pool->p.offset, dma_sync_s=
ize,
> >                                     page_pool_get_dma_dir(pool));
> >  }
> >
> > +static inline void page_pool_dma_sync_for_cpu(const struct page_pool *=
pool,
> > +                                           struct page *page, u32 offs=
et,
> > +                                           u32 dma_sync_size)
> > +{
> > +     page_pool_dma_sync_netmem_for_cpu(pool, page_to_netmem(page), off=
set,
> > +                                       dma_sync_size);
>
> I have the feeling Olek won't thank us for this extra condition and
> bit clearing. If driver calls page_pool_dma_sync_for_cpu() we don't
> have to check the new bit / mp_priv. Let's copy & paste the
> dma_sync_single_range_for_cpu() call directly here.

page_pool_get_dma_addr() also does a cast to netmem and bit clearing :/

The whole netmem stuff was written to maximize code reuse. We don't
really special case pages for performance, we convert pages to netmem
then pipe them to through common code paths.  I can special case pages
here but we would also need to copy the implementation of
page_pool_get_dma_addr() as well. But note the tradeoff is some code
duplication. Seems from the discussions it's worth it which is fine by
me.

--=20
Thanks,
Mina
