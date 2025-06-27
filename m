Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E3F2676D9
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 11:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751023977; cv=none; b=tJt2qm5fVUtA1yqCC4Z1CBUirLPM3O8fE8y6WEqhZp34v0ufiVmrltXKeHWrKEzBRZl26yicHEjhJYQ0tCSCLbHPzsq4eAos0ZOdd5ws2hfObSWPSMjC8WjM2x2Qb43AA1R+sWV/vhLRPGqgttC4i3fvFmpKCkywl+2doBwMNw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751023977; c=relaxed/simple;
	bh=k7FSokoRUWjGKmunOIygkPJAEDu5OPFHiE+Rh1EgJ00=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ljlbKU/+7+veXgvin10GXWxNqVv4E1aM1+vXtZM1fSkNQBHHeeSe0SZ1a/CP8UEXTi1WwwrardxaYZmFJ7XQgXA/hyh1V6iYnKulM7ye/5seL3Xn/eQsQmlG78E/Fbjbo+R8qNOj0+diKCrV9JtXS3plIzl2JtJ6NSWQRw2NYbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M7ldabYy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M7ldabYy"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45362642f3bso2962525e9.2
        for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 04:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751023973; x=1751628773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VA1K+sSxb+ZA7vsDXvA15WJBHT58z1iBmKqHJX5Tp4=;
        b=M7ldabYy/A7V3dntUhr2p1UC//cph2SQkCQwqSZ/+zmKrlm6NsAWd6IjzGDnUHCCzl
         CArPdc6iepd4q9syWvwf/7TkNlNY8MmqSPoCQRyZJhG8dxF0m0hbbCuAMJ/zoA6Smshq
         FMqD/0wpeBm+kPJz+xhxTw+k/tcLW29xjJ3Ss0zPXAUioAZClzE2W5aEFxzLYyAzfmM8
         ZBP1FU+ho2+Y8wIp5GqDN6AL5Z8Pwm0WXF+ro4mWe7rjOdfy0y1t7jbHX91pa33dsMCs
         eOwZB5HWAvI+7JG8KjXodGqiPsizHYFkt9riQ4xGpK0UpHeVo6svwocmuBcDNjO4p5OY
         bcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751023973; x=1751628773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VA1K+sSxb+ZA7vsDXvA15WJBHT58z1iBmKqHJX5Tp4=;
        b=t7kPjV6VZ6Pew580Gvqj0xMeTDQAw6ZZD5G4JXV636kCqR3noXB/gBPWFkhxDInwoS
         e4gqq0EJ1gElTIcFFRQwF/2Y0z6Z3VD52yO4qIGwmlUP0pA8fs5dPP+GiIaeBqzaJuHj
         WUAIzOwHZViwsghEKll3rSph0Tlof2fnlqAMGi451OCzyYDSCtNIGulZY8jcP1yW9cJe
         GCr6lIugo3MgtxE8mJaPRU336oNdtp9KoPhnYxmki/A5G01O9KX1h1foQGNphuEy88Rx
         8kkKoPtE1rAps251aXrape9QwRTtzQ7EUvBWVpK0NmrNBz5Q3vzQueiJfpsCqwrYPPWD
         72Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVesIjQqvEYof3n/2LfVslGHsKv3SugRkNxkm1vg2TeM399vmR+mtLlWE1PbCSrhBUIIuHoPZlYX0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAAxhkDb7GEnNaD91YuN5iAAI1WEYikGAtzwlVbc/AHPa6EW2G
	+TsCKQlWukDzjABAtZ4jTIynWakm5AlPUTLCXJ4VslViFj3JF8KkFrlMuBYyN9IN+Yg=
X-Gm-Gg: ASbGncvwy8qfhxQIPdPsD2fpLJoocjBdlpfTCgeiEGJasXTHrwpzfpwAGfZNxSp0Mvf
	hhoyEpFVQKHOXDzq6NZvhVQ3DjoWwWmPj7Xat8XlN6ZrOB5nITn2q8jPL7Ix+IrHYNkMC8HWhWv
	ZUdhNVpV7Pn9DN8jtxCeTUJP47TMAc56m6Q94KrC7KH1716asizkunfEWitxSpxvzH4c18ZQO1Y
	QsCG5+7jrG2NB7p2N1G0mfzUlGBmSqzqgJJGjt/VPomkE0dl+/Sqon5d6U91QZP4M99ujly9Kll
	Q5Cds4doP+M3JSz6ArOz8d69wSEissT+rq9cclymiLqIpegDCGAJtYK4qxaaLnt3WZxC5nf1itD
	frzjtR2bnUWNwy4xhGvob6/y2rXZG1MXqWwuI+rtE6hAmqYOPMq/CPP6cW7ZZVEWnlXw=
X-Google-Smtp-Source: AGHT+IEWZCSuqttypCq2CzG6w+lGWATA0+jX9Li2yrDFrWwmJA+OoSeGnOZU312Xh/zwCq+WJVnCjQ==
X-Received: by 2002:a05:600d:10:b0:451:dee4:cd07 with SMTP id 5b1f17b1804b1-4538edf5becmr9797775e9.0.1751023973312;
        Fri, 27 Jun 2025 04:32:53 -0700 (PDT)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a43325asm47023565e9.16.2025.06.27.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:32:53 -0700 (PDT)
