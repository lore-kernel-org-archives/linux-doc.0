Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D8B482EB;
	Mon, 22 Dec 2025 22:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766442238; cv=none; b=UrGzHS7kjb8g5LyqPNOsPi1Z2wBBoiw/gW9M3pEovy5wNMXIlBXMKKjVsZokSn2hYDAqHqxBMC2imQMtZAbu+WAiZachwVbYM/I0GkU/wlR+/xaLoW2LwjG68FJzb8ryF2bdFdnnslLzrZ2eKn26oetVT/bOoVhzbFZH6lAKVfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766442238; c=relaxed/simple;
	bh=G2q3tFVw3jM3bLGEedAR+CXYy8TWOh0ghaMlPTwt18I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HT1cWlCR4GX7NT884Ea3jVdwaEL5ZHYihEF2lM18sKIEQEYYiyuCWFCYEe3hDLuks+8tPumszHqFWyfYKbRipG9etXRGz16PjbZBUREbP+QPCGVuXAoCvhpbASm6GF0keyqpNUhVP2w/eiEJHSlOVCzrNnU1GIYF4k/1mbAFaic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bEWqIc+b; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bEWqIc+b"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 208294040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766442236; bh=YZndtjFVmDjPYoXXRznMxawPfgKcpRWQr9W88SxOwX0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bEWqIc+by0UMaPCC+JGrNJhz5dXXoq/oiCsqaHQlJF3btRzwU6tmUYISXYVIVsa8t
	 GpgVuRwn6BZWo43wa87aTARYE+kgjoqVVYTjXxgf2UMAmrHw1LfRsdzcHuBqCaGy24
	 dlH7j+G0SlDFnK1byqGUiKYFDnWM/3OCOsC/QwOFZfUqstlUopGC6HbdDPyjb5yM0B
	 YZsgxo1K3kqFTCrwlmFde/VkPaK2tCBiiYcOCl9+8nczddHjUqn7W7wxHWy3E8pbkT
	 j84nvNoq/fpemAQlZllc9AbZpJUTsPK4hNztyqK0pVfW1YgO4+Um/JSqK8fTrKvbmG
	 D45sIzwBiUTvA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 208294040B;
	Mon, 22 Dec 2025 22:23:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Marc Herbert <marc.herbert@linux.intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Marc Herbert <marc.herbert@linux.intel.com>
Subject: Re: [PATCH] docs: make kptr_restrict and hash_pointers reference
 each other
In-Reply-To: <20251205-doc-hash-ptr-v1-1-573966cfa404@linux.intel.com>
References: <20251205-doc-hash-ptr-v1-1-573966cfa404@linux.intel.com>
Date: Mon, 22 Dec 2025 15:23:55 -0700
Message-ID: <87ldiuyx38.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Marc Herbert <marc.herbert@linux.intel.com> writes:

> vsprintf.c uses a mix of the `kernel.kptr_restrict` sysctl and the
> `hash_pointers` boot param to control pointer hashing. But that wasn't
> possible to tell without looking at the source code.
>
> They have a different focus and purpose. To avoid wasting the time of
> users trying to use one instead of the other, simply have them reference
> each other in the Documentation.
>
> Signed-off-by: Marc Herbert <marc.herbert@linux.intel.com>
> ---
> (please just go ahead with any minor corrections; I mean do not ask
> for my opinion)
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  Documentation/admin-guide/sysctl/kernel.rst     | 2 ++
>  2 files changed, 5 insertions(+)

This one doesn't apply to docs-next; any chance I could get a respin?

Thanks,

jon
