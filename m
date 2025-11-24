Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564901BC2A
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 12:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763987859; cv=none; b=LvAp9c+ba0gCzG5dOdgfoaPPLRGFBEupScaVkfpOUQ28MOi3yxq88e1XQzsEjxsRaxRkSrfVK85bshRwl2wA8Y9VjBzlZMWB7bMLQENESFxZmhZT4d6chRMSil/angTzeB4xVGs54Fya8cxTwikY4KMfLBmV48h7XiHIAVEHBeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763987859; c=relaxed/simple;
	bh=xjDttXRS5ImqH6z/aDM7WnkLGLiQh07Ud/MtlyMPsCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9JDXM2aUc5IAhtuc4iMlX9iHxtkossYiGwW+eWhFQohZK/k6hBSpFtPu9o/CxEZgjW+Wzx9C5D3264zPyLBr+4U0qoJYppXk/24lIR/8Pn2AUzscJLDXmDw2yg/kA/0Xkucb8Uhc5bbQZCW/B2XTboEDOHvePdbfcS5ZZvf80k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4VbtNfm1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4VbtNfm1"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779e2ac121so99745e9.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 04:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763987856; x=1764592656; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FbelAFcOsYSEHJr61jVue9qL8RZ/6OY7KUqEPYnfD10=;
        b=4VbtNfm1S14HNWsqhtiYA25Uc1inP2P8pkUUcH6m1ctm4K++/Nic52Pnq3wizspMhv
         ghgihDzU5lcd++bQPhVrm3d2/HwHx3JxWXZ6Oxt7yYlOSAp03yJygZslBmwqkf8bnMWv
         QoZTjbKKAfSO/eRAUDz2hubywu47bCzrlpIKOFiluflQ43r5mnJ7grNIiQts8TU/Tuur
         8XMGioh1frMJ+V2Pqd+K39OlcNV6U1qmhhxmfH+lUg8UjierIAkeg21rUhhruDsRkQLM
         NKxYsyct9vIgNXssZGui74LyTKdEh/yAEhCxrqUZyVW3IWLQpjU+2D+glzCB0tzfmNI9
         tdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987856; x=1764592656;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FbelAFcOsYSEHJr61jVue9qL8RZ/6OY7KUqEPYnfD10=;
        b=ojk00jzS1BcYkSYgtfbPCuPNAW977vyy4g4xj/bnEY0JiJfQdC3bUWm6smgj2x6o5L
         2ES+g6209EjIUPIx3bAr1sG6zvVDtBbqob67RXHj7FaZGHZFnCB//ILrMEIQdG8+hlem
         ObJ3F82QESwjZqn2N7Z0+xY0+I17yQa3mpXjCUfNZ4GYwx4GAkQ8UZZa/XGWAFmyTzpY
         jBQPYETy06thmXQxPzAn3apJBzQfFM7By+0jaM+vJ8p1nacX4M/Ly32PqrYr3lnHYPS/
         6EHjej5YZUptLjn8Ab0Fzq6GBpnEPMidvI1H7Mh+28wsMhfHO1MLXY7f6WRZFuL10/Oa
         v4hg==
X-Forwarded-Encrypted: i=1; AJvYcCXa1mBrMDkb4w9yGhX9oI6tgnzpZk74O8kUatJFBoLetbAmBnp+iuoL/vt2cnGeJLzmmLbiy3RSkhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YycOjuok/2Q04u5kKX+hkn13EfeKhrYp9ZZPRWfqefSSmNvYn96
	54rOw8NAzBcHNYfnSSv0j4wmKNEGMkw+ArQMkMITt7vpTL6OFkBVxYQPk8jS0rg4Uw==
