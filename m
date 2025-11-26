Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE20271A9D
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162774; cv=none; b=PkRPtuaAlcv8DFZRvnRHJzPaBE657HQzayfANTV88oICe+8HpT5E4Shvnh0IO/LK/Z0T5RgTLBamC21T7AcqmwP4Wz+KgvGNolTeeNVRxrEy9gT91paj/RxhejZS6r9n/IovJkPvOJTYoIWEkIx4kW+FpmCLwDcd7H0YJZOeVcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162774; c=relaxed/simple;
	bh=Jo1hwBQ1OAKjPw3AJMr/P9Kbq4e9sCgCina51O06nNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuJR/JBTTh93sD+Ql1s4uS8Atj17/4GsraQfsF7Fp6fsvkG3Jcv1tdzvZ7axQPqCY822BxzCge6u8+XCKPgzfpnbUvapynp9l1LU1QFvfBjnUep9LZh1ZbxTtxpmlAfxJCTf4Vt8saph7+PYIyAuYfTcNANYBhvrx1vO0gYUmAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0l/5TvTw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0l/5TvTw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-295c64cb951so203035ad.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 05:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764162771; x=1764767571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v7j/p6bUr5Xuh7DTD99aQLTt37H/gN4j/r6C1+HVuuw=;
        b=0l/5TvTwMZVpkD0BWtEXg5dW5N9AUKyXKn2OXl7vYSfXG6M2yRr080jIEYwyfqPEAd
         wMne3IxRGt0ErWDHmNsGn+LmXZfG3rqsj6HwxmqzPKf7n+FLOE5HFn2X4l77O3MBtID7
         vxzpILnpr5BHrOJ8XTP74p5zo6lEEpNddTzRqW5Hl91ynh57gDKQUzAB/nt28L6UGsSc
         8VwkNrMdvHKhMj+OxH5o55l/r0P3RLOZAdClLg7x54zjjEMeqTfpkk20+lzJpOUOQ1ei
         tQ9ByWrlYY3io0pKAa4iAp1bTao94cm4S95Fi1Ta0s2+MgqcGmY6ZV+u6TQ3AT19Xpib
         TGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764162771; x=1764767571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7j/p6bUr5Xuh7DTD99aQLTt37H/gN4j/r6C1+HVuuw=;
        b=aba6td7M0sVkvHg1W/uGqX1WTxdUzo4SvrXEwZ2jB5STYDlFZu7p2EoSlCyJMV3DH/
         HlRYGYuJOwHqupjuL512d9c1lu5pRhNV+MQLF36TTYMiapWq9vRVg9yzsvOpGObF3CYm
         xFI9a98TKSDvEKJoRm3YnUeQXVGMWuUrvS81UaCmMYf4n5e2gmDRjcQ3eJwnoJFdoq9p
         TNTLHuruh05GhLmyvMWgdHyRc5PX8kyqUyklxFyfL9ySY2hjMb8OvbN245aM3pq2GrNa
         3tC3hpvtNIAVLC3MF3nztSj2M/DDvLgYT1BAHbMTB9c/RoWTAEF+cBtwW/D9grg/HUcy
         gU6g==
X-Forwarded-Encrypted: i=1; AJvYcCW8FZ/Xl+1xiQ81c029r280v3Q0L2rQamD4SsfLdlGoLrd4zuKd0W/0jeKh6/xAnLr8FKaze0uktpM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytg0YDt0dByZ9AgOscMo2lky4X8Bip5NOb/ZzcQlislr92+cSK
	JxTYl/G15oFVWtnBpZwCi5IqqdhWwisndwNy6FczrVxXB4PHckiKF5XI8x3NZ0oofQ==
X-Gm-Gg: ASbGncs8+VV1b8rYD/fvwR9Ecm2L7yihdU0bWgB2tf+QfcROCA8ROHVbR1e1aNwLYGx
	haWhv27fxKJh7KheMBXGWOeIFfjDu9vDj2DGpxe/tnkYz+hckwkQmtPEO0Uadu5h54hS+fIzOAj
	3HJD1TsTSDT0gRc+c+/yPj4cNc1t8VS/iqHybaai3KNI6p7AyMyTPrILQxoYCAtdj2Kcckv98Iq
	K33Bh1okGr81N0WOzBsue7iQYQLN6op5jWH6vgR+nsmuUNHqzwwsNs9vOCOgHUe3onN8OJb1qN3
	KseXpQdVza3xuJPsZXzA+opva9ocg49ddnT/8vf60xpa+4aJFr4ZrKc396F3PYWNIDAgsZLHG4c
	V5F3FspPJ17DtpH9hFrilwzagsJFR49Sre2xsBO8YbNkpLg09bB69o7ErzGomDdJ5vcZ+iuq5dC
	MNWmsvas90K7hUUbnAFvR7dzXG+YU8puNOg3LitNBQba7LzxBS
