Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076793;
	b=OqF5d0weIFpMmViD95UMcdrNpskJGIyi+Kf+B/iDPJO3z2coCoM48a7osnhEZBXDp+DH
	 fNTwuvElhuMPQ1Ozx8bgun3kaVl3iSxBMlkksi+Pc0I5k1HSYnPE5TkrVspr17l645THe
	 3qLyrBk081aEAFRhyuVDnYveONErjZNIcxp2eXEK/nq9w494dWKb5T/iP7TaI+U7rNjHA
	 NUgpyPoRjvyxNV3nnGruIELDvi4A3UYyO/P2jFbg+W5jgZbtw2DqB/R0QtK8NvbsbDCZY
	 Ie7ZfsUwQKFF1CFv3T4JAVebesSRFWZDFR3HZ64E8N35GdFiiCpQKgRLy9T140fTBiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076793;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=lD0avvf7a0W4YUjuR/w8gv8cSrs+orKdOF7+3MwyUNQ=;
	b=G4rMyqssSJiIp1bWGnFPuoqJ5jtYpfOYmbjFFW8GLE6EcVquGB2f8EjTvylXZcyv9diy
	 ZYwABJeUenjK1l8ZJeugYq61BSmBc2E4asSknpGKlpYNDNUKqq8kEeyAQOTxQ1Vi+LDRt
	 D4cXpG83tfSv4XELnwMkpG30L7h4olPeW1pbGoLxIXzBk6sPl7jCrvEQvfQ7j6JI5uf7H
	 l5y9XSqepo/BpDXEGRaurkH/a7lCFLjWXwAGPJ0L41T6qV7EHatByF6WSrOjgpZfJmGft
	 94SYUfXaSbgJkYvT44fYmORL1x0J37l0ZjRJzjhf28GZks4yRuFxAbgg/F+QVwRzkwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sj8B4eAd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85243606A332;
	Thu, 19 Nov 2026 08:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sj8B4eAd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79641F000C7;
	Thu, 19 Nov 2026 08:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795076792;
	bh=lD0avvf7a0W4YUjuR/w8gv8cSrs+orKdOF7+3MwyUNQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Sj8B4eAdm1rPA9A9kvkOW8aa2I5KLj2Xu/ZsKGea/JgXDyGjOlLQUJtWAc0TAxLtg
	 eJ2tczDWSyNfNQwR4liU98aTbgD5uB3R7u42kznXNtoxXjknWDEOEPssSP/IP/eD2V
	 hllgA1tTb5DIeyTnCjLheGcOjcgekHLHkk8H+85MimiyKJ/LE6FvyQtLBUwE82qMIZ
	 e2y0muasl5jH+rFsYyYpQVYpUQItMrhoO4w+o4NMMFtJB5b6p1LMBxB9GA2D4qzdV5
	 J34lgUafiEKU5K/Km9nyJjLo7P7cuZ01M6BzfiCxMDeMxnmgxW1T+zdxRh2GyQoXJS
	 jg6Uopcz1f/0w==
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/2] kho: drop the incoming sub-blob debugfs view
From: Mike Rapoport <rppt@kernel.org>
To: Long Wei <longwei27@huawei.com>
Cc: rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
 akpm@linux-foundation.org, graf@amazon.com, leitao@debian.org, 
 corbet@lwn.net, rdunlap@infradead.org, linux-mm@kvack.org, 
 kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, hewenliang4@huawei.com
In-Reply-To: <20261119063800.698863-1-longwei27@huawei.com>
References: <20261117092951.4017931-1-longwei27@huawei.com>
 <20261119063800.698863-1-longwei27@huawei.com>
Date: Thu, 19 Nov 2026 10:26:26 +0200
Message-Id: <179507678647.425130.13205346175314463200.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi,

Please don't send vN+1 as a reply to vN.

> kho/in/sub_fdts exposes the raw contents of the sub-blobs described by
> the incoming KHO FDT.  KHO does not own those pages: they belong to the
> producers' consumers and have independent lifetimes.  LUO, for example,
> restores and frees its state in early_initcall, before kho_init()
> (fs_initcall) creates the debugfs view, so the blobs point at pages that
> are already back in the buddy allocator.  Reading them triggers a KASAN
> use-after-free in _copy_to_user().
> 
> The same information is already available to user space from in/fdt,
> which KHO does own and which stays reserved.  Drop the directory rather
> than adding another interface to describe it, keeping the -rc fix small.
> 
> Patch 1 removes the interface, patch 2 drops its documentation.

Patch 2 is only four lines of documentation for the interface patch 1
removes. It could be folded into patch 1 so that a stable backport
removes the documentation together with the code.

-- 
Sincerely yours,
Mike.

