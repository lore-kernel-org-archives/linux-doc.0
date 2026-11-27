Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795782569;
	b=JVo3gWyH5S/m9gXAg6njFiAZaxN9Iih/whoFgmCR63L/mmAIX4p/pPaIZWVHRXfttafv
	 Iifdq3+xO9FDL8Tdry9PdMGbIK9OqVObrFN2elkxvvZ2I/1g3pMtnIYiDH+hPBdknEsHN
	 4VpE8oK3qfk6ovkkK/zYhPPoLLrowt/X6TZijekEGCmI6gnUEAs8SiJsUScb3LsZjpxNA
	 J6fkwnjz99O5pv22+EBIu2XytiIoPSpNH7e4bnMmRmR97OMCWiWzHYUx2nMC2ZIfEB0GQ
	 zvPfXBCEiHnAHr78QAio0ztY5OYC8DO8DvhewilYBUT2qOx32Rgi2m+LHzHTcRdvOUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gXf5stEDIYuDZVQjUcNyW733hx6qDRKNZoyJXoBIROc=;
	b=cYS8WLwAdkCUpym4Kbiww0ZowSTAAcmO0YSrPZ3UBxdsi8Y1qNlMRIZC2OCyZaqS2H52
	 etH60BdKsvzNwTmkmVl9RP7Orsxyg5ofiUX9EwyIpM73rZKdSBBGwnf2wi5PjLqDu+bqq
	 a9FvFgUWmJahYffKjMtgaQlJZ12hjhqo3LTxiuKb+jAin2iKRaawP+kXq2LziBzRgTHV8
	 9MnW4ov0sVBGYtrEcav7ECG8278+KsVHh1d6OLl9BFvNmZbav+Xm20qtxKM4zeOHVw6+F
	 yDT0Ih8HXsHdGGABn9QCNyg3DYSNp03Y8tZRnGhliyenhinTATr8apSZq2IY1l7oYvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IDtGKepm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CBA606A32C
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 12:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63CBA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IDtGKepm
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55dd1f9b760so134711cf.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 04:29:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795782568; cv=none;
        d=google.com; s=arc-20260327;
        b=NoUKa0nYritoIbPF7ueGXJYIsVgHCakZMVqUS2U9netq3+4PKMOIoLJEvjjCKkv39L
         Wk3hp8JKtFz134uGMBcCgScT+XNgOrFaILbWoHrjOpLiz2r4nKindegxZstKgW5cFbIm
         mDVyjR+ktWN0ukPWuWq6GpUJFdK3jgWKhxQXW+vv7K17kggaQuPPdj8LWrm33XI9eJTr
         ZGFhMPGHXg8lj4loVDgZ2SBWfbvBMyb9auGnTztxAH/lNG6gDRvZijUwGD2lLNiU7agq
         7LsDZ871yfNW/cs8l8fbYk7HfaiTJpBIwC9AlXi5QjjWhWBs0skAm2mmuuGRrNk6YtBL
         tlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gXf5stEDIYuDZVQjUcNyW733hx6qDRKNZoyJXoBIROc=;
        fh=uFrWCP9ScRsjGq7V2wvoe5oP4uRarJC0qKpz3+o9oZk=;
        b=TuD13HzbCorA7uKv4uYz/RK7cL0of53bAeewK1oEBzu5EcitGmuH5oo7Y3Ghb28E/v
         aMqiK3Vd9NPcxaewCQXc2z8EztgG9airpFCnHIUA057SgN6y+X5UXzdTcyMmjRESsKhM
         vsxWwfF70OrrSwJvG9mMyYSN2N9kOAy/rhcGo6iLO92MGrtwBBdapnwY3z5KaVqHGaWq
         sqHYAEFfxqGpF1W0/058fEdo4rx8esiUI/5ubovPbx6cPpyrhd6sY6utC47B7X4GZlVG
         X30HDIynXdEdAfbQnvpHnO6aVUO4a8Rc1VjHHPsZRptwEWcDW1QgKKi8ghYLDyeM46Xo
         Tplw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795782568; x=1796387368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gXf5stEDIYuDZVQjUcNyW733hx6qDRKNZoyJXoBIROc=;
        b=IDtGKepmhQShYR7D/olwV/obTk+1pmvySEjMhbDi/ma/1i93QiS/JtjUrgxBSMhQ0k
         JL+ilsf6MgB7rL0RhzqkxVfHwpWehnk7Fk4Q747FAHE3PcGDe+yn84ff6jYRMPlMbx0e
         QokdEvRzq0preycHEpMBQ2Lohvx+Zw/uSsx2DMrkiT1qcSSKYLtRImSCVnyuzNksYALX
         NtWTa/1okzanV5FHK0NJqjKm441asfoZ8MYagjrt+QkZuqm+fqNCuiCSxrGhrELhPKIE
         fk/8Dwyrnu3Us/ZvtQsa36mEXHtFs/36/ZYUVzpvU3JIUzDhbiIDtqOBlvidXDxzNxSY
         eJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782568; x=1796387368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXf5stEDIYuDZVQjUcNyW733hx6qDRKNZoyJXoBIROc=;
        b=kcMP5tk5jWezJCGISvBwiR3oFVWr+z9minxEW8uF6QW5mq1dCy6Iu7kJqwwCM3aJTU
         tbXYX5e9FPkgnrJGjuIt8H6gFFIzFfUvV48FayW5DxkrXNT74QMbPkHstqGtXDSH+ES9
         TibQkZPlFLxJ5A9gil2htwOYD0yX02eHkB7SJRYVAcOrZG4ksDbDuwFGwUIxoXHXGrPe
         C6oMwtANKV2LuCJeL0KjwfvJCzwot2hciJdhOVNyv4FNp+Xc5UPITau1U93wy6MajYua
         cMgXI184cNE/2n1vf3HGe0/Ji0gQii4ES3CwlfeQpJJwasxGh1g/yuDz6M/nPfZ+Goh/
         vS9Q==
