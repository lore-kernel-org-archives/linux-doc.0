Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792765864;
	b=ew1iTFwKXFQvQuYA5utqC4LZo3hxcNXHxXSFG05rL9frjsSVXYzrIHFBB6WSVLzKChdq
	 6xTL6H5gEmusXlxLae2RyGITlM/2cHPhmMAEHpPKsDDfiiuVkqEO8k6QtR9/k5CBRGmXF
	 VnFHKVUbdha0K3guOxfF3ds4hXtDSaosKdfUSyw+DTjorXcFvMVwwt2V4Hp7ZZK8SzIDH
	 gziGRpmx0zjPuPm7mo7Mr+wswapxHmg8v5p69lhukwgeJjqyhNyCY5CDBHUPvrKZY0T4B
	 4hLCcntr2daN2vNdFKh6u9jhQUZngEhueHz1oLOdyvQEwOE3Lrbv1R8j3WP3XFYNPNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s3FkMl8OhjMqOhi3zpzbiZNiNsx48LLQzOlCjP1CveY=;
	b=N2C9Nb7pdL2qkN8m3SZhCL2QKpBldVdlaGLUYyajq8NFSvCYzuld2BDyj9hK7omNcwX5
	 0Eh2kGQ/2s9odFBixdGjpczGs31J4vq+QwIM3XP4MWS+h+6pSDbPmBEsnueOO2cGxD0Bw
	 CgI8xtSTpLuak67Vyi5POZ+oue3A1ZbwfyLjCY0CjwQQR4Q6JiLmd6fnyk+tnTcJKjTrm
	 JxVT6uU+x36HoQP24NK04PfJ0gLG6ZSu3kwuVNszAc4lHNNoGCtegoesT+5586pxAA4SQ
	 2AGnwqpi24s1FsJ5P2i8xC/HkIHj0CHWEcs3mcondgWtSDOQSZ4aqLmXCoK5H6U6nzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VVIFg6tb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99660606A32A
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 14:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99660606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VVIFg6tb
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so55315ad.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 07:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765863; cv=none;
        d=google.com; s=arc-20260327;
        b=hpSan1oXSRVkMQmhMldtj//+6uqydUukiUrBoeeV5iORiollHhFP4o+t3xN8XksglT
         J5u9TTapN/NX4hnjqs6wUX3T91h8NaPAjpWoWRaCP8JRH1qR1HfbXP/3JJydIJdp3UvX
         cxc4JzhjE92cTH7809IxpcEPL0d7MHqNZnELVeRT8UhEXeKgYDjF1+tY942Ebr+WA7YY
         SUc1nfxCIJjpIeFpZ8FN4vMwkbaanbmtCgyLl51czI7vafyYxzi1d4MJTnCS3U0zoyzA
         ljwWFy63aADV3jmKCRbVLIzHtwW3Jw/wkmiJFqL5K7B/He6im8d1sJmjk9MXcHeKooyM
         ziCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3FkMl8OhjMqOhi3zpzbiZNiNsx48LLQzOlCjP1CveY=;
        fh=u+/B4LeldIL96WaecK0zR2H0+BBOQh9wFWGCDC5o4VI=;
        b=Hj+qWmrFTA39fnGa2pYsClM5dJze4wl52hOWe6wystfG4bLYi4NS5hPIRpd8VKIB8N
         BNZ2foc0amUJ7gKPEYqHzOwQh+1cDvyFrzXDWnsuNXrm+Em9TCUKRVRMAyquRXPSi3DD
         1Yr8AfVWPHHpgFDOMDosb7El61RCpHOjbpLb3gPY8K8l8zWanucP2ODZDyS51lOvD7hK
         hrg3P1gZgMnl++HIsDgLnyhRGrkO134i4n3tHRIEdlx+qQUv2wG5P2jb7Cl7xxHqjKF+
         7DdRFNuC820fhPZYf5uVY14ucwkzxhSfLD2m2uIGMPVF6gp2ze28adQtYlWAEZr3L67N
         vheA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792765863; x=1793370663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3FkMl8OhjMqOhi3zpzbiZNiNsx48LLQzOlCjP1CveY=;
        b=VVIFg6tb7WK4WNH/I3L6DFNDUrzYJ8o1O9kJJIOL0mZjbDHHGac5RMiQ5AsP/FqpYv
         1Dt4Jc4CBdbhHms0jG3oJH6xf8Tj+LzES5uC5C5CYoNAXzPld4yvlCtqXp3+F9mf0spz
         +3BusVjz7rkrm0ohoVloTAShTDbfxn+Rcr2g/VyGdDdplOcHciqKZgZmgBE4eYfT0qJl
         qhFR3JTcIYt343vm3g8Uh8JKEgZBCoIcY/Fn5sFRoo7c8899zyI0Y2kjALu+M9xDlJeA
         7upuI8KJB6SYRwqoRToLV67mbyXPbUJP4w9MoEyNB9cq5p8Kfjr85sCMlI79SsK78Rsf
         UeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765863; x=1793370663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3FkMl8OhjMqOhi3zpzbiZNiNsx48LLQzOlCjP1CveY=;
        b=EYXJuCG9EXniqyeU/kfi6HAnPDWM80/Rz5HrP91BiM/jQdCRCx4rouXbNgqcN4MZ9N
         t9P7jR5Wns1HIu7vOQtQmQTFukhrAaM0qwBIgM3vAA82pXAywo4tOvqtXWtG/PgTayQV
         AOkxYUVPJz/gg55lNhtpsjWeiQrFdYrMEsvt7zzf5oeSV+HpV2d4bsQHRa3fkjpCIX6I
         vX/ihSq6nSJtgFTCvfLbj/++kOsLnfOyHzzQgTjkg9O+0DuxZ+1DJTokHLR/D7tM6DeN
         ZVj/f+vXI2B5hA/x4/EAS+0VKxFISkg9V21Bhv03+oZwkow/+FzLX+kQtrv4aLc3wQRA
         a44g==
