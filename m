Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AD613D638
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 01:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728954661; cv=none; b=Jb3ROX431CpXnx5anwqfYTdVQKbRAFqXzOBIgzt0ZbSKHrGSr9tAHOZWTFCweMf+PnDKKj/lJY/9vK9o7crxihTd+qoXeqD7ReVWRsp8OA1ZZnOhT0wI3LqJJIjv7jHN6ZvmT2hSx+2FxJIWfafp6cXGyTwD7lQ/d5mPU1uw6yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728954661; c=relaxed/simple;
	bh=G3p3v2IVPnYwW6geyKRP6ZLFOQMbvfxwqtiPANE8Q+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kNFOI0cCZFd76gYUMDZt9i3LWphVQzMpMq8HbdJdCiQ8rMiYOdmgndzc+Z4EIHQ3p/wWCwMFYru609DGlbX/Mad2rII3/br3+HQJE0X0Kf2lYE7PdDzWTEl8de8+G7CDtwG91e+Ezz0LRovAwbtqq+bXMQOau0W0gc/rnOhwHqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x69y2woX; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x69y2woX"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-45fb0ebb1d0so525481cf.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 18:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728954658; x=1729559458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3p3v2IVPnYwW6geyKRP6ZLFOQMbvfxwqtiPANE8Q+w=;
        b=x69y2woXq7U6PGnkmZ1Y7S+TQO+pb3oOGmArAC1ZzKOcTYvjHUvpeTM7+2JJf+v72T
         fuRJDLTFypIE1caGBToh45eWHgjE81lCiJReKj9OorTT0k54IDEfnCCqAWHZBKJtMsdV
         nrVRMI1Lgg+P4VC6JM5YdGHOESyACxGTdU2XHJQ2SZ4NLW5z1QPuIykGmJNTHsXTkhuY
         xiYnBgMX3U2UrVOvP6chiIkTWvE+SWU/b15FFn0As9hxYf7qBpQIErfyx2/gSJygYdl8
         wAPMQlcLIys5Y5/hdNC4SlC5eEsyOAHQ5igC7f/BywPc0XjqpWFPy08txReVXNfTZ8ub
         mGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728954658; x=1729559458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3p3v2IVPnYwW6geyKRP6ZLFOQMbvfxwqtiPANE8Q+w=;
        b=g2EvHUqaC1z0/vn/EeHjOknOyAn2JoX1mQSqkPAOLnRAKFgIWiSMLvv7qMPXsYFzL9
         tDlnwCX5DXVFLzFH5KJF6n0a9IkB4ObrLOa47L868IfO/ZvSEbasHcxrclBvltr8SHQa
         NzdnnGrOEY8G9UrT/oiDpOkGMOiDC/9LfxlhWa/1WelpsDSCj4oavvBb6xHv+spqBEh+
         1G/lDWMOXeqnb8+GbuzAEIiQR2ULjLJsETWyyABc22xA6oO37cIu0aX0ZvVmy7vbXqoN
         Hs7Fc9j9wVoHCcX4nZicSpGQzHg/d3bQS1CmUJGplmf+82mv8hYn6p+hkgKb2DJx3X6A
         ewnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhPb6RzifWNCDOOuHbscxZ8sg5zwt1kIWlExJBE0mXr2wJJgs95DCcsE1rc3F7AP/fzFKXtq+oM4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvECjs/YIX7cm8zQjz295BzPApiWMMO/SAGyonL44zkwksuRMN
	GJsqDYlSUnftQ8YWk2byeD+VzVlzHM2ZFNm9rmIeuXN/8CsCBnJvy8/zA2VreS8X3vSwD69dhjl
	0bVQeBigRcbbiRJrzMwTiqtM71Iw/9weoxRv9
