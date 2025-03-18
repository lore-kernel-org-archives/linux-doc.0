Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25F6126BFA
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 01:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742262243; cv=none; b=efbnQmQSfR1UZt6+GuUYVfkp1bYzFPtW01rtTyVwYxeBaZE++EuPu+h3zw5ehgZEFs0y6iURpdX79tVGZqgIgWmhLgUdrJYNuIbYIekQhM2VeyLG9aRLeJVS27lEuFPX5MMQ+RRehHG+pKiJ3NKyFe4sTHLJ4K5EfiMCHZuAZGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742262243; c=relaxed/simple;
	bh=zFzGaBwkMXzdFxJh4V05wjFrZPGt1cfaFX/apXDtvI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELQgXaGijYTNvh2h5wiu1OMLnb0QKJQoyGPjyzBCDNnZ6UOnLG3kdRtk33uCuOkDGnRlD5SVW0kJw2ghPNJIIoDyQRWY8kOxvN4JybUrYg43S8A95tS/ani+329PUQ3pirJk5tjSflTDM2FfebGyNIuHBynJE4DlHghhBmejlac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=B+kuNopB; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="B+kuNopB"
Message-ID: <98bf374e-7e29-4aa5-ab79-1927b6e20385@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742262238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g993M+81djIw48kr/nqYNWB2vmaV1nYAEGMgmfe2/lQ=;
	b=B+kuNopBllYOiei1ZrtZFIXSoL6ulbrfBdx8jbREte9xLQcyt104lpup9v7A90mWqWrpLM
	Sy7hJ4n8RXBnRb8poclK5C8tHPNvT3OFVKLQsAqFOwfbOqnChFP8vIwbT6nteD8+Z8WKQ1
	C0JUzoBuN12EbtbCAVZUNzvp39yOegk=
Date: Tue, 18 Mar 2025 09:43:51 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: Add security lsm-development Chinese
 translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <20250312024226.14804-1-zhaoshuo@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250312024226.14804-1-zhaoshuo@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 3/12/25 10:42 AM, Shuo Zhao 写道:
> Translate .../security/lsm-development.rst into Chinese.
>
> Update the translation through commit 6d2ed653185b
> ("lsm: move hook comments docs to security/security.c")
>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


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
