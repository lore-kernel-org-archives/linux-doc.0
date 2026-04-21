Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24D7382F3A;
	Tue, 21 Apr 2026 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760001; cv=none; b=JdmzCZ4/qEmXDIdq8gHDk+p3OTRlxK0bb4ibxx46fvB8R//ussMw8TvcegP9T9+NGn1u9mw8oonrgpwmOUFjukw6S2InzxKuXFFW7UUAItFcUGrkSqAZPZTv61eghqowuG4s+WcoRQ2OxyEGiQ6/MdmX0axYRFTdqOjc6tI51M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760001; c=relaxed/simple;
	bh=i5m2CUR8QP6u+qST5Zf+eew7jsrxDzkoBpW3jeL85T4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYVPdDxoZwH3H2j1fd+WAhilu5idf6efEav/FhMGHGHZMYosqupTOSaDEv1sZxMFdm1JJo7soEm6CJSxQMplsC+NrgSXxiJQDg/O3YshUm3qGOzUX8arSbXcBUxCPmt4HJnwKmp9cqv8F6Ryb5GeaWi1fX3tYBmp7VfscVZv0IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4YWv8EV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4YWv8EV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1DA1C2BCB5;
	Tue, 21 Apr 2026 08:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776760001;
	bh=i5m2CUR8QP6u+qST5Zf+eew7jsrxDzkoBpW3jeL85T4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C4YWv8EVkYKxvs+uYNI7RisIRb0Ryh2Mc/Ha4ptpqfMnOKfdzwr+vvghjhXTF5B/E
	 /myt1Gg3WpjTQVouyK6ugDFu9ZZJRH/Cm4aPVpT1Xq5nbbACR1lEWiv65vTUP5cCZJ
	 RC6xtEk7s4XjsOPaLRt50/4EWDnaU3UDAYO1LkSTH7HHwtawIfmN/9tffnaDLYdFuw
	 1SRBMgD6/9VIZhapfC1YM8uxLZc9gxubUXUySGm1Q8avaVCixc2EyVVqM9emQu0uxg
	 xHXZ5qIu01kJlqDMN3etpBIW2TH+nlBKnqJVj5PfzV/hpmJdG4r/WQcGQ5Vmm7HHaq
	 QDbj+vE5aufaA==
Message-ID: <15109c59-3339-4ef1-8528-7735e674255d@kernel.org>
Date: Tue, 21 Apr 2026 10:26:37 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/mm: clarify that we are not looking for LLM
 generated content
Content-Language: en-US
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Matthew Wilcox <willy@infradead.org>, Harry Yoo <harry@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/20/26 23:03, David Hildenbrand (Arm) wrote:
> Let's make it clear that we are not looking for LLM generated content
> from contributors not familiar with the details of MM, as it shifts the
> real work onto reviewers.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Thanks!

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

