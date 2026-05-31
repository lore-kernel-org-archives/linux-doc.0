Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8FB26E706;
	Sun, 31 May 2026 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780243690; cv=none; b=VjHDxLWL1J44NBSBviIOtZMOYKA2UJrsrlcurWgD5Kbu6zV/IMT6mHdmf4s/mxRo77yjOZVXKjnjsmjVU2RFiojTf7OyT3tgWeiaN63JyviaxFQi/gAS9Xi1KcvufbYt9RRhxW1ddfxoHpJY0qICRUDh7DU2/LEur5e20jG1qsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780243690; c=relaxed/simple;
	bh=0D2zIWTiPSZOfNmjXXkUIIfndi7bjVo7+twC3Vl0jCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KPqww3pP6oRYAceVk6zBqSXx3a3SR+iQPqn6qbBqn9V693rBAEHFdOOntHFin2DkKsIMg7N1z4JoNK2UmwI/v8jgPvIs4ibDeiGim0d7EQuq1oREWzhGKO8ayi3tY364DT1vSIIW//bW4ll6vYWcMyCcOjuqp1QOCr86c2pQv0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1FqWovmz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1FqWovmz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=KDhYQ4YmeDGOqVQZfVkK7wOITkoeT+qOT7mrSnoe1Kw=; b=1FqWovmzxxSlyTblEI0/nwFv43
	9pqH3hxy7zijF6V5KRKnHJLtqs4lxNQFJd5hAqen6CuA8O8oELPQfzDBe5B4YVJ8LynE0aHRYmRC9
	34Oe+4Yvs5plaGlSF3QXPiOhg3NIIyKkw/mzgOX63H95+988y88qfq2SAFj0ZTxLLEF9lyMeFZBfN
	shp425TGNvy9TFSeQfh5CoNq7Q+M0M5lLKXQ7q/jd0R0aGtNbqJ/hs+mkw5egnLa1/rx4s0NVIOpc
	fCaWnMzKKcl5u640q2e43mq3xkicTuC91H+toCjiNzfgJzTvjFyMgEWDxt/MwfGgnWlv0HH8LTBsr
	O+tkNMBQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiho-00000009jtf-3ZXt;
	Sun, 31 May 2026 16:08:04 +0000
Message-ID: <347d655d-9cb8-4732-891e-d16c9661e81b@infradead.org>
Date: Sun, 31 May 2026 09:08:03 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs: kernel-parameters: Remove sa1100ir IrDA
 parameter
To: Costa Shulyupin <costa.shul@redhat.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260531135455.4113157-1-costa.shul@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260531135455.4113157-1-costa.shul@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/31/26 6:54 AM, Costa Shulyupin wrote:
> The sa1100ir parameter referenced drivers/net/irda/sa1100_ir.c,
> which was removed along with the entire IrDA stack in commit d64c2a76123f
> ("staging: irda: remove the irda network stack and drivers").
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 4420eb72b378..459ed0d72aeb 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6735,8 +6735,6 @@ Kernel parameters
>  			restrictions other than those given by hardware at the
>  			cost of significant additional memory use for tables.
>  
> -	sa1100ir	[NET]
> -			See drivers/net/irda/sa1100_ir.c.
>  
>  	sched_proxy_exec= [KNL]
>  			Enables or disables "proxy execution" style

-- 
~Randy
