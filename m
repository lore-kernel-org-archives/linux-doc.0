Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EAC304BDA
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 17:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763399785; cv=none; b=CFdK5lXmD+54Ba5oOlsdvoDlB4QJ2PMTIi6AZ3IrlQrnaO95IRFhzNwMq0gA59kKRj+r/IG/mHP1uhxufzwmDDb/pRv92hXHLASIRNVoEywj/K4IuHoErnEC8DNYkD20QkmlhiKzanIk8k0rSG1uN24BSgP2jnFP32hiBPRH6Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763399785; c=relaxed/simple;
	bh=2sNLnkk8V5VHxiND7V+FoGQrjFZ2T5dAZtQ/cFM2bC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evrdp7vDfAwOcCsQknGzGvkfURZzjKjXiCsX0xWD09iEqB3bqdrPwP/OSVCR9qYg3A3sFwXBz9KAywGKbhG6RVOeJdItjc4NlevQrLamgZEcjTNzyU+vXAL26M84QBa6z3LCH4qBK0NMfydlrc35KXk6pnP3BASzqP/2l3SvXok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=St0q6+iO; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="St0q6+iO"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ee04609ffaso9134271cf.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 09:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763399780; x=1764004580; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P1EKuTl21MaZwOVAnrWkECo68IZFcqZRr/UNlppTPmo=;
        b=St0q6+iOpxbQP/6k4YKopb2b5abxIoNmFDBUjCQhyPHK+h7d8HKH6xaNs1SrXfm6OZ
         SX3+iU7AfSkVpcl9Oh20UsDOxLGNyrTJJc60M57mpWVYDN6AnVbBn3x/F0Pr/nl/c57p
         5jOlIOnA23o0k+wKKWoTyTffzSAy9/U+iWg/cLqgA3zQq/msJHRR/LgxbQaTSBBwO6MZ
         HKzAgSbvvmGmW1PFfxSgqU9DWWWbgWBmTKIdeGJueyBjy9frttHn2vvAydk/HIgrAZxw
         cGoTxy1YwOwm3TyCYh3mvEIbvhY1xGP7VBnVqBapoxOOhc2WUKsxkMK9G0cuu6VQah0D
         A6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763399780; x=1764004580;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1EKuTl21MaZwOVAnrWkECo68IZFcqZRr/UNlppTPmo=;
        b=Vn2WukhOU4z4JjjnSyMUP28LolheXb6DQ9FQKX6gZuvfmpynVJx0/iq7dTRmfIaYPV
         EZ3bUac7vLpsVCgDd7StvWVVRMhm5E1WYE4eOoeBVeP0/fNv9WIQhYBlULKNO+T2rB75
         NZD7p/0dsII0RTLAdZsM+SWT+e0nvyWuZ4KUC1rFkqQeUH51zoNR+TduCrcIheIFCcAO
         vWZmQ37+Dn4clWRiOiYDLyiQal2TSzsZLJuv4ZdeczU6+W4TqDPpE6SCJv8XOWul3oYy
         Z2hhZ6bcvVTksVaI1ewwmHqxMs8v3SPK1hHTbT+w5x1PS34QtwDKPKo3R0ulAlfLzWPj
         knhw==
X-Forwarded-Encrypted: i=1; AJvYcCWDCzcFVNKUOJLoNA8oji8ylQ7yNJoIO7rLVFl7+2r+IklRdr89EA30Rc9Aot6l2KJv5MKaQEmxM7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFQniNAW9wUL7CQ5oWU1s69faFU4+7u9GMW0w73j47a2C0qwX/
	sxi4RV8G4cYNm923ApCv9ucjccQ8u6bCu6TuumqJAGfQsMBO4/K2I6nOsUPiaY8dFEA=
