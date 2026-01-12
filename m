Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD842749D6
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 13:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224782; cv=none; b=YaMOry4OmG9FLCvlbK2VbYUrmf6vyeBp4ch3H9JDIixLEwlx6GwtfPq5X8wNRJ5gLlqRYQl8DT1ibCYOL3qQJ1ku/axID07KVxBXvvZRLx3aGcFe6FUrPleVmmWVaT23Gm8HllHOEs3OT1Y91/KyldxWTYWer429Cvh/LttuFrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224782; c=relaxed/simple;
	bh=spIsHBCK0TroQP2RO6KacsvLhnr36XzfF5LeCNxh2qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQpi15uBmqc91obqdnMysrzE3Ajl7J+l9vsRNO7nesfoL94wCDqkNmGlessQFbbQkBTHvE+uMohbDCWznb5mof6WiWLFs/BpIKDBUNx4npULjGLtGNNgoM3W2eRp5EGMlAssx0KjduR9dno/5XprjL7Uja8xX/4UZooEBSRwyBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=RXugb3Ch; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="RXugb3Ch"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ee257e56aaso58456051cf.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 05:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768224778; x=1768829578; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/3OlMjXUkwUyc3rlyrTigWpD2j2oxQCnKlM2MHwQt6I=;
        b=RXugb3ChylJ9sI82jOFxpobpQu1anLRM/wpxgVGYxWU/q2qTHKav/UJanEBIwQE4RN
         otJ88YLNQibj2WuAa1LYs1USGIwHsPIvZKdtkfU4u5rHy0uzY0FwVUOzxTK9GY+Ctf0k
         RDQB+ZJS9I0AnFTBLhGDYnV/Fp0qe+r1F/0jAidJgoqSSke75c1zUMnA6tUcsVovi5RS
         O8mtgqZwpTCABRx+vtO51c+iQ3n+mnT4h3ttF/XNXtFAp6TT2DLX6FUTTMjLDsPsVkCR
         p5lZfcXbY17yygSNi2MXmVyAcrZuljIQA9ag65MCI5xv+WSpWQT+J2nuaT+sugejgSTJ
         ScAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768224778; x=1768829578;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/3OlMjXUkwUyc3rlyrTigWpD2j2oxQCnKlM2MHwQt6I=;
        b=nrpde0WIyhuVAJYB1g3gD7GRMO9pnSbjzd1B/8e4HjIfrne3w0szXTSrWXQ/hvMJ1Z
         zfKIn+Wv89N7HYqAkAFI/czp+6i8/9ECLiBf2y+dkCUAZyt+IrT+WVSTv9GWhN+PKjRU
         q4FfSeBtUwbABr/Fs4Tc4r6Xpx0PmQMDvSHaPSsLBI/WmkrecVWZCCHvoCwz3Sp0KVMW
         lgNfH163B51nUEEg+lLMxPPKsQp4pTDKCfcM6R5gN/OYlmlv9qDeXmUyIrBy7DMJlTQb
         IZSwPrpfGuXBdqkVpNJ3Wf239OcIhYBQEMdP+yMy7DyJG/XmPqDwS6fdRsIYohY2uYj2
         GvyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm6q/9+UpGi53jBciy8K6ur8bm5+gzkoRUeg0XyL7kin4uOWPYT4xjnbMKwrSzhuzBLAtw7WIILIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUKTcxXt1d/geEnT93bv5nq+m+5EQwsYkI+ZVVPW1zl0XIi6gX
	GxNMZ9RkKsvwjn4On+epLBFtJCeg2hN5Yui9HQtf9DK7ekT1nCvJypOO/eDmRtmlPII=
