Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D42E22A4F4;
	Wed, 19 Nov 2025 21:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763587793; cv=none; b=atg8np6JEuOP7DGnj7V/waYIoutHzebujRvIRp71aeAxiXeJuUMjxHIFeef2ss1Q5DY5pBCbAhYugDREAzIkZsg9nXnvpxlhnbMEpt798SssX4nG4WjWdiFJb5WCMsEtXo/M9z8FpMlllChOwsTk9FKMEGonYtTqCnieFJOOpaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763587793; c=relaxed/simple;
	bh=6phd6QhVPBojxK3XnzQzQQ2uqUlejXLGnr68XhXf3kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYu2OAB8btyKxzI1XzmFuLkELz690AFDiQEN6M3CvVBaGZybdQHt8wsgVViTwfeH50rv9gfDIeiNrxV4U5UNatMJS1zea5crTLe/JWA7ixqT/LJqfEZnZ/+q97oBdA+3PbS7p8XcZCabz1RBeTwBTCroUf0KF1H/0nqKC/1sJoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=owuFPoGq; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="owuFPoGq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=266JOR55aPR8LuiM2HjmOMQWxO1A/hMjoBGJjHYSfjg=; b=owuFPoGqWu1VTsYbYuFRC4tGDE
	59dpUB0K5JWXFS9fWHRJc1pLMlYnnCZ5nVa9Txz80AWSsoKCUv1ytRJRz7naprTo3hSAz6dGiDqml
	/PmPj+5Nz+J3Teec76MAFt02llpp5p+Kt/5cBev/YxeBDpK/ExWMtZpUQ6hWkViM2COIfIN3+DB6M
	a8H+/ILHBxk6l+5af6zqyCsScxs25t5xJ9BRNROi7i9xzjdDzaxpXR1XLnGWvFqmPJDFgGFYP5juP
	n/6wu0xZkv3EiI+90tQFM8D2FvGIDnn345AVTusGxj99oyd9c9IWNZxHEzmvNHCVjrEcYKZT3z5aC
	4hfJgrUA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLpkN-00000005kXX-0kt7;
	Wed, 19 Nov 2025 21:29:51 +0000
Message-ID: <1bccfd52-28f8-4688-9746-cd130a814011@infradead.org>
Date: Wed, 19 Nov 2025 13:29:50 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Documentation/admin-guide: fix typo and comment in
 cscope example
To: Jiakai Xu <jiakaipeanut@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
References: <20251119065727.3500015-1-jiakaiPeanut@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251119065727.3500015-1-jiakaiPeanut@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/18/25 10:57 PM, Jiakai Xu wrote:
> This patch updates the Linux documentation for cscope, fixing two issues:
> 1. Corrects the typo in the command line:
>        c"scope -d -p10  ->  cscope -d -p10
> 2. Fixes the related documentation comment for clarity and correctness:
>        cscope by default cscope.out database.
>        ->
>        cscope by default uses the cscope.out database.
> 
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>

LGTM. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
> Changes since v2:
>  * Fixed line-wrapping issues to ensure patch applies cleanly.
>  * Formatting improvements in the commit message.
> Thanks to Jonathan Corbet for pointing out this additional correction.
> 
> Changes since v1:
>  * Added the second fix for the documentation comment line.
> Thanks to Randy Dunlap for pointing out this additional correction.
> 
> References:
>  * [PATCH] Documentation/admin-guide: fix typo in cscope command example
> https://lore.kernel.org/linux-doc/6017104c-740d-43db-bc53-58751ec57282@infradead.org/T/#t
>  * [PATCH v2] Documentation/admin-guide: fix typo and comment in cscope example
> https://lore.kernel.org/linux-doc/871plv5mlf.fsf@trenco.lwn.net/T/#m10f8ec032dd57eaf7388939da3722c9f4b599b33
>  Documentation/admin-guide/workload-tracing.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/admin-guide/workload-tracing.rst b/Documentation/admin-guide/workload-tracing.rst
> index d6313890ee41..35963491b9f1 100644
> --- a/Documentation/admin-guide/workload-tracing.rst
> +++ b/Documentation/admin-guide/workload-tracing.rst
> @@ -196,11 +196,11 @@ Let’s checkout the latest Linux repository and build cscope database::
>    cscope -R -p10  # builds cscope.out database before starting browse session
>    cscope -d -p10  # starts browse session on cscope.out database
>  
> -Note: Run "cscope -R -p10" to build the database and c"scope -d -p10" to
> -enter into the browsing session. cscope by default cscope.out database.
> -To get out of this mode press ctrl+d. -p option is used to specify the
> -number of file path components to display. -p10 is optimal for browsing
> -kernel sources.
> +Note: Run "cscope -R -p10" to build the database and "cscope -d -p10" to
> +enter into the browsing session. cscope by default uses the cscope.out
> +database. To get out of this mode press ctrl+d. -p option is used to
> +specify the number of file path components to display. -p10 is optimal
> +for browsing kernel sources.
>  
>  What is perf and how do we use it?
>  ==================================

-- 
~Randy
