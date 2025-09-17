Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A23622ACE3
	for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 08:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758098097; cv=none; b=Ld3ib3/TcDI9EHi7o4naPY3Xvt0rPUfyUEE+/XiabULo+Gw5cWEF5UJEfmjbcAb+AVn18+FOhKXGAm0SZWMlr+0Lgvss3fpOMUXdpc/4n8lVoQRwij/p9usCoswM8mYycSqT5+QQp+z+I6RkrlSyytEko7lIlUFIjvhdmxHjkPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758098097; c=relaxed/simple;
	bh=V14gtq9A0bm200QoiFGs2VxEzU3HB1JIDdAg4lPo9Ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nnx/Q1nVExLCZdLtABE5YwOee9oPCzq/tPi5RXX9HZlOVvRX70/GkKP+CoCattuuKfd+78fqF4g81GaY8WxZrTDJ0fFN9laQ/T27+BT9bj15L1Ytfl0+YkAxofbIxXnijM6AJ1E9iygcnzIcfJ6+EU1PQFf9JvFJFcBM/zpAzG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K+81nkIJ; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K+81nkIJ"
Message-ID: <f27e3d04-ced6-459c-993f-b5495257fa3f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758098083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RpI9q1IwSk47lhK6SwQ0h/F//+p1Xmj8B105Y7CCDUE=;
	b=K+81nkIJNBJsjnuLjYyhZ0IItiH4Cds4vybsUOEYkVCaOGzjp8JfHqv6DNhbtT0S1eHVZW
	1SiDAMzzafqQBgAwKV+uGtQyTtbXM96yVSS7ylvZ5mkxvkmldx5vJFt8J6eU6J7Btb3uNL
	TAKRs0rMZXFquRgb5M9Yqey+2pUJZug=
Date: Wed, 17 Sep 2025 16:34:35 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: Add security lsm-development Chinese
 translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: dzm91@hust.edu.cn, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250917073010.88607-1-zhaoshuo@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250917073010.88607-1-zhaoshuo@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 9/17/25 3:30 PM, Shuo Zhao 写道:
> Translate .../security/lsm-development.rst into Chinese.
>
> Update the translation through commit 6d2ed653185b
> ("lsm: move hook comments docs to security/security.c").
>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>


Thanks,

Yanteng

> ---
>   .../translations/zh_CN/security/index.rst     |  2 +-
>   .../zh_CN/security/lsm-development.rst        | 19 +++++++++++++++++++
>   2 files changed, 20 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/security/lsm-development.rst
>
> diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
> index 78d9d4b36dca..05d24e3acc11 100644
> --- a/Documentation/translations/zh_CN/security/index.rst
> +++ b/Documentation/translations/zh_CN/security/index.rst
> @@ -18,6 +18,7 @@
>      credentials
>      snp-tdx-threat-model
>      lsm
> +   lsm-development
>      sak
>      self-protection
>      siphash
> @@ -28,7 +29,6 @@
>   TODOLIST:
>   * IMA-templates
>   * keys/index
> -* lsm-development
>   * SCTP
>   * secrets/index
>   * ipe
> diff --git a/Documentation/translations/zh_CN/security/lsm-development.rst b/Documentation/translations/zh_CN/security/lsm-development.rst
> new file mode 100644
> index 000000000000..7ed3719a9d07
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/lsm-development.rst
> @@ -0,0 +1,19 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/security/lsm-development.rst
> +
> +:翻译:
> + 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> +
> +=================
> +Linux安全模块开发
> +=================
> +
> +基于https://lore.kernel.org/r/20071026073721.618b4778@laptopd505.fenrus.org，
> +当一种新的LSM的意图（它试图防范什么，以及在哪些情况下人们会期望使用它）在
> +``Documentation/admin-guide/LSM/`` 中适当记录下来后，就会被接受进入内核。
> +这使得LSM的代码可以很轻松的与其目标进行对比，从而让最终用户和发行版可以更
> +明智地决定那些LSM适合他们的需求。
> +
> +有关可用的 LSM 钩子接口的详细文档，请参阅 ``security/security.c`` 及相关结构。
