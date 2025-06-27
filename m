Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5522D97AD
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029328; cv=none; b=mkZzJJVqpDRgFXAmGIwo8mpzJv6wLrQ4e57Kzw3720BGcxxp2PXvWW+8BbqQf5vN9QNp/hEmz6OiNmpgtHOjw4XYgnajKltio4ue1yo402J1IjTQGKgRP6bNapDtixCQenBfZROD+MexQr4JCDYsbqr5xutjv/6Sw3S0DAlmw2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029328; c=relaxed/simple;
	bh=F8EDOzjXrDbWmnlmZz1t7I4za8xIMeSWdmVPPoPujGc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G1RD79HjHXiH329dxaQc0W9lmf8mStNRPLbkChUiGdat+MHr09FDa2lt9HXOVxUQjfZvZgCRTRf5eiFWjp/nokcZ5lO1lZ9iXiTAur3QYvrC4yO999nZDzvAkOFeUl72En/70oZF1BfUTqb1xnwhAOnzmdxQDhuC6ZDMwi+h7NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TjHOIKIG; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TjHOIKIG"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6f24ef3acso229619f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 06:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751029325; x=1751634125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22QdyLiFVtJ8aqoY0Hwoc5WCRF3aJ1CurJSMqFHJ5LM=;
        b=TjHOIKIGsTToYCvmb1pMomrug+hddc6M7/A6WuC/SDHTKFjXa1/72SHQ6yzY/CCXyU
         kwQ3UINLco0d5hiB86/u8OSWxEnrmBfUwuk6PsAm2HVdWVxfkhYy+lq3c8nXatxDx3RO
         e+JMAqNTd8N1HXCj11RWq/NBbBbgqsXng+IVVl4d6M9Uy4hkQjphEVs/f+HWkmUcFp9L
         vn7tqqMHvODkjWBcliiZbUSTk5W43zyQkg6Hkbzcf7+i+6bJkwxXUMelQgV7wy8pYY75
         FDRP3Fgr806mIasmnAm+0FFolQItsbn7WtrwiekoGhbkI0Mag/8cl3ISrKDFo1opy8vQ
         mrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751029325; x=1751634125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22QdyLiFVtJ8aqoY0Hwoc5WCRF3aJ1CurJSMqFHJ5LM=;
        b=sMtMkmLEaLEAgpTdcoDMCFrUsY8WNN4k3cEGbPtHR5/8OEhr7vSlH4xE6c4G81RTT6
         AhNMsTZaoeeChKG2c23ydsflYs6cuwxgMVRupZe9cYhYncU6MLps32jepogOL/CX7/xz
         8JeD5izRWMKl4SqA+BSdiNtFJyB89TH5atxPcrmqHsirwhEjC6hFlaDPlxFCpxgvbtS2
         AUQ7g1T8KRclH8hajfY7Xu+QOozcDvOGQx1zgbwmKJQuZhhn/WxcOWRfE0c4/vSPI6rY
         i1/FE8im/iJFmSVvKUFcXYcuDYcqJ9EsTkZ+qqH/Fu3w83PzCki1pvU/OxnSuzGNdDAA
         Kkpw==
X-Forwarded-Encrypted: i=1; AJvYcCWrm/5pgz62LF9oxm0AEILS0ZHbH0zTZ9+km0oqm9gPUOdJWZYQg+r6yuQ6u+I2Ol+n+BQxGdCQU/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKAfZtd4OiICaPXAcUqWQe49XI0QfOeFXXsP1Y6V8vh9FRQr6B
	mDmuNjWM016Y8/zkH+i8zrjCM1PCjUuARsBxVHjX8ov+qVezSIFeFKlQ4YkpnLORfLM=
