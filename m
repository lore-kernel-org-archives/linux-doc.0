Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182618;
	b=GytMBpDSmf1QBPNQ1vKa1fuCWX4pcFsRaWHUzfCC4r0mwxf4uanZYq3FRQcsb/IcLkDo
	 OfEqOyBcTu9MRqB6M/HvIGsZsdqHwXjysQKLy72wVIWtMLM+r4Nso5xN2NGzO1XnIM+gr
	 gGaGk6g/QzOrFmyGOENkzouscOwQqVHPZZ4N8NoL3z3laCG3qx1PMtikHoJ8r25D3G6b6
	 lwzG5LWPGEzqyBPZT2IHVkfeFMV3+QeZg/6cQ1wpSnOBLqMRRwZci4gmPArqsNMFcL1vu
	 jPApnu2WBJCJ1ehtxrLFlXobsB9AuIpPOm8CuiIhqkzQdBhnW7TyFNm9uW4bKXwKttg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uU+g78pFe3woDmujMNPfhZ/0Qi8mHsxDvK4Ws3nTpkw=;
	b=RWXmxmtExrxkym7f465dmuOTBsuXXun8vsk1HQqEeYNN5KoBwyiOmpOZ2SZ1FI4Y5eL6
	 EJXVbpgEARvU6R27xmZJU3qoS1o6eKM37a2X7cscnKoMYZ4V1etQ/JqkyBin5n4PfRY4y
	 0OT4CR0/Uk+7vGEmHMZDfROA1Fny1kaP7cyYeT+b1/0nDYeRP+1/oBYbM+udjydbW0Xx+
	 q1e2Z5f+OLWXPbTxOuQ0joPxcABXpToEVe6P5XdazKdr5MsNzbbZ8c+HUz2FAAaJ8JRX6
	 K7pFOUSrKoykvcSvxvuYjtceXdNQSp/rDXC0bY57jcgbqm8BJWnEgOJ4toUQmmegdzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ehz6mMEB;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9DD606A331
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 13:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B9DD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ehz6mMEB
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-949657a20d7so121271285a.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 05:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795182616; x=1795787416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uU+g78pFe3woDmujMNPfhZ/0Qi8mHsxDvK4Ws3nTpkw=;
        b=ehz6mMEBp7FU9O4IkG6ucYOPrN/2FptPlSVzAMegQhkSAM21Hz39XQX76haUWfk977
         A2S7LqWAyzQ/MMpQcJ9hlw5/i8t5QmFoKEbwfS2++6OthszxDFhEwhu48SFckK+V0pvW
         ZrB7pLti4QW/zlyDdG0NHqvUQqc55WcUlTDasvdx4/7cbllh7O44dOopIvf3GjZWbJGD
         Hp2pPFYqt09CILTVYoO85olovSxlw20uhMs3fEFAaJjWsbuz4Ruyjz74FAK8xTbPsjJm
         YNZjjLR6Muw2SduJu6y83jD/L3yp3ZXbUhG9xHOIQjqowZufFq2KjlStO23Q1v2+do05
         Ehqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182616; x=1795787416;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uU+g78pFe3woDmujMNPfhZ/0Qi8mHsxDvK4Ws3nTpkw=;
        b=w06Nq2UUr7zbSIdJGe3hrOFvVpfdd+Tvq0Pcziz3C4+SG4+67zvEjoRrvkSyXai/y3
         EEaWsG4O31M6hpqRSJiOGfg2t/jOoE3J0sErmzyPzliTOc/YPDhddjv+MH0v4wMUzMZA
         Q/5I5LSh6Jteo+TMSyvtOPbMBFrK0IMG1KIq5UmTtqRwpAEQv7zibghjImZ3pWNkqnk/
         bo9s3oKHGhDOPednz1XRY4BlKsYfOvC5ld9x7x5C/nmF52o09wMRPQIuta2pJ8+NWnoN
         /fsSZlG6/e80mfPN9l1C1pIlIylRhbZKpkfDeCV+c7Y/++c/stc+wk50Cz96DwY6uxZX
         8Yuw==