X-Gm-Gg: ASbGncum/Obtk0T2FhHokHr9xXhephXJPLb8ImWI0z43I4B64vkUUFdX9IQN6ZphfiG
	D0qpUzAEg5RGV4fi6XoopreDGZ/3BjgxM7WohFDCPzKa0rxB5+2XsJUVU2avrW4bxI/eyO/+FCQ
	ltgtt/+DTluaQEA2FYWMv1ZJC9tU+7E37LFdAXggIMTxNnIY8Cy4DM4M695OrgCOPPmYpyrxMz/
	vSIpEEkWdirjBKmcjWjp7+7mCK2sAOgljDuKSTWyqp+oymMpESPsiVgRVthFJPo+1C+nZmfUhM9
	5N3njIBB6HTT3+ond7ZGO04Az+fXLDjRVzWtt8B7/Hr0IWTFZZQkkUZnqbYLuLaXD56py3B/0Mq
	WuEFtS+fF/+z0istGzcBCYTtRAmyZYs6Z9ku5XhPTObyYQchuA3QxSnQxW3UwN4Sl1O6QFHw8iy
	xTzRuYtjdJVuC4k9XCqTy77fRRTF4Hsx8dtwZidXIBV+UWlg27vKYAZ1T/fEde
X-Google-Smtp-Source: AGHT+IEZ1AffknXuVGP8AlyImRjsSfE4J4xB0sAqNDM7r0AApBCqrRJbKEvqzMG4cEc/7c+Lw03Hxw==
X-Received: by 2002:a05:600c:c114:b0:477:86fd:fb18 with SMTP id 5b1f17b1804b1-477c5e09081mr1789195e9.8.1763987855511;
        Mon, 24 Nov 2025 04:37:35 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1e868bsm188617465e9.4.2025.11.24.04.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 04:37:35 -0800 (PST)
Date: Mon, 24 Nov 2025 12:37:31 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Will Deacon <will@kernel.org>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz,
	surenb@google.com, mhocko@suse.com, jackmanb@google.com,
	hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	rppt@kernel.org, Qinxin Xia <xiaqinxin@huawei.com>
Subject: Re: [PATCH v2 3/4] drivers/iommu-debug-pagealloc: Track IOMMU pages
Message-ID: <aSRRizzS39jI3BjH@google.com>
References: <20251106163953.1971067-1-smostafa@google.com>
 <20251106163953.1971067-4-smostafa@google.com>
 <aRW6Tf_G2ObR__vE@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRW6Tf_G2ObR__vE@willie-the-truck>

