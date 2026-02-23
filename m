Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B22D33B95D;
	Mon, 23 Feb 2026 18:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870595; cv=none; b=ErzFYg8IOTTMvcCx++UN5veUmXn+n/PsV47URu6fomtEgX80lLx/cC5l0Xgz0g26A2IQfZjFYsEICJXWC0TTrEo9Nk1G929belklEyi7IMPGwPoyS3LFX+JxojzNaRikQF/0haO0/Nn6MOcqzD2chO14/ASkE2x6NaCybNZ8nJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870595; c=relaxed/simple;
	bh=WjniMxY7ffDU/faRmempSMzEAYczfPNIjU+1WG+nyq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAV9PEqfNxeVtHmp94bzviP7NGdfU7uznblmdPf9YI6SWpj0ZUwMLhILnlT6zvHxJUQ960Wj2mIkrCeIkaEB9prrj6SLUI6XetQnklrunHX4vJSwNMQljXF4L9/kCp6XgtxvTLNjWduGFkl/4HX337mev13Qo27jT6N7nl5DCnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Spr+s1qL; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Spr+s1qL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=92r6PfU1Qk5a3qUnsJ0bAd5+x15hqcIX5R4iKteY2Y8=; b=Spr+s1qLyRWvBbjO7Q8InQNHov
	v5YISRtP/9Kfnif3Fkmaywyh9oqFYYO1DCqR0Y7g731Z+2lUPpl/sWtX1GvCgrPlGgoGnVc8Ff3J6
	HXmzoho4Lk3WX3xhvkdCYAl52utunYGnJxI+Z4wOjU7u8R02SbCgOceGU1ROJwlEjN7Cf2OPInfeU
	kbyQBnsgq7fMKcinghnqNTRChK+ZPIA3lJG9ABF3e4u0U1yFz9uT1+/zr+XhRalyYiQAjh4zWE02i
	5jhZUIcmAJ+lbtrSvd5PniN+XlTaJRTZ7Fy8qovKWXtq6dr5hO4EsVtLXbHIuGiJj6IGYY76Ey2au
	ppsXRoVg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaTw-00000000qxq-1Lz0;
	Mon, 23 Feb 2026 18:16:32 +0000
Message-ID: <03358c3b-7a41-479c-83df-d5fab5d2c2c6@infradead.org>
Date: Mon, 23 Feb 2026 10:16:31 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: sysctl: Add documentation for crypto and debug
 sysctls
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260223170251.10540-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260223170251.10540-1-chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/23/26 9:02 AM, Shubham Chakraborty wrote:
> The /proc/sys/crypto and /proc/sys/debug directories lacked
> documentation in the admin-guide. Add RST files covering
> fips_enabled, fips_name, fips_version, exception-trace, and
> kprobes-optimization sysctls.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

I would change a couple of things below, but it's not worth
doing another version just for this.

> ---
>  Documentation/admin-guide/sysctl/crypto.rst | 49 +++++++++++++++++++
>  Documentation/admin-guide/sysctl/debug.rst  | 53 +++++++++++++++++++++
>  Documentation/admin-guide/sysctl/index.rst  |  6 ++-
>  3 files changed, 106 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/admin-guide/sysctl/crypto.rst
>  create mode 100644 Documentation/admin-guide/sysctl/debug.rst
> 
> diff --git a/Documentation/admin-guide/sysctl/crypto.rst b/Documentation/admin-guide/sysctl/crypto.rst
> new file mode 100644
> index 000000000..a4c2e5ed4
> --- /dev/null
> +++ b/Documentation/admin-guide/sysctl/crypto.rst
> @@ -0,0 +1,49 @@
> +=================
> +/proc/sys/crypto/
> +=================
> +
> +Currently, these files might (depending on your configuration)

Drop "Currently,". That's what we try to document (even though
files get of out date easily and quickly).
Besides, having 3 (what are they? conditionals; caveats;
exceptions?) qualifiers in one sentence could be too much.
(I'm referring to: Currently, might, depending).

> +show up in ``/proc/sys/crypto/``:
> +
> +.. contents:: :local:
> +
> +fips_enabled
> +============


> diff --git a/Documentation/admin-guide/sysctl/debug.rst b/Documentation/admin-guide/sysctl/debug.rst
> new file mode 100644
> index 000000000..a836c091d
> --- /dev/null
> +++ b/Documentation/admin-guide/sysctl/debug.rst
> @@ -0,0 +1,53 @@
> +================
> +/proc/sys/debug/
> +================
> +
> +Currently, these files might (depending on your configuration)
> +show up in ``/proc/sys/debug/``:

Same comment for "Currently," here.

> +
> +.. contents:: :local:
> +
> +exception-trace
> +===============

-- 
~Randy
