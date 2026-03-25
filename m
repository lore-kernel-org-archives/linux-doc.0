Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01C41F4168;
	Wed, 25 Mar 2026 00:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774399863; cv=none; b=oyGUWKo4lFu8Gfg7/bliMUeoRZnLSQQ7SnBO5Wr4NWbpAgoTCxgs1aarHDZT3SkDfy8SEAlr2KNlqtOioYccojlx7jym4+ONkeE4DHgpuuNCXzYceoguhT4nLx3k8/xncLAEUcV/uaOQNKmgIrid7P23YHZuqgViUUnKt4k0HSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774399863; c=relaxed/simple;
	bh=cdJh60EixA6VF9vPiZhuIqhskQHWFHFaay/22zdzY40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5wW5FPkdcnevAkM1O2EmJNpskViL/TGi1TyTNXrLyr8Ky9Z/y5QLirR1UVoLAvsstQ9KQ5TBp4iHChm0EZroLdp6a4TCXzTtXSLEep3f132DCzXoGrq7MPSaPgr6IaaC5i6c9nUKgYUTZanKLjYOn0GJAvII2+Lb19r8VMwUuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Bh84yj+P; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Bh84yj+P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=WSWIm5AJ5Vu+8BygKTZB3MYp/PeXyV77sGrrzyLCqcg=; b=Bh84yj+P3DnebUccZNYqDGlQln
	a3y5s6nxRHGCVHJ/Pd3B+y/ySvp5FU+MZWQkZPir7NxArE+Wzc1/wp0oa9IqTwS6nVR3gcwnjgAR3
	meYFzdPM0JJ1FenS1yVxPNYLy7z5wsDwG1G+0HYXVHS4Cyfl9fhUheIaPm/gBLVhTIV4bzQ6McGZg
	THPHDrv/bBZwQcQCYG2HUr3XX3RTFVzuLgLH0pXqariQa1bkYO6KBqvRbhBVsAoyp32QE2p61LbcE
	Bxm+hWYizwU0/js6AodU1A2UaUvblaSnfm0Nq2Qf1XZnohmarRxqTxVg+aRGUuEKGQXpTXuBYVFAR
	yt7+ngUg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5CST-00000002QKj-0Or4;
	Wed, 25 Mar 2026 00:50:53 +0000
Message-ID: <15756fa8-e9b0-4787-90e6-4a8e3a3039e9@infradead.org>
Date: Tue, 24 Mar 2026 17:50:51 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] docs: allow long links to wrap per character to
 prevent page overflow
To: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
References: <20260321180841.10166-1-rito@ritovision.com>
 <20260323152428.30483-1-rito@ritovision.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260323152428.30483-1-rito@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/23/26 8:24 AM, Rito Rhymes wrote:
> Some documentation pages contain long link text without natural
> break points, which can force page-wide horizontal scroll overflow
> on small screens.
> 
> Use overflow-wrap: anywhere for anchor text in the docs stylesheet so
> links can wrap per character as a fallback when normal word boundaries
> are unavailable.
> 
> Examples:
>   https://docs.kernel.org/6.15/firmware-guide/acpi/non-d0-probe.html
>   https://docs.kernel.org/6.15/arch/x86/earlyprintk.html
> 
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> Assisted-by: Codex:GPT-5.4

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

> ---
> v3: add latest public versioned URL examples to the patchlog
> 
>  Documentation/sphinx-static/custom.css | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index db24f4344..4ec617d40 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -149,6 +149,11 @@ div.language-selection ul li:hover {
>      background: #dddddd;
>  }
>  
> +/* Let long link text wrap instead of forcing overflow. */
> +a {
> +    overflow-wrap: anywhere;
> +}
> +
>  /* Make xrefs more universally visible */
>  a.reference, a.reference:hover {
>      border-bottom: none;

-- 
~Randy
