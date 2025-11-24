Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CAC2F8BF0
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 11:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763983426; cv=none; b=sL0J6Nyin+5ksgA7LF2ZWJN0d1LvQbck3u1GUwutj70BZ8egFa+FjwYvJOCkt1e/jkn61DiDRFq7//CjECQRy+FIUgHUUvJM2IPRTm/W7b3ss7fFRfgKmzpY4mDuZR3OPZpyCGzdzjVSMXguqA1fJPFIlKD+8/4gvp4UXH3ogX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763983426; c=relaxed/simple;
	bh=bBx2zX4NNXGxJ60W46Gs+T1nncBnetTXvCFoQnu4iCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c42JbdmN9cboh73cO/sUFwZX0ssFac9o+u9R4rkGuwTY1NPkYolYOb85bzTAxcf/CXcYJmEBKrNtkI8L1UKCwWzL5alBOfmaPd9q4UqZ9hTB0P/KKePiQMvrmXqKx0t3l68Dq+/Q9huB8DpCZ0hhIVhX0JBnv67P2MFm4HgraT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VvbTV3FR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VvbTV3FR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779e2ac121so95065e9.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 03:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763983422; x=1764588222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A/9qmpcn6sF8ptPObBDBMptCfIXtJ3l0IrBw1r6Q5lI=;
        b=VvbTV3FRAI6BBkuQhd9BBTsJ2hO2iNMkNtHyLU8IHYwFjbcHGEqviSrjd/fPkn7pwb
         496mBSe5DUdnLVqyk9J4y/sbLYCd6jAOXOIDiiJyxGe9xvGdJJ1PVQkzmjPs/mFfgxSu
         XuxboENupC5JmK27T4iGvXaUC+zbqti/YRmZnT6alrlzP2/WvGmIeSNilG7AMNQlzXAS
         rFToOoO8CHEQiHoEFDqGGYCcBg5qNYZ9A0/dqfPxO7GEBXoFiBkUi59X4paZD2DiV44L
         weDFpV97i2rXjuKkB1B02K88QMbO+cqD6GG1iyEcan0aCQXhx9obZMmMKdXh3ynyKhOW
         /cWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763983422; x=1764588222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/9qmpcn6sF8ptPObBDBMptCfIXtJ3l0IrBw1r6Q5lI=;
        b=bc8e80l6dsJvaYsum9MknVckhafMIs6FgJz3xqCm/I18aqpgnE0SQD/REvX9yiNr+6
         bxYftCCUbpVe5x64dnK5KeTxiobKcyvomJT4yuMcArhQiaGHiVZgD/TqiQInZRN3TzxI
         5KlQ5X1lyWS8PHSaWcbmY/M+b8iMTx4lMQdbzC5eC8ezhPeWDm2Gqf0l0LSEkD9ct8br
         /ommQFee2EZ7L+hNdjLS2tTC9vrgrbSWvgzA+5IEFQnOo6WV77jkb0kZ45ZPqJ3yW3C0
         Ay0b6roCdZJQdtvKwvZXdiTHn7FyBVMnZd5ypIlmg4ijTk1d0JI6qUKPNrfxgwq2bv9I
         mLVg==
X-Forwarded-Encrypted: i=1; AJvYcCXR8r/pm97i0qy1ctokmOhKOytPAHrciAIwEEaAF1p3OpBpay3oNoeU9Oz4NAdhjGa/He5vpD5+xtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaCNRV4UmUFe+6ALSq3+12nS3yLXnJ08hNmacLO0PnpB18T1rJ
	OjU+L8gsxsvQzgUQdPinS/NlRc4ujwkmPUCfzTECGcIERc/Ha6mNSD1clUokChOOmg==