X-Gm-Gg: AY/fxX4Sd8igVUGKDMobdZi4rx/0UCcfs2hIA9Kar1C6IMYn9biP7b/yMNgF1/pPRPU
	+I22WIlEVRUScwgHwu6RVaexEY/teK6fab2B/JzzIPI+5rhStNkstGpMfQAc/eyOSzb/e2oKBrb
	+QpgGhSonON8KbsWA3N3DgoZ3U2DSy361Dza/7Oa/zcm5xxTrJTlWcm16to12OD2ypviiV2bNa3
	3ytCte7qWoSlPAkdUnanheCjkkAwnK5LalXCWnBXMvHmcCatic4Xce2W9awlPxilT6ik+HY5FsK
	W9u6UK4F5B6HkWlZ4HeA6UtzLQnVscSiHV9w8BLZy8Pqby9Dkt8SATl58t9SSX+wmAVqmuncv5h
	trtLJO+kc4Gk9nE8F46qp5YaHJecmoo1M3oLj6tFpzoNJ+Iy0whKYWD0548b4j8J9a1Fk8/XwVw
	+wEer1r2O0CxX7wUulqS7VWntQvs50xUMrqRn1enK0nLkkg39OH1Rf4OicR7+bhOhh+GvPLcgEu
	87+hg==
X-Google-Smtp-Source: AGHT+IH4Dcu7h+OOktsvfMPjqqK1/8N0YWz6dlKvurnb+htQMqLWJDpjuBE6cizrKIHyOmLaaemzrw==
X-Received: by 2002:ac8:7592:0:b0:4ff:beb1:cb9f with SMTP id d75a77b69052e-4ffbeb1cbd3mr144089361cf.40.1768224778294;
        Mon, 12 Jan 2026 05:32:58 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffaac486efsm127185781cf.27.2026.01.12.05.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:32:57 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfI2S-00000003Pwo-2w95;
	Mon, 12 Jan 2026 09:32:56 -0400
Date: Mon, 12 Jan 2026 09:32:56 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com,
	baolu.lu@linux.intel.com, rdunlap@infradead.org,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v6 3/4] iommu: debug-pagealloc: Track IOMMU pages
Message-ID: <20260112133256.GB745888@ziepe.ca>
References: <20260109171805.901995-1-smostafa@google.com>
 <20260109171805.901995-4-smostafa@google.com>
 <20260109195111.GQ545276@ziepe.ca>
 <CAFgf54r_au6isA10Nrve=MHL455X=tKhNsSwH1ej-TX08J3xLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFgf54r_au6isA10Nrve=MHL455X=tKhNsSwH1ej-TX08J3xLA@mail.gmail.com>

On Mon, Jan 12, 2026 at 10:20:14AM +0000, Mostafa Saleh wrote:
> On Fri, Jan 9, 2026 at 7:51 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Fri, Jan 09, 2026 at 05:18:04PM +0000, Mostafa Saleh wrote:
> > > +static struct page_ext *get_iommu_page_ext(phys_addr_t phys)
> > > +{
> > > +     struct page *page = phys_to_page(phys);
> > > +     struct page_ext *page_ext = page_ext_get(page);
> > > +
> > > +     return page_ext;
> > > +}
> > > +
> > > +static struct iommu_debug_metadata *get_iommu_data(struct page_ext *page_ext)
> > > +{
> > > +     return page_ext_data(page_ext, &page_iommu_debug_ops);
> > > +}
> > > +
> > > +static void iommu_debug_inc_page(phys_addr_t phys)
> > > +{
> > > +     struct page_ext *page_ext = get_iommu_page_ext(phys);
> > > +     struct iommu_debug_metadata *d = get_iommu_data(page_ext);
> >
> > You cannot do this - phys_to_page() can only be called if we already
> > know that phys is a struct page backed item and by the time you get
> > here that information is lost.
> >
> > Probably the only way to resolve this is to somehow pass in an iommu
> > prot flag that can tell the difference between struct page and
> > non-struct page addresses.
> >
> > But I have to NAK this approach of blindly calling phys_to_page().
>
> The callers to this, first will check "pfn_valid", which is the right
> check AFAICT (looking at similar patterns in page_owner for example).

I'm not sure pfn_valid really works in all cases, it has a number of
exclusions that can be relevant when phys_addr_t can be a MMIO
address..

So far we haven't been using it in the DMA paths at all, I'm not so
keen to see that start..

Jason