Date: Fri, 27 Jun 2025 13:32:46 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>, Keith Busch
 <kbusch@kernel.org>, Caleb Sander Mateos <csander@purestorage.com>, Sagi
 Grimberg <sagi@grimberg.me>, Jens Axboe <axboe@kernel.dk>, John Garry
 <john.g.garry@oracle.com>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, iommu@lists.linux.dev
Subject: Re: [PATCH 7/8] docs: dma-api: update streaming DMA API physical
 address constraints
Message-ID: <20250627133246.1d0a6d46@mordecai.tesarici.cz>
In-Reply-To: <f3164113-a834-4b22-adb4-9da1e7ca2c73@arm.com>
References: <20250624133923.1140421-1-ptesarik@suse.com>
	<20250624133923.1140421-8-ptesarik@suse.com>
	<aFynHWAYtKPFT55P@archie.me>
	<20250626070602.3d42b607@mordecai.tesarici.cz>
	<bdb3a37a-a9d3-44c1-8eb7-41912c976ad1@arm.com>
	<20250626154818.46b0cfb1@mordecai.tesarici.cz>
	<0f95be6d-2e13-4281-98b5-6d4311a3b98f@arm.com>
	<20250626214038.2d005bb5@mordecai.tesarici.cz>
	<f3164113-a834-4b22-adb4-9da1e7ca2c73@arm.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Jun 2025 12:07:56 +0100
Robin Murphy <robin.murphy@arm.com> wrote:

> On 2025-06-26 8:40 pm, Petr Tesarik wrote:
> > On Thu, 26 Jun 2025 17:45:18 +0100
> > Robin Murphy <robin.murphy@arm.com> wrote:
> >   
> >> On 26/06/2025 2:48 pm, Petr Tesarik wrote:  
> >>> On Thu, 26 Jun 2025 10:58:00 +0100
> >>> Robin Murphy <robin.murphy@arm.com> wrote:
>[...]
> >>>> It's not really that simple. SWIOTLB, ZONE_DMA, etc. require platform
> >>>> support, which end users can't just turn on if it's not there to begin with.  
> >>>
> >>> I know this very well. As you may not be aware, my ultimate goal is to
> >>> get rid of ZONE_DMA and instead enhance the buddy allocator to allow
> >>> allocations within an arbitrary physical address range, which will not
> >>> rely on platform support. But that's another story; for now, let's just
> >>> agree on how the DMA API is supposed to work.  
> >>
> >> Indeed that might actually end up pushing things in the opposite
> >> direction, at least in some cases. Right now, a driver with, say, a
> >> 40-bit DMA mask is usually better off not special-casing DMA buffers,
> >> and just making plain GFP_KERNEL allocations for everything (on the
> >> assumption that 64-bit systems with masses of memory *should* have
> >> SWIOTLB to cover things in the worst case), vs. artificially
> >> constraining its DMA buffers to GFP_DMA32 and having to deal with
> >> allocation failure more often. However with a more precise and flexible
> >> allocator, there's then a much stronger incentive for such drivers to
> >> explicitly mark *every* allocation that may be used for DMA, in order to
> >> get the optimal behaviour.  
> > 
> > I have a different opinion. Most buffers that are passed to the
> > streaming DMA API are I/O data (data read from/written to disk, or
> > received from/sent to network). For the write/send case, these pages
> > were previously allocated by user space, and at that point the kernel
> > had no clue that they would be later used for device I/O.
> > 
> > For example, consider this user-space sequence:
> > 
> > 	buffer = malloc(BUFFER_SIZE);
> > 	fill_in_data(buffer);
> > 	res = write(fd, buffer, BUFFER_SIZE);
> > 
> > The write(2) syscall will try to do zero copy, and that's how the
> > buffer address is passed down to a device driver. If the buffer is not
> > directly accessible by the device, its content must be copied to a
> > different physical location. That should be done by SWIOTLB, not the
> > device driver. Last chance to chose a better placement for the buffer
> > was at malloc(3) time, but at that time the device driver was not
> > involved at all. Er, yes, we may want to provide an ioctl to allocate
> > a suitable buffer for a target device. I think DRM even had such an
> > ioctl once and then removed it, because it was not used in any released
> > userspace code...
> > 
> > In short, the device driver has no control of how these buffers were
> > allocated, and it's not fair to expect anything from the driver.  
> 
> Indeed, for true zero-copy to existing userspace memory then there's not 
> much anyone can change, hence "at least in some cases". However, there 
> are an awful lot of drivers/subsystems which use streaming DMA on their 
> own relatively short-lived kmalloc() allocations - the first example 
> which always comes to mind is all the interfaces like SPI, I2C, UART, 
> etc. which are either dmaengine clients or have their own DMA (and 
> indeed some of which were historically trying to do it from temporary 
> buffers on the stack). Heck, even alloc_skb() might end up being 
> commonly used if this "ethernet" thing ever catches on...

I have been looking around a bit already, and I didn't see an _awful_
lot of these short-lived allocations, but yes, I've found some, and
yes, most of them are in the subsystems you mentioned...

Anyway, thank you for your patience with reading my DMA API docs
update!

Petr T
