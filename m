Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76D6261B8A
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747686; cv=none; b=FflHemPGjwjwJJfEmrPYwCh6llDWGsPXdWrXXrddT9PSaXXiOncjjNTYN7IDJVuSYdpvXYwleoAFZK8K9QUmHeQruoFRDcg1lRNLkkKyU57wmamlINls/vhiKo23OXc/Qn3QJppfFx83ACsIFa/Kp7cd/AyLbu3WYVJ6Nl/eQDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747686; c=relaxed/simple;
	bh=93Vtiw986HP5Zw70geHWmY/TgmlDxs9RMiLH5inaSP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5szFqXwGWhjceXVWHFE5i32Vx3XskFq98RzRslYs2YZ0MnO/LZ3OqmQskGwoC0hsiUNGUHOFeqREfBXwqTBTqQx83q4JSU1FvP1YMpDp/4dz1U93OZa5T39SNpd2IArNinwLr8SkVRqOnL3SlK33x3dHp6TknB+aE/Fr6hk17w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4UXe+eGl; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4UXe+eGl"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-475df55f484so65815e9.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 07:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761747683; x=1762352483; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3v3m7+iEHWRkLzDZ7+GIqu0uQ7bsmsqb2voqo0NHPtI=;
        b=4UXe+eGlgjwrb6pWQzf5Cry18615hGIrwbyGNkPv2JWHb2AIeki8CriGH3CaH4ZRBE
         Sd7aZ0IDQLQaNS493HGb5PsGcG85bbQAUb9Lx/+8qGYoXn8m7a8EP7+xIU+Efc+QazzC
         pmkigCyDIyurIj4tBxCxa14Yie1uusFzEd6bRuG614utJDFbAieks2Wws1DoXFQrk/2s
         adM15VrSkimAw7+LZfPkT4XgOoGg/802NJ577rhKeY4cqz+OYZucW9aRHz8tRQkw3hNY
         Xa9MurOw4ThLROtp1K3mLZilsH0Clk0bvVjw5A+bZl5BHJP3S8fk+H3F8mGn7XRfAzXt
         fPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747683; x=1762352483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3v3m7+iEHWRkLzDZ7+GIqu0uQ7bsmsqb2voqo0NHPtI=;
        b=BtRSH0CewxYZgrK1TW/ctZLjzxl0JInwldsafUzx5g3xmIifYtVVy9ZXDPm4h6yxpe
         CKOqeDje8WOyCBGub+2BvS0k10cHxztY+s+Jy+2mrqyiqQyD2hxSSkABFmSdmXE2pOVo
         bVUTWW0asJI241mVEIzdfAbFFBedJZu8ERn4lIwkfqGxEiqNYUIjusOAfOL7K0aEBDd9
         k7o+Z2Kji75tGGnJ2zvuY2n7ChWHW+VKN4LO4E4SZ1guftt37Gd8OzJm/viO6uZ5lP/N
         a08+FCIepD50RrY1rLCAG4q2Jk9XGVrrbbq3AYFtCnf9TwaTm52q/2/gY8dHqL3ukQDu
         5TMw==
X-Forwarded-Encrypted: i=1; AJvYcCULGWeLypwk1sp4KMOJK9H1TEmg33j2rGngkdJCeOhifbVn4uNv0C0ou0ld2RolPXFz+G9cnJqadx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4uXqm2bN1wp/xcgCM/CAhAArCQaZ0TbBUfB/LDBk7f5Dqq5R5
	G9r3OYoBnzur1zJBC8JA0FEWaAgAgni9LXEVXcW0WfyoZyQeEO/M3ph1idP2rlMbWQ==
X-Gm-Gg: ASbGncs+uAUHjqBuP48iExUodW5L+yRFIgARZTsF8WSADCqDvS60XEb3AqVtq/8o0cM
	Ol3BgPySaanKQ2oA5TQ89eDshSWWB9a1px/dCYPK3kn6o0L20bPydBom46TBeFP/wp2VLBSddEo
	TxpMitACDTINby+AtvFzddey+SBPtQmOXrsEZxLxVV7gb+0Uz2EnQKLVpe0/phytNuaKI9/96cS
	2ILCBQa8uQyMIifbxXNwnl+h43ZJ02t0BCspGMeLTUUlzjBCU+uF0+RLZSBW/Q0SLwLEBk8bDTY
	OVm7pZxBvt8MsYXzab5qdeljBYJApRNxAjlQxEsIdVzYxPit+n97IeZElZMFoYtMsUJ0DwZ2GFW
	0hSC0OFdXXULnO9yKqAadGOJR3ZGKsfrYjUU2uesuzepDZZ7kMWRcepBRTKeRguNIaThyKMpvAP
	rxKlQUgWhATKjRsUupIVOb4Lyd3VqnkJ9ixCPQTRqUDyV+9n/YUw==
X-Google-Smtp-Source: AGHT+IF0QvVp/pMidwWCYmRvRc3ULDAawDYrzzkZVMrjVXmcSM5ssLIvciM67QH/jAt5xWVHGKoIQg==
X-Received: by 2002:a05:600c:a00d:b0:477:2205:df3d with SMTP id 5b1f17b1804b1-4772205e0abmr1513845e9.6.1761747683131;
        Wed, 29 Oct 2025 07:21:23 -0700 (PDT)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475ddad455fsm123107015e9.2.2025.10.29.07.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:21:22 -0700 (PDT)
Date: Wed, 29 Oct 2025 14:21:19 +0000
From: Mostafa Saleh <smostafa@google.com>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, will@kernel.org,
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz,
	surenb@google.com, mhocko@suse.com, jackmanb@google.com,
	hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	rppt@kernel.org
Subject: Re: [RFC PATCH 1/4] drivers/iommu: Add page_ext for
 IOMMU_DEBUG_PAGEALLOC
Message-ID: <aQIi3-l7juuwLZzs@google.com>
References: <20251003173229.1533640-1-smostafa@google.com>
 <20251003173229.1533640-2-smostafa@google.com>
 <uwznrzdsbfpbalzf5jxxpguf2ykslphfs47u7gf66ssiwzpqju@dh7nw3van6sr>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <uwznrzdsbfpbalzf5jxxpguf2ykslphfs47u7gf66ssiwzpqju@dh7nw3van6sr>

On Mon, Oct 27, 2025 at 12:42:09PM +0100, Jörg Rödel wrote:
> On Fri, Oct 03, 2025 at 05:32:26PM +0000, Mostafa Saleh wrote:
> > +config IOMMU_DEBUG_PAGEALLOC
> > +	bool "Debug page memory allocations against IOMMU"
> > +	depends on DEBUG_PAGEALLOC && IOMMU_API && PAGE_EXTENSION
> > +	help
> > +		This config checks when a page is freed by the kernel
> > +		it's not mapped in any IOMMU domain. It can help with
> > +		debugging use-after-free from driver doing DMA.
> > +		This santaizer can have false-negative cases where some
> > +		problems won't be detected.
> > +		Expect overhead when enabling this + enabling the kernel
> > +		command line iommu.debug_pagealloc.
> > +
> > +		If unsure, say N here.
> 
> Expected indentation here is <tab><space><space> and not <tab><tab>.

My bad, I will fix it in v2.

> 
> > --- /dev/null
> > +++ b/drivers/iommu/iommu-debug.c
> 
> Is there a plan for this file to contain more than page-alloc debugging? If
> not, it should get a more specific name, like iommu-debug-pagealloc.c or
> similar.


I have no solid plans for other features, but I was hoping to build on top
of that in the future, but for now we can make it “iommu-debug-pagealloc.c”

Thanks,
Mostafa

> 