X-Forwarded-Encrypted: i=1; AKwUvBz3JjInQUDMgi/piA6IpJSMwQVGPZYTnbauXFKnjU35gFB58s/xZGwYXs7CqGfLqgPwdFvu24ngS3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHC3Oedq6mLaSnDcJKjaiCSyNua6eOk4eJoibUuNYSVkc7RiN0
	Enrp/z7S8wRzqg/P2zQMNJGx6VFSRZZ7eZvn5WB4VV47JFqHl7KAisiU6VM5mm+FY2P/6lwDRD1
	J0kdso+ihfdewZPDdEdXamIPOSe8k7hBwaXHmBzGx
X-Gm-Gg: AYBFou2nRn5ffRf+89gIcO0oAP6p5UAaPgZfmFHOh1FckwcNFtzyt8HXQxVkSeMtpWa
	unOfhqW3g5EOBLsdwbvJS5N71GHkIixJb3A1mcmBOu697miA9pGeNjypRSpwxNLCsJDGlx1ulnR
	geGO363Ob8Dhvv/QeYIJ2+zK6U60aNb5+x6YG64DFaNIUd4p0VbjrBNbkHk6AKsURfFLpECbAuO
	KUgHU0kJtiDnOT3JH3QOoUrTeEVYbbCYcqigfWF3vkVuG6DkCGXe2sY69JASWHaleYHRFfOq+jU
	rhuA3cqlj39VNJL1bqKux6NmFefMXvQ29LrQjItkjvTrFxPs+qu9zwx0umbmLmrWwU3xgcA6kDW
	AQKQ9rRl3HhNaPjNaPDRxHPOOrG79zvy+qnJDrrk/zw3lGJRIeakzXg5xScY=
X-Received: by 2002:a17:902:f683:b0:2ea:7180:3abf with SMTP id
 d9443c01a7336-2ea7f512f16mr4025665ad.15.1792765862249; Fri, 23 Oct 2026
 07:31:02 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org> <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca>
In-Reply-To: <20261023140107.GC3977851@ziepe.ca>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 23 Oct 2026 16:30:25 +0200
X-Gm-Features: AclHuK9d7tFq_s1fhJmYPVN1-JncgZCOvwLUHaeunw-YOxbh9iZtFoxmVAkcY88
Message-ID: <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 4:01=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Thu, Oct 22, 2026 at 11:51:40PM +0200, Luigi Rizzo wrote:
> > On Thu, Oct 22, 2026 at 10:12=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca>=
 wrote:
...
> > > Can someone explain what outside netdev would use this? And why you
> > > couldn't do this in the netdev page pool?
> >
> > I can try.
> >
> > Regarding users, the next target is disks (not included in this series)
>
> Disks don't use a memory pool, they do IO to folios allocated by the
> page cache.

I know. As I said I have a separate patch to cover those IO buffers

 block/bio.c                  |  21 +++++
 block/blk-mq-dma.c           |   4 +-
 drivers/iommu/dma-pmd-node.c |   3 +-
 drivers/iommu/dma-pmd-pool.c |  14 ++-
 drivers/iommu/dma-pmd-priv.h |   7 +-
 drivers/iommu/dma-pmd-user.c | 390
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----=
---
 include/linux/dma-pmd.h      |  53 +++++++++++
 mm/filemap.c                 |  27 +++++-
 mm/page-writeback.c          |  13 +++
 mm/readahead.c               |   9 +-


Disk I/O is still potentially affected by the same problems
(cost if io mapping/unmapping, iotlb thrashing, bounce buffers
in confidential computing...)

>
> The only other candiates I know of besides page pool would be the
> existing dma pool users. I don't think they are so performance
> sensitive as netdev.
>
> IOW I think this entire series is only useful to netdev.

Well, the series provide mechanisms to address disk I/O as well.


>
> > > It is not a common workload to have the DMA allocator be the one that
> > > allocates the memory. Usually we are DMA'ing from memory that was
> > > allocated someplace else.
> >
> > Aside from the fact that dma_alloc_attr()/dma_alloc_coherent()
> > does memory allocation + iova allocation/mapping,
> > this is not what happens here.
> > Maybe the confusion comes from one function name
> > (dma_map_alloc_pages()), but it doesn't map any thing.
>
> > My code (in this version, and more in the upcoming release)
> > mainly implements a specialized memory allocator with an
> > API equivalent to alloc_pages() and variants, but ensures that
> > the order-N blocks come from contiguous 2MB blocks reserved on the fly.
> >
> > The physical addresses of these blocks are recognized by the
> > "dma allocator" (I suppose you meant the entity that allocates the IOVA=
 range)
> > so that it can apply specialized IOMMU mappings backed by 2MB IOMMU lea=
ves.
>
> Why? This seems completely divergent from how anything else works in
> DMA mapping, and I don't see a reason for it to be anything like
> this. Other than it makes page pool work a bit easier
>
> Frankly this looks like you had AI to transpose a bunch netdev page
> pool into iommu.

(yes, AI assisted, heavily human-guided).
Frankly, it's very orthogonal to pagepool, given that it uses pagepool
for what it does well, and it provides functionality that pagepool
does not have.

Anyways, reading your next comments, are you suggesting that all
these functionalities should be implemented as pagepool extensions?
(2MB mappings and iommu backing, proper allocator of fragments out of large=
r
pages, device-less pagepools, multi-domain mappings, pagepool
as memory provider for skb heads, pagepool as memory provider for descripto=
r
rings ?)

cheers
luigi
