Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5811799F
	for <linux-doc@vger.kernel.org>; Thu,  2 Jan 2025 07:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735803149; cv=none; b=OP5W/IrM8ZBb2crPAGnMXFyhqfINqvB0ijrtmqs9VF+DJGnkUeJOjFY3Jke3IyhfjJL3xVD/E475KY/jGOlxGyFa4UVWkbpZ/qLOHcXvY/vuVdmcS5l3bpxfHaHc4fwt6y2ZjdnGRWHyF4+qUp5wnK/gt2XjW1oOno/58pwiSFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735803149; c=relaxed/simple;
	bh=voCWaKaC3+4xwjRpuyqVTu39cnmgWsLIs9dwYl/lmI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMMzNxYBGj9VGeS6vZcmw0iZM3TGvuRYHFMfDi9HlS2Z/5tqlWgma9UEhGeNuSW5s26tdTpa0J7ePStWgp+6kJWfpqUc/dim4uugmi12pmpR1IqQwSMCZwkSCnxtGnUtxdL8CCaUrSbpZG2MHOvRiWh7B1gtzVsUxOQtCHdkP4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=v8soC9/l; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="v8soC9/l"
Message-ID: <6552aa64-01cf-4ff1-adc0-bcbed2ea7907@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1735803142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DnYwoBS52F6Tg2pvmXuDWDDk8AiQDQecBTc5juIkoLI=;
	b=v8soC9/lMQ8H/zbMnWhrgUFxyUfPYVEMHSqwclwPHE3zpW8clsKjNAUiMrh/scAX9X4COp
	82TztfCbhMUQVcvT3uPEbmrCBGYR4kXJNFiUL822Wy0sd11e5kwHNk712lLX0iCQDPKHJn
	/g/CV1L+xW8q46fMvisHaEKmYcsnh8k=
Date: Thu, 2 Jan 2025 15:32:14 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: Add security digsig Chinese translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <20241227082836.16078-1-zhaoshuo@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20241227082836.16078-1-zhaoshuo@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Zhao Shuo,


在 2024/12/27 16:28, Shuo Zhao 写道:
> Translate .../security/digsig.rst into Chinese.
>
> Update the translation through commit d56b699d76d1
> ("Documentation: Fix typos").
>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> ---
>   .../translations/zh_CN/security/digsig.rst    | 100 ++++++++++++++++++
>   .../translations/zh_CN/security/index.rst     |   2 +-
>   2 files changed, 101 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/security/digsig.rst
>
> diff --git a/Documentation/translations/zh_CN/security/digsig.rst b/Documentation/translations/zh_CN/security/digsig.rst
> new file mode 100644
> index 000000000000..96560d52859e
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/digsig.rst
> @@ -0,0 +1,100 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/security/digsig.rst
> +
> +:翻译:
> + 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> +
> +===============
> +数字签名验证API
> +===============
> +
> +
> +.. 内容
> +
> +   1.介绍
> +   2.API
> +   3.用户空间工具
> +
> +
> +介绍
> +====
> +
> +数字签名验证API提供了一种验证数字签名的方法。
> +目前，数字签名被IMA/EVM完整性保护子系统使用。
> +
> +数字签名验证是GnuPG多精度整数(MPI)库精简后的内核移植版本来实现的。
how about:
数字签名验证是通过精简的 GnuPG 多精度整数（MPI）库的内核移植来实现的。


Thanks,
Yanteng



>   * ipe