On Thu, Nov 13, 2025 at 11:00:29AM +0000, Will Deacon wrote:
> On Thu, Nov 06, 2025 at 04:39:52PM +0000, Mostafa Saleh wrote:
> > Using the new calls, use an atomic refcount to track how many times
> > a page is mapped in any of the IOMMUs.
> > 
> > For unmap we need to use iova_to_phys() to get the physical address
> > of the pages.
> > 
> > We use the smallest supported page size as the granularity of tracking
> > per domain.
> > This is important as it possible to map pages and unmap them with
> > larger sizes (as in map_sg()) cases.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > Tested-by: Qinxin Xia <xiaqinxin@huawei.com>
> > ---
> >  drivers/iommu/iommu-debug-pagealloc.c | 74 +++++++++++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> > 
> > diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
> > index a6a2f844b09d..0e14104b971c 100644
> > --- a/drivers/iommu/iommu-debug-pagealloc.c
> > +++ b/drivers/iommu/iommu-debug-pagealloc.c
> > @@ -27,16 +27,90 @@ struct page_ext_operations page_iommu_debug_ops = {
> >  	.need = need_iommu_debug,
> >  };
> >  
> > +static struct page_ext *get_iommu_page_ext(phys_addr_t phys)
> > +{
> > +	struct page *page = phys_to_page(phys);
> > +	struct page_ext *page_ext = page_ext_get(page);
> > +
> > +	return page_ext;
> > +}
> > +
> > +static struct iommu_debug_metadate *get_iommu_data(struct page_ext *page_ext)
> > +{
> > +	return page_ext_data(page_ext, &page_iommu_debug_ops);
> > +}
> > +
> > +static void iommu_debug_inc_page(phys_addr_t phys)
> > +{
> > +	struct page_ext *page_ext = get_iommu_page_ext(phys);
> > +	struct iommu_debug_metadate *d = get_iommu_data(page_ext);
> > +
> > +	WARN_ON(atomic_inc_return(&d->ref) <= 0);
> 
> Is it worth dumping some information about the page in addition to the
> WARN_ON()? That way, you might be able to benefit from other debug
> options (e.g. PAGE_OWNER) if they are enabled.

These WARN_ON are for overflows, which should never happen.
I initially thought about using the refcount_t, but it didn’t seem
suitable as refcount_add() expects that the refcount is already “1”
indicating that an object was already created which doesn’t fit
in the semantics of what this is. Similar for refcount_dec().

In the next patch there is a WARN_ON for the refcount check
to capture the mis-behaving context, I will add a debug print with
the leaked physical address in that case as this is the important one.

> 
> > +	page_ext_put(page_ext);
> > +}
> > +
> > +static void iommu_debug_dec_page(phys_addr_t phys)
> > +{
> > +	struct page_ext *page_ext = get_iommu_page_ext(phys);
> > +	struct iommu_debug_metadate *d = get_iommu_data(page_ext);
> > +
> > +	WARN_ON(atomic_dec_return(&d->ref) < 0);
> 
> nit: I can't see why you need memory ordering guarantees for the refcount,
> so you could use the relaxed variants for the inc/dec operations.

Will do.

> 
> > +	page_ext_put(page_ext);
> > +}
> > +
> > +/*
> > + * IOMMU page size might not match the CPU page size, in that case, we use
> > + * the smallest IOMMU page size to refcount the pages in the vmemmap.
> > + * That is important as both map and unmap has to use the same page size
> > + * to update the refcount to avoid double counting the same page.
> > + * And as we can't know from iommu_unmap() what was the original page size
> > + * used for map, we just use the minimum supported one for both.
> > + */
> > +static size_t iommu_debug_page_size(struct iommu_domain *domain)
> > +{
> > +	return 1UL << __ffs(domain->pgsize_bitmap);
> > +}
> > +
> >  void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t size)
> >  {
> > +	size_t off;
> > +	size_t page_size = iommu_debug_page_size(domain);
> 
> Since this is a debug feature, is it worth checking other properties of
> the arguments too? For example, that phys is non-zero and that phys +
> size doesn't overflow?
> 

Makes sense, I will add some more checks.

> > +	for (off = 0 ; off < size ; off += page_size) {
> > +		if (!pfn_valid(__phys_to_pfn(phys + off)))
> > +			continue;
> > +		iommu_debug_inc_page(phys + off);
> > +	}
> >  }
> >  
> >  void __iommu_debug_unmap(struct iommu_domain *domain, unsigned long iova, size_t size)
> >  {
> > +	size_t off;
> > +	size_t page_size = iommu_debug_page_size(domain);
> > +
> > +	for (off = 0 ; off < size ; off += page_size) {
> > +		phys_addr_t phys = iommu_iova_to_phys(domain, iova + off);
> > +
> > +		if (!phys || !pfn_valid(__phys_to_pfn(phys + off)))
> > +			continue;
> 
> Hmm, it looks weird to add 'off' to both 'iova' _and_ the resulting
> physical address. Is that correct?
> 

Yes, that's a bug, I will fix it.

> > +		iommu_debug_dec_page(phys);
> > +	}
> >  }
> >  
> >  void __iommu_debug_remap(struct iommu_domain *domain, unsigned long iova, size_t size)
> >  {
> > +	size_t off;
> > +	size_t page_size = iommu_debug_page_size(domain);
> > +
> > +	for (off = 0 ; off < size ; off += page_size) {
> > +		phys_addr_t phys = iommu_iova_to_phys(domain, iova + off);
> > +
> > +		if (!phys || !pfn_valid(__phys_to_pfn(phys + off)))
> > +			continue;
> > +
> > +		iommu_debug_inc_page(phys);
> > +	}
> 
> You can make the bulk of this code common with the unmap function.

Will do.

Thank,
Mostafa

> 
> Will
