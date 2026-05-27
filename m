Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB5730EF88;
	Wed, 27 May 2026 22:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779920017; cv=none; b=OaFHfMMJ/NDxbAMJZofhoKb9HGTTSG6XpKYpezqJSuxpyRGB1lawQRX6OMhz1dEmopQVOD4CL7/5gc/xYJLB43GprifND7EBMMAOaSYOHWlimfeUbCPoTcH8iSNsq9F4BLuSU26MQ6s1YFh6Eda2yktVMNCKdYeqT/u+XHZ6V4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779920017; c=relaxed/simple;
	bh=CW+Iifdz3bIRfnE9d689BzCZ0J+WwvEHLY5CKufVG68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISW1qkCItzLtnlc3EPSnzNcrRJOgwM7nm16VOUavjywABuhwek48s59sTA1lLNE3GRl5kbwMJ1tTtcOBwSLZ4fRAW80ohe3TJFGyX1H5EuEyWkS3HrGBXbsab3fjQvzqifeVhQmpbTDeNnphgDZdVdGyjTJ+PAgIbIFl/QMee1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vnMPwzyX; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vnMPwzyX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dodOOnd1Ef+RhYMklOu6YQdcoDL3YHcV/9uS/rD7CTY=; b=vnMPwzyXnO+XywybwKb5KuliVo
	5ehX6LavM9xNXUc8+Uq8M0WIEYnduf7HuuJ0hPd/oAjAOU5Lx8Kq3pq4McOVaGwlrkV6ZxI1PQ9Tb
	3iaBA9kdNaKme+vzOOAat43Uy93oxPXEAdc3EPavWlDRQ99+iSmvZIl6Eb3rCA/U8S3Ci90dJI666
	WxI5xctNB1UnWl2Lzw7KaOWB62Q5TI/HvXzmX7BGqOW5lj03Z8RNfCgoP1Jzbo0BPSVM5uBrJTVwv
	bKDttAhwEqwX6OvyS8QdghV5FI7eODY2VXJx3icD+zbh9ot9Zm1+Eo+pXPbyzMw8mW/p6ljC/l/MO
	E+MWIwMQ==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMV9-00000003PNc-3SNN;
	Wed, 27 May 2026 22:13:23 +0000
Date: Wed, 27 May 2026 23:13:23 +0100
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
Message-ID: <ahdsgyYYDn6juR_R@casper.infradead.org>
References: <20260527104634.2434-1-lirongqing@baidu.com>
 <4da5d090-8272-7f26-9e83-ea4ab489f1f4@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4da5d090-8272-7f26-9e83-ea4ab489f1f4@gentwo.org>

On Wed, May 27, 2026 at 02:29:22PM -0700, Christoph Lameter (Ampere) wrote:
> Oh someone put an #ifdef CONFIG_SLUB_DEBUG_ON in mempool.c. Overloading
> the meaning of SLUB_DEBUG_ON as it is used in slub.c with something else.
> 
> Someone was assuming that SLUB_DEBUG_ON means the same as SLUB_DEBUG?
> 
> Please clean this mess up.

Isn't that what this patch does?