X-Forwarded-Encrypted: i=1; AL+hErFJZlZbN5QHjZXtJNmK1X4d7ZZYi4UdlcbIrt8yq8yNBUlFRirY7QxE0kh6k5rK5Fm71SR0PI5Dt3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RTW4MbXbE+pns524BT8N4PzpVcKpJ2zSNNCU6PW+8E3y8PTa/
	ksgTL7hXfCjQk9sIZOHswM6GHdLWiFuQRi7g7O9cy9TK7nOgh1t68/gkk89dTZK8t6uny9L5iKZ
	8rnbW1eWguZwizJBpzmwLNdG++XnKcKbPeQbbQMsg
X-Gm-Gg: AZFdTZd0tqImLqu8A7k50+grm/NgfQy2wPCrF7L1IFzuSNhUhEFtPi1Rfu/4SM9oqg5
	6l9iNRgrWREIVyGLzyYW5AndqL6aln1BpnzjT6Vie3d5E0vH64cHG0dj25PhMudEBew84neorG3
	g/r3n3iALSEszz6maDs65vF2noBwkKyPBqKhhwNJ0a2azcdC9DMVCxg9zUNHuwX+1NdLYecz5ag
	WpnT12u0CFl7JHuEIJ/wYuy8pv8ANrhVGwGkpUrucqmBAe53TIHMhMBEo+E++mQNkKBzwmRA7pE
	etafwSiKMC4XEXoqf8qEykphTlgrUW/xYMoeumBCMV7sHMZ7EbWtkYA8dPWijNfmbThMTR2GHnS
	hyFXLO2E7n65LYKw5pjsuy4gDeyY6enyuxhuSGA==
X-Received: by 2002:a05:622a:a14:b0:536:6ae9:f55f with SMTP id
 d75a77b69052e-55d8900bdcfmr34062041cf.7.1795782567558; Fri, 27 Nov 2026
 04:29:27 -0800 (PST)
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
 <CAMP57yVZx=s-JXHfQfd_ouv2jV6MMsJXpxVLkQQHG=7qfFVJfA@mail.gmail.com> <d42bd9452d00a0b2a5b7d6652d556c9fc8d2c830.camel@linux.ibm.com>
