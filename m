Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5F3360EE1;
	Mon,  1 Jun 2026 19:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340919; cv=none; b=PM6YfpiOaye3I70RJBBHvjYnaUblMwbYgHzXBsmP6EtWsKBhy/7cyjxT17Akq05UHyrI6IQMu5RiCpLTf4zqHN1PWh0LX5qUCMVUn24L0JnMwA8G+MsrOdo7qiStt7lf1yeKr2gL9BCkI2sCpQ3s9Kr3QcrbC526AgfS7yWjkYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340919; c=relaxed/simple;
	bh=eb7084sSUNMCJAClyTtIWei4A5dlaWhLaHbga7K/oq8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rkjWCz8/8mhzk/gwYVGi9G9B49Zl/ThyjSYpNUJgx83VuYg/XwXv5m3DZPzEsl83cPMoBKOEkZd+O+qspSxO4DzI0YA/AkxHdK3LS7ZlFMxiyFJjtYhWm/nQIdLN9jNrKZmXNNq/JXb64KiLM3wcScKz4IJYBb6DS3OaVeihT9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jwV/Dvmi; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jwV/Dvmi"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 205C340E50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780340918; bh=2mpCoTKfC5sXglQufo/V1Q/cgV/pJRUGqSV59ulBvdI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jwV/DvmiFgsdp+aMe/GN35jBovFDVXRtvTL6T3CqOq3VaJNpMTKGTolyVy30FEaKq
	 lgk2DVw4hvkl8W5OQI+4x2ozDm6EIL616a0/2jKrmaxxnWCEserloKtio0FxJX4wBW
	 zkfL005yFIaKSj0WwH0Ye3jhehVHIG+tdHYK+P350eTxKrC2sd7f7LI3N798FlMFP1
	 Kn7VkXHfw3nrIka88k5HSfsapKYZ4jDVnSsFHyW9yxuhQpK6Koy3a+DZtlxixOaH/X
	 euBUrfiPukNJmwv98ONxJmJe6tjNah/H6/6N0uT06VtlWyEJLsLqDzrYuy0h/WJBJY
	 RFvlHjaVhZsMg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 205C340E50;
	Mon,  1 Jun 2026 19:08:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH v1] docs: kernel-parameters: Fix stale sticore file paths
In-Reply-To: <20260531140541.4115641-1-costa.shul@redhat.com>
References: <20260531140541.4115641-1-costa.shul@redhat.com>
Date: Mon, 01 Jun 2026 13:08:37 -0600
Message-ID: <87h5nm84ei.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Costa Shulyupin <costa.shul@redhat.com> writes:

> Update file paths for sticore references that
> became stale when drivers were reorganized:
> - drivers/video/console/sticore.c -> drivers/video/
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 459ed0d72aeb..f94ec9f3a75c 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7381,10 +7381,10 @@ Kernel parameters
>  			Set the STI (builtin display/keyboard on the HP-PARISC
>  			machines) console (graphic card) which should be used
>  			as the initial boot-console.
> -			See also comment in drivers/video/console/sticore.c.
> +			See also comment in drivers/video/sticore.c.
>  

Applied, thanks.

jon
