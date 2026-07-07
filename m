Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD403DB99A
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 10:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419508; cv=none; b=IzZMj3V6D47yutiMwpzjlkogytn9/4C6ZNLIyiLpcnI7K0QAe9YShAX0m5dbGVTnex7KlJYZro5+3qXSRNewbNACSypDvNZ0WrBftCDAOu+9FSWpYh0Kp+tkpxPfKuBterbBOx4zufliEU6d/zlMNyda5yf51wED6btuVRea3dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419508; c=relaxed/simple;
	bh=98VhNMModFCcxiqm7ARQ8dKwSt5GANhTPKLjWFAsCsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4BQPPwgdcO8ch650nTHNB9MaX1KqHs7E4kdVFN5YAdTehyeL6Kr/EOPcDNG1VwemsXKcZOt/XEYutLlE83NLZ8hDBlorIpRMd0YL99mna77OpZUaRExwK6PMGTYeLPUVfe6hSBK8YavzQv2PhHy80vh3PeI2srQ+jjrP7xxV0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ifONFYuO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HpNFvvQR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ifONFYuO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HpNFvvQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783419506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3slwj2XyzWQtqngmhVqaSA6RBHzpXga6waGc30WeTwg=;
	b=ifONFYuOk72bELdNfNMhYpqN6wc6bDcAmrY6szzV+H6J0wUe4QHj7g18AvhZZ4+4XYdVCo
	1K1ZuL9KS2kFLlvSYCWLmVhta1Y+rU+3RQ8HIHRH2lOWRAFkPsSK/F9HBKeWJBPEeY6BsX
	xOK0VsBNAvk9xuKYudhiskE31be7Y2U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-vDVMnoXiMdylx1HamzAfQw-1; Tue, 07 Jul 2026 06:18:25 -0400
X-MC-Unique: vDVMnoXiMdylx1HamzAfQw-1
X-Mimecast-MFC-AGG-ID: vDVMnoXiMdylx1HamzAfQw_1783419504
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-472c330e555so1697243f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783419504; x=1784024304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3slwj2XyzWQtqngmhVqaSA6RBHzpXga6waGc30WeTwg=;
        b=HpNFvvQRI9otjk1BVz0MSDbqpHp15ROiz8a9LEj4sDSMnW5YdhaY1fQO+8vViU3NnI
         BNEx0TQsXfGyTDk7b7mar6FDGNC3R9OFdTxuarFkGoxIslO7zMe0tSGSJ/WtGdSbPCGB
         4jriprwpnwHiL7qQidH9hc2CCVC0JtNHV5z6C8c3AgMpWmy2rd7MGMMUawXXLRApSLxn
         wNsC7P2wOu7+Akqm62YHjRlJlh4dmB9+8U8a1EWl5U0O93P0VWXTscwO9i9kO/L2HJsq
         mkl7L72xHnM/OReRUuZ1Z9lZWTiau+QrefSttG7ZTx32Q610dWG0TvfjW9uzDLfeNWZH
         U8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419504; x=1784024304;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3slwj2XyzWQtqngmhVqaSA6RBHzpXga6waGc30WeTwg=;
        b=p2ZCW2HLf3soSzckphEJmHzG8uO2xAORxKmQqKCb9E1lcTeb2CL+NQ3/8Y16Vj79pA
         i7hVn1lNrfclMfWCA64KTewLiw1uyqe7MUvd2jJkFcIFPD7sc/ufIxJnS0/Ri0rS/XN0
         cHr9DDKZWoddNxBkFwYTCyhNUAQ7O3HkpXtENxh4ddJAx/1/nk/fcn3YLFdmCQN5LES0
         YHtgimMS/BwiqRbheImbXsLCkcJPq3WuUGzDTAYvJjh2rO89TAcZmE70Jx+egk8MuzFh
         DwgBqMateHDMT36X3WIF9SRu3sCMA2DkWsYwlBNAvwlvhtKMfrm6UrTMyohhA8v8oqoC
         BwRg==
