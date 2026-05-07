Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE98C36AF6;
	Thu,  7 May 2026 03:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778124268; cv=none; b=nolE6eLnSLbGD3hgE2pv+f0rfBvaYb8jP1cE3erfK4dT+ScZ3Rzfe2eej+dVj/FgoxDVfUfasfyY3RlRnE+O7sDgeQQca9zmM50hFeGXV3XUIOxgB/IJ1ILQS6hGRX/iLlA/p1z605ZP+Y7CvHrOYqu+1Sg1qdD2Xwpp3WrbWK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778124268; c=relaxed/simple;
	bh=A/PB+UZcY9w79DUZC7gIO1TLqtLUzy5tvK8bqE0PQ+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlWzh2p/C6EY8mAvxENISX+6S6YkbOyuIKxyAkd7cwkdi5E+5WvvN2hc2QdCQYMMJI8INbPb3o9cxHZpW+kd+dpRygOKGYB05wdWETxSOOxvPqCCNpLTY810nV5xCLXlpYVMRbOmrQo1s67VPjFvdS8Txawiw8M9TP2KPWIg5V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aNHs7Gpg; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aNHs7Gpg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uosM+lXd9uy3S524rPCNXAcNFz9sYtM1V3K+35pNSWY=; b=aNHs7Gpg+8TMfkMF/G4/YKqYj9
	aJk6/6cy1rR91AC/Fu5mg1mR6A7idk6YunVP9Lw1zlSZMk6PZEHOjVU0UTFOyDZkaaLBOGdbulE3T
	sxNaX64fI2A1jVDCm6uHZdIT2c8C4mWUZ0KI4O5PPvtgnCOLqkVs4fpUDkxd64SXBDFLH8A6VATyz
	81aw8N76AIuEeWH1RMOVFOE4VohAdV8BpyTVmj9X+Jb5O8lkuXevnmRCKdTeR+AfWRz3IFNoysAEQ
	8/K9YcHmsJkmP1lBxj1OkeXFbtDPabeo+dBzNPEocSGuytEea8zPBCjVbHDLj/T/rIa6IBz+QqGzG
	YPAiknig==;
Received: from [213.147.98.98] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKpLZ-00000002csG-1oyb;
	Thu, 07 May 2026 03:24:21 +0000
Date: Thu, 7 May 2026 05:24:11 +0200
From: "Liam R. Howlett" <liam@infradead.org>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 2/2] Documentation: maple_tree: Clarify behavior when
 using reserved values
Message-ID: <5qnwgdcxqat2zo5qe7qy63xm5awo5l4lkdkf4umbj3sl2ct5sj@v5c3szzdbbq3>
References: <20260504165746.1422057-1-weilin.chang@arm.com>
 <20260504165746.1422057-3-weilin.chang@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504165746.1422057-3-weilin.chang@arm.com>

On 26/05/04 05:57PM, Wei-Lin Chang wrote:
> It doesn't matter whether the normal or the advanced API is used if the
> user uses xa_{mk, to}_value when storing and retrieving the values. Just
> specify that the normal API blocks usages of reserved values while the
> advanced API does not.

Your comment above is incorrect.

The normal API will filter out reserved values on return while the
advanced API will return whatever is stored there regardless of the
value.

Meaning, if you store a reserved value with the advanced API, it will
not be returned by the normal API.

> 
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> ---
>  Documentation/core-api/maple_tree.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/core-api/maple_tree.rst b/Documentation/core-api/maple_tree.rst
> index 87020a30ba69..e5ccafb84804 100644
> --- a/Documentation/core-api/maple_tree.rst
> +++ b/Documentation/core-api/maple_tree.rst
> @@ -30,9 +30,9 @@ Tree reserves values with the bottom two bits set to '10' which are below 4096
>  (ie 2, 6, 10 .. 4094) for internal use.  If the entries may use reserved
>  entries then the users can convert the entries using xa_mk_value() and convert
>  them back by calling xa_to_value().  Note that xa_{mk, to}_value() bit shifts
> -the given data, so the top bit will be lost.  If the user needs to use a
> -reserved value, then the user can convert the value when using the
> -:ref:`maple-tree-advanced-api`, but are blocked by the normal API.
> +the given data, so the top bit will be lost.  Usage of reserved values is
> +blocked by the normal API, and will cause undefined behavior if used with the
> +:ref:`maple-tree-advanced-api`.

Which behaviour is undefined?

>  
>  The Maple Tree can also be configured to support searching for a gap of a given
>  size (or larger).
> -- 
> 2.43.0
> 
> 
> -- 
> maple-tree mailing list
> maple-tree@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/maple-tree
