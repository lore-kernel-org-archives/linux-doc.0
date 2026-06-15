Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646D92E424F
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 22:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563011; cv=none; b=LIw/PcldDS5OPaMRkBxOd248broeEZ9Pvst4Pzo1sWJ+l8lnFLLwqMIV4pewzYZQq718O8tRaW2lLjuAkRFmwAp5ZlcLavwsZrN3r1RIHFaJktmOYuTruzjaQvGCoa3GMS38Hsq4ElXlvbAAbxSeIz6Nd0sBEVIQPD/wM9WUVrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563011; c=relaxed/simple;
	bh=4r4YexS4fbX3hczBkGthwosRFlrMipjfpcv2A2X5mmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/NqXQaxaEZlImzqFpq1nFO0flCN+CL3DGv71Ya5h4Ioq0SztRyWDArXa7TGb+83pbRJ6ror/dCMWZ0y6c+XLKJdV4ubf2u0lwipGVkCJt+qyu8/bgETr0YSwGTU0rf6ryAaDrmchH6DMSHQRymcUVh5rKJdueWoM4RLsIxnIAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=F5udQ6dJ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="F5udQ6dJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZQwXW0jvpjDNSLaNZjbX0DZaCHLyNpZXPd1DqAvn3xU=; b=F5udQ6dJg/OrfFZETq+XqX12pY
	UXNY+m7a6do4EDnMlzTfIKfFRvNV9EmgwVk48vE+OoOyYV/qu2bpwrGYISuQdMf6choTmk103Hxtt
	2Mj6cCD0S5FO5V817gSh7Q+ZWsqU1wFd06gE2/vw1eUo2FcO3PeKfoRenuMcGowoBtFHc7JT29KUU
	Ai06D8H8V8cacHjaF/kx4Wb50V4PtAR0eHLZT4HhelMcNoELjU7q8e7ATaEeLbFR9mWpmtG30x8At
	6q9pWJslheyPqvX++7a/iJp0zcXfaXByrFMSnfsGKTNkrnqnhjasbbJ8i+4tUIUSW/yVyuxcl762N
	hVc+n7mg==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZFv7-00000009cH1-431H;
	Mon, 15 Jun 2026 22:36:42 +0000
Date: Mon, 15 Jun 2026 23:36:41 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2] docs/mm: describe current criteria for enabling split
 page table lock for PTE tables
Message-ID: <ajB-ebLDYB-pX-4h@casper.infradead.org>
References: <20260615222829.17420-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615222829.17420-1-enelsonmoore@gmail.com>

On Mon, Jun 15, 2026 at 03:28:29PM -0700, Ethan Nelson-Moore wrote:
> -Split page table lock for PTE tables is enabled compile-time if
> -CONFIG_SPLIT_PTLOCK_CPUS (usually 4) is less or equal to NR_CPUS.
> +Split page table lock for PTE tables is enabled compile-time (via

is enabled _at_ compile time?

> +CONFIG_SPLIT_PTE_PTLOCKS) if NR_CPUS is greater than or equal to 4 and an
> +MMU is being used. However, it is not supported on some architectures.
>  If split lock is disabled, all tables are guarded by mm->page_table_lock.
>  
>  Split page table lock for PMD tables is enabled, if it's enabled for PTE
> -- 
> 2.43.0
> 
> 
