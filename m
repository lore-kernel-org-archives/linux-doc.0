Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AD230C608;
	Tue, 23 Jun 2026 20:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246839; cv=none; b=kBiGLCzzsdYP2AOw2nm5Y0y4jw3m+7RVx5ld/1EwkjEUntXfbKIIYfcIfh+R6WpTtYecW+xpbVJAk+guS1Y4ZXwQdrrTrX6qle1zVzP72+e5z01uWpYwuDlN47OApFu1TDc9g1sXS8eqIcuYCfHGE0aYGiR0Grf4t9+R3Csn0+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246839; c=relaxed/simple;
	bh=4E/cUIh6CZzgJi0bpWbF/RLtKfxHqGv4WBOa92moRyg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Iwi7J5Vnqd/LBAD0ejRktseIZkGrIipp4hU3wAZw53f/qyiNOF0MnQcyx6X3FMq4XQs1jKYJ8GmFr7vduTpzCUTuJacLK6wjl4jGICVFdwTOoZ4mA5LpTzZ9hiFw5enSWhuEyO5arwvTgdIciR2hS1zM051PHHmQN2l4lk8Ixxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Lr6EHKpI; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Lr6EHKpI"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DFD0540430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782246838; bh=oXFqv3WrwPUxymqAZP9skrV9Vnyzou4lBSNDl7UsG+o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Lr6EHKpIptcQPAzFmFOD2sCg1R1flG4Lt3v3l2FonAoGGz0OAl2lA1rl+GMdjMai6
	 M4tMsUkCOq/8fbrcNv5pNzkpY/MQz0VCRHBGgHnU73maI95T3mKzHYxQ8b4hld3OQW
	 KRIx321rkKHg/rI5Lev4BJdOQ8fsUW1hFI0rUyA+lC20KptNmdzhU45WeQCCRfoHnW
	 94EY8pffd+RYCO9N8f29gWFFmzfZNqPOmaT7uZ88RPsxKTzDC9E83Anh80zS3yHqhV
	 EY9ms+kPF0TasDShdijw9HyK4wkFsqmLcvSrH1SXPoqJiHcVe0rstGX+4FsDxj6BHb
	 ciG9vO3FSn2VA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DFD0540430;
	Tue, 23 Jun 2026 20:33:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Doehyun Baek <doehyunbaek@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka
 <vbabka@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Doehyun Baek
 <doehyunbaek@gmail.com>
Subject: Re: [PATCH] Docs/driver-api/uio-howto: document mmap_prepare callback
In-Reply-To: <20260622181821.1195257-1-doehyunbaek@gmail.com>
References: <20260622181821.1195257-1-doehyunbaek@gmail.com>
Date: Tue, 23 Jun 2026 14:33:57 -0600
Message-ID: <87ik79ate2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Doehyun Baek <doehyunbaek@gmail.com> writes:

> The UIO howto still documents an mmap callback in struct uio_info.
> That field was replaced by mmap_prepare, which takes a struct
> vm_area_desc.
>
> A UIO driver following the current howto no longer builds because
> struct uio_info has no mmap member. Update the documented callback
> signature and matching text to match the current API.
>
> Fixes: 933f05f58ac6 ("uio: replace deprecated mmap hook with mmap_prepare in uio_info")
> Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
> ---
>  Documentation/driver-api/uio-howto.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/driver-api/uio-howto.rst b/Documentation/driver-api/uio-howto.rst
> index 907ffa3b38f5..c08472dfbcfe 100644
> --- a/Documentation/driver-api/uio-howto.rst
> +++ b/Documentation/driver-api/uio-howto.rst
> @@ -246,10 +246,10 @@ the members are required, others are optional.
>     hardware interrupt number. The flags given here will be used in the
>     call to :c:func:`request_irq()`.
>  
> --  ``int (*mmap)(struct uio_info *info, struct vm_area_struct *vma)``:
> +-  ``int (*mmap_prepare)(struct uio_info *info, struct vm_area_desc *desc)``:
>     Optional. If you need a special :c:func:`mmap()`
>     function, you can set it here. If this pointer is not NULL, your
> -   :c:func:`mmap()` will be called instead of the built-in one.
> +   ``mmap_prepare`` will be called instead of the built-in one.
>  
Applied, thanks.

jon
