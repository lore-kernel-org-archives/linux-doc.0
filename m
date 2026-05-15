Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A103B27FB;
	Fri, 15 May 2026 14:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855214; cv=none; b=kCZpQy4K/tg1kBNwQpGShNZI1Gk7Ih5NCcNwjenigI1pQmB2eXbiEt33nB9IVtJijb2UKaRUlI48Z7Ms2CJKUPE28xn0IJo6dvWCVrq4diUGFWUseD9QfVnw58QZCygAoAu977IK3ZtCj3AVc2bL96H8QyVpWmiH25AfsKirVFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855214; c=relaxed/simple;
	bh=l4sUqsfEqPrWGz3d7rrX5FyMiR6PrxVNqr5HYPnzGeY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YapFJTqJ6XVVmzsdTWDmtp/A/ylimEoW86uLAqzym6ZTB/FAar371eg8CtMZs8aLkkwjNqwNDVaiCOvs1q4uYPdmp7sDA8yoG8xYXrxHZeweGZGg8nHTaiPv/h3j7kfeoNIMbZiZ0LKYcExZObutaFRPjmTvpH072jyBgi42Fyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Aa4DPsKK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Aa4DPsKK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D3505410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778855213; bh=UBVn+424J8p1Gqvfvb04655le/ltoFHH0wfexrn4DoI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Aa4DPsKKnpwiXjMKfYykVgnz8re5Vp3lW53My7oe7pkDs5IuF/qFIRmHgkuBAiBvz
	 LtGMkfXn6B4hM2rjgZCk1lWTV5oRz8eJuNbGYVdY84PTTEuNePZxJGI6OaP3UbwWip
	 wDYJl6WkOBaNaY0KbQniNdhbAnYy5d8Sf2pSh2T9jEvbXyIvTROZOAe32Pz4qTCqYu
	 BY2wJqZp9Nra+PwdROUSa2X3EaTuP+60fLN8f6nvLhakZvamygvDc3QhQp4OsPX+H8
	 w1V5X2wo2Hi/KhdPJM5sck6e5AeD23z3xedkT4jlzyDzEO4hnpWhY3XPZ6iISafG/G
	 YmZ8Gw3UUte8Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D3505410B5;
	Fri, 15 May 2026 14:26:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jinjie Ruan <ruanjinjie@huawei.com>, skhan@linuxfoundation.org,
 akpm@linux-foundation.org, bp@alien8.de, rdunlap@infradead.org,
 pmladek@suse.com, pawan.kumar.gupta@linux.intel.com,
 feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com, kees@kernel.org,
 elver@google.com, paulmck@kernel.org, lirongqing@baidu.com,
 safinaskar@gmail.com, bhelgaas@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, skelley@nvidia.com
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH] docs: Update nosmt support for arm64
In-Reply-To: <20260417032540.3720627-1-ruanjinjie@huawei.com>
References: <20260417032540.3720627-1-ruanjinjie@huawei.com>
Date: Fri, 15 May 2026 08:26:51 -0600
Message-ID: <871pfcrbo4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jinjie Ruan <ruanjinjie@huawei.com> writes:

> commit eed4583bcf9a6 ("arm64: Kconfig: Enable HOTPLUG_SMT") enable
> HOTPLUG_SMT for SMT control for arm64, but the documentation was
> not updated accordingly to reflect that ARM64 now supports control SMT
> via boot parameter and sysfs knobs:
>
> 1. Boot parameters:
>
> nosmt:          Disable SMT, can be enabled via sysfs knobs.
> nosmt=force:    Disable SMT, cannot be enabled via sysfs knobs.
>
> 2. Runtime sysfs controls:
>
> Write "on", "off", "forceoff" or the number of SMT threads (1, 2, ...)
> to /sys/devices/system/cpu/smt/control.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cb850e5290c2..6a73eb5abae9 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4661,7 +4661,7 @@ Kernel parameters
>  	nosmt		[KNL,MIPS,PPC,EARLY] Disable symmetric multithreading (SMT).
>  			Equivalent to smt=1.
>  
> -			[KNL,LOONGARCH,X86,PPC,S390] Disable symmetric multithreading (SMT).
> +			[KNL,LOONGARCH,X86,ARM64,PPC,S390] Disable symmetric multithreading (SMT).

Applied, thanks.

jon
