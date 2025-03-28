Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDC613D51E
	for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743167400; cv=none; b=nXHRV2FlUx/VOdJLuxlEbghXdN0vVHFmiuMA0TJlICBoMK7WgmLRTKIgLd8PZeVTbj+BUBAsnMtHB6ERW7Qa9IppRI0f39IkmdQa6qEUqQ0WnQntM3rzIEnLT07CjAN/XW1yJlv3HIMUrr/16kf3EaExJebbAxzgH/hmhkCC/a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743167400; c=relaxed/simple;
	bh=nsTbKkWCqPsRPDxW3L9BiP9mUlaPvv6pz4JS3WdUmiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdDGK0IiUqM2OZ7Cse2TEBKnxBstr23HY7jp7Sje2fbDRox7XiQJElcOGZ20G/znfho657lKGMMiMWgK29r/BPpu8W2TxvxIjYqFLXurtLO7QI6k2dQOlNDBQmruwUyf66NnrU1jyL4HTMoJGpvWrD2tHZp+QOOetN4mHq7gyvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=hiWcasnR; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="hiWcasnR"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so16346006d6.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 06:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1743167397; x=1743772197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GrbE8iOj+o8uLnkO2AV/Y6hVNF8UOVIwZLvvFnjPOyM=;
        b=hiWcasnRuaL4DnKvtC4NJX8RG/f5UYOYWRUA55kt5X4Ou9aVvQm+FKdwIprb45mCN+
         B64wAJeUv35kVw/ncU9VK4Y7J+2zZALQ6xMjCLiJ5UN1YA8+BR4pJWPwAnhS2iPQdUvg
         qKfHDfF/lNhPkuZINhXpkMx27hpfpsPel5MxC+Q5e2U5xSSC/nu+oA5/aBUAAOCIuiLs
         Iy4N50X1IyYpYEkWuRaOvj+/3bbi/In8PZ5Jmk2BPRbK+PZ8wfCxx+wV2nKgYTPAUe9e
         52GfMe9xxB3rKueo/2tqGeBVLO0PEsp4lIVCD5TCOKlgJeKcfd+w0IRw0Is0p55s1l1f
         ooBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743167397; x=1743772197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrbE8iOj+o8uLnkO2AV/Y6hVNF8UOVIwZLvvFnjPOyM=;
        b=On44Ixoh2n1k8emkYoMBAgqF5FtV8sFhp/+lp2E3qsfurm+Y7DD5Xe2wjs+Qh0WG0+
         4QMR2oWQyuE4fU3GTIt5JXUqb9Fh5+c5R9FJyMJEzx5MVz2Y3mRJDpS3O2xdtMI4XTIC
         wrip11sePCyHXxppKg8gOyhOjrz2G4siduqTdsxwf9ycG4k73lxrigTYQ1bS1YnSzVs7
         lZ2QlIUV8xKXsufrMcxl6E+NQT/0rn+XrmrfRSCfnE5RGg838Cm3kgPDUtL3R4QIOxXi
         uTY5B3OTYMstryXA63UsWnCKCBGDkYhqWCHTCaEAn1eRox3OuXzPJ2VP5UtUMpilIEih
         m+nA==
X-Forwarded-Encrypted: i=1; AJvYcCV/PuGfEhkDU/CQJsEZUqnHflfTddJ4b2iVXr86sJNKqXlPDUNwjGlLEgWwk9T5cQZY6d3TuB7tBbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmZPOXpeMycldenwjVzB2GdXOuQA0rbaWgRjRT02lPruGbyZyt
	9tLJIfuxryO6alzSQGJh+RKjfiAeaSkF2Gl43Jba/tIfb62IQ8MNkedhALhXfaw=
X-Gm-Gg: ASbGnctR6Vuno2Kg8+A4Y9+ClmlPzwS5/JfF8ziS9HJB/Km1kcn4AG/V8sIYHeInvlb
	992/mxo4aILYDWAuTeDIad+X2BED7ctnGvco9rRpzDOAmtAZK6bciT2XquMfvOJy99cbJGQaLBO
	BaF6dgnqeOY/YbUu4ihwgPqBp8KZEBdJkeDscvByVYmr2wXBRP+nel5yoXgbxh4gvwRwTu8/Wob
	Tm6xsNKz7bcVMiSfVyQv9Aik0h2gVy1dpNtiSWFAeFXxFCHrnWYYKPlA7Ps7KgstmLmVXtv/nHr
	g39TjIOanzWZWMwej3aVk0CQSjlbNRmaxfVy2uOt6Mbo0B9pD2vGYZt6p1hyFKWYnHgICe1iKXL
	m7+gGgJlwGTT1r3qMii6j+T4=
X-Google-Smtp-Source: AGHT+IHidI8Os+Ek5ST85eRSABKJEnwVGlnRgxl/M61KkTTVspVJqP5FKyEOIMZ6GGbE0+O2r3M/8Q==
X-Received: by 2002:a05:6214:19c6:b0:6e8:fa72:be49 with SMTP id 6a1803df08f44-6ed238a5684mr100935736d6.12.1743167394762;
        Fri, 28 Mar 2025 06:09:54 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7659ae3sm116989685a.5.2025.03.28.06.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:09:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ty9T7-000000005Qn-1rpo;
	Fri, 28 Mar 2025 10:09:53 -0300
Date: Fri, 28 Mar 2025 10:09:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux.dev>,
	Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] iommufd: Fix iommu_vevent_header tables markup
Message-ID: <20250328130953.GA20836@ziepe.ca>
References: <20250328114654.55840-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328114654.55840-1-bagasdotme@gmail.com>

On Fri, Mar 28, 2025 at 06:46:54PM +0700, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warnings on iommu_vevent_header
> tables:
> 
> Documentation/userspace-api/iommufd:323: ./include/uapi/linux/iommufd.h:1048: CRITICAL: Unexpected section title or transition.
> 
> ------------------------------------------------------------------------- [docutils]
> WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.1.3 ./include/uapi/linux/iommufd.h' processing failed with: Documentation/userspace-api/iommufd:323: ./include/uapi/linux/iommufd.h:1048: (SEVERE/4) Unexpected section title or transition.
> 
> -------------------------------------------------------------------------
> 
> These are because Sphinx confuses the tables for section headings. Fix
> the table markup to squash away above warnings.
> 
> Fixes: e36ba5ab808e ("iommufd: Add IOMMUFD_OBJ_VEVENTQ and IOMMUFD_CMD_VEVENTQ_ALLOC")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250318213359.5dc56fd1@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  include/uapi/linux/iommufd.h | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)

Applied, thanks

Jason