In-Reply-To: <d42bd9452d00a0b2a5b7d6652d556c9fc8d2c830.camel@linux.ibm.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 27 Nov 2026 13:28:50 +0100
X-Gm-Features: Aa3M54o01jhZM9dCQYVFb8_-yMQWCkVYamRB04RwDLjyCo_Cf-5r3I24fRo_Jr4
Message-ID: <CAMOZA0JMZ8wUrV08YznFUH7AkmyqXcNdzfd26KsoTtzqt69SVA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/25] PISA: Pre-mapped IOVA Superpage Allocator
 for DMA and CoCo
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Naman Gulati <namangulati@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
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

Catching up on a few comments:

On Thu, Nov 26, 2026 at 9:46=E2=80=AFPM Niklas Schnelle <schnelle@linux.ibm=
.com> wrote:
>
> On Mon, 2026-11-23 at 09:50 -0800, Naman Gulati wrote:
> > On Mon, Nov 23, 2026 at 2:10=E2=80=AFAM Niklas Schnelle <schnelle@linux=
.ibm.com> wrote:
...
> > > I think that approach would also align with Jason's idea to keep thin=
gs
> > > within the network stack and to work with the tools we have until the=
ir
> > > limits become very clear.
> >
> > Hi Niklas,
> >
> > I have been working on this idea exactly - extending the network
> > page-pool with a memory provider that allocates large pages, splitting
> > them into N smaller pages that all share a single IOMMU entry. I
> > breifly shared my approach in the v1 PMD series [1]. I'm readying a
> > short RFC to share shortly, would appreciate your feedback.
> >
> >
> > [1] https://lore.kernel.org/netdev/CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69t=
rmw+BJRVYf3JB1g@mail.gmail.com/
> >
>
> Hi Naman,
>
> This does look more contained, but I'd say you should still go simpler
> and fewer steps per series. Some thoughts:
...
> - This is still a LOT of churn, my gut says much of the benefit should
> be possible with much less churn. It's really too much to follow but a
> cursory look makes me feel like there is duplication between rx and tx,
> which is weird since for the pre-mapping they should be quite similar.
> There also seems to be very little integration with the existing page
> pool, rather it seems to set up a parallel mechanism for the pre-mapped
> buffers. Really in a first step I think we "just" want to use a more
> efficient DMA mapping and contiguous memory chunks for the page pool
> and also keep the page pool API unchanged as much as possible.

The implementations seem large because they expose limitations
in the current kernel code (or our understanding of it;
but the proof is in the pudding). Networking for one, since you
mention it: the tx path allocates memory in many places without any
hint on how the memory will be used (loopback or device with IOMMU ?
cleartext or encrypted?).

If we limit to the easy parts (e.g. just network RX) we may avoid
some churn but we will not resolve the problems arising
from reasonably strict IOMMU deployments on large systems:
- IOTLB thrashing (network traffic uses separate PTEs for
  rx buffers, rx headers, tx_buffers, tx headers). Rx buffers
  are only 25..50% of the total. See [1] for some data.
- per-buffer VM exits on overcommitted VMs (same problem as above)
- IOMMU unmap serialization (with strict DMA, I measured over 10us under lo=
ad)
- swiotlb copy cost (on tx and a backlogged queue, most of the copies
  happen on the TX softirq handler).

Also we will not be able to see what is lacking in the current kernel
code to address all the above.

What I wanted to do with my series (Request-For-Comment, for a reason)
was to identify the components we presumably need (meaning: implement,
or figure out where they already exist and actually do what we need)
and get an idea of how intrusive the changes would be.

Then it is completely fair to say that the goal is not worth the effort
and should not be pursued, or to take the low-hanging fruits out of it.

cheers
luigi

[1] Here is an experiment with a system using bidirectional TCP
traffic on multiple NICs, where IOTLB thrashing becomes a bottleneck.
Below is how total throughput (TCP payload TX+RX across all NICs)
changes using 2MB mappings for different regions.
We really need to cover them all to recover the performance
of identity mode

Use of 2MB mappings         total TCP throughput Gbps
-----------------------------------------------------
none                                  440
rings                                 572
rx_buf rings                          577
rx_buf tx_hdr                         572
rx_buf tx_buf                         649
rx_buf rx_hdr                         674
rx_buf rx_hdr tx_buf                  716
rx_buf tx_buf tx_hdr                  734
rx_buf rx_hdr tx_buf tx_hdr rings     744
identity mode                         744
------------------------------------------------------
