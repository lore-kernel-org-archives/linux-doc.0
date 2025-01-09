Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C09984039;
	Thu,  9 Jan 2025 19:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736451861; cv=none; b=I1e/N3n6610nJ6DIIiD39pNmi4t5pg1689lAhY0BYfdmnQfT/HLYKo46kTgIVsApTobeuuQuIsC1JZqZQ4uAMPJjqC9uRo2ooyHtY8P+PrJ4jmaGj4HYA2iz4LbVH7qi0Tr9g5kcW/RpSpVwygS+gVqltLgyuqheCGyBghox/Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736451861; c=relaxed/simple;
	bh=VhUlWXxhcPYfPnIFpC60MlvDTdocby7zN8Lhd6I/91w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tjCaVidlIWfEK+I1h8wQl50YiaUlEgoHo8M9MF0Z+xgbdOE951jVsac8KtmUBWWIlyOdYCK2avqrLfpLTqrVPv4ItfG7qztz4hsNnZp3sAIMomMN7M5PmwG4SVnWtzhA3V/lEroXN03dzuAwr+SHlA68oY6CzIXwU1AIYKhmJj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SjR5QXKU; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SjR5QXKU"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net ADF31404F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736451856; bh=rdVYRBAD7Lq1tG95dVLavCm62tW6IVj9Z+YZ+gmJRTs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SjR5QXKUCn7IremDZcZxetv20hSNDhdJubROpUlpfDwJuqtAxvJ24G0gFpSoCDUmy
	 iknzQTvyMHVXrDnuADu96IDTcTkZA/zMLkPvSKDFWCBogAX6L7gJOVDOwy2Pqmb9rg
	 Ev+i6Ssmq3qSDZa8TesGAnGxJII+E13Rb66D5rvG4w/Sgumg5TtLzMNCFB90yAwu/0
	 JtVv0yZchVFUXylVLpofQm9pC0hEl6I88neYm5L+Jh/UlCTIBPkhqHFxXeTWnRLEM7
	 5l350bqpKte4jkvZEOIr6XarOrmcmsgV+4CUDDqeJ5rjK4DbHlwYQwtdPEwfTupwlT
	 6SRgA+gNHx7lQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id ADF31404F0;
	Thu,  9 Jan 2025 19:44:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jianhui Zhou <jianhuizz@qq.com>, akpm@linux-foundation.org,
 paulmck@kernel.org, jonaszhou@zhaoxin.com
Cc: thuth@redhat.com, rostedt@goodmis.org, david@redhat.com,
 victor@mojatatu.com, andrii@kernel.org, xiongwei.song@windriver.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jianhui Zhou
 <jianhuizz@qq.com>, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] Documentation: Remove the outdated prompt under
 cgroup_disable option in kernel-parameters.txt
In-Reply-To: <tencent_50D7C8F43461B5F8CF055C15970A1A36C305@qq.com>
References: <tencent_50D7C8F43461B5F8CF055C15970A1A36C305@qq.com>
Date: Thu, 09 Jan 2025 12:44:15 -0700
Message-ID: <87zfjzkc1c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

It would have been good to include the cgroup maintainer here; adding
Tejun.

Looking at the code, it's far from clear to me that the other cgroups
pay attention to this parameter.  Can somebody convince me that this
change is correct?

Thanks,

jon

Jianhui Zhou <jianhuizz@qq.com> writes:

> Disabling options other than memory is currently
> supported according to the cgroup_disable function.
> So it can be removed.
>
> Signed-off-by: Jianhui Zhou <jianhuizz@qq.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 3872bc6ec49d..3c562653016f 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -609,9 +609,6 @@
>  			- if foo is an optional feature then the feature is
>  			  disabled and corresponding cgroup files are not
>  			  created
> -			{Currently only "memory" controller deal with this and
> -			cut the overhead, others just disable the usage. So
> -			only cgroup_disable=memory is actually worthy}
>  			Specifying "pressure" disables per-cgroup pressure
>  			stall information accounting feature
>  
> -- 
> 2.25.1
