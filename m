Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E4024E4C6
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 16:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702069; cv=none; b=C9DwOZjjQ1b3enxHnY6ofwisz4mS1YH51UPV0SoY1lnNVDyClsKVEF0E3IinJfKOdhMeg0e/6pAzUOZVMz+oV9Kc7/aUXLbRRArLA4zdD0a9itFB+g1/ylXtLkUym0MzGBynZRgzVTyzlFUk63PYSjCD5HkSCLf245VKuIvfrOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702069; c=relaxed/simple;
	bh=5mY/LNzOoYWIQwJjGaIbGESQyPbUXU5+u9YysOMf/yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlR7u6Do/f91mQ5Cb9liglWc4aJn+076FzTjpAOyqzwmaJbScpdAZ+cm53kSREHR4D6VsNhNdO/WwjVytmge2dbA4DHgkTK+68Rl0wSJmrIzYVkYIAFYDqQ6jv+4V7zVYb04r/tkF5H/YvcCcaCKb0fwGdYio65d3B1v3xegecA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=pJjUs4fx; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="pJjUs4fx"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9204711e831so93964085a.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 09:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783702065; x=1784306865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ldYpDeT5zs3T98XMfsT8ni9uE73SXe2oYxwTATvCf1s=;
        b=pJjUs4fxJRRV4JyKYlLYpWw2bzk38dHrOh6nkT9Fk9sBD5r2HLAYjShp/o6Cg6ZF/q
         Gcp+e2f0MX07bpFIZtTZE3rC/QY83URHHcn/Y7Of2fITSLy3FIy18aw7x1UoV35GELov
         dNC0vVBsROWvwix7FeVYppBiNutBs7LzTTbELawNd6P7ReUVwboVJ66LT1SzaVt3ZDbv
         cwpfjr33yr5c0UpQqB072mC1rty2Ao2KZWj4gV2U8OvZPENCqA2SvCxk2+P4seYkMskX
         N8kFoYFWDXKD+KoWDBl/g/WHzBDxI+NIKG4vTr/cF/0hgOXKAAnzXeMOSvwbBLoVQWwl
         RI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702065; x=1784306865;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldYpDeT5zs3T98XMfsT8ni9uE73SXe2oYxwTATvCf1s=;
        b=IpIu91rzfpo+MTyWVWqXG5giV7o214a760cmY80qNN/lB6i2J4adavaQtS8+r2DdJY
         icXCEDGhhOyIOG35IeLgU6Xgt+P2l//U9KRU5CiqqBKUyRwkc4gZjvdMIGZIUvw7oMd7
         PtnOTHVGHg7VzxPAGGXuTOTJnVTTH5WYOLrJ/6QHvZ79Xa8Sm7VuH5XX2G1d2wCBX9QJ
         ZcpUot618KyUrninVukiGkitCuLDUT9ORo3F8rwYchLKWRePfPvefyfb9KQEIigWodHX
         bgbQZ+frOjR0d1myPxNzsb40wwSLlLav+Oe+FLR65vHzpD8zNGvHCrErR9m605qLeeO8
         mnuw==
X-Forwarded-Encrypted: i=1; AHgh+Rpl4hyKAEtuwXm5yDiqfdWlxFg0ohIR44eNAD8Ra8IM/CIzIoUmflwU3318iIAVp7p8ZjW1KFF8MOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhc5O9+O2U52ejYp11OuI30NimCzxHM/U/cLbptti5fNKj8cno
	bZ/7Wd2on9UTKmc+7nnSVHUhsBF7MxSdoZzt8NqRQeiba0fKWLhv+jiORoAZgjBiPzA=
X-Gm-Gg: AfdE7ck9wx2dssVX0h5USaEZ1YlZ5WG8HTUoWtOW2ZSaSHu8pvkbT95Mqbd1KNNI+K6
	HiJPOGCaqRDhgEtKSh8P2vLH/zWHjJ++QCq1GFJHfTpE9GeGdHBogFRFlr4IyjS9maFvXwbBTeE
	GMKEjdROCYBVDjC9D1BGGFb0dzeaM28g+JomhS7pFnPVJ2n7JhvkUEdJUwb65ZAosoKq6WZD7H1
	DQanctKkutPB2Au0J+Ss9uWanoGIXCdPzfs58I6GG1gTP7ti1USCzGfipIPmXm0bOnrlP+mIexI
	2M7zFeZfVffGEZQgYaOG7cdjcmZ9DD26EMUwbeMc5DU1LAf/OGLVToYykGvbRnGEq80Jj9AclNQ
	/jKSP4K9ERONCcctLQbXHROwAPbbsTiI3y0xzYmPtOutqadCQKPmsfB6vUPrw
X-Received: by 2002:a05:620a:4044:b0:92a:3ceb:9cf1 with SMTP id af79cd13be357-92ecf68b839mr1385461685a.37.1783702065110;
        Fri, 10 Jul 2026 09:47:45 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd5bbac2asm45778726d6.21.2026.07.10.09.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:47:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEO7-00000007ZDn-3hnt;
	Fri, 10 Jul 2026 13:47:43 -0300
Date: Fri, 10 Jul 2026 13:47:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
	corbet@lwn.net, dakr@kernel.org, david@kernel.org,
	decui@microsoft.com, haiyangz@microsoft.com, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <20260710164743.GX118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
 <20260710162749.GP118978@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710162749.GP118978@ziepe.ca>

On Fri, Jul 10, 2026 at 01:27:49PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 07, 2026 at 12:47:01PM -0700, Stanislav Kinsburskii wrote:
> 
> > +int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
> > +				     unsigned long timeout)
> > +{
> > +	struct mm_struct *mm = range->notifier->mm;
> > +	unsigned long deadline = 0;
> > +	int locked, ret;
> > +
> > +	if (timeout)
> > +		deadline = jiffies + timeout;
> > +
> > +	do {
> > +		if (fatal_signal_pending(current))
> > +			return -EINTR;
> > +
> > +		if (timeout && time_after(jiffies, deadline))
> > +			return -EBUSY;
> 
> I really dislike there is a timeout here, HMM is supposed to be more
> deterministic. GUP doesn't have a timeout, what is this about?

It looks like you've moved the timeout processing related to the mmnu
notifier sequence from the callers into this helper. I'm fine with
that, but maybe add some comments that this timeout is helping
implement the mmu notifiers, and we do expect that the HMM part will
not timeout.

Though it is a little hard to see how your stated purpose of enabling
userfaultfd is going to work, aren't you pretty much guarenteed to hit
a timeout if the userfaultfd process is adversly scheduled? That's
going to end up broken.

So, maybe the deadline should be resetting after every handled fault?
ie the timeout really is only about the mmu notifier and we don't
count the time spent handling faults or walking?

Jason
