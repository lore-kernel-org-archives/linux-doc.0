Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1699B3382E5;
	Tue, 21 Apr 2026 06:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776753925; cv=none; b=lZBOjaC0wKX7v4p5jzr4GE0dGJVH8I8wLW3iasOgcGRFX1Wbs0t0Ik7YKXvjReWrzgr8Crium3rZnRaVT9ExWOjIk/eoereKbJ/6dAgtWTCW1245J4VDfWZtIdEqT7P2aGD1Q9HXF+h1mQKBV4GX4YwBkXCnEG+hwGDt5ouZha8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776753925; c=relaxed/simple;
	bh=dx6qSz9cAbPLai93tke4yY9+hgGMAcqbUzp/yIBIdeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sd0Gpm3UgHUWwHVdRBXJlT147yrnCPI8PYObNddMt1LvN9QGW6xRGk0ik5FxzHfgBkr4xMVc+wPeQamEhwl1f7i++TOrRnMQr7jXEMvOpCRRNiEIDpGdgxB9xNzuK4lfRx+QVK9RXny+kusTzsjoE+hawX/ptLWtvv0JRDwgYgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZFVCtUb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZFVCtUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2BCC2BCB0;
	Tue, 21 Apr 2026 06:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776753924;
	bh=dx6qSz9cAbPLai93tke4yY9+hgGMAcqbUzp/yIBIdeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZFVCtUbH3qyg4P3hgbHvXgvoZzOL/sYNfbd8x9MZz5vBbk5B9GAsDIvYLyttGStA
	 N8fNTWJAFFrzqgufzVNG2q7RrLB1n4ue4gd/EiaLKebRwiE/qGabSBQzEwo8WH7Eui
	 Wo781Z+f4WLsDgjkm7Xvny7hh2gBxqgCdGIhCmUOcr0GNsy8hsnanEAFCInyVDKWKK
	 7+Cl8Zs9Px+aYflCxCjxJmlhKGeVnp52yDnPU47nRLt7ZLgGrnThVo/ayi5MwClI+y
	 7endUe9ZfsH3U2fRcoIyemegwT+2ryIhSEozG9uJHvKoXn+Z2exhXICRYRF6MAVd1d
	 IqxXjIafvd1dA==
Date: Tue, 21 Apr 2026 09:45:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Matthew Wilcox <willy@infradead.org>, Harry Yoo <harry@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: clarify that we are not looking for LLM
 generated content
Message-ID: <aecc_TTRh1517J7X@kernel.org>
References: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>

On Mon, Apr 20, 2026 at 11:03:16PM +0200, David Hildenbrand (Arm) wrote:
> Let's make it clear that we are not looking for LLM generated content
> from contributors not familiar with the details of MM, as it shifts the
> real work onto reviewers.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  Documentation/mm/index.rst | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
> index 7aa2a8886908..13a79f5d092c 100644
> --- a/Documentation/mm/index.rst
> +++ b/Documentation/mm/index.rst
> @@ -7,6 +7,19 @@ of Linux.  If you are looking for advice on simply allocating memory,
>  see the :ref:`memory_allocation`.  For controlling and tuning guides,
>  see the :doc:`admin guide <../admin-guide/mm/index>`.
>  
> +.. note::
> +
> +  Unfortunately, parts of this guide are still incomplete or missing.
> +  While we appreciate contributions, documentation in this area is hard
> +  to get right and requires a lot of attention to detail.  New contributors
> +  should reach out to the relevant maintainers early.
> +
> +  This guide is expected to reflect reality, which requires contributors
> +  to have a detailed understanding.  Documentation generated with LLMs
> +  by contributors unfamiliar with these details shifts the real work onto
> +  reviewers, which is why such contributions will be rejected without
> +  further comment.
> +
>  .. toctree::
>     :maxdepth: 1
>  
> 
> ---
> base-commit: da6b5aae84beb0917ecb0c9fbc71169d145397ff
> change-id: 20260420-llmdoc-21bf5fadbd6f
> 
> Best regards,
> -- 
> David Hildenbrand (Arm) <david@kernel.org>
> 

-- 
Sincerely yours,
Mike.