X-Gm-Gg: ASbGnctJVaV02jFMiifH2E5hw+Z/X+SoSFD38gm7CXeQUk66R8p3F48ezjSR74Dj/m2
	DdkIECXR0AFiWSCFrNmA1VSgJeXGmSf3kwPM2cbVguomhc8+TvkZ9R2o14SAeuS0ZOm51NykkFI
	ZcbfXqGnV3d8QypRDQFoJzZCOPGqj/iGC/7sCSHukHspv79XpVhli4D8gSr/oGKyEnmP7zd5H9B
	Y/yx7kSqthF7b+AuxGHn39BJPqXQQGYxeBG1fzdsI/NSBgObD1OVX6iKXP7HZGWErtyftcvpaiR
	HZ7bV80ZvmzI56BhM16YDRwGmXIn4HmfLfMQCPKS4H5gY6j1P/ACgy1mGWBFAVFMCxs/F22mYan
	82oHI6dku82ca6wmT4ySu5tuykofTLkE4VBENNDaBOrEIqOTt/Z5rWgpUlq10f2ktX0y75XsMmT
	gESyuhXgY8OQtGzPeWl3hAzrNl8JLH9OWxXLFjHcmJXI0MwKw5Vg==
X-Google-Smtp-Source: AGHT+IHPjRoPkJts63WSW1KmhvXOZnj4KJdKdrrFOfPPYFwb16nEkLhtHX2sQ0Em7vKdjEkEynh8tg==
X-Received: by 2002:a05:600c:3b94:b0:477:1afe:b962 with SMTP id 5b1f17b1804b1-477c5ea32a2mr1726485e9.1.1763983422303;
        Mon, 24 Nov 2025 03:23:42 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf198a67sm200937725e9.0.2025.11.24.03.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 03:23:41 -0800 (PST)
Date: Mon, 24 Nov 2025 11:23:38 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Will Deacon <will@kernel.org>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz,
	surenb@google.com, mhocko@suse.com, jackmanb@google.com,
	hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	rppt@kernel.org, Qinxin Xia <xiaqinxin@huawei.com>
Subject: Re: [PATCH v2 2/4] drivers/iommu: Add calls for IOMMU_DEBUG_PAGEALLOC
Message-ID: <aSRAOv6WqFTxzy_C@google.com>
References: <20251106163953.1971067-1-smostafa@google.com>
 <20251106163953.1971067-3-smostafa@google.com>
 <aRW6P7vhTIZvm2Qf@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRW6P7vhTIZvm2Qf@willie-the-truck>

On Thu, Nov 13, 2025 at 11:00:15AM +0000, Will Deacon wrote:
> On Thu, Nov 06, 2025 at 04:39:51PM +0000, Mostafa Saleh wrote:
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
> > Tested-by: Qinxin Xia <xiaqinxin@huawei.com>
> > ---
> >  drivers/iommu/iommu-debug-pagealloc.c | 23 ++++++++++++
> >  drivers/iommu/iommu.c                 | 14 ++++++-
> >  include/linux/iommu-debug-pagealloc.h | 54 +++++++++++++++++++++++++++
> >  3 files changed, 89 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
> > index 385c8bfae02b..a6a2f844b09d 100644
> > --- a/drivers/iommu/iommu-debug-pagealloc.c
> > +++ b/drivers/iommu/iommu-debug-pagealloc.c
> > @@ -5,11 +5,13 @@
> >   * IOMMU API debug page alloc sanitizer
> >   */
> >  #include <linux/atomic.h>
> > +#include <linux/iommu.h>
> >  #include <linux/iommu-debug-pagealloc.h>
> >  #include <linux/kernel.h>
> >  #include <linux/page_ext.h>
> >  
> >  static bool needed;
> > +DEFINE_STATIC_KEY_FALSE(iommu_debug_initialized);
> >  
> >  struct iommu_debug_metadate {
> >  	atomic_t ref;
> > @@ -25,6 +27,27 @@ struct page_ext_operations page_iommu_debug_ops = {
> >  	.need = need_iommu_debug,
> >  };
> >  
> > +void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t size)
> > +{
> > +}
> > +
> > +void __iommu_debug_unmap(struct iommu_domain *domain, unsigned long iova, size_t size)
> > +{
> > +}
> > +
> > +void __iommu_debug_remap(struct iommu_domain *domain, unsigned long iova, size_t size)
> > +{
> > +}
> 
> Since the IOMMU API doesn't really have a "remap" operation, I wonder
> whether it would be clearer to have unmap_begin() and unmap_end()
> functions instead? You'd probably want to call them as a pair, so the
> check for unmapped < size would move into unmap_end().

I guess that would be cleaner, but we have to pass both size and
unmapped to unmap_end, I will give it a try.

Thanks,
Mostafa

> 
> Will
