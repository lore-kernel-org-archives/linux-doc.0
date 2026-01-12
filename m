Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C31BA3F
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 19:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768245465; cv=none; b=Zpb/WVTxS7ocDOPWetsYhE9wAX79RuCwS0Rq5AItTn87T0XPVapqibqGyIQCtJkVhfxnOShwjPjvfkpsl3+4sveoJVC5EUmmqNbDUwVG/4JCd3ZW6OK9G5JDRu4zb5IzvVEQwwLO7ggC4+GZqbbtzFtXMHXu9A6slgiy/Bz5yDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768245465; c=relaxed/simple;
	bh=NWDfa/sJJpX4wtHFpmlns1isF6LdcCFgQER69g8Tiec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GO5NfP2yElmNFmUyF5Ol7nXb3lQ7mhF2hsWhB0edulL4yAgzgIsC3V3fxTWAAFQA0yRhTF9uHAgw2VQwEJ1tRC1veck5+XYfyespvnEgH8TUon+tv6ng7/A7uq8M2WjwhiX88seaOnh5n9KxlfmT6YoKop8cqu/H2Mwh7xVT1AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=UScv0ETp; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="UScv0ETp"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ee1a3ef624so41512201cf.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 11:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768245463; x=1768850263; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=79V8FU7VojpzuezWKGikKP+GBTJI3ooJk9r8kmAFP4Q=;
        b=UScv0ETpQAfaKfqQsOz7MPXyqbJyPe2KF9Q5Ozh9cddSfp47VDDoLL7u1kl2uMrMqe
         DocHvn3d8337G/bYOdNDZ5VDYx+Z96GoS/hcI6fMuwXZ7SUOuppLPopW67Bg0i61hvoa
         1fv1t1LsyvT25265RBohrHbYniaYAwIAwG4Xmn/NMVqwgFxvaZBg9IM6AFgQlYGFdbcz
         UH4H0x+XYZZZe5vViqWZfq41Fiy6HxSlrv8ub4ntWjffyQ38GW8KCF9hfPUOGS6ZusSL
         xWsqQKRYCxnPJzDBNjDdwZ1dgdCsdBqVsqLZ6tPTVrioXCkAmryry2iYees529ukRc7o
         lhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768245463; x=1768850263;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79V8FU7VojpzuezWKGikKP+GBTJI3ooJk9r8kmAFP4Q=;
        b=rGJsI98Pl3UMYTV+mYsDOAZbTyCb9lqgImrQ9kAF0YN+Pka32WtCy4TCPX5Vtdtb8O
         SCHlI9C65+95mNup0OITZm/QIRXLC5LN/5IgxdGv2B1HViobEqQUrbSXetipMZW7h05V
         MAAc3wgvCnlWjFjfJwa3x+Qyedb92oXxNjemUozTiaEwSDQEBm4kbHgKiygoNi3g+sHR
         OAQnvn/ZgL74BV58nII8D3ez1M5sqU81LxG7HH7aFchZCOkRi4eAj+uzqdStbsX59cDH
         TFTiHWcNwPn63DeeI+p1wGxAjhcTg6SyLaQ6O96ViWFYW6d6i/wjk5hHn8ck5T/tqwxF
         jr5g==
X-Forwarded-Encrypted: i=1; AJvYcCUVRrM6lw5Y8zBY5/ugDnEV+2HDCnVMF6dXEYxb+hxBCkRSRs7OWykaxzd+8KvK09wuJjDu91PH8Gc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrUd9XDZuQBabafCysioSkHboHGeTKsaVLM8UmfkB0qMZqJnXx
	G1/WqMH/m7xKvhNVokwzEWw5wl9xjuSdThbvM7y2ZKBvjNEHRv6BpDpAsE5Cjnj0BcM=