X-Google-Smtp-Source: AGHT+IHJIOBgKlL+CS0ZpKtYX5Djx07PEo4PrDI8k+TVBWbcqpi0p7MakMMReKQUlItaKRJKERuBaA==
X-Received: by 2002:a17:902:cf07:b0:26d:72f8:8cfa with SMTP id d9443c01a7336-29bba9e8a00mr1709325ad.13.1764162769984;
        Wed, 26 Nov 2025 05:12:49 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b105e4csm194769895ad.2.2025.11.26.05.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 05:12:49 -0800 (PST)
Date: Wed, 26 Nov 2025 13:12:40 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Alex Mastro <amastro@fb.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>,
	Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org, Nicolin Chen <nicolinc@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v9 06/11] dma-buf: provide phys_vec to scatter-gather
 mapping routine
Message-ID: <aSb8yH6fSlwk1oZZ@google.com>
References: <20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com>
 <20251120-dmabuf-vfio-v9-6-d7f71607f371@nvidia.com>
 <aSZHO6otK0Heh+Qj@devgpu015.cco6.facebook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSZHO6otK0Heh+Qj@devgpu015.cco6.facebook.com>

On Tue, Nov 25, 2025 at 04:18:03PM -0800, Alex Mastro wrote:
> On Thu, Nov 20, 2025 at 11:28:25AM +0200, Leon Romanovsky wrote:
> > +static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
> > +					 dma_addr_t addr)
> > +{
> > +	unsigned int len, nents;
> > +	int i;
> > +
> > +	nents = DIV_ROUND_UP(length, UINT_MAX);
> > +	for (i = 0; i < nents; i++) {
> > +		len = min_t(size_t, length, UINT_MAX);
> > +		length -= len;
> > +		/*
> > +		 * DMABUF abuses scatterlist to create a scatterlist
> > +		 * that does not have any CPU list, only the DMA list.
> > +		 * Always set the page related values to NULL to ensure
> > +		 * importers can't use it. The phys_addr based DMA API
> > +		 * does not require the CPU list for mapping or unmapping.
> > +		 */
> > +		sg_set_page(sgl, NULL, 0, 0);
> > +		sg_dma_address(sgl) = addr + i * UINT_MAX;
> 
> (i * UINT_MAX) happens in 32-bit before being promoted to dma_addr_t for
> addition with addr. Overflows for i >=2 when length >= 8 GiB. Needs a cast:
> 
> 		sg_dma_address(sgl) = addr + (dma_addr_t)i * UINT_MAX;
> 
> Discovered this while debugging why dma-buf import was failing for
> an 8 GiB dma-buf using my earlier toy program [1]. It was surfaced by
> ib_umem_find_best_pgsz() returning 0 due to malformed scatterlist, which bubbles
> up as an EINVAL.
>

Thanks a lot for testing & reporting this!

However, I believe the casting approach is a little fragile (and
potentially prone to issues depending on how dma_addr_t is sized on
different platforms). Thus, approaching this with accumulation seems
better as it avoids the multiplication logic entirely, maybe something
like the following (untested) diff ?

--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -252,14 +252,14 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 	nents = DIV_ROUND_UP(length, UINT_MAX);
 	for (i = 0; i < nents; i++) {
 		len = min_t(size_t, length, UINT_MAX);
-		length -= len;
 		/*
 		 * DMABUF abuses scatterlist to create a scatterlist
 		 * that does not have any CPU list, only the DMA list.
 		 * Always set the page related values to NULL to ensure
 		 * importers can't use it. The phys_addr based DMA API
 		 * does not require the CPU list for mapping or unmapping.
 		 */
 		sg_set_page(sgl, NULL, 0, 0);
-		sg_dma_address(sgl) = addr + i * UINT_MAX;
+		sg_dma_address(sgl) = addr;
 		sg_dma_len(sgl) = len;
+
+		addr += len;
+		length -= len;
 		sgl = sg_next(sgl);
 	}

Thanks,
Praan
