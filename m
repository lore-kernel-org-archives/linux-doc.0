Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972A02D2498
	for <linux-doc@vger.kernel.org>; Fri,  2 Jan 2026 08:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767341709; cv=none; b=qMO8t6snAD/NU3NiLx3F1Kbme/in2dmdGCce+rYgwwdYcD1h11u5e9zptliYo5lNJbS4X09F29/iQyUBj/Jq/TB9gAlOEmYg4+QrZXkpGgEMmImJvsX333XLbW39JlP7ILyDRgYAmWL+0MuaZYBDwuJHcQO2wbVZl/7zKxp75WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767341709; c=relaxed/simple;
	bh=pR9J2JcpyuSslYDA7lsLX4ZhILZRZva1Jx7LQCRL2xc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QO5pDDt7rYQrp0f3gS4sigQYpTPfMrO7aChU/FXUJdFYmZvGfJ+0/5EvUp3nshsEzN765DnQ4kt/aK1vmAVY8Cmkv6uQsqEwnmp3RJjuDRSAihG/Zfu61F7B/ds1QYaLH3/jco++2ZBQtR/KHGhLJ6mCdqP14z0ZWy9Ax7iQO2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YA76nKi/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YA76nKi/"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779b49d724so13789255e9.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Jan 2026 00:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767341702; x=1767946502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7B5OROvqw/DgiaRfLYZJf4GjF/wj6CLJOtpsQ8Z+Uq0=;
        b=YA76nKi/w+4r6QrU3u2zf5Le8V9XRZBLFbZgcDqg8nvt9MckDoEaO8By8k5rFaH2zj
         M6FOWUp+8LwZBjF7Ct+EYIO0kH0S0v+Pr9wSVpl4cXLp1lFB/7/Pb3+7EkRYFZ3ouqef
         b8TA2l7ZzYNtFHMUb7pVDcW0ZmWyV8GwubCAvrstaOiHAncUBTCHGnjdqJUtd1u693Nf
         pm12hnFgGAbipqxoZBPGus+ExXjFykcTzIXHpoBAw8wzK/IcFi5XxjN/gsygR6pDcVF0
         P1iYMU4BuJYFaPN7BknV7Vy3fKB9GXy/u40sq+1UrdlhP1knI9/5NYPkaXLxDyogj33o
         q9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767341702; x=1767946502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7B5OROvqw/DgiaRfLYZJf4GjF/wj6CLJOtpsQ8Z+Uq0=;
        b=ThF56SIPq/C5v3mcmqmqh3t6tHVJUk12E1fi2rMXTDJEEFIKt9ZE+jM5yu/y/7m/kr
         Kn/7bCbEczuTtEkhLxYUi9Bdml2EMLU+DkZaSkaQhgKd6KazUx3/5hqGXF9h2URonOld
         ydygQ/ntXCvitZWUZzmh+jx3+1b3N+WsnIP4ZF1C7ghi0B4o50nNNAfm+iK8tkuX2Pqc
         0D7nBjjmZCNTjv4yU0Nv2l6Sg+T9EIT/Nv5Rsz2nIV/ADJwQENwoqiJxmXDUyY+uzlHk
         an0wHUJ0m46vZQtl6n0ivOir07N+7Qrbo0brK0dKc4KcU775BS/fSZFwoPjP1dnTo2bs
         zvMw==
X-Forwarded-Encrypted: i=1; AJvYcCU51QobfYSkWBqnczJ/YBOXqeEKJQmDbugeMckpytjkanElenxPUrHIe9sxL+4LTiC35RVYcEe3NZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzASmb3hB2HTJu1dqBw9PHkC0PAdOteMHK2GcXOFturCfYeqArs
	R5WkBj4tjJ0WVkK9NR5fknBeB3tHftTW50bcv9hpz7D2anFZ5b/yTobGNvZd1+DBHDo=
X-Gm-Gg: AY/fxX75N77GcHJtbBbkn+h89sdkV/W2VQ08gs0SilYQeHOWKgL2rKrkum9Chzu97FV
	QpkOss/vV9ULbMGmmSR5dlGxe3+bkJ0eKupSsgoFyOKmI0UtV0D3ZAtgn6BBZ3lGOwpVFLxPdCp
	8kzrUoRYfrLT+9j0df+JTqtwHCK1njEyeqm3w1rJlQDlGxw1dKAyFU5XuicLB3f9okyJlQo/2r0
	+bOMh7+0eeAokV+dWZ38dZm8Mm7yFZ4CB1XZ6hUT4wBD3Ct1PAnnS0q+Kc0ik61Uc/VmJsmgXCt
	bbFHGbqEys8YnEK9ox2jQcMIkugUUgz69mur1R2wPrLnzEd6ujQvuaJNSFK+BXCgNsCiiFCWz61
	mtj4qCi3d6CMrIJJZJPod4G78NH1M8GziT0n9UniJk5wELUawd7tm+anArmRxAKsQuxpBQmsQFg
	q9UuLmLSuptqNUDY+Vcr09t8BdBiiZQyHewWEwC9b1BQBYhlKw+oqLY0FCaSgHlr+HeWdFiDj0H
	tCs
