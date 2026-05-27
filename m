Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2513939D2;
	Wed, 27 May 2026 23:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779923364; cv=none; b=DCNH0CGAXm0Ivff+/9FGnnjFJC0SJ1SYUYPLjIOsZrvKwba+ok4qCBOQxDjCjekgXO0vDT0iEyllaZhdwBdCoy598nOHIhuFm8t5bdVIZ835Or3zjwWyFaAxD3QBDerRqovvdJ+MUwbOPijpt9c0gJjGFL4zrXEEEdxgWfHOdhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779923364; c=relaxed/simple;
	bh=18Poc3XZQzf9xkj3R0OcIzEYuSmWDPYZQAlsZBGOKe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZMoUNS4//3HNgXMxF/PQGOl0ufIu0CU7QUriBsgq8RDd/zhOvbtNlgK4Va6J+wcScoJR4UOWLEXnqyyHXvTW6zoM989v1aIlcsRUU+07MJSXInHaYrccUWBPoJNQCaFXhjn4z2r0ykhX/cboIfXb9lLJnmMG476tWfYicZrAWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Yk0GnaFZ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Yk0GnaFZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=naJphF58gIMQUdGu4pgd6Y3t0BQU+qW6Iz2A86qJ/LU=; b=Yk0GnaFZJJUaLcgwL59X6ebBf0
	Biwo8VfeS4xcraPusP8WrRf91iwY9QapvW74Lhcq+E9qXSnWlcz/75bXw+TmUjBeQhTaZBsQEiaBU
	izlaNwAky6YiBnaR31a7GQTr/GEQXL41hEvmk04y9C8V2Rf0JXzRKBFOWcTzB+cW3FP7wc93iGg5l
	nbfxfc9widPOJpETlN4UlyiHOpEsxT8i40D0j+Nt/VLg4BT5loN4TjyRVzXyEzstSn9MVAhavruFf
	dD9+wEcgm3Tnx6wgkQVBQ8IFaXrUlbxsKydKyHAGmRiThe6nUWgll7fN/v7QAcBsGdj9VWzfKVRJV
	jBC7BuuA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSNNA-00000003SLW-3rV4;
	Wed, 27 May 2026 23:09:13 +0000
Date: Thu, 28 May 2026 00:09:12 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: lirongqing <lirongqing@baidu.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/mempool: use static key for boot-time debug enablement
Message-ID: <ahd5mIMCnI4DQFn9@casper.infradead.org>
References: <20260527104634.2434-1-lirongqing@baidu.com>
 <4da5d090-8272-7f26-9e83-ea4ab489f1f4@gentwo.org>
 <ahdsgyYYDn6juR_R@casper.infradead.org>
 <7f4ec43c-0d9c-190a-0ce5-bc3276b45cb0@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f4ec43c-0d9c-190a-0ce5-bc3276b45cb0@gentwo.org>

On Wed, May 27, 2026 at 04:06:18PM -0700, Christoph Lameter (Ampere) wrote:
> On Wed, 27 May 2026, Matthew Wilcox wrote:
> 
> > > Please clean this mess up.
> >
> > Isn't that what this patch does?
> 
> Its not marked as fixing something nor as addressing the weirdness of
> using CONFIG_SLUB_DEBUG_ON here, A kernel build with CONFIG_SLUB_DEBUG_ON
> can still boot without debugging if a certain kernel command line option
> is given.

Right, but ... if you look at what the patch _does_, doesn't it do what
you're asking for it to do?