X-Gm-Gg: AY/fxX6bPjchY9BLWxiLz3kJiSvARXGtDktfxMQNQvTZ67OeDIIJFnSF+NusTJQOBkP
	wZUnq/AiDPswFXzxZ4nB6RjZD3jzaLAmxjo436r3uBCOKn088a7YGeu3k4PXGd+yRUuobpQhHtp
	MXNQgQfKLwE9IPajtd0rLTu0t9CKCozkYHB9B3P7nJDvY3BwtpljZ8Aop1pp08DXCDepkBY6qzN
	4hZ81mpSeShlhJqoegjQVnqGM8V3E+8hPm3wC6F3dkHZAbPKRWthFkEljEdULMqLNBEGx6pJc4s
	bS9aKr9XZhPKureYFuX7LtFH1xt5r5ovDB8SLCkxvogTk4XhUWQvwOQUDWtDqCg7KjWqfWKQGtK
	6bJAAMnOmw66vTdYqp2slQadYDcuRMd9gwUfKvnUFXDvB+AFhlud+2gdZIaCY9yg5Ybu6yBptWL
	Vxra9Fut+4yRU5S+bLjOOo7K/cz4oNjzWqvgQaVgon6XpNCFgjSZyHQuDT3HiZkLWtdn0=
X-Google-Smtp-Source: AGHT+IG8g77fglBlqhZKMGazF9A00SKS0QmAPx/h9dmbnRAuIOD9kpUD64pci6T5eeVAY5Szu07Wsg==
X-Received: by 2002:a05:622a:4d0f:b0:4ec:f403:3019 with SMTP id d75a77b69052e-4ffb48fff61mr258726701cf.21.1768245462410;
        Mon, 12 Jan 2026 11:17:42 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d3d92esm132795641cf.5.2026.01.12.11.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 11:17:41 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfNQ5-00000003cmO-22Z1;
	Mon, 12 Jan 2026 15:17:41 -0400
Date: Mon, 12 Jan 2026 15:17:41 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, linux-mm@kvack.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	rppt@kernel.org, xiaqinxin@huawei.com, baolu.lu@linux.intel.com,
	rdunlap@infradead.org, Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v6 3/4] iommu: debug-pagealloc: Track IOMMU pages
Message-ID: <20260112191741.GK745888@ziepe.ca>
References: <20260109171805.901995-1-smostafa@google.com>
 <20260109171805.901995-4-smostafa@google.com>
 <20260109195111.GQ545276@ziepe.ca>
 <CAFgf54r_au6isA10Nrve=MHL455X=tKhNsSwH1ej-TX08J3xLA@mail.gmail.com>
 <20260112133256.GB745888@ziepe.ca>
 <CAFgf54psxPrsvujStPNtrzxiKOsJF+aVrN7BcNxxmAF4wDmRXA@mail.gmail.com>
 <20260112135208.GD745888@ziepe.ca>
 <CAFgf54q+9Y5TtGJDB=8q_BW-0F=TM7zBbCcMzvtvr_N2WMnd-w@mail.gmail.com>
 <746f5adb-1d91-4ca2-8ae0-a2d171203b66@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <746f5adb-1d91-4ca2-8ae0-a2d171203b66@kernel.org>

On Mon, Jan 12, 2026 at 08:11:50PM +0100, David Hildenbrand (Red Hat) wrote:
> On 1/12/26 15:58, Mostafa Saleh wrote:
> > On Mon, Jan 12, 2026 at 1:52 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > 
> > > On Mon, Jan 12, 2026 at 01:43:41PM +0000, Mostafa Saleh wrote:
> > > > But I don’t see why not. from the documentation:
> > > > /**
> > > >   * pfn_valid - check if there is a valid memory map entry for a PFN
> > > >   * @pfn: the page frame number to check
> > > >   *
> > > >   * Check if there is a valid memory map entry aka struct page for the @pfn.
> > > >   * Note, that availability of the memory map entry does not imply that
> > > >   * there is actual usable memory at that @pfn. The struct page may
> > > >   * represent a hole or an unusable page frame.
> > > > …
> > > > 
> > > > That means that struct page exists, which is all what we need here.
> > > 
> > > A struct page that has never been initialize shouldn't ever be read. I
> > > don't know how that relates to page_ext, but are you really sure that
> > > is all you need?
> > > 
> > 
> > AFAIU, if pfn_valid() returns true, it means the struct page is valid,
> > and lookup_page_ext() will check that a valid page_ext exists for this
> > entry.
> 
> Not always. Offline memory blocks have a memory map but no page ext. We
> allocate the page ext at memory onlining time.
> 
> Also, I'm not sure about ZONE_DEVICE memory, very likely we never allocate a
> page_ext for them?
> 
> I'd assume both cases are not relevant for your use case, though.

They are in the sense that those PFNs can get into these routines and
still need to be handled in some appropriate way..

Jason
