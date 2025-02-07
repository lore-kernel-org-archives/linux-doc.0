Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2E5185B5F
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738922086; cv=none; b=rr1NCjRZIHxqIUGhyfmydtBHKJ87tcTepyp+6E8BqeVsWF5KFtLMh6k9HVIqp3sU6WjDBc51UbSI1s21gBpCm97uHaBZEC8Matp/4KlM715aA5zeUL+6NCGhXWKobgjR0kOt0yYJE3b23q1xw64H9NVLill/5VYzeCsxawsOLNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738922086; c=relaxed/simple;
	bh=YbrmnBK47wFq/cEI4HBfzjFOyeHySWEZW5PDB2ZRVAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nPYWCSTgo1QJWtxY0F2XQtFK5XMbRyQg2y7fFXJGNAw/yW//nVUE5S63RdSYQ87CEpKv8kOZyJBjU7cuCZSi5D6375goTe1Jb3lbm9ersF5RKmhlIfxAqpkxUqJJa/zy6xCUX4/a5/sOKvIwYhM8XKmHz5CtNUFTYCc1DKF6Dtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BSbaqeiU; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BSbaqeiU"
Message-ID: <da9d1cf9-7650-4189-82b9-6e59785b243e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738922081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EtLLaX4xh8KmT1JDPx9O0mKwiw2fu20TaH+cNTdlsRQ=;
	b=BSbaqeiU3Mjhv+sq+QIc/r+Bt4xpkYdj2KOA4J9vknWF4jbeL+rxz1zlIhQkk1bmQXXJ8t
	ZUlavKAWw1Znqauhm06MD5jmHR2XvBtpltbPUWprsnLHz4h5xxALhB3EwOYtgxzQVh+N+J
	l85e3tSvmKlI9dSjW88Xvwx0UZl0jqQ=
Date: Fri, 7 Feb 2025 17:54:25 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/3] docs/zh_CN: Add keys index Chinese translation
To: zhangwei <zhangwei@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn, zhaoyuehui@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1738835231.git.zhangwei@cqsoftware.com.cn>
 <02843f1e6bcab0fdf5b2433bc3762b51f84a963c.1738835231.git.zhangwei@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <02843f1e6bcab0fdf5b2433bc3762b51f84a963c.1738835231.git.zhangwei@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2/7/25 10:23 AM, zhangwei 写道:
> Translate .../security/keys/index.rst into Chinese
>
> Update the translation through commit 5395d312dff0
> ("doc: ReSTify keys-trusted-encrypted.txt")
>
> Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
> ---
>   .../zh_CN/security/keys/index.rst             | 23 +++++++++++++++++++
>   1 file changed, 23 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/security/keys/index.rst
>
> diff --git a/Documentation/translations/zh_CN/security/keys/index.rst b/Documentation/translations/zh_CN/security/keys/index.rst
> new file mode 100644
> index 000000000000..1c26e027aed1
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/keys/index.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/security/keys/index.rst
> +
> +:翻译:
> +

> +  张巍 Wei Zhang <zhangwei@cqsoftware.com.cn>

Have you discussed and decided that you would translate this catalogue? 
If not, I suggest not signing the name here for the time being.



Thanks,

Yanteng

> +
> +========
> +内核密钥
> +========
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +
> +TODOLIST:
> +* core
> +* ecryptfs
> +* request-key
> +* trusted-encrypted
