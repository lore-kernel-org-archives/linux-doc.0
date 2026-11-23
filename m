Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795456255;
	b=qXOlPb/qXu8a6epxaU8PUCdE1MgOVZzENKFoUoEL2WWnbhjAfbWQeMn1DrpwLG1OYsgz
	 PUv4EC/8KqB3y0JixXwtCHRRmwaK9w8YSMZIdfPY/ilyo8AomZ9xJ/hse7wBOjwX+w2Te
	 eqv2BJ/biF3+uY5/nbGcKhKxewwrnLRhMlgFdChaOQKVDoAul5r8vfyCnu0ZGPA6gat5U
	 bAwCMQDg6GePBMItm19OwPW+BdteJzwAVjUQp5urnQiu/fcMBRCe40aV2XNXp+OfhU22U
	 De+5ATIYNmCPGvmWXOEJDldAY7o9xgtZ5Yo/DdDzY7a40XLP5Q0lTogUEwmhr/wQtrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ezlDWRMj9kmxxJBJDvLQDaV+rNJm+P/qJAKPI2Vbze4=;
	b=KZYuU5P/mkkr08KHtU5RNJqRGFsXWYY4nqJSrPxCVtHby9f4/RmFyYpwWiQIespGTfyA
	 rP8vmL9CZzbvTl8/UXwcklkWG48csI7xD0mf5paTNKpv6FNhMExC0934SaIpT7f80HyYR
	 vQJqs3q8YP8uZcGcADoqqQXeYFrT92Z/2iTB0/qMgVWJ6cWU7/tgeSfThQdhG3WNO4cIr
	 cBtAwpdttQPkJeYIXAtG6jtGgo5p8MkddDiUEufTwDSxHImNHNMyJdY+ft+3hi4CJadzF
	 YpUwSr5AXdI+WVatfP31j9kT+vsug/3f4ACJGYZc4cfJ/JH6MlL81fcwgrLzEu4mz5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rw6Pf2ZE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520CC606A32D
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 17:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 520CC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rw6Pf2ZE
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so102405e9.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 09:50:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795456254; cv=none;
        d=google.com; s=arc-20260327;
        b=Sr21uZEstPt13yu7s9lL4gJSyIYlA+LK1zmI/ldYur8UNBW/xdof6ztPUx9LSMXCZu
         92h17Fs3fBeTBJX1x7zXxAdsLWc1AA5Id6SxrfQEkj+2MlQMqyxh+BV0AAktE2cSZqGT
         1CfMW4XY+q+mVodKg/bdtkjDp3B/LT4+zl0i3YayPPuUFdUlpWNaDDPdSoQ//FJfuSkY
         vxHY3Jfed5sEWDF6xFyXK1KIiie7KDqeBRKd1k3JnQLZlyZ20mJCRbhLodZrUqUCFErr
         Roi6rEw6sL9FnMVYQ3+nHRTS86rbAO+hdb2/5/7QR31IXYyC1VX3vbOCO0g1DBo93nws
         YQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ezlDWRMj9kmxxJBJDvLQDaV+rNJm+P/qJAKPI2Vbze4=;
        fh=fmbcp2UAjkygcHunYgjzAEBJrNh9yfEKzh4PtoMCP18=;
        b=RCASJZFxt9TdHpsk9x1sDSlHsmjJNT/PJ7C9CjsjNdFtAVvkSpGKSDmbBhEwFCWBdP
         7OIZIcbX6Ha+m0AAVS6usLi9IhRwx5JD8CRx/spNPrz26lwpu1Pnx9NulE1d3fZBkPO1
         DqCCovvX9NrdNAq0VEUB7AQJKTwH7dE0dTqppooODTEvy2sRupCP9h+Ms/WXG9pCZmJo
         dkloGfHYTjdcABoI8A5+epJa2Lzopsju7byxznLsLRthIm5RvOjnyiI2n8Bm0x60v/FP
         KgRwkTlricx9ZLSVzRPBc7iSV+p+SsfyGeQmwXH74AhM7VQC6rbbgiCp+PJ/hfQ89/ZV
         eI7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795456254; x=1796061054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ezlDWRMj9kmxxJBJDvLQDaV+rNJm+P/qJAKPI2Vbze4=;
        b=Rw6Pf2ZEwkI1UXO7urWIQFYldmXs8W5N8krS6E97FFE6mZKhIHwUDIn10TfS01gjv0
         2ad/qxb2eC2QJ2UwmKmpX8g2xrOhdsb+6+H6gCquaMukF9SRNBjDmZHbmjQIwwKtRQiz
         4OnUASOkQ+gEQPbp4T/4aQR4JKBPgDMoGv8nxz+UYm2NOW8p0PGH2bBJwz/WImNU3r1U
         7r8Czk+/KdZ24CppBqkaigsCmxPO9BAkydO5jrN1Xf3tfO/6af1kY2RhTIaGc/+at7nS
         QY++jE75t3ZW+U8KeoNEjOh2ljFPeod1xGq4fsrYeZNmNMxs/loEagZUSbz58olNW7Oy
         5/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795456254; x=1796061054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezlDWRMj9kmxxJBJDvLQDaV+rNJm+P/qJAKPI2Vbze4=;
        b=Z7Al+ozv/H7miKFSNWpmi9vt8qRrmqX3A4FCAvmJEY6eHFsew3N3V2QB0uNT8P3zWZ
         isU98CcHxZAFBqtEULio9drh29XuKki813iZhw1DR5ILEHt+8ZWVXB7dfoyQHCimztN5
         G7gekd543tW57wFfi665W5a+c4STfeVYxTVzVZppL3nNQf8lH0wqZjNwYjpwNNmnH3L1
         faEXqodCBFgMw6E5iYUj7WPwtvJJl6CqOE5AmpO4Dlgaa7FxmCcErFWjan6B/vKi/Ev3
         5hH6ZQ2B1wEK7PDIdzFxs9tDa7jw8qFdQaQLw+GxGJJ2fLgh42bPxBCU6xIwkO/4rCyb
         d18A==
