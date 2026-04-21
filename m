Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4745C382F35;
	Tue, 21 Apr 2026 07:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776757133; cv=none; b=lU5xKXq/P8+tL9XzIEg+oEKWKtexKsdZcBoIfkQKNtAbUjG1P7xCb7Y3uVDV8nxbPdjr7B/kSdPx9RhjJhGd6gSnnzjrZYkoyO9v7PHfcLrUUe9VRS/BCtmB7FUBRLxrSvj55/Hgo8SqAgmhLxhUfWyWr27g4a6bhil64n5t6WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776757133; c=relaxed/simple;
	bh=HOqa5XPljAtYrq4q19EOWPa+YuGMA5Hz1ufgw3AIi1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYoSDWfcM537/ykOu0JA0CPG7liM44nKIeCasPECuRkVCmYj515AaUSMfsKdTLMgFkbLsSvsGzL9im3UX/rLUxfgLG9R28JqBHh6cHzPIIlK9hOmm766/Xz3yJuCVbYJrcYE4Ln8Wda6McV1WR8jzQ/XhYHKJ7XQwelI7oKbIVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFA1h/dz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFA1h/dz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7595C2BCB5;
	Tue, 21 Apr 2026 07:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776757132;
	bh=HOqa5XPljAtYrq4q19EOWPa+YuGMA5Hz1ufgw3AIi1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IFA1h/dzV0RBcJx4PXA4CELRa0OQGXDRkqcUCfMgQzFiTJov9bcGWulZl5O6n1KOI
	 9mdnidumTxrxDukqN4qDlLGxq2cvZfcqYp4rdKefh4Du3Nysqk2ZHru5Z7FQ6fX5Xv
	 5rcrM5hz+8r3vmKS/Lfvj0v7ZjZPIkcU6s7tj2m4FYUkGV86TkBOR2QsbIWsYdoXGa
	 ZwnjluIWkMwysyBQZPKG+ew1JLpQnJA558hJn7OHO0ZuYEZOdpImRoXEyYKcI6iUnQ
	 P73pUEEpGpJiWJf+tlgF+0N91Elrk9ImIBvffEwMuQ9oYQb5P41LTzHhWKBtKgA5po
	 H/gvzog5XQt6w==
Date: Tue, 21 Apr 2026 08:38:47 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Harry Yoo <harry@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: clarify that we are not looking for LLM
 generated content
Message-ID: <aecpRyCcT2iKgyrl@lucifer>
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

LGTM to me, I think it's important we clear this up. So:

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

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
