Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8742FFDED
	for <linux-doc@vger.kernel.org>; Fri, 12 Dec 2025 18:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765565058; cv=none; b=LQLp0tVwsR/eLu0Ay4TNcgRxzz1ALLP76U8RQtYmZ+LhZw8pwOp7zByGNnhy7BqoFaCeISRvQR/RrHqwKygq2sOLB8TmJMXn7sum+IKkTsvKnvjuZ/12TtgZPMJQOpoCid0txO9fvdZCebCzv6SuQHE6bfxMXv+yhu5JYamMS/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765565058; c=relaxed/simple;
	bh=rmtKLb7q+5ezLO29xEQUuSgWaDW8KS0K3IegkM6c0uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2rYQZdI1hf0ebyOnpa08H7EJoagT+kK7/4KA3ceWY1ELp2JfvX7Gdaqhj/Itq6Cf1EZwRRwGmQVTjewwIyVGwShvo1jS2phlj/GT2ed4yEAqPZCMh1fNe+FCzHk+CaTZ+pah/GU9HR/ZJHhpHfEVri7Q5RzfuUQBHrWTrEbfQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rgx08SXo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rgx08SXo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477a1c8cc47so181775e9.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Dec 2025 10:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765565055; x=1766169855; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tZ+zh4+qr/HN6w+u7QW254+tODE+L4KOJGO5KT43g/s=;
        b=Rgx08SXowW7g/cE+AQNErBxnuBoQ0qTa6Cl9COFe5/+PL7a0RRPlOj9zRpTMg+Csw0
         y/Soy6XIv1d437O9emfm6qBIRWlMNQQLw05rs1NUJWQbwFpUjQiUC8vjiTCA0FgZV7kZ
         BRJlk8sBVZB9C+oy5SI37xl4xY2SrpSufRe8GR7jpSFZ4syEdlpIwhlfTlIkNzsb2eCR
         Ta9maDEF69jC+aU51+/o7gmwPNKBn20Xhw5BnjPhV8ZSSuw6hTO5zfOmw1YFGvgMxGrF
         k3vu4kaz94d0aJXakjvevy5v8lcw0qC2s7tRX4UhTu77ur0DEh573V2Td5QgcEcrPAeJ
         Fg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765565055; x=1766169855;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZ+zh4+qr/HN6w+u7QW254+tODE+L4KOJGO5KT43g/s=;
        b=NGqV1SB7DvKJZ4zKpBOv5I696/UJsqO4a8b+gF6Wu5qYtRF++b+SdI8T343AqSZ1nH
         0X5pmeajP1Xv8txrPGHBlS17YI8tzAhZSVGf/xdLDQA3nJWvItDi1uCQ1JptHA/OEzsY
         OqgLMMlliIm949gFSPJVIhD3FCBM80qxC5zltogecXgol4xfr2QGsDfzDiXsz0yvO38/
         xahWK3nRbMeFzievxpDSYEZXFsQn9AzWuq45QK5rRqsO5PAsOrk55llWSk6Jyq0by/UV
         tTDN1LTY1Uxlb/hE3H5EC4Y2UKgelFuUV0RkC5Vpcz1x5KZJ43dHwC6hSUFml7n9pGOg
         4e7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSw8HJSg85kb+p89DF/ncIGQFKxeyejI7yLnP0NOmuPk1AZbeDFaj5yHZ1QKYcqJ3Wc84/LjMc7Ik=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNValBQ3IKLiAGShCg2UdEG6Cxqfx3MVNIrIEpeD/SQre+tdpQ
	6HfMu5VAWyoa6lHc+0+mGaVMvcYUnw21f6gP4IAJNxUEA9KC/Q8Wh/+nk4fQScKXeUMYZGYVrmN
	XnuaqpA==
