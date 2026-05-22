Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015563A5426;
	Fri, 22 May 2026 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453793; cv=none; b=GxeINeXTBMIQiKgG3YvhdxDpAH12QoBC+qz9Dusdk/sDH3BVvVlsWZTgz3/qPXLC7Y9LShuaW1XjSAcSsqPsoI32Hr9r4Qi/NNAkaR4VoooBjKzpu2FkEkqM8te2spGKpjx5h3wxqVQnmTP3i3E7PF+M+ttgQreNuFe52MZRSvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453793; c=relaxed/simple;
	bh=xGpSnQ4KGIJrikxISEZEDfH3h3HpjmUUhPb/oJHlLNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnkY/J5Z0jC+qm97rPdzLBsoyH/7xluw3McbW/38Fe7YE+IdR6Nx8EqwaTDvH56syQiRRq6YL+OYzZhJ263pvVVTqUP6fs96Q8BSonUkApjGsGWEpmKafnKkKprngeAsOrqTxCCsOmJ2B4DZSseRnu7m5xMhPmMtRvgBXpgHSK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkEWvCng; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkEWvCng"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150711F000E9;
	Fri, 22 May 2026 12:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779453789;
	bh=QxOgQXzaZASXcVJgI8Qq11mQsZZNFHADvivKSV/ngbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MkEWvCngWip/LktaFv9KNDt/vDGhDOpNtHPA0zVWH5rq5WIvDSeDaDE9KlX5ykDeM
	 6QHRqYrBetVs1yI/52zyIEgWSupsL1cV1nRS4YJN17XA4SfcePcDmMPpGCBlooIF7U
	 SmoirnvLLZRY3F0x/6Qce6Xms7Y0wZ/6G26Ki9Nv4xQYSZ7T9PpA6m4X4g0yTw26+7
	 R8K0gEqKVL9szqiIbHm93mlHLLvbf132T8ir/w5XnjlgV+j6DqAox6vTjNoPCVhWYd
	 M4XmqufW7J3jy/KktGhqsRPyzS5k0pHYdLHQuCF2OuIR8B+aGSTOF7+ITKUKYnAMQm
	 lc8p4lTVhl/Og==
Date: Fri, 22 May 2026 13:43:01 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R . Howlett" <liam@infradead.org>, 
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH mm-new] Documentation/admin-guide/mm: Fix typos in
 transhuge.rst
Message-ID: <ahBPP__PGXICBvVL@lucifer>
References: <20260520051751.74396-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520051751.74396-1-leon.hwang@linux.dev>

On Wed, May 20, 2026 at 01:17:51PM +0800, Leon Hwang wrote:
> Fix these two typos:
>
> 1. approporiately -> appropriately
> 2. presure -> pressure
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>

LGTM, so:

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

> ---
>  Documentation/admin-guide/mm/transhuge.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> index fc0127a36ef6..78a1b341a3b5 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
> @@ -57,7 +57,7 @@ prominent because the size of each page isn't as huge as the PMD-sized
>  variant and there is less memory to clear in each page fault. Some
>  architectures also employ TLB compression mechanisms to squeeze more
>  entries in when a set of PTEs are virtually and physically contiguous
> -and approporiately aligned. In this case, TLB misses will occur less
> +and appropriately aligned. In this case, TLB misses will occur less
>  often.
>
>  THP can be enabled system wide or restricted to certain tasks or even
> @@ -211,7 +211,7 @@ PMD-mappable transparent hugepage::
>  	cat /sys/kernel/mm/transparent_hugepage/hpage_pmd_size
>
>  All THPs at fault and collapse time will be added to _deferred_list,
> -and will therefore be split under memory presure if they are considered
> +and will therefore be split under memory pressure if they are considered
>  "underused". A THP is underused if the number of zero-filled pages in
>  the THP is above max_ptes_none (see below). It is possible to disable
>  this behaviour by writing 0 to shrink_underused, and enable it by writing
> --
> 2.54.0
>