X-Forwarded-Encrypted: i=1; AL+hErGE2JSR7ApzPKEIuHrQtCxE4+3Al7jndh4Fbe+P+cH2bZtY0JzQsstsyqvsiC7bpFJfz6OUVqLLCEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xkzH+Zp4TX8N43BnTwIsaijqWKvOuYt1OsBSH6RhZS+wFZl5A
	34vzXTDY4/WeTn0gO8N/oK0vFr8OysGeaTRCxz9QMhbxxBsTJNQ6S2YOaiUM3L2kjcrIs0bNTnV
	le2ZCNmAAZNOkaJmJb6porTYsJ7VCVnS2IQPengUI
X-Gm-Gg: AZFdTZcHn1p6hkfNJOw0kbZFESh37ZWXiN9v44YkpazgS6+Roe58giQuMJKRZPb+3P7
	YsNYz7M0UHwx9vOP7X9xot97qBIfr8+5uzxJCbqpBqedUXt3Lsx67Tj0odoMbHJdopaerPyDnbZ
	3qhgQBPfuOG1zo32jVL3Ti3Go/6EUf2j/3aZ1Sc0XupYNhMfiTPl9hGiyuUlp0cl781TF2RpzoO
	Ja0QKrJChleGE99HYlOIRFBFBH37EPrtfihx1mxSlcdiCEho+YGhMakKbfGMciIJEGI3DeF9sdQ
	TYGSk6W41Os+XHL5oO38bPIiTCptTdsFotx6AILsMih0BfNYiK+NmGyZxu9ORrVX90d2aDDFNfa
	Mm5WELoGd78+lH+DOTMj80JInzBwHl/FmCwjWJzogXqs+kxxjn/GQmIhym83xU8RWl3Y=
X-Received: by 2002:a05:600c:287:b0:4a1:e368:cbf7 with SMTP id
 5b1f17b1804b1-4bb909d0619mr1867585e9.0.1795456253076; Mon, 23 Nov 2026
 09:50:53 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109182533.3594984-1-lrizzo@google.com> <20261120010655.467825-1-lrizzo@google.com>
 <20261120135013.GO3115493@ziepe.ca> <CAMOZA0LmZ9PFzxLcc1SuS8piFyZu6P=vX_qR2jy-3QRUoNCUKA@mail.gmail.com>
 <1f10002ea9ee16a17087bd06e4a1685a973fdf6e.camel@linux.ibm.com>
In-Reply-To: <1f10002ea9ee16a17087bd06e4a1685a973fdf6e.camel@linux.ibm.com>
From: Naman Gulati <namangulati@google.com>
Date: Mon, 23 Nov 2026 09:50:40 -0800
X-Gm-Features: Aa3M54qK7IY8ZMBupflhQ8_7jK3YPX7yjpTGqvTp5f5henwr9osR6FHQsicVdiQ
Message-ID: <CAMP57yVZx=s-JXHfQfd_ouv2jV6MMsJXpxVLkQQHG=7qfFVJfA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/25] PISA: Pre-mapped IOVA Superpage Allocator
 for DMA and CoCo
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Luigi Rizzo <lrizzo@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Jens Axboe <axboe@kernel.dk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Harry Yoo <harry@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Hao Li <hao.li@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Jann Horn <jannh@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Willem de Bruijn <willemb@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Christoph Hellwig <hch@lst.de>, Dragos Tatulea <dtatulea@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, netdev@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:10=E2=80=AFAM Niklas Schnelle <schnelle@linux.ibm=
.com> wrote:
>
> On Fri, 2026-11-20 at 15:19 +0100, Luigi Rizzo wrote:
> > On Fri, Nov 20, 2026 at 2:50=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> =
wrote:
> > >
> > > On Fri, Nov 20, 2026 at 01:06:30AM +0000, Luigi Rizzo wrote:
> > > > This is v3 of the RFC previously posted as DMA_PMD [0], now renamed=
 PISA
