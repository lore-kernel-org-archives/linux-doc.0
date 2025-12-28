Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C766A3A1E6B;
	Sun, 28 Dec 2025 03:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766893393; cv=none; b=iSIHF2slipq4igVwuZrFg7XtPbN5yC3NJBGLfgAD91Rwait+NSozJFmmPXErqGpXfOsu2xGL+8T4C00ZdGwLOByiMlCrTDW/W0zBgzDzjyoGr1SdETil+BTBKJAPoa4T6wmABLHmECMWEpjnhwdDTw66tV/IxDbPoOmACTihcMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766893393; c=relaxed/simple;
	bh=XHFgrE5Z1anzcIFXkdzMMmbCv+NsDEGlOOJbHAN/r3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/lugVERmL4Exmd1Zd4YpYlTOOzpYRU+Rj4gVRm5n4H/uVma85TBX9rZ2BCjlRHfWv2auoDIb6g4XnXTOgw5l+Vsje1/+rAJbwh8LSelnJ3ZQLvtlO2oKdRNf1paLrOeR+D6E87Zbyu+FCEjcaUSPRxEDRULX9txxOmQ9g9y2qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OVugtFUe; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OVugtFUe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7E1czr0P4bYeP4gGirjw5YdD3fjfTZRnF0cs94CurKM=; b=OVugtFUeIzxtlINiiivlJQDWaD
	6t5oR/Ij0oueQkr69KPvNFnUxDbCQm28tVHsjOSR9H4yuACaa4aV9h0nPWHFAnJRsKqZVZHrfw7sa
	ZKBYd7w0g8nsjkI0aB5fKUsZ2m1DzOHwFrW5SODcxk6fj2gpflXD9Ir8O8cCGTcG4cyqRbmYnYDIS
	2nIHDRY1meTRPWr1b7PCfTKtDcHxogm2sPKnJObx73FLpOROP/X+Fea3v+nUITNUXhMuFojP5N1Cq
	d7rvH85M5S6OyK1njbZWHbN6H3XvuIq5Op8gv3+YYZWfVYcsoxWpkwMBP4KnHVV6mSJxBbcflKSnc
	eaTxdlWA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZhg0-00000000PJF-30dK;
	Sun, 28 Dec 2025 03:42:40 +0000
Date: Sun, 28 Dec 2025 03:42:40 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com,
	corbet@lwn.net, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	wangkefeng.wang@huawei.com, sunnanyong@huawei.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, lianux.mm@gmail.com
Subject: Re: [PATCH next v2 0/2] THP COW support for private executable file
 mmap
Message-ID: <aVCnMI5gFLTB9UCe@casper.infradead.org>
References: <20251226100337.4171191-1-zhangqilong3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226100337.4171191-1-zhangqilong3@huawei.com>

On Fri, Dec 26, 2025 at 06:03:35PM +0800, Zhang Qilong wrote:
> The MySQL (Ver 8.0.25) test results on AMD are as follows:
> 
> -------------------------------------------------------------------
>                  | Exec mmap Rss(kB)  | Measured tpmC (NewOrders) |
> -----------------|--------------------|---------------------------|
>  base(page COW)  |       32868        |        339686             |
> -----------------|--------------------|---------------------------|
>  exec THP COW    |       43516        |        371324             |
> -------------------------------------------------------------------
> 
> The MySQL using exec THP COW consumes an additional 10648 kB of memory
> but achieves 9.3% performance improvement in the scenario of hotpatch.
> Additionally, another our internal program achieves approximately a 5%
> performance improvement as well.
> 
> As result, using exec THP COW will consume additional memory. The
> additional memory consumption may be negligible for the current system.
> It's necessary to balance the memory consumption with the performance
> impact.

I mean ... you say "negligible", I saay "32% extra".  9% performance
gain is certainly nothing to sneer at (and is consistent with measured
performance gains from using large folios for, eg, kernel compiles).
But wow, that's a lot of extra memory.  My feeling is that we shouldn't
add this functionality, but I'd welcome other opinions.