X-Forwarded-Encrypted: i=1; AL+hErHz4lORMRzXH+P99WiYi25FKekCqRUcptlDeoovj2shwr6JR6KRtQfmJnaSN9eJOMTQqWCSmhVGWVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QA4bo1JdcLphehlWfazNZ9+KT9uSbucCk99XlyxVnPKcxW49R
	WgCYOIHLNJxLPwaAXA9iF5GiPjEc3KfDx4vD2mtDA4yWMnuK4tB4S5NnBH2WfZ3UrIQ=
X-Gm-Gg: AYBFou3mSmSSwN4HUNDb3vluvhvmbBBO4KvtwD5Zw8H71lzJwUrEVgkzTymRUuCeHnU
	THNDLKcsig4/fVWVljc0oyV2j44H3bP4ePZ3vPwttoVj8+JunuJIi3bg05git5YcAj/g2xqp8iP
	bSlF5DHBGDUQjRBqLbFMuNL4svlEkVUq12GeSY1gDpVkq3ddU+kB20LLsd2h5AG47SHafg5+6iG
	VvhR2lvT1aZ8KSg9eIO8UeCs5AeR0OBebNp902Msum3fyQXPjCKxcphrr0vma8mYRoB360d7V9v
	EUG1F1zdSuJGp4v1L7wGJStGRUqCpvUxPyJbjUmxvL4cy5LTfGBYafVZx7znVYfaMXerozPf9ep
	RI4FmL45R1sd64czxUCSpMxIABePzSI9hSeaNknPR6ai+QLNqQbb2fI8T5o+gTzK9rJk/3mY6ST
	RumY7iZ+3C/ZPjdK9ucRASzCp4MD/X4OJd182vVZLdfluXD09BUY4Ech2swvQ4/moa2hfFrzVji
	Xr7xc4ohuPB4NwpGfTmABw4YHA0Bttu+aOzItusE0rNbXxlYd53k/MTLwm+UO311lEaO95l/NDc
	dtzQmQ==
X-Received: by 2002:a05:620a:4111:b0:939:5cd5:e243 with SMTP id af79cd13be357-949ba80f8acmr491343985a.6.1795182615989;
        Fri, 20 Nov 2026 05:50:15 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm190597085a.31.2026.11.20.05.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:50:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xUP0H-00000003hHG-3ovL;
	Fri, 20 Nov 2026 09:50:13 -0400
Date: Fri, 20 Nov 2026 09:50:13 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Luigi Rizzo <lrizzo@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Vlastimil Babka <vbabka@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jens Axboe <axboe@kernel.dk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Luigi Rizzo <rizzo.unipi@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, Harry Yoo <harry@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hao Li <hao.li@linux.dev>, Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>, Jann Horn <jannh@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Simon Horman <horms@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Willem de Bruijn <willemb@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Christoph Hellwig <hch@lst.de>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Naman Gulati <namangulati@google.com>,
	Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	iommu@lists.linux.dev, netdev@vger.kernel.org,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 00/25] PISA: Pre-mapped IOVA Superpage Allocator
 for DMA and CoCo
Message-ID: <20261120135013.GO3115493@ziepe.ca>
References: <20261109182533.3594984-1-lrizzo@google.com>
 <20261120010655.467825-1-lrizzo@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120010655.467825-1-lrizzo@google.com>

On Fri, Nov 20, 2026 at 01:06:30AM +0000, Luigi Rizzo wrote:
> This is v3 of the RFC previously posted as DMA_PMD [0], now renamed PISA
> ("Pre-mapped IOVA Superpage Allocator"). The text below follows
> Documentation/core-api/pisa.rst (patch 25/25), which has the details.

I thought the conclusion was to just do this stuff in netdev pagepool,
now you come with an enormous AI series spread across the entire
kernel?

> - Needs bounce buffers: in Confidential Computing VMs, PISA allocators
>   pre-decrypt 2MB pages in place, avoiding swiotlb bounce-buffer copies.

It seems this was ignored too. We want the bounce buffers in CC. They
serve a security purpose. You cannot loose control of the shared
memory buffers have have them leak into SKBs, user mappings and so
on. It is not secure.

I don't see how any of this is valuable or necessary for CC,
especially when we really don't even expect to have an vIOMMU for CC
very often..

Jason