> > > > ("Pre-mapped IOVA Superpage Allocator"). The text below follows
> > > > Documentation/core-api/pisa.rst (patch 25/25), which has the detail=
s.
> > >
> > > I thought the conclusion was to just do this stuff in netdev pagepool=
,
> > > now you come with an enormous AI series spread across the entire
> > > kernel?
> >
> > There were surely comments claiming nothing outside net/ cares or needs=
 this.
> >
> > I respectfully disagree, witness is the fact that e.g. there was alread=
y an
> > io_uring proposal which is smaller, but does not address applications
> > that want to use the standard disk I/O paths (libaio, buffer cache etc)
> >
> > Nothing has changed from the initial series in terms of size, use cases=
 or
> > subsystems involved. Large files are placed where they should,
> > the series covers the same three use cases (disk, network, CoCo), and
> > touches three parts which it has to touch: mm (most of it; it is a
> > memory allocator
> > extension after all), dma (it hooks into map and unmap, not a large cha=
nge)
> > and net (the pagepool change is a couple of lines; the tx path needs to
> > touch more places because the current stack assumes all paths have
> > the same I/O requirements).
> >
> > For CoCo, there are very fine grained controls so the bounce buffers
> > can be enabled only when they don't pose a risk, which in turn
> > depends on the threat model.
> >
> > Specifically, for network tx buffers or disk writes, the user-to-kernel=
 copy
> > is basically a bounce buffer provided it is used correctly and not leak=
ed
> > elsewhere (which is the design; of course the implementation
> > needs to be verified and possibly fixed so that it matches the design).
> >
> > cheers
> > luigi
>
> Hi Luigi, Hi Jason,
>
> I've been lurking but following this series since the start. I am torn.
> On s390 where the IOMMU is always enabled on our closest equivalent to
> bare metal (non paging LPAR hypervisor), and where we also default to
> an emulated IOMMU in KVM guests, the underlying problem is a real pain.
> We're also in the process of enabling large IOMMU mappings via the
> generic_pt API which are 1M and 2G on s390. So, the idea of making
> better use of larger mappings is very attractive to us and I applaud
> you for trying to tackle this very real issue.
>
> That said I do have to agree with the critique. This series is too
> invasive, too unclear in its layering, and most importantly it feels
> like you're trying to do everything in a big swoop ignoring advice from
> the maintainers just because it would limit the scope of a first step.
>
> I also don't think Jason's point is that nothing outside net/ cares, I
> think, it's rather that the IOMMU and DMA layers already offer the
> tools and each subsystem needs to use the right combination for its
> specific requirements. And if a tool is missing this needs to be stated
> very precisely including how the addition keeps layering intact.
>
> I don't claim to have a simple solution to offer, if I did I would have
> sent patches already, but let me state my thoughts. First I think this
> really needs an iterative approach with much smaller self contained
> steps and focus on specific issues. With that, I think this should
> focus on the network stack, while the io_uring specific proposal can go
> after the block layer. Also in my experience networking is where this
> hurts most.
>
> Now, I wonder if we can't start with something simple. What if the page
> pool could start by allocating in batches of PMD sized and aligned
> folios of contiguous pages that can share a single large IOMMU
> translation. The page pool can then still hand out pages from that
> batch without having to do sub-page allocation but would already use
> much fewer IOTLB entries and the locality might even help non IOMMU
> workloads. So, I'd even hope this could be enabled by default and this
> is actually something I don't like about this series, I really don't
> like having a tunable when we know that larger IOMMU mappings are
> strictly better when you have an IOMMU that supports them.
>
> I think that approach would also align with Jason's idea to keep things
> within the network stack and to work with the tools we have until their
> limits become very clear.

Hi Niklas,

I have been working on this idea exactly - extending the network
page-pool with a memory provider that allocates large pages, splitting
them into N smaller pages that all share a single IOMMU entry. I
breifly shared my approach in the v1 PMD series [1]. I'm readying a
short RFC to share shortly, would appreciate your feedback.


[1] https://lore.kernel.org/netdev/CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+=
BJRVYf3JB1g@mail.gmail.com/

>
> Thanks,
> Niklas
> > >