X-Forwarded-Encrypted: i=1; AHgh+RqrHGg2UhG9Ga0aW8RhUdxvjxF5/e5oQVjgz8pRjaHlJiWTG0rLITYopMVLBCC9o53ByV1DZOe39T0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcgUiK8VWzooafyFkNz/lOYuDyRUCwPwnuho0XmI/L4q+6X/o7
	HR0B3MKpbkgD6uh14X/TN9GNuL11w6qrprnXeSpFrE0QNfAUU/UKjUsEHf/T0cyKRq6Y/fHLINI
	672uL4C6dRLv2zn/vZedZjkyUN5iSc32fH9Vk5BUjmiruFJ7LC3X5/wrGjB0PyA==
X-Gm-Gg: AfdE7cl28Ep5GO5/B5LhCKGu2OJRvmsATVEvTFI8vitSTndl1PBHF3l21QXFHg+QSYM
	gMJmebEY186vQp2lACLylzeVus7MiKKAnV9nxqCtcVra5IPbrqv/GOFv946EQuYqIa1wLJSviKx
	xOaxPJxtk6RngZJI5WfOMJzN39zd+gLEbk60j+BDjQ7kbE9gp9X93yTtcvsd+l6c2QiFkHfBcBS
	TE7n/uBT5utZxj+fSMgG5hNyVeLfXpJUOGIM2pI2qjJaEuCl4uirwnZXT0naoX01MHh087XjxNT
	e6Pf1VDQNVftSMPVguIxBXYm6Y3t/+HpxZqgBTclvmjtopA0BRHthQgi7garfFxlOdZv5vpiJUd
	PM7KD5+IkhKXoFd+ZSnb1cQhWOuy8cN3n
X-Received: by 2002:a05:600c:c173:b0:493:c98f:12e3 with SMTP id 5b1f17b1804b1-493e3066380mr12492975e9.20.1783419503693;
        Tue, 07 Jul 2026 03:18:23 -0700 (PDT)
X-Received: by 2002:a05:600c:c173:b0:493:c98f:12e3 with SMTP id 5b1f17b1804b1-493e3066380mr12490105e9.20.1783419500441;
        Tue, 07 Jul 2026 03:18:20 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-68-31.inter.net.il. [80.230.68.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm49438995e9.0.2026.07.07.03.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:18:19 -0700 (PDT)
Date: Tue, 7 Jul 2026 06:18:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sourav Panda <souravpanda@google.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, mhklinux@outlook.com, fvdl@google.com,
	gthelen@google.com, mike.kravetz@oracle.com,
	pasha.tatashin@soleen.com, rientjes@google.com, riel@surriel.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 6/6] mm/hugetlb: support free page reporting for cached
 hugepages
Message-ID: <20260707032839-mutt-send-email-mst@kernel.org>
References: <20260707064235.1386552-1-souravpanda@google.com>
 <20260707064235.1386552-7-souravpanda@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707064235.1386552-7-souravpanda@google.com>

On Tue, Jul 07, 2026 at 06:42:35AM +0000, Sourav Panda wrote:
> Implement free page reporting for the HugeTLB dynamic cache.
> 
> Register HugeTLB hstates with the page reporting framework if they
> support caching.
> 
> When pages are added to the cache (either via recycling in
> free_huge_folio or direct population via sysfs nr_cached_hugepages),
> trigger a page reporting cycle.
> 
> Page reporting isolates pages from the cache list, reports them to the
> hypervisor via virtio-balloon, and then drains them back to the cache
> list, marking them as reported (HPG_reported).
> 
> If a page is allocated from the cache, or reclaimed, clear the reported
> flag.
> 
> Signed-off-by: Sourav Panda <souravpanda@google.com>

So if you are going to look into this, I feel the 1st step
should be reporting pages from hugepage_freelists - this
can be done independently.

-- 
MST

