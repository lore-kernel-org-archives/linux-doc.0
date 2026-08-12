Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDA03F484B;
	Wed, 12 Aug 2026 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786525135; cv=none; b=clXTGJb4CGqjCjRyWEi4teL2QfjwF9gzc9kY4khaUw8kyYKgyhblD1bkzyEiXwYC+q0OjrFuSBNFdHAgH4im8HTB50rq1bPdxtUSyTvJ3HlM6OKOkZHGu3i3PfGNvyX20UGDnyqsZh/+tlbqkImtHzqLqd5eLnRFxx2RxM3SDh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786525135; c=relaxed/simple;
	bh=Wh0KA3Ab43Gft7XkMtU2UVjIfzcxtWxFpaBBvXzBFmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAPjNp3SID6aC25echqOWhGhGc7N8k1wTBYGtoKzHeefIithnnEpNJGtl4jV2mY/wo5iVIDojjLfPuMl1C3zkOxv2CdZvPsBEY5omO1ROAG+HgM8sCe7HnuImt1MqHMd7Itrw5gGOExqOWNq2tPw78jqKVBJMFvE414Fx3n7CM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaAm6ZoL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaAm6ZoL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FF41F000E9;
	Wed, 12 Aug 2026 08:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786525134;
	bh=Lv+2Z/1Wduwhy5AzrXisK5gs2st/FQotGoYG6sp0EPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oaAm6ZoL0bGjZNnnDPIJ7BXckZpQ3BmpgPnW5gWbYQfp7gpAkJNt7lLc+JWkrobJn
	 brbcqfuvNBIv9dWGRsvq7NaFzyKYSvtcA2/8a94AHmaMA2JWt+y0hwvPw24TtPQBoC
	 hLPYaqBg2GMJg7oJ5SWcWjj7huO84D6OKabzAxEKGI6uFbYT7oCrAkt1d+FuRG6KhG
	 SDUGkoKUPa8OQhqp3rSW2FAQ8h/H0FGSWNdL/F+eP00BJ6sfSLNVvY3PjdpC9phucQ
	 MX8Bbtq0Ra45++zyGyAZpYMm7RwgR/q+Ve4aMEGj65gnhNnCoCe4f9D6z+txZcM+nU
	 TeJQCS0LT9DXQ==
Date: Wed, 12 Aug 2026 09:58:33 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Song Hu <husong@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org, 
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, usama.arif@linux.dev, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Docs/ABI: document
 transparent_hugepage/shrink_underused
Message-ID: <anw0mM2YVPRRM2Ff@lucifer>
References: <20260812080313.330413-1-husong@kylinos.cn>
 <20260812080313.330413-2-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812080313.330413-2-husong@kylinos.cn>

Please don't send patch series like this - we really require a cover letter if
patch count > 1, and every patch should reply to the cover letter.

On Wed, Aug 12, 2026 at 04:03:12PM +0800, Song Hu wrote:
> The shrink_underused knob was added in commit 81d3ff3c6f76 ("mm: add
> sysfs entry to disable splitting underused THPs") but is missing from
> Documentation/ABI/testing/sysfs-kernel-mm-transparent-hugepage, although
> transhuge.rst already documents it.  Add the ABI entry.

Hmm what even is this file? :) What is the contract on this file?

>
> Signed-off-by: Song Hu <husong@kylinos.cn>
> ---
>  .../ABI/testing/sysfs-kernel-mm-transparent-hugepage   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-transparent-hugepage b/Documentation/ABI/testing/sysfs-kernel-mm-transparent-hugepage
> index 7bfbb9cc2c11..bbdfae2c0caa 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-mm-transparent-hugepage
> +++ b/Documentation/ABI/testing/sysfs-kernel-mm-transparent-hugepage
> @@ -10,9 +10,19 @@ Description:
>  			- hpage_pmd_size
>  			- khugepaged
>  			- shmem_enabled
> +			- shrink_underused

I mean I guess fine for consistency.

>  			- use_zero_page
>  			- subdirectories of the form hugepages-<size>kB, where <size>
>  			  is the page size of the hugepages supported by the kernel/CPU
>  			  combination.

But we already handwave literally everything else here....


>
>  		See Documentation/admin-guide/mm/transhuge.rst for details.
> +
> +What:		/sys/kernel/mm/transparent_hugepage/shrink_underused
> +Date:		Sep 2024
> +Contact:	Linux memory management mailing list <linux-mm@kvack.org>
> +Description:	Reading and writing this file controls whether khugepaged
> +		splits underused transparent huge pages (THPs) under memory
> +		pressure.  A THP is considered underused when its number of
> +		zero-filled pages is above max_ptes_none.  Enabled by default;
> +		writing 0 disables the splitting and 1 enables it.

Nothing else is documented in this file so why is this getting special
treatment? And why is it backdated to Sep 2024?...

Drop it please.

> --
> 2.43.0
>

--
Cheers, Lorenzo
