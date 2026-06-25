Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B606233A9C1
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 14:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782396366; cv=none; b=pdUpUIgjeQtr+ncWMEXFQ7ig74jpO/NbtOVuH6y99k0QzAQFv9coGOzfHdvshb71oUtQWnT0iNnOmrHsMsyerjnc/qTsTNFDcA6g0OFCw3qQ68Sy5RFXFIu4mi7CmajjT1o0IfhXX2mU6eYWUjbqxFll11hIms7V/FiflmDZBdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782396366; c=relaxed/simple;
	bh=32KL/T0pa0DTIfbi12niAIcca9ym7BhO1xxCHsrVCUk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ckD3uBPDzpqBrdzqCRfO+L+QYxNh/2n903ygwMo5vEmxzVaW0injUz3TvWpCSOmuAg7xXr1Hy88bECSKgK5QI+0IKGGkJcvcdUtgJNBlAnULsVIzvmthZQd0nsg8H/8XzqFUfJNYfR2jyFKu3xW6LOJzZBbW4ThEKe7DBC37td4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CtHuWpBW; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CtHuWpBW"
Message-ID: <d9ada3a3-6978-4602-a11d-689e0fa4171a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782396352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ow20Ap6CSlfnAtL2yrWY3YbWQS38wkcMjV92g0akp4s=;
	b=CtHuWpBWIYyJV44FQuTVcb6xRChzIBDhPA7zryOK6fF9uEGBJiqSJLvmkWUPWoEfILjCFt
	jZRry3542AnM6EBbpgD6MEZAbHgloUVC3j4fzt92kTwj0pCuzwpfnhzwEZ/wNd7r9TIzpf
	wmUV9hnwnqYNMX/B6B5b5p/PnKUXGOU=
Date: Thu, 25 Jun 2026 22:05:46 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: cui.tao@linux.dev, Shuah Khan <skhan@linuxfoundation.org>,
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cgroup/cpu: document cpu.stat.local
To: Sun Shaojie <sunshaojie@kylinos.cn>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>
References: <20260625130723.1144463-1-sunshaojie@kylinos.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <20260625130723.1144463-1-sunshaojie@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



在 2026/6/25 21:07, Sun Shaojie 写道:
> Add documentation for the cpu.stat.local interface file, which reports
> the throttled_usec stat -- the actual throttling time incurred by the
> cgroup's own runqueues, which may include throttling inherited from
> ancestor cgroup bandwidth limits. Unlike cpu.stat's throttled_usec
> which only accounts for throttling caused by the cgroup's own CFS
> bandwidth limit.
> 
> When the controller is not enabled, the stat is not reported.
> 
> Signed-off-by: Sun Shaojie <sunshaojie@kylinos.cn>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 993446ab66d0..a7766f40ef65 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1160,6 +1160,23 @@ will be referred to. All time durations are in microseconds.
>  	- nr_bursts
>  	- burst_usec
>  
> +  cpu.stat.local
> +	A read-only flat-keyed file which exists on non-root cgroups.
> +	This file exists whether the controller is enabled or not.
> +

Hi Shaojie,

Thanks — the throttled_usec semantics are described correctly.

One fix needed: "exists on non-root cgroups" is inaccurate.
cpu.stat.local is registered without CFTYPE_NOT_ON_ROOT, so (like
cpu.stat) it exists on the root cgroup too:

  $ cat /sys/fs/cgroup/cpu.stat.local
  throttled_usec 0

Reviewed-by: Tao Cui <cuitao@kylinos.cn>

Thanks,
Tao

> +	It reports the following stat when the controller is enabled:
> +
> +	- throttled_usec
> +
> +	Unlike the ``throttled_usec`` reported by ``cpu.stat`` which
> +	accounts for throttling caused by this cgroup's own CFS
> +	bandwidth limit, ``cpu.stat.local`` reports the actual
> +	throttling time incurred by this cgroup's own runqueues,
> +	which may include throttling inherited from ancestor
> +	cgroup bandwidth limits.
> +
> +	When the controller is not enabled, this stat is not reported.
> +
>    cpu.weight
>  	A read-write single value file which exists on non-root
>  	cgroups.  The default is "100".

