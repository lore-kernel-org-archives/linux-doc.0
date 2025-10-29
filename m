Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95019266EFC
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 14:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747783; cv=none; b=g7NGxWhUBKekccB17FUvtck/asiXbLg+Fwg0/TTcmVw8jXoBeJpSWsp4cOuU9V+HpyUsmXowQk1XUCj5pD0t/at2QTnfKYInsPaMRZZwRneUHcsXPw/IKxOwO6dD4jhsLhPSx2Vd92k/WER98ytPwNoCRRPf6XuCnUZ+AUXtMZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747783; c=relaxed/simple;
	bh=3r1XQRF8DDSRrKj9zbUnuUeGmXqakMD70QFkY1kuWkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZYIYXJU5RhK6XCfS7Lybnw8b4aGTpmicjOFoNxzUVQKuEKRdK1zswHgzQ66q3bFSQbkGTYE1Eq5uFUccA56T2Pac0dzFutqhywJv6KNBajKFzgv6pWys9yAuuKVB++MWOQTOb7p+yBIAYG8O2/EIhm/aIdmLvcTwJaT7uFxp8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pT0a4RDi; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pT0a4RDi"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-587bdad8919so10640e87.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 07:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761747780; x=1762352580; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3X8rEfNOS8L5ftWnixKzPLC44IltEKPSF05+QvLhNoU=;
        b=pT0a4RDiIs6sKv5yKt8jxXLlZIZcuZKDgckMvNJ3+qU38g/fB1vquKksB0atwDNQNY
         Fq1xfNiyfdqcp4yHkEXYVY6kPSqjUDFFZftUpNJzIHqCM2KRQz7xsSJUeCMB4WkE3hzL
         ZSS7mYgN9ZE0ahx/aZKhg6orGeaAYmboJP6qVFka4nz4jB8Zpslm201HC2H2bOyL2ZYs
         5prTdl7u4hh8iuWcDMdQD/PRWrbo2aDpfkHXcD2T09tZZ/3Lb1aPicBpFat7h6WcRSl4
         t9CeWCSAR7r+vhFOvCbSDJtbblzPTSYO25ZU0V592loQ9iJCN8WzqDrS+6Oq5VEPuSz1
         te8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747780; x=1762352580;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3X8rEfNOS8L5ftWnixKzPLC44IltEKPSF05+QvLhNoU=;
        b=Svnsh8Z7WSy3prjTkAxXUHga7njRYn+ZZRN/W0pPRzYmcuOxeMC9HMgNrrRGrkfnHl
         cvIxfH1plfs8YnujsiqBW6XGBwVYqSi35qI0Isu2yCIe9XAjQ2Z0X9r7MZIjsQCpcTkH
         Ml7tMNgHT7mnLYny3xxXM6yyR0Ay8pLXqWk6i9hITeon9qF4fMG3CnKCPMHFlZpFpG9o
         Ac2viXiVZBt9eYa2GP7J3CzleIdsiJS0/jgsFS13tFu8yKSwC/KpZwZDcrSm+OgxWc18
         v60I5UximENBTrjli4kiPRqqqWj8M4HsefMkNCrLdwzBK6VPs/k05wQOLC4/XqXBBpv0
         jb2A==
X-Forwarded-Encrypted: i=1; AJvYcCU5VsnzhMTQQP6Vpl56AIpguShYxN4TXmziQEcBBnJRzGrAMjVDFincvw3SliSQhcVaYC1/6dCzQPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNNYLA+utz/OioGnkPr18I8gJCrLOHAH1VeWxauPm11//tSbro
	F/HAbyX2IZ3M0F4RYveLkEvqCIOsfOF2hdHDUglQOZsQCMPGx6r3QgyYuSaS/J3xJ0pqGNhLwe4
	JbH5d5w==
X-Gm-Gg: ASbGncuGwnWamnGCzSbcPVl05DnwssHlQ6vSCL+rXQcPORKkQUtdjwymzESN9WfNazG
	UMQbAveZDonBc6nNODE6oLc+21BGsvWqXVPjfSlwjQQ8YhA9VyG32LWEafJDpo1sZKaQTKiyMzM
	YoKakbuJrXmDwEo89WUVZk1Cna9B6Tv9R0wfEwpplknQy9b3Ck0Gp99mcbEn8oioPgIvdIhYJh6
	Qy5htMwDjqkzIy2tBUeHn7aGjejsUpDswIYfzV+7ixXYGNaFABqROSWu37fSckgxLmcJZqHLwXl
	4LUXPVb4yfqQWnjduYFLNtJM3Ginvx2YzhlR9KlJdn9zZVT1sW6BVqJ574wlY9KGKmhEqzzNkhr
	+bQcLOQ+u6BXeSTz5WlUpHW1jTMT3BRa20pdMUMKfRwTUhwhu41ZrnUb1C2KGeULaccYhjD7DDv
	Y4HAQiSJFJUgEt65AmSDtJaQUxfYJMThh8gfVgHP0=