X-Gm-Gg: ASbGncvnZifEf9Sc2iEnoKOpEiGNhTxbf+V7WS+82676m69yZfRVg1OxpsD439cwdh6
	FXuuLanA86hb7sSZ/aOYy4dWDpkh+FhtC7Ac2ET8p6q725i1Vyj0gEiGFfnLFQtORZ4UMyJ5Iyy
	DDxFyQTPeeh+YHc6zQR9jWlNtbZXD6RofhOGPKs1Q/P/O0s6ahrzqtYPSXgv32fFoR8t96Uu2iv
	xrdm0ug71tgjhfKRjBTVvQD9009jTEKTSCKW3JTbdCZPRdl0tHLiz74BjmMC+nu5sHUYbdRukXY
	qCl5mho+nHOh0WV+mi18RUtQ/7WpA2oUjrfifNuZqaWl4shIXcVc88ZcWF7HddYVzE3U2dwN7Pg
	v+cU6tNkwQzLIZiVcqsR6vA8HiZc7zwZPjSUcCJAtYlErl1fzJdkdcgovAMY4epAxczYj8G+zjr
	YacArSRGLBZwRnkqEwdAz0AsUKr2HLCB/ojiyvdsjoNFDlFzhQiomt5GIh
X-Google-Smtp-Source: AGHT+IHdomOA3fXFLRj5Qifi24Z8ILoy1R2tZQWL9HXByV1pnhKykseLX/aaxM1vhUTUzCoPwrvJjg==
X-Received: by 2002:a05:622a:22aa:b0:4ec:ef20:ac52 with SMTP id d75a77b69052e-4edfc87511cmr159168241cf.79.1763399780286;
        Mon, 17 Nov 2025 09:16:20 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee1c21ea34sm32656311cf.30.2025.11.17.09.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:16:19 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vL2pv-000000005PX-0G4a;
	Mon, 17 Nov 2025 13:16:19 -0400
Date: Mon, 17 Nov 2025 13:16:19 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex@shazbot.org>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v7 00/11] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20251117171619.GB17968@ziepe.ca>
References: <20251106-dmabuf-vfio-v7-0-2503bf390699@nvidia.com>
 <20251110134218.5e399b0f.alex@shazbot.org>
 <da399efa-ad5b-4bdc-964d-b6cc4a4fc55d@amd.com>
 <20251117083620.4660081a.alex@shazbot.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117083620.4660081a.alex@shazbot.org>

On Mon, Nov 17, 2025 at 08:36:20AM -0700, Alex Williamson wrote:
> On Tue, 11 Nov 2025 09:54:22 +0100
> Christian König <christian.koenig@amd.com> wrote:
> 
> > On 11/10/25 21:42, Alex Williamson wrote:
> > > On Thu,  6 Nov 2025 16:16:45 +0200
> > > Leon Romanovsky <leon@kernel.org> wrote:
> > >   
> > >> Changelog:
> > >> v7:
> > >>  * Dropped restore_revoke flag and added vfio_pci_dma_buf_move
> > >>    to reverse loop.
> > >>  * Fixed spelling errors in documentation patch.
> > >>  * Rebased on top of v6.18-rc3.
> > >>  * Added include to stddef.h to vfio.h, to keep uapi header file independent.  
> > > 
> > > I think we're winding down on review comments.  It'd be great to get
> > > p2pdma and dma-buf acks on this series.  Otherwise it's been posted
> > > enough that we'll assume no objections.  Thanks,  
> > 
> > Already have it on my TODO list to take a closer look, but no idea when that will be.
> > 
> > This patch set is on place 4 or 5 on a rather long list of stuff to review/finish.
> 
> Hi Christian,
> 
> Gentle nudge.  Leon posted v8[1] last week, which is not drawing any
> new comments.  Do you foresee having time for review that I should
> still hold off merging for v6.19 a bit longer?  Thanks,

I really want this merged this cycle, along with the iommufd part,
which means it needs to go into your tree by very early next week on a
shared branch so I can do the iommufd part on top.

It is the last blocking kernel piece to conclude the viommu support
roll out into qemu for iommufd which quite a lot of people have been
working on for years now.

IMHO there is nothing profound in the dmabuf patch, it was written by
the expert in the new DMA API operation, and doesn't form any
troublesome API contracts. It is also the same basic code as from the
v1 in July just moved into dmabuf .c files instead of vfio .c files at
Christoph's request.

My hope is DRM folks will pick up the baton and continue to improve
this to move other drivers away from dma_map_resource(). Simona told
me people have wanted DMA API improvements for ages, now we have them,
now is the time!

Any remarks after the fact can be addressed incrementally.

If there are no concrete technical remarks please take it. 6 months is
long enough to wait for feedback.

Thanks,
Jason
