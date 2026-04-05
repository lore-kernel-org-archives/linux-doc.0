Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FE6186A
	for <linux-doc@vger.kernel.org>; Sun,  5 Apr 2026 03:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775358975; cv=none; b=ktul1IPTjxQmxWaEHCsjZdC5beR1UlgRbo/uo+qEoyeuFbEe06Kus5cgHmJbeNblEo+ThkI/4wm7O/l29NsGwoWg5Y1P1phjZFZXV+6LT0LLvTBR1oTCrOg9LgVkBq2xiDrh8G2w3dzIBnA2d5IEIK31KgStCW9vzW+L3zlHAYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775358975; c=relaxed/simple;
	bh=FXiBukdjPxrAPSSE6Ee+nSOjzSxKs3BeIY027icQdns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8QmiVsKLKG+t7CCk+++eoPgG0JMt8a3bmJBAtAlLOQblgYtYQD+2Xh6Dlo47UMo2f9YYNy7eyK5VdJPSTZ1mGYvbzKuysRpzqJ2EC2zUqq4s0fFBlREbefz2T39zCkHa7tZ6DEiuhxydnj1EQBsY7Mre0FzanXnKcp7BDM7BiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wP8PX/GS; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wP8PX/GS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=EKwV1EGyKcPLItYr84qzfaTAibGg0sOGKzCV+gsaBxQ=; b=wP8PX/GSyF1pflwvZQgg7JZwvx
	VediBiqBzYaYiwdApxa1yaDEhxH6gjbjAUFVZFYtAS7tzqLNozBtMGweuuxRTWyoNZK7psQ64I4xs
	8sj0FzNF39DVtMg7vB8aRE9hYugIq5TLxm4A0Tlo+ylMneRoAJgBYOH00LSGISDVx9oBlgiGFwSeF
	cfiAvQ1+aN6TSWZlVJnIM4ezkLQ9naF8aYWtCtsi7OpMHxhu8UFA5CB3ynViOqlP995FbwZH5BLoM
	BkMMT4NRnKoe2zy4hpd/B+1Rh/np/ZIOGEgyjntVM8E+S1MvPQ+4QI+RIk1wQl4tLaDqwkDcRK/X+
	z5/hTC0g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Dy2-00000003vNp-2RkW;
	Sun, 05 Apr 2026 03:16:06 +0000
Message-ID: <8e489ff9-e9f8-4924-ad92-a1dbd6d33121@infradead.org>
Date: Sat, 4 Apr 2026 20:16:05 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix typos and duplicated words across documentation
To: Manuel Cortez <mdjesuscv@gmail.com>, linux-doc@vger.kernel.org
Cc: corbet@lwn.net
References: <20260405030359.7392-1-mdjesuscv@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260405030359.7392-1-mdjesuscv@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/4/26 8:03 PM, Manuel Cortez wrote:
> Fix the following typos and duplicated words:
> 
> - admin-guide/pm/intel-speed-select.rst: "weather" -> "whether"
> - core-api/real-time/differences.rst: "the the" -> "the"
> - admin-guide/bcache.rst: "to to" -> "to"
> - networking/switchdev.rst: "is in in" -> "is in"
> 
> Signed-off-by: Manuel Cortez <mdjesuscv@gmail.com>
> ---
>  Documentation/admin-guide/bcache.rst                | 2 +-
>  Documentation/admin-guide/pm/intel-speed-select.rst | 2 +-
>  Documentation/core-api/real-time/differences.rst    | 2 +-
>  Documentation/networking/switchdev.rst              | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/bcache.rst b/Documentation/admin-guide/bcache.rst
> index f71f349553e4..325816edbdab 100644
> --- a/Documentation/admin-guide/bcache.rst
> +++ b/Documentation/admin-guide/bcache.rst
> @@ -618,7 +618,7 @@ cache_replacement_policy
>    One of either lru, fifo or random.
>  
>  freelist_percent
> -  Size of the freelist as a percentage of nbuckets. Can be written to to
> +  Size of the freelist as a percentage of nbuckets. Can be written to
>    increase the number of buckets kept on the freelist, which lets you
>    artificially reduce the size of the cache at runtime. Mostly for testing
>    purposes (i.e. testing how different size caches affect your hit rate).
> diff --git a/Documentation/admin-guide/pm/intel-speed-select.rst b/Documentation/admin-guide/pm/intel-speed-select.rst
> index a2bfb971654f..dec2a25f10bc 100644
> --- a/Documentation/admin-guide/pm/intel-speed-select.rst
> +++ b/Documentation/admin-guide/pm/intel-speed-select.rst
> @@ -287,7 +287,7 @@ level.
>  Check presence of other Intel(R) SST features
>  ---------------------------------------------
>  
> -Each of the performance profiles also specifies weather there is support of
> +Each of the performance profiles also specifies whether there is support of
>  other two Intel(R) SST features (Intel(R) Speed Select Technology - Base Frequency
>  (Intel(R) SST-BF) and Intel(R) Speed Select Technology - Turbo Frequency (Intel
>  SST-TF)).
> diff --git a/Documentation/core-api/real-time/differences.rst b/Documentation/core-api/real-time/differences.rst
> index 83ec9aa1c61a..a129570dab5a 100644
> --- a/Documentation/core-api/real-time/differences.rst
> +++ b/Documentation/core-api/real-time/differences.rst
> @@ -213,7 +213,7 @@ to suspend until the callback completes, ensuring forward progress without
>  risking livelock.
>  
>  In order to solve the problem at the API level, the sequence locks were extended
> -to allow a proper handover between the the spinning reader and the maybe
> +to allow a proper handover between the spinning reader and the maybe
>  blocked writer.
>  
>  Sequence locks

Those first 3 look good.
Just a matter of how they get merged.

This last one is a little awkward as is but dropping one "in" doesn't help it --
it harms it (i.e., it's correct as is but could possibly be improved.)

> diff --git a/Documentation/networking/switchdev.rst b/Documentation/networking/switchdev.rst
> index 2966b7122f05..948bce44ca9b 100644
> --- a/Documentation/networking/switchdev.rst
> +++ b/Documentation/networking/switchdev.rst
> @@ -162,7 +162,7 @@ The switchdev driver can know a particular port's position in the topology by
>  monitoring NETDEV_CHANGEUPPER notifications.  For example, a port moved into a
>  bond will see its upper master change.  If that bond is moved into a bridge,
>  the bond's upper master will change.  And so on.  The driver will track such
> -movements to know what position a port is in in the overall topology by
> +movements to know what position a port is in the overall topology by
>  registering for netdevice events and acting on NETDEV_CHANGEUPPER.
>  
>  L2 Forwarding Offload

-- 
~Randy

