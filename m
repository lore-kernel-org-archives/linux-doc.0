Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5024DAFA5
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 16:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613475; cv=none; b=ZR9iXsAweUYoNKffLeEwDUErBi57YdAPlsg8uBGzh930soMybxPrmX/ma4hYN6cw3cCC2mFHzOId7CdiuxpxvbG7eQc9E4eF/026/rKqT5HaKRGvSR9jvYsn0upvNXLDL7VWOlfJV0qvvRjYvRWb29IlLZH28qId+kwwverRKec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613475; c=relaxed/simple;
	bh=IXp+DNYl+BoH3Oqn6yr0ixaywkuluAO68ZDn2+oQlXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEe/AX5lZnSRCPigQ6kBWTbCJSAm21ZNdUxAScvV5CBgey9eK3k7eo86W/iak2JFsm0qdoKrRJGkMbCZ4khjxktQTi8JpAFs83Nz/J9TPNL0zGgiqbVnLAIkl/pAR3I1jSb1M6c6uw8P6xo1gwH+bn4a0ogi0LN5FjispoW/370=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pE8sweve; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pE8sweve"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d3b445a84fso90575ad.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 09:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790613474; x=1791218274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M/MstH2yf2DRt7ZMfWOotv8NrOEYhdb7bl9lXouyXqQ=;
        b=pE8swevejwo93+ZmhKIbrPje6BVYus/8j+iIptZ1lP9b/XPGsDuprbrjOfUrMeg/pD
         sI88T4DBDI2YNRLdc+01yMtcC/ikry+qJy7o+FtvkjQ435ncyill+croaLKP+1gujxzI
         ir9EcasAb6m+WLxOR/EHcfyw7TKXHpfwYFAkDtgRRGlJmVnbqI40uAaA5DM8DzbpIduM
         3cuuUcod9kwj3doKIwzFq5MZsawRep8kEW1TWlFI9wEpybXxujKVU9yKKmu1qoylLpkT
         xqiuDlzZUp/Tewr+/g7+sPRnWzcPYsFC6t8T9zMhWYezUKp9rMT4CTIkz5B7DnuMNgLw
         ic+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613474; x=1791218274;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/MstH2yf2DRt7ZMfWOotv8NrOEYhdb7bl9lXouyXqQ=;
        b=cV+iK06dRfLOO1IRfaFKXXRFazytpDPIOluZUZrN4ML4x3h4DQgvDliBs2C9uRC0cm
         K+kuY5xRHc6BAq+30o/mY+zCyt5k9nNIQGwud0JwUHHEGkNVqFpcrlQBCfkkH7Uj2hSq
         01kNJUMN5O0rR4chL/5aYXhENhe5m1tGw5P32fqrTey3bUxyIeOQKeBm25k4XRomdiBp
         sNHdoOFyrsXZkiMErytM9OJR6jBC76w+RJZBk9h78EE9CnzS/77fsdqtiiUGnsbI0uOy
         eP1Cy34QwhajRgqA3e7X5MNg1Ih/6s0nZp6KMfRk1sN1vaaloG/Jg+FTdNjxHQtDQfVB
         +hPA==
X-Forwarded-Encrypted: i=1; AKwUvBw4qtolCbVC9uxveLYE7XOcezrJuDVRy+jGz0KRAGOo2a+zRi+ZECBCXCYwsurrTtSOCfIlpK8Ttek=@vger.kernel.org
X-Gm-Message-State: AFq9FYItw+fQVxcDFYMF+jDDELBnZuR+CZxSAlPzigqw4g4cHluhh5z/
	CqD2IOALilNdQhEqwvOFm8XzedWL1lkXBn0rPUoFWMWturk7QvWy0taeNDSFmmJzyg==
X-Gm-Gg: AYBFou1GpFvY1xnCmYKKQ5DA42a/NF1u6iF2BObYvHiQK26ASLWUDGpWVHgrPmibEsa
	4UQ+wh/IkQOEtC+C2iFcVmk0UxC8GVLwhg6kyd28MEQjqiM4DxPNYsXy+rOSS8ROC2SAQDkvaI7
	2iiRxumbAGc6c1QEbRUovnsfTWHi/HA+tRbtnW/An56VeGYUUW/YWdbRWPKh6/hlBxPHmOX5oFP
	zaeRjROPkwSdtyMJzmIj1vSoVmJmJ8eazSy0EBeFAItr07hCmBRjUnYW1SymKW7eTYcK+TeDisN
	zrXo3QF6SVATkEMmwh96DHfgU0rogB35SDx9bIm4bwB7PE7/mK5Ejv1eHgV1VtNWOGCrprLy2fi
	Xzl+Ay00e/+uqRw6xQgUGouTP/Dow+LJXBgw0EBwXv0IeKMM+EZvBb+3hssNojIRBwn3U+d+gFe
	Ljmx7wNPzCJoCYnx275kvAVVEy4eSLNfSLSRSKdOV6PvCDQsVQUP6Kb27ziz2fA3pSE3XRwte+s
	hQAKa8Vkihe8NnFjDXzwNEXcxvT6eHE1AXR