X-Gm-Gg: AY/fxX5eL4I66QoXEkW+n9/sIsruCN/CHC92YJNz8N/Gu+++1eeNjTMCNpGK0X71g1d
	efL0OjBsMcTlUd1f40Yd5RQ6udDTb68MlPXxQH301ugrvXajxZgz4q2+6lcDwQk1b7ASsCpipTM
	beKA44DaDHSTbx0gJbDCvY6IMVps0NbIiH3cRHHS0j2qFaD0uXkTmMb3HrdED3lhQWE7OxRRaxf
	ErbHczHmbxBcdCVyHG0vtve/PsSrGB6CJ9Mfj0oxW1+ttPOvPX2UHvrf999Ir+TCrERD8hHXtjG
	8hAB3G6oXLbZGJaQSShLcYOPHya+X5lHIkWo/tznxAE1dNgTBE5VizCtg9m64cU1fZhwOBiwrd7
	pTlSn5KqIP/hWOWROIhTlD/9aLt8hV/lw5Fx6AA744vDuhKGVbD1wqtbyQpGxCC7wYTytj91rOj
	VqP0sygBOmn1Dy41ycpbZ/hobHKUdyuKQnBtfriEK2qAf/cN+iNw==
X-Google-Smtp-Source: AGHT+IHGvjVZJ6nOuRdDb1gX2OZv9LSRuh0+95/zqQtd/9rPsVw68PVqoRCbVL9lWG9KXK+ZBoktwg==
X-Received: by 2002:a05:600c:2195:b0:477:b358:d7a9 with SMTP id 5b1f17b1804b1-47a948f6e81mr4845e9.17.1765565055030;
        Fri, 12 Dec 2025 10:44:15 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4b516bsm18335255e9.2.2025.12.12.10.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 10:44:13 -0800 (PST)
Date: Fri, 12 Dec 2025 18:44:09 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com,
	rdunlap@infradead.org
Subject: Re: [PATCH v4 2/4] iommu: Add calls for IOMMU_DEBUG_PAGEALLOC
Message-ID: <aTxiefxT08hbUPsd@google.com>
References: <20251211125928.3258905-1-smostafa@google.com>
 <20251211125928.3258905-3-smostafa@google.com>
 <20e015d7-cb54-4a2a-bf62-a828e10e3126@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20e015d7-cb54-4a2a-bf62-a828e10e3126@linux.intel.com>

