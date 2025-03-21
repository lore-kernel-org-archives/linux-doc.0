Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5E7EEB3
	for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742551335; cv=none; b=Gr+lCAIDsslYnaYVRbQ8r4sOmrLrWDntl94C9vpfuWChRcHW35XcQmEnZPjzfoARR/Yvo/xpbZn0YchD3nVA+++X3P2swy08dqvp/AMywJAWc4gUoY6r6FR+XoLlnNs5QkpvwxgW5gVPIVrLQPYDGQWNlxINEB2l9IeeBXIg8wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742551335; c=relaxed/simple;
	bh=DsRzTng9a5Ur/WRL/117wEq6pRtPM/PnER8ZfDX2mnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bEzLjZyZ3xmRIdEGOoyBi7wAvXcJAsXvV8EihHDv3xzw5dI/fQsfAKz3iUw2gi6YUMUXWGtDbpqb+Zdkm8t0LXy4JOrcYtDyuHpbkQ/1S8SvkP7sISptuzEgpsKHiTucN5wtnifgYuCcb8/xJ18y4WMMHUPZQ67zu1l8dyH/jvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=REpG6SxT; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="REpG6SxT"
Message-ID: <be3aa70b-a9c6-4a37-8b98-29c84177a3ff@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742551324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUv4c1DDBTk6gQ4tqkmYhQ9nJq4ttXWGohABMAItkRo=;
	b=REpG6SxTGa8x82BslaY6v+fi/bdeq/wmBQQM2Sd2uIZ9o0w31IjT5K6Nr4wkxI5DzHjgSM
	zANKvTWj1W143RemLfEGkUr6KHsf7wMVcPN3VuNAQuZH95Sp3eaUfJkpiaScFa3S3bA442
	ZmKOv5JbWfRAsahEQAvTeQBl+aiVXyE=
Date: Fri, 21 Mar 2025 18:01:57 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] docs/zh_CN: Add security lsm-development Chinese
 translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1742542887.git.zhaoshuo@cqsoftware.com.cn>
 <1d7b8c13052f008def17b2ad923fc83bc53e32e1.1742542887.git.zhaoshuo@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <1d7b8c13052f008def17b2ad923fc83bc53e32e1.1742542887.git.zhaoshuo@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 3/21/25 3:49 PM, Shuo Zhao 写道:
> Translate .../security/lsm-development.rst into Chinese.
>
> Update the translation through commit 6d2ed653185b
> ("lsm: move hook comments docs to security/security.c")
>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>

Where has my Reviewed-by tag gone?

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
> index 000000000000..cdd0aa03e089
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
> +基于 https://lore.kernel.org/r/20071026073721.618b4778@laptopd505.fenrus.org，
> +当一种新的LSM的意图（它试图防范什么，以及在哪些情况下人们会期望使用它）在
> +``Documentation/admin-guide/LSM/`` 中适当记录下来后，就会被接受进入内核。
> +这使得LSM的代码可以很轻松的与其目标进行对比，从而让最终用户和发行版可以更
> +明智地决定那些LSM适合他们的需求。
> +
> +有关可用的 LSM 钩子接口的详细文档，请参阅 ``security/security.c`` 及相关结构。
