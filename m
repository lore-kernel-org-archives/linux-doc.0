Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04443199939
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738243915; cv=none; b=QEXN5+3Q9seWHgB61lBjtsjvVHLslsUlWt/Sabw7DW0czQBPWKMvg1Tf6oAeKaTVlsopj2TbPjlpx1DGIBfPH6dWw/av3VLiv2LZTt8h1Gp1ctneILfAXggzYY7N+2N648tmdR84k8dxcdPCFf/1FcpBwXU+aXo8TQ6EsNr9Dfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738243915; c=relaxed/simple;
	bh=LD9Lbp6T0cZSqTiHjOVO+0MqqWN1TIO1OH0hJeFVo50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKGPSyfGPpY+1WFqdp0S6Yf6mprWqd0uTXMvq8Pk7jKxDhNHwNUA2R3ba0m+JRYerwqK4/BJq15HNiThG8CiDybMSFm9RPn3uokA5ti5xEUn1fuKnbeOItibRyyJTkWkQzR4jE+nlqHXJuCRyF0j0Oodcz8s7LLjdCHFV5sP9yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=WO4KKYzE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="WO4KKYzE"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3863c36a731so652631f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 05:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738243912; x=1738848712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HfypuIQboTZvpun4E8zdORtqN9UpDgcxhaup4sp9X8=;
        b=WO4KKYzEFakrr3ZSnPpBBF/gRr3akWbkk2hjywW39MfhprMI5/jqdzwDWyMx5rn1qX
         MiZJqwxtzN9vGRNXXq1TKPq/8myNIHUXRWNSw2JVG+ZYNMO4Z8IxfYShd4/YzBAv8/uT
         P6Ukd5yPaHipmFNsceSFLUFt6ahFOnalfCd1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738243912; x=1738848712;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HfypuIQboTZvpun4E8zdORtqN9UpDgcxhaup4sp9X8=;
        b=bb3kOzB138J1HGpXRE0cl7b1JnYO94SlDvnwROqVQ2Ca4OspN6pjWswEtQ85hrB1Q2
         ZCyoak9qhOnKvvap9DB6KIj3f3je4FGq5EllImCKp45pov1HrMsKE3CtLTRw1xSOdwrE
         qppmdyzH/snp78n3QS/NScwHKVN8ZNcWO8PfgEsPtJMqNQhOkOnms7TdyZ45wKzByzHT
         DHmrjwUdctt9M41PQT4qQTDFhl4uj26rurKvuSaFlDu5muwpkbKt6X+KvLo+sKgJ81eQ
         LoJBFwluUK2/y6GNGWR1+6A8u3FH1ZZKBgmTlW9nX/UokIY2S4Vy2X0dPVSRIRpu9DYz
         cK/w==
X-Forwarded-Encrypted: i=1; AJvYcCUCWxK9nBeAEIPVXD2r3iZTdbkE97WXey+EAACTy1HyaUzjisjA3+GzIjbahXvjYgmfVdSzjO9F1Io=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxja56zJFc0CszMBYYBbG7yEE3SybWhldKjunNxmguWfivGXX5m
	x0l3dnJkcVl0KOFQaas9FbEGRMJynlgBhCm3CSYqR/YsYab7yCtoDHP6+LFgbf8=
X-Gm-Gg: ASbGncuR0+T2mC7eAemI7dB8B01lsIBKyQLeEh8bEIVLs0dHtQPLA3BKqpHq5+i3MWz
	EC+FDG3FU9eusJnCnY1/l+WYXyfMPo+dfubXSo/ugv/oPINYW3FFXf5bG59Dy/zinm4ebbqELFC
	FHBpDcR59ozR5m8HfI1FFdA9NxzSemerLEX7DxuOnc6J526y12JkpCUkWgPI8e0pIQgHY9VRDEV
	Bw2u0cCY0W9dN/GJ2ELA4sMudSU5XbE4DYpFxIdnVbZFCqWVyw6Dv65QZtWSUGueEaHni6DkcXe
	s8rH/v+PQytOVkidq9VOmB/jeCA=
X-Google-Smtp-Source: AGHT+IFMswZ2dc1PUK9As+fnPUJ+YPXY0lrKZKSyFsUE3i9ImUyvh7RLGwzxoWBETKt22tExTSNKvA==
X-Received: by 2002:a5d:6c65:0:b0:38a:4b8a:e477 with SMTP id ffacd0b85a97d-38c51969b28mr5731448f8f.22.1738243912301;
        Thu, 30 Jan 2025 05:31:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf831sm2033238f8f.90.2025.01.30.05.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:31:51 -0800 (PST)
Date: Thu, 30 Jan 2025 14:31:49 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 4/4] mm/memory: document restore_exclusive_pte()
Message-ID: <Z5t_RebEx6Mj-KlT@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-5-david@redhat.com>
 <7vejbjs7btkof4iguvn3nqvozxqpnzbymxbumd7pant4zi4ac4@3ozuzfzsm5tp>
 <cfc4f8ac-80c4-472f-85fc-36ffcd212441@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfc4f8ac-80c4-472f-85fc-36ffcd212441@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Jan 30, 2025 at 10:37:06AM +0100, David Hildenbrand wrote:
> On 30.01.25 01:27, Alistair Popple wrote:
> > On Wed, Jan 29, 2025 at 12:58:02PM +0100, David Hildenbrand wrote:
> > > Let's document how this function is to be used, and why the requirement
> > > for the folio lock might maybe be dropped in the future.
> > 
> > Sorry, only just catching up on your other thread. The folio lock was to ensure
> > the GPU got a chance to make forward progress by mapping the page. Without it
> > the CPU could immediately invalidate the entry before the GPU had a chance to
> > retry the fault.
> > > Obviously performance wise having such thrashing is terrible, so should
> > really be avoided by userspace, but the lock at least allowed such programs
> > to complete.
> 
> Thanks for the clarification. So it's relevant that the MMU notifier in
> remove_device_exclusive_entry() is sent after taking the folio lock.
> 
> However, as soon as we drop the folio lock, remove_device_exclusive_entry()
> will become active, lock the folio and trigger the MMU notifier.
> 
> So the time it is actually mapped into the device is rather

Looks like you cut off a bit here (or mail transport did that somewhere),
but see my other reply I don't think this is a legit use-case. So we don't
have to worry. Well beyond documenting that if userspace concurrently thrashes
the same page with both device atomics and cpu access it will stall real
bad.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
