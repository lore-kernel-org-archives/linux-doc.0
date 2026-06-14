Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3581C2030A
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 00:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781397231; cv=none; b=Cy4+kSkzBj0lj4n+AuzJbfjS9S1RSIROiC9IsdpxnvRhtQuh6HkCae0sxf2erG4ISRxQ7S/QKcflp07YLsj5YioZ0AkvQoiQQJadJT1yXgny3JKT5miSVrYBPqtfgdUlSvHLKsXDMae1j4DY+CnJU78e7UnAzQr+DXS3Ik9ThG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781397231; c=relaxed/simple;
	bh=H3qdW1OASO7EGbsJ6intxG6VFZhKlcf04Q6uXf5HD20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUWCQbv8Kpyu4grlD0SrRuSVrugJ1RXz4op0RLP5bMpcovDKfdE0ZbIAuIChqpQCfptW7I+QuAa83j7j9c/hhJ8JP5SlEupgMi9aMdO3BR4PNggkUWrLlCqzGIwIQ5zreqAbPNaAysLovQvm7TzepYQWTLmoJgbafJCcjtRaQYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m96K0j+L; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m96K0j+L"
Message-ID: <f80eae9d-cf80-4a03-8007-195f50bfdafd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781397225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVhYyEYulu2vZ8tBAz5TY40Ul8ZS2iko/Y1lbY+Stl0=;
	b=m96K0j+LuSBewTbVZqun0kdPCcA2xjZgJO3vvGS8MXsKjYXjSH2Us17AHasHTc4eoaACRU
	PW/P4w7PBUl+aTPs8T6tpt+v0XJlIUoQHxphAVVcWwtU7ZB6LctQ3468nwifpCaLhuTzc2
	jm8P8nwO6+lf7l9oXk8L4Jg8e+kAeYM=
Date: Sun, 14 Jun 2026 08:33:36 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] docs/zh_CN: fix CONFIG_CONPAT typo for CONFIG_COMPAT
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>,
 Kees Cook <kees@kernel.org>, linux-doc@vger.kernel.org,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>
References: <20260613183737.11434-1-enelsonmoore@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260613183737.11434-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/14/26 2:37 AM, Ethan Nelson-Moore wrote:
> The Simplified Chinese translation of security/self-protection.rst
> contains a typo CONFIG_CONPAT for CONFIG_COMPAT. Fix it.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
> Changes in v2: remove unnecessary information from commit message
> 
>  Documentation/translations/zh_CN/security/self-protection.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/security/self-protection.rst b/Documentation/translations/zh_CN/security/self-protection.rst
> index 93de9cee5c1a..ad96bb4a4995 100644
> --- a/Documentation/translations/zh_CN/security/self-protection.rst
> +++ b/Documentation/translations/zh_CN/security/self-protection.rst
> @@ -97,7 +97,7 @@ ARCH_OPTIONAL_KERNEL_RWX时的默认设置。
>  --------------------
>  
>  对于64位系统，一种消除许多系统调用最简单的方法是构建时不启用
> -CONFIG_CONPAT。然而，这种情况通常不可行。
> +CONFIG_COMPAT。然而，这种情况通常不可行。
>  
>  “seccomp”系统为用户空间提供了一种可选功能，提供了一种减少可供
>  运行中进程使用内核入口点数量的方法。这限制了可以访问内核代码

Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>

Thanks,
Zenghui
