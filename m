Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C183537D0;
	Thu, 23 Apr 2026 12:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945895; cv=none; b=TEOn7eG8keJz3wPSL4hFDXJAjBDNwA9rEy0DrY+GXUZuTNcjz1FrsfK5p/8ZHq4BvchHu6aPaviTee8UMA+VFCpaPcAASPQox8lFPieZNeH04RiMGbHMmSCmuNTcRMC695rHKYFLUaUVvkyICoWOd10Gqojl3nz8rIvv/CIFMjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945895; c=relaxed/simple;
	bh=hzJ77ASRkCRaSHSjMn47TW+Kuw1n+IH12iv4QHD1qVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/6wCHUjunA/MsKFz32wjKgzrIzAFL5qPKHLv/ECJA3SlU5DbwabHLQGA7cx55LUPdY3JHPFk5IFRlDQtzhfIAqhG8H/W/zsHk8pH7lL8J6aAikbGNnTwigzA+47z6rqoJE8fj22bme6P/gbCtEdFauU0AzUHZ3USgGxvc5e+T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HAbO1lYx; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HAbO1lYx"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD7DC1C25;
	Thu, 23 Apr 2026 05:04:47 -0700 (PDT)
Received: from [10.164.148.53] (MacBook-Pro.blr.arm.com [10.164.148.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E801C3F7B4;
	Thu, 23 Apr 2026 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776945893; bh=hzJ77ASRkCRaSHSjMn47TW+Kuw1n+IH12iv4QHD1qVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HAbO1lYx2JeLQ3DwNXPZ7qJv+dx1eztGxRc+BfCLCs75zj4s5HbY6wYDO0NwUTOPN
	 jOF/iyBvKKjD74UeIwpsqDDQ4UeVGGgPIqJzmYQ2cnYs9wFuuVaARz8TEq+TQ5Fmky
	 nb3CC2oiEJqaMZcgz8ehDb7wkfOmmAQGXQLvBSFI=
Message-ID: <626b7f63-b165-4e9e-8c18-92cff5aab1df@arm.com>
Date: Thu, 23 Apr 2026 17:34:45 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/mm: clarify that we are not looking for LLM
 generated content
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Matthew Wilcox
 <willy@infradead.org>, Harry Yoo <harry@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21/04/26 2:33 am, David Hildenbrand (Arm) wrote:
> Let's make it clear that we are not looking for LLM generated content
> from contributors not familiar with the details of MM, as it shifts the
> real work onto reviewers.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Acked-by: Dev Jain <dev.jain@arm.com>

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