X-Google-Smtp-Source: AGHT+IEG7/UqWg/6ELIcyq0mVb3xfMQn4RI8cpiRrR5W4zXnA35xM+TJgjTRoe1XllkShxIti5fDKg==
X-Received: by 2002:a05:600c:3151:b0:477:a203:66dd with SMTP id 5b1f17b1804b1-47d197f69demr322547935e9.2.1767341702410;
        Fri, 02 Jan 2026 00:15:02 -0800 (PST)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b0d5asm792930555e9.13.2026.01.02.00.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 00:15:01 -0800 (PST)
Date: Fri, 2 Jan 2026 09:14:59 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eugenio =?UTF-8?B?UMOpcmV6?= <eperezma@redhat.com>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Stefano Garzarella
 <sgarzare@redhat.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Leon Romanovsky
 <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-doc@vger.kernel.org, linux-crypto@vger.kernel.org,
 virtualization@lists.linux.dev, linux-scsi@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH RFC 01/13] dma-mapping: add
 __dma_from_device_align_begin/end
Message-ID: <20260102091459.6bec60c2@mordecai>
In-Reply-To: <20251231154722-mutt-send-email-mst@kernel.org>
References: <cover.1767089672.git.mst@redhat.com>
	<ca12c790f6dee2ca0e24f16c0ebf3591867ddc4a.1767089672.git.mst@redhat.com>
	<20251231150159.1779b585@mordecai>
	<20251231154722-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 31 Dec 2025 15:48:26 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Dec 31, 2025 at 03:01:59PM +0100, Petr Tesarik wrote:
> > On Tue, 30 Dec 2025 05:15:46 -0500
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > When a structure contains a buffer that DMA writes to alongside fields
> > > that the CPU writes to, cache line sharing between the DMA buffer and
> > > CPU-written fields can cause data corruption on non-cache-coherent
> > > platforms.
> > > 
> > > Add __dma_from_device_aligned_begin/__dma_from_device_aligned_end
> > > annotations to ensure proper alignment to prevent this:
> > > 
> > > struct my_device {
> > > 	spinlock_t lock1;
> > > 	__dma_from_device_aligned_begin char dma_buffer1[16];
> > > 	char dma_buffer2[16];
> > > 	__dma_from_device_aligned_end spinlock_t lock2;
> > > };
> > > 
> > > When the DMA buffer is the last field in the structure, just
> > > __dma_from_device_aligned_begin is enough - the compiler's struct
> > > padding protects the tail:
> > > 
> > > struct my_device {
> > > 	spinlock_t lock;
> > > 	struct mutex mlock;
> > > 	__dma_from_device_aligned_begin char dma_buffer1[16];
> > > 	char dma_buffer2[16];
> > > };  
> > 
> > This works, but it's a bit hard to read. Can we reuse the
> > __cacheline_group_{begin, end}() macros from <linux/cache.h>?
> > Something like this:
> > 
> > #define __dma_from_device_group_begin(GROUP)			\
> > 	__cacheline_group_begin(GROUP)				\
> > 	____dma_from_device_aligned
> > #define __dma_from_device_group_end(GROUP)			\
> > 	__cacheline_group_end(GROUP)				\
> > 	____dma_from_device_aligned
> > 
> > And used like this (the "rxbuf" group id was chosen arbitrarily):
> > 
> > struct my_device {
> > 	spinlock_t lock1;
> > 	__dma_from_device_group_begin(rxbuf);
> > 	char dma_buffer1[16];
> > 	char dma_buffer2[16];
> > 	__dma_from_device_group_end(rxbuf);
> > 	spinlock_t lock2;
> > };
> > 
> > Petr T  
> 
> Made this change, and pushed out to my tree.
> 
> I'll post the new version in a couple of days, if no other issues
> surface.

FTR except my (non-critical) suggestions for PATCH 5/13, the updated
series looks good to me.

Thank you!

Petr T