X-Received: by 2002:a17:902:e884:b0:2d6:3c22:994e with SMTP id d9443c01a7336-2dfa976fec0mr5954175ad.11.1790613472819;
        Mon, 28 Sep 2026 09:37:52 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea78fedbsm4448464b3a.23.2026.09.28.09.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:37:52 -0700 (PDT)
Date: Mon, 28 Sep 2026 16:37:44 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/9] iommu/arm-smmu-v3: Optimize range invalidation
 for latency
Message-ID: <arqX2OC71JneElBJ@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <4-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <arpohmaJTPEEI7mi@google.com>
 <20260928135007.GA1616761@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928135007.GA1616761@nvidia.com>

On Mon, Sep 28, 2026 at 10:50:07AM -0300, Jason Gunthorpe wrote:
> On Mon, Sep 28, 2026 at 01:15:50PM +0000, Pranjal Shrivastava wrote:
> > > -/* Used by non INV_TYPE_ATS* invalidations */
> > > -static void arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
> > > +/*
> > > + * One TLBI command per IOTLB entry, assuming the entries are all at least
> > > + * iopte_granule sized. Returns false if too many commands would be needed which
> > > + * indicates too high a latency. The threshold is similar to MAX_DVM_OPS in
> > > + * arch/arm64/include/asm/tlbflush.h for the 4k PAGE_SIZE.
> > > + */
> > > +static bool arm_smmu_cmdq_batch_add_single(struct arm_smmu_device *smmu,
> > > +					   struct arm_smmu_cmdq_batch *cmds,
> > > +					   struct arm_smmu_cmd *cmd,
> > > +					   struct arm_smmu_tlbi *tlbi)
> > > +{
> > > +	unsigned long num_ops = tlbi->size / tlbi->iopte_size;
> > > +	unsigned long iova = tlbi->iova;
> > > +	unsigned long i;
> > > +
> > > +	if (!num_ops || num_ops > 512)
> > > +		return false;
> > > +
> > 
> > Should this be ">= 512"? The old arm_smmu_inv_size_too_big() and
> > arm64's __flush_tlb_range_limit_excess() both fall back to a full
> > invalidation at exactly 512:
> > 
> >         return pages >= (MAX_DVM_OPS * stride) >> PAGE_SHIFT;
> > 
> > 512 is what a walk flush could generate. For example, when 
> > __arm_lpae_unmap() frees a last-level table on a 4K granule,
> > it calls io_pgtable_tlb_flush_walk(iova, SZ_2M, SZ_4K), hence,
> > num_ops == 512.
> > 
> > Before this patch that was a single TLBI_NH_ASID/TLBI_S12_VMALL, now
> > it becomes 512 VA TLBIs + CMD_SYNC for every 2M table freed on a
> > non-RIL SMMU. The same check carries into arm_smmu_tlbi_calc_single()
> > later in the series.
> 
> I had set it deliberately like that so that a table flush would issue
> singles. That is largely based around the feedback from before that we
> shouldn't over invalidate.
> 
> We've been insensitive to that issue in the past, and I'm going to
> argue the >= of today's code is a bug as it effectively made alot of
> iopgtable actions turn into new full invalidations, while originally
> they were range bound singles.
> 
> So I view this choice as a return to the historical behavior before we
> started to fix the soft lockup issues. I guess it crept it during one
> of the refactorings where we merged the SVA limitation into the main
> flow.
> 

Makes sense, thanks. I checked and before the invs rework the only cap
was CMDQ_MAX_TLBI_OPS in the SVA notifier; the io-pgtable path issued
singles without any limit.


> Granted I didn't notice this detail that the current code was 511 not
> 512, I will add a remark to the commit message:
[...]
>     The current code switches at 511, but this turns every table removal
>     into a full invalidation. Change to 512 to try to minimize the amount
>     of full invalidation.

Nit: that holds for a 4K granule. With 16K/64K a table removal is still
a full invalidation (2048/8192 ops), and the limit there actually drops
from 2047/8191 to 512, so it may be worth incorporating in the remark too.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