X-Google-Smtp-Source: AGHT+IHqpmvhmNQeMUwlxSx22ePgHZKELB9fYGyYcpwDmvfoTwWjtRpntwXiEd4wY5k8KEzx24Mb0A==
X-Received: by 2002:ac2:5fd0:0:b0:57e:b289:c64a with SMTP id 2adb3069b0e04-59412a39f9emr279787e87.6.1761747779360;
        Wed, 29 Oct 2025 07:22:59 -0700 (PDT)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5678sm26187265f8f.22.2025.10.29.07.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:22:58 -0700 (PDT)
Date: Wed, 29 Oct 2025 14:22:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, will@kernel.org,
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz,
	surenb@google.com, mhocko@suse.com, jackmanb@google.com,
	hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	rppt@kernel.org
Subject: Re: [RFC PATCH 2/4] drivers/iommu: Add calls for iommu debug
Message-ID: <aQIjP3jVigyz8t38@google.com>
References: <20251003173229.1533640-1-smostafa@google.com>
 <20251003173229.1533640-3-smostafa@google.com>
 <hu7ozrdn6la24apa4pco5nkhow2dmthahjomjj6hy4nrefx6j4@lcdfbykoafw4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hu7ozrdn6la24apa4pco5nkhow2dmthahjomjj6hy4nrefx6j4@lcdfbykoafw4>

On Mon, Oct 27, 2025 at 12:43:06PM +0100, Jörg Rödel wrote:
> On Fri, Oct 03, 2025 at 05:32:27PM +0000, Mostafa Saleh wrote:
> > Add calls for the new iommu debug config IOMMU_DEBUG_PAGEALLOC:
> > - iommu_debug_init: Enable the debug mode if configured by the user.
> > - iommu_debug_map: Track iommu pages mapped, using physical address.
> > - iommu_debug_unmap: Track iommu pages unmapped, using IO virtual
> >   address.
> > - iommu_debug_remap: Track iommu pages, already mapped using IOVA.
> > 
> > We have to do the unmap/remap as once pages are unmapped we lose the
> > information of the physical address.
> > This is racy, but the API is racy by construction as it uses refcounts
> > and doesn't attempt to lock/synchronize with the IOMMU API as that will
> > be costly, meaning that possibility of false negative exists.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/iommu/iommu-debug.c | 23 +++++++++++++++++++++++
> >  drivers/iommu/iommu.c       | 21 +++++++++++++++++++--
> >  include/linux/iommu-debug.h |  6 ++++++
> >  3 files changed, 48 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/iommu-debug.c b/drivers/iommu/iommu-debug.c
> > index 297a35137b38..607f1fcf2235 100644
> > --- a/drivers/iommu/iommu-debug.c
> > +++ b/drivers/iommu/iommu-debug.c
> > @@ -5,11 +5,13 @@
> >   * IOMMU API santaizers and debug
> >   */
> >  #include <linux/atomic.h>
> > +#include <linux/iommu.h>
> >  #include <linux/iommu-debug.h>
> >  #include <linux/kernel.h>
> >  #include <linux/page_ext.h>
> >  
> >  static bool needed;
> > +static DEFINE_STATIC_KEY_FALSE(iommu_debug_initialized);
> >  
> >  struct iommu_debug_metadate {
> >  	atomic_t ref;
> > @@ -25,6 +27,27 @@ struct page_ext_operations page_iommu_debug_ops = {
> >  	.need = need_iommu_debug,
> >  };
> >  
> > +void iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t size)
> > +{
> > +}
> > +
> > +void iommu_debug_unmap(struct iommu_domain *domain, unsigned long iova, size_t size)
> > +{
> > +}
> > +
> > +void iommu_debug_remap(struct iommu_domain *domain, unsigned long iova, size_t size)
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
> >  static int __init iommu_debug_pagealloc(char *str)
> >  {
> >  	return kstrtobool(str, &needed);
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > index 060ebe330ee1..56c89636a33c 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/errno.h>
> >  #include <linux/host1x_context_bus.h>
> >  #include <linux/iommu.h>
> > +#include <linux/iommu-debug.h>
> >  #include <linux/iommufd.h>
> >  #include <linux/idr.h>
> >  #include <linux/err.h>
> > @@ -231,6 +232,9 @@ static int __init iommu_subsys_init(void)
> >  	if (!nb)
> >  		return -ENOMEM;
> >  
> > +#ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
> > +	iommu_debug_init();
> > +#endif
> >  	for (int i = 0; i < ARRAY_SIZE(iommu_buses); i++) {
> >  		nb[i].notifier_call = iommu_bus_notifier;
> >  		bus_register_notifier(iommu_buses[i], &nb[i]);
> > @@ -2518,10 +2522,14 @@ int iommu_map_nosync(struct iommu_domain *domain, unsigned long iova,
> >  	}
> >  
> >  	/* unroll mapping in case something went wrong */
> > -	if (ret)
> > +	if (ret) {
> >  		iommu_unmap(domain, orig_iova, orig_size - size);
> > -	else
> > +	} else {
> >  		trace_map(orig_iova, orig_paddr, orig_size);
> > +#ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
> > +		iommu_debug_map(domain, orig_paddr, orig_size);
> > +#endif
> 
> These #ifdefs need to be in a header file, not the actual source code.

I will fix it in v2.

Thanks,
Mostafa

> 
