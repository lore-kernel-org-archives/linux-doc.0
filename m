Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A148439CCF9;
	Sat, 22 Aug 2026 17:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787419520; cv=none; b=BiCVUIEyhZwExa9qdoGQUE23Fq8RZhiHIxjQcCqvDKHsjcR5nMpA80qtxVeeBb76l3k2m1H4kOPhDCV78YJSQzU1RKSE/hkvF1bo++M81iwmAm5VIdflRDKRHgaI/JjQoPK59ngKwIHt7LgXSQK7JyR8HGKl3yjUsy5yy4bnj4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787419520; c=relaxed/simple;
	bh=/B845rhwmLlHYeWWjJHgE1lPP+pFyuMyYNEOO5grnYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TN6Sa6Vo3G25Bf2l4zM3XGj4HaotBOmtZQjgOzQHMFZw5Mvpp82snLu9RUICRLhHIWiVvyiozwXA3b0Hi1wvgZA/N+idhZ6wBe6GepBgvZGmVqXKSWRBBfR11KLb+vM6KDheZEotVFcuvWnZbZ0YAriNyXt3F/rPhhScyFhrY7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=E5pEpoIX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E5pEpoIX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=3G0DUzDF+UtPefcaeWHh2d5T+RPRrOvdjkmMKCtIHT8=; b=E5pEpoIXxLH0AAc9aK21PpkmlT
	5bsGkvbtYqrGb71BjaqohT5hm+xf1PKzpj7okG5wWLZlO2kcaU8LqN3zCIqXTse3wd08ZdnjrlCoi
	mScjNy0hggRVRiPy9iMPdkbHaOVUcdgiUOREs2Rs1e+QtceBOlpOJcdrdjVPpq7PUlR0tb0KvW4kD
	+OoXAJa1Cv5YYdGb2B+KfZIgmgy2gVWl6e7yj3OXufLUluIZnU9IDqcmQR4wwIJt+VmMqzJx0cdXu
	vX+fmp4js2CzpXFDlxBjklrzVNBH4EScxJTgNGrASPCfuKSDMTGbZB6WtuksyTQu6y6vuiMniQoaL
	iusYjGIg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxpT2-0000000EghI-2t8v;
	Sat, 22 Aug 2026 17:25:16 +0000
Message-ID: <2c4fc25e-e38e-483c-ad75-1aa421bd7bb1@infradead.org>
Date: Sat, 22 Aug 2026 10:25:15 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] docs: cpu_hotplug: Fix multi-instance removal calls
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner
 <tglx@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260822121651.1559-1-kmehltretter@gmail.com>
 <20260822121651.1559-2-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260822121651.1559-2-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/22/26 5:16 AM, Karl Mehltretter wrote:
> The function is named cpuhp_state_remove_instance(), not
> cpuhp_remove_instance().
> 
> Fixes: c9871c800f65 ("Documentation: core-api/cpuhotplug: Rewrite the API section")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/core-api/cpu_hotplug.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
> index 6de26d1c6a9ad..f8b3f59a3d5f7 100644
> --- a/Documentation/core-api/cpu_hotplug.rst
> +++ b/Documentation/core-api/cpu_hotplug.rst
> @@ -607,9 +607,9 @@ ONLINE section for notifications on online and offline operation::
>     if (ret)
>          return ret;
>     ....
> -   cpuhp_remove_instance(state, &inst1->node);
> +   cpuhp_state_remove_instance(state, &inst1->node);
>     ....
> -   cpuhp_remove_instance(state, &inst2->node);
> +   cpuhp_state_remove_instance(state, &inst2->node);
>     ....
>     cpuhp_remove_multi_state(state);
>  

-- 
~Randy