X-Google-Smtp-Source: AGHT+IFuh8W7Uf7fvfrbQy6mJO5wY7T86T49mlOONosOyBbStmXP/uck1Oy8jFpfIjUbdjW4D0wseFu0I1+Pe49OvO0=
X-Received: by 2002:a05:622a:7392:b0:460:49d1:7872 with SMTP id
 d75a77b69052e-46058f5ed56mr6725041cf.28.1728954658009; Mon, 14 Oct 2024
 18:10:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003160620.1521626-1-ap420073@gmail.com> <20241003160620.1521626-8-ap420073@gmail.com>
 <CAHS8izO-7pPk7xyY4JdyaY4hZpd7zerbjhGanRvaTk+OOsvY0A@mail.gmail.com>
 <CAMArcTU61G=fexf-RJDSW_sGp9dZCkJsJKC=yjg79RS9Ugjuxw@mail.gmail.com>
 <20241008125023.7fbc1f64@kernel.org> <CAMArcTWVrQ7KWPt+c0u7X=jvBd2VZGVLwjWYCjMYhWZTymMRTg@mail.gmail.com>
 <20241009170102.1980ed1d@kernel.org> <CAHS8izMwd__+RkW-Nj3r3uG4gmocJa6QEqeHChzNXux1cbSS=w@mail.gmail.com>
 <20241010183440.29751370@kernel.org> <CAHS8izPuWkSmp4VCTYm93JB9fEJyUTztcT5u3UMX4b8ADWZGrA@mail.gmail.com>
 <20241011234227.GB1825128@ziepe.ca> <CAHS8izNzK4=6AMdACfn9LWqH9GifCL1vVxH1y2DmF9mFZbB72g@mail.gmail.com>
 <20241014171636.3b5b7383@kernel.org>
In-Reply-To: <20241014171636.3b5b7383@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 15 Oct 2024 04:10:44 +0300
Message-ID: <CAHS8izOVzOetQH5Dr6sJzRpO6Bihv=66Z2OttGS7vU7xjC=POw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 7/7] bnxt_en: add support for device memory tcp
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leonro@nvidia.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Taehee Yoo <ap420073@gmail.com>, davem@davemloft.net, 
	pabeni@redhat.com, edumazet@google.com, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, donald.hunter@gmail.com, corbet@lwn.net, 
	michael.chan@broadcom.com, kory.maincent@bootlin.com, andrew@lunn.ch, 
	maxime.chevallier@bootlin.com, danieller@nvidia.com, hengqi@linux.alibaba.com, 
	ecree.xilinx@gmail.com, przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, 
	ahmed.zaki@intel.com, paul.greenwalt@intel.com, rrameshbabu@nvidia.com, 
	idosch@nvidia.com, asml.silence@gmail.com, kaiyuanz@google.com, 
	willemb@google.com, aleksander.lobakin@intel.com, dw@davidwei.uk, 
	sridhar.samudrala@intel.com, bcreeley@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 3:16=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 15 Oct 2024 01:38:20 +0300 Mina Almasry wrote:
> > Thanks Jason. In that case I agree with Jakub we should take in his cha=
nge here:
> >
> > https://lore.kernel.org/netdev/20241009170102.1980ed1d@kernel.org/
> >
> > With this change the driver would delegate dma_sync_for_device to the
> > page_pool, and the page_pool will skip it altogether for the dma-buf
> > memory provider.
>
> And we need a wrapper for a sync for CPU which will skip if the page
> comes from an unreadable pool?

This is where it gets a bit tricky, no?

Our production code does a dma_sync_for_cpu but no
dma_sync_for_device. That has been working reliably for us with GPU
dmabufs and udmabuf, but we haven't of course tested every dma-buf.
I'm comfortable enforcing the 'no dma_sync_for_device' now since it
brings upstream in line with our well tested setup. I'm not sure I'm
100% comfortable enforcing the 'no dma_sync_for_cpu' now since it's a
deviation. The dma_sync_for_cpu is very very likely a no-op since we
don't really access the data from cpu ever with devmem TCP, but who
knows.

Is it possible to give me a couple of weeks to make this change
locally and run it through some testing to see if it breaks anything?

But if you or Jason think that enforcing the 'no dma_buf_sync_for_cpu'
now is critical, no problem. We can also provide this patch, and seek
to revert it or fix it up properly later in the event it turns out it
causes issues.

Note that io_uring provider, or other non-dmabuf providers may need to
do a dma-sync, but that bridge can be crossed in David's patchset.

--=20
Thanks,
Mina
