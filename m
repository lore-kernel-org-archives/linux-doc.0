Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4A765BBB
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 10:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706611244; cv=none; b=DsYBIex5dzI/gWFBEWX54hNCD+OLz8mRFCvXBylQWRhaWX18R8+T/JiqBuWbWZ8JVmzICueqHaoMMCwARd+sj7Hlv6nBNQQWbVemeysQDyVy9DZWGnDk3eBxdmdN/+LRy5c82VZvUGP4BiUVirTsk3w1EFF8BxW/mIF/6JPLOoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706611244; c=relaxed/simple;
	bh=ETdl8coLEmvqaxOFLDsn4/glTC/AoKOwDmqO3n9zkAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXh7cgphduDcy7vX0UQfs98/7VwjQQevUPFTFayHO7M0OPGQUFfMSE2rjGB5VdZsGJ5PO3keCGw27V+7l8C5Mi1ewU9YUzfWWr5mNyEUwGzx4OTbtlf3g2/5X724n47iczXCzlHUiYQYSLzXn9vcEX8AKCItHEHxbLmymzzJrhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=FlVy2dkm; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="FlVy2dkm"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55f35ad4d36so192823a12.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 02:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1706611241; x=1707216041; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bpht1JVVU83PUsSOfehDgTwxwvmRcn3OoCMGwiYoquM=;
        b=FlVy2dkmMTm3VdInTzYzAVaHF+mck+lV2jkocL6K9V/yoLpfW8TxGh+hPuPO8Gc/jP
         jsoY9okfXGxxpxdPmN1WiKHmImOHqvN0HYVkdWHUSbYNl7RhPq16oxRAP7oI294IDWX6
         tgDOrKnuBQONnsmTBh56esl8g6dVEx1XwOYk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706611241; x=1707216041;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpht1JVVU83PUsSOfehDgTwxwvmRcn3OoCMGwiYoquM=;
        b=iAacjoYvvKdyIxmpzhmHn6CYLzbQTmut9M11uQN0L7jZUhQnEAkYZh+pxcqpnd94lP
         x8x4uyxFMg2bVOq/IAGnXB2YMx1Tm8I7hkcDMPOzuqx4rk8BEnAJsnHbbWQjGl8W7/p7
         dcqHdWMvNv185BC6GnMCqzgYLLDvcGqTVgr6YlsnAfFM8nlf5HJBWmh1dhbpPyCjm4Wp
         8PHztQAVGasKrn6V12Gxg69t/bhSkqq5+jYZSZVAF+tN5S1c14iL6lNK7MMxZ7DDuBIF
         b0zMHdGSa+6J1DF1w0YklQZQdjwgl3vVYCn4TgFmQilUV5cD6IH0LiiG3hnzD9vtixoF
         poRw==
X-Gm-Message-State: AOJu0YwpLQqzweNWvUjefuP1mwCJ3zq4O+jYxO/FhyfOubtQXZCgcvLm
	Lba5/Becm8RcM4RWGWMWjp1Sie1QE5sMVtPWkT/doouYhlqtbAKKRy34TmA6NZw=
X-Google-Smtp-Source: AGHT+IHZ1+k7/jhfw/iaNOKyePTFN9as60sY4ufogxiCp9dTJV9WWo6nCqSg8dJHFMfPftGHyW34Rg==
X-Received: by 2002:aa7:d04f:0:b0:55f:99:fb30 with SMTP id n15-20020aa7d04f000000b0055f0099fb30mr3223522edo.4.1706611241253;
        Tue, 30 Jan 2024 02:40:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id es19-20020a056402381300b0055cffd3fd32sm4749393edb.68.2024.01.30.02.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 02:40:40 -0800 (PST)
Date: Tue, 30 Jan 2024 11:40:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Message-ID: <ZbjSJi07gQhZ4WMC@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Christoph Hellwig <hch@lst.de>
References: <85a89505-edeb-4619-86c1-157f7abdd190@amd.com>
 <0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net>
 <577501f9-9d1c-4f8d-9882-7c71090e5ef3@amd.com>
 <7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net>
 <2ac7562c-d221-409a-bfee-1b3cfcc0f1c6@amd.com>
 <ZbKiCPhRvWaz4Icn@phenom.ffwll.local>
 <c97e38ee-b860-4990-87f1-3e59d7d9c999@amd.com>
 <Zbi6zQYtnfOZu5Wh@phenom.ffwll.local>
 <a2346244-e22b-4ff6-b6cd-1da7138725ae@amd.com>
 <7eec45a95808afe94ac65a8518df853356ecf117.camel@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eec45a95808afe94ac65a8518df853356ecf117.camel@crapouillou.net>
X-Operating-System: Linux phenom 6.6.11-amd64 

On Tue, Jan 30, 2024 at 10:48:23AM +0100, Paul Cercueil wrote:
> Le mardi 30 janvier 2024 à 10:23 +0100, Christian König a écrit :
> >  I would say we start with the DMA-API by getting away from sg_tables
> > to something cleaner and state oriented. 
> 
> FYI I am already adding a 'dma_vec' object in my IIO DMABUF patchset,
> which is just a dead simple
> 
> struct dma_vec {
>   dma_addr_t addr;
>   size_t len;
> };
> 
> (The rationale for introducing it in the IIO DMABUF patchset was that
> the "scatterlist" wouldn't allow me to change the transfer size.)
> 
> So I believe a new "sg_table"-like could just be an array of struct
> dma_vec + flags.

Yeah that's pretty much the proposal I've seen, split the sg table into
input data (struct page + len) and output data (which is the dma_addr_t +
len you have above).

The part I don't expect to ever happen, because it hasn't the past 20 or
so years, is that the dma-api will give us information about what is
needed to keep the buffers coherency between various devices and the cpu.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