X-Gm-Gg: ASbGncvy7qJIqEP0CKvgAInLRuD7yJnHvOHRco0d0lsaCNXjeGv5njGDmEs4CY8wx2q
	CzxGOwU1iSO62cCBc49xLNstwW2GQZ50bFOoA3C6uRJjyzbMekjjmeETMW4Vl3YvrYiFnkpe3Tr
	GMs3WtGoga1t5Gbna+8eLjoSEColgoqjMb4LnWUb0Btgbyt+ia5Hs1D82XJEK//raoUnUnovg2k
	6ezqG63uPK/wwBoaYm8XWoIc/eiCNCfknNzB9SuExUbftBqt80EaFiE/lbF/pGMEVpWk9Lpb8Kq
	987Ey78DOYe7W2jVL/B+dxJKCWN+7TOn+2BR8I9bge4CBEL8EDmX5QJjyQwG63klZ89DYljAJif
	rNvY0pFLAw13sRHjuLSy9K84ySe+Yg2nCv0zSadUnxDU3oMODLLHfid6Klo4M++ynEZlqZIHH2O
	xPfA==
X-Google-Smtp-Source: AGHT+IE+dpgMJXXbb3Q0ZAuKEMDWMdgM8HtfCx3M03+1P4Vz5NMyiQcifzE/Bk4mh1MZJwWBbhP/JQ==
X-Received: by 2002:a05:600c:8b22:b0:453:76e2:5b16 with SMTP id 5b1f17b1804b1-4538ee5dc7cmr13153575e9.0.1751029324438;
        Fri, 27 Jun 2025 06:02:04 -0700 (PDT)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406ab6sm50817745e9.30.2025.06.27.06.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:02:03 -0700 (PDT)
Date: Fri, 27 Jun 2025 15:02:00 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Jonathan
 Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, Leon
 Romanovsky <leon@kernel.org>, Keith Busch <kbusch@kernel.org>, Caleb Sander
 Mateos <csander@purestorage.com>, Sagi Grimberg <sagi@grimberg.me>, Jens
 Axboe <axboe@kernel.dk>, John Garry <john.g.garry@oracle.com>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MEMORY MANAGEMENT"
 <linux-mm@kvack.org>, iommu@lists.linux.dev
Subject: Re: [PATCH 7/8] docs: dma-api: update streaming DMA API physical
 address constraints
Message-ID: <20250627150200.2192c6b1@mordecai.tesarici.cz>
In-Reply-To: <aF6Urf667AKtVGXr@infradead.org>
References: <20250624133923.1140421-1-ptesarik@suse.com>
	<20250624133923.1140421-8-ptesarik@suse.com>
	<aFynHWAYtKPFT55P@archie.me>
	<20250626070602.3d42b607@mordecai.tesarici.cz>
	<bdb3a37a-a9d3-44c1-8eb7-41912c976ad1@arm.com>
	<20250626154818.46b0cfb1@mordecai.tesarici.cz>
	<0f95be6d-2e13-4281-98b5-6d4311a3b98f@arm.com>
	<aF6Urf667AKtVGXr@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Jun 2025 05:55:09 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> On Thu, Jun 26, 2025 at 05:45:18PM +0100, Robin Murphy wrote:
> > Indeed that might actually end up pushing things in the opposite direction,
> > at least in some cases. Right now, a driver with, say, a 40-bit DMA mask is
> > usually better off not special-casing DMA buffers, and just making plain
> > GFP_KERNEL allocations for everything (on the assumption that 64-bit systems
> > with masses of memory *should* have SWIOTLB to cover things in the worst
> > case), vs. artificially constraining its DMA buffers to GFP_DMA32 and having
> > to deal with allocation failure more often. However with a more precise and
> > flexible allocator, there's then a much stronger incentive for such drivers
> > to explicitly mark *every* allocation that may be used for DMA, in order to
> > get the optimal behaviour.  
> 
> It really should be using dma_alloc_pages to ensure it gets addressable
> memory for these cases.  For sub-page allocations it could use dmapool,
> but that's a little annoying because it does coherent allocations which
> 95% of the users don't actually need.

Wow, thank you for this insight! There's one item on my TODO list:
convert SLAB_CACHE_DMA caches to dmapool. But now I see it would
introduce a regression (accessing DMA-coherent pages may be much
slower). I could implement a variant of dmapool which allocates normal
pages from a given physical address range, and it seems it would be
actually useful.

Petr T