On Fri, Dec 12, 2025 at 10:33:20AM +0800, Baolu Lu wrote:
> On 12/11/25 20:59, Mostafa Saleh wrote:
> > Add calls for the new iommu debug config IOMMU_DEBUG_PAGEALLOC:
> > - iommu_debug_init: Enable the debug mode if configured by the user.
> > - iommu_debug_map: Track iommu pages mapped, using physical address.
> > - iommu_debug_unmap_begin: Track start of iommu unmap operation, with
> >    IOVA and size.
> > - iommu_debug_unmap_end: Track the end of unmap operation, passing the
> >    actual unmapped size versus the tracked one at unmap_begin.
> > 
> > We have to do the unmap_begin/end as once pages are unmapped we lose
> > the information of the physical address.
> > This is racy, but the API is racy by construction as it uses refcounts
> > and doesn't attempt to lock/synchronize with the IOMMU API as that will
> > be costly, meaning that possibility of false negative exists.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >   drivers/iommu/iommu-debug-pagealloc.c | 28 +++++++++++++
> >   drivers/iommu/iommu-priv.h            | 58 +++++++++++++++++++++++++++
> >   drivers/iommu/iommu.c                 | 11 ++++-
> >   include/linux/iommu-debug-pagealloc.h |  1 +
> >   4 files changed, 96 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
> > index 4022e9af7f27..1d343421da98 100644
> > --- a/drivers/iommu/iommu-debug-pagealloc.c
> > +++ b/drivers/iommu/iommu-debug-pagealloc.c
> > @@ -5,11 +5,15 @@
> >    * IOMMU API debug page alloc sanitizer
> >    */
> >   #include <linux/atomic.h>
> > +#include <linux/iommu.h>
> >   #include <linux/iommu-debug-pagealloc.h>
> >   #include <linux/kernel.h>
> >   #include <linux/page_ext.h>
> > +#include "iommu-priv.h"
> > +
> >   static bool needed;
> > +DEFINE_STATIC_KEY_FALSE(iommu_debug_initialized);
> >   struct iommu_debug_metadata {
> >   	atomic_t ref;
> > @@ -25,6 +29,30 @@ struct page_ext_operations page_iommu_debug_ops = {
> >   	.need = need_iommu_debug,
> >   };
> > +void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t size)
> > +{
> > +}
> > +
> > +void __iommu_debug_unmap_begin(struct iommu_domain *domain,
> > +			       unsigned long iova, size_t size)
> > +{
> > +}
> > +
> > +void __iommu_debug_unmap_end(struct iommu_domain *domain,
> > +			     unsigned long iova, size_t size,
> > +			     size_t unmapped)
> > +{
> > +}
> > +
> > +void iommu_debug_init(void)
> > +{
> > +	if (!needed)
> > +		return;
> > +
> > +	pr_info("iommu: Debugging page allocations, expect overhead or disable iommu.debug_pagealloc");
> > +	static_branch_enable(&iommu_debug_initialized);
> > +}
> > +
> >   static int __init iommu_debug_pagealloc(char *str)
> >   {
> >   	return kstrtobool(str, &needed);
> > diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
> > index c95394cd03a7..aaffad5854fc 100644
> > --- a/drivers/iommu/iommu-priv.h
> > +++ b/drivers/iommu/iommu-priv.h
> > @@ -5,6 +5,7 @@
> >   #define __LINUX_IOMMU_PRIV_H
> >   #include <linux/iommu.h>
> > +#include <linux/iommu-debug-pagealloc.h>
> >   #include <linux/msi.h>
> >   static inline const struct iommu_ops *dev_iommu_ops(struct device *dev)
> > @@ -65,4 +66,61 @@ static inline int iommufd_sw_msi(struct iommu_domain *domain,
> >   int iommu_replace_device_pasid(struct iommu_domain *domain,
> >   			       struct device *dev, ioasid_t pasid,
> >   			       struct iommu_attach_handle *handle);
> > +
> > +#ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
> > +
> > +void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys,
> > +		       size_t size);
> > +void __iommu_debug_unmap_begin(struct iommu_domain *domain,
> > +			       unsigned long iova, size_t size);
> > +void __iommu_debug_unmap_end(struct iommu_domain *domain,
> > +			     unsigned long iova, size_t size, size_t unmapped);
> > +
> > +static inline void iommu_debug_map(struct iommu_domain *domain,
> > +				   phys_addr_t phys, size_t size)
> > +{
> > +	if (static_branch_unlikely(&iommu_debug_initialized))
> > +		__iommu_debug_map(domain, phys, size);
> > +}
> > +
> > +static inline void iommu_debug_unmap_begin(struct iommu_domain *domain,
> > +					   unsigned long iova, size_t size)
> > +{
> > +	if (static_branch_unlikely(&iommu_debug_initialized))
> > +		__iommu_debug_unmap_begin(domain, iova, size);
> > +}
> > +
> > +static inline void iommu_debug_unmap_end(struct iommu_domain *domain,
> > +					 unsigned long iova, size_t size,
> > +					 size_t unmapped)
> > +{
> > +	if (static_branch_unlikely(&iommu_debug_initialized))
> > +		__iommu_debug_unmap_end(domain, iova, size, unmapped);
> > +}
> 
> I am wondering whether it would be better if we move iommu_debug_map()
> to iommu-debug-pagealloc.c,
> 
> void iommu_debug_map(struct iommu_domain *domain,
> 		     phys_addr_t phys, size_t size)
> {
> 	if (static_branch_likely(&iommu_debug_initialized))
> 		__iommu_debug_map(domain, phys, size);
> }
> 
> (Does it make sense to use static_branch_likely() here? Normally, people
>  who enable CONFIG_IOMMU_DEBUG_PAGEALLOC would want to use this
>  debugging feature. Or not?)
> 
> So that ...

This actually was the v1 implementation [1], but Jörg suggested to move
it to a header file as a function call would have an overhead if this
feautre is disabled.

I believe the priority would be to keep the performance overhead minimal
with CONFIG_IOMMU_DEBUG_PAGEALLOC and the commandline disabled, so people
can run with the config in production and only enable the commandline
it to debug problems, without having overhead on the typical case.

> 
> > +
> > +void iommu_debug_init(void);
> > +
> > +#else
> > +static inline void iommu_debug_map(struct iommu_domain *domain,
> > +				   phys_addr_t phys, size_t size)
> > +{
> > +}
> > +
> > +static inline void iommu_debug_unmap_begin(struct iommu_domain *domain,
> > +					   unsigned long iova, size_t size)
> > +{
> > +}
> > +
> > +static inline void iommu_debug_unmap_end(struct iommu_domain *domain,
> > +					 unsigned long iova, size_t size,
> > +					 size_t unmapped)
> > +{
> > +}
> > +
> > +static inline void iommu_debug_init(void)
> > +{
> > +}
> > +
> > +#endif /* CONFIG_IOMMU_DEBUG_PAGEALLOC */
> > +
> >   #endif /* __LINUX_IOMMU_PRIV_H */
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > index 2ca990dfbb88..01b062575519 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -232,6 +232,8 @@ static int __init iommu_subsys_init(void)
> >   	if (!nb)
> >   		return -ENOMEM;
> > +	iommu_debug_init();
> > +
> >   	for (int i = 0; i < ARRAY_SIZE(iommu_buses); i++) {
> >   		nb[i].notifier_call = iommu_bus_notifier;
> >   		bus_register_notifier(iommu_buses[i], &nb[i]);
> > @@ -2562,10 +2564,12 @@ int iommu_map_nosync(struct iommu_domain *domain, unsigned long iova,
> >   	}
> >   	/* unroll mapping in case something went wrong */
> > -	if (ret)
> > +	if (ret) {
> >   		iommu_unmap(domain, orig_iova, orig_size - size);
> > -	else
> > +	} else {
> >   		trace_map(orig_iova, orig_paddr, orig_size);
> > +		iommu_debug_map(domain, orig_paddr, orig_size);
> > +	}
> >   	return ret;
> >   }
> > @@ -2627,6 +2631,8 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
> >   	pr_debug("unmap this: iova 0x%lx size 0x%zx\n", iova, size);
> > +	iommu_debug_unmap_begin(domain, iova, size);
> > +
> >   	/*
> >   	 * Keep iterating until we either unmap 'size' bytes (or more)
> >   	 * or we hit an area that isn't mapped.
> > @@ -2647,6 +2653,7 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
> >   	}
> >   	trace_unmap(orig_iova, size, unmapped);
> > +	iommu_debug_unmap_end(domain, orig_iova, size, unmapped);
> >   	return unmapped;
> >   }
> > diff --git a/include/linux/iommu-debug-pagealloc.h b/include/linux/iommu-debug-pagealloc.h
> > index 83e64d70bf6c..a439d6815ca1 100644
> > --- a/include/linux/iommu-debug-pagealloc.h
> > +++ b/include/linux/iommu-debug-pagealloc.h
> > @@ -9,6 +9,7 @@
> >   #define __LINUX_IOMMU_DEBUG_PAGEALLOC_H
> >   #ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
> > +DECLARE_STATIC_KEY_FALSE(iommu_debug_initialized);
> 
> ... we could make this static?
>

This is not static because of the header usage as mentioned above.

Thanks,
Mostafa

> >   extern struct page_ext_operations page_iommu_debug_ops;

[1] https://lore.kernel.org/linux-iommu/20251003173229.1533640-2-smostafa@google.com/
> 
> Thanks,
> baolu
> 
