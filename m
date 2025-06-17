Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5239433993
	for <linux-doc@vger.kernel.org>; Tue, 17 Jun 2025 01:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124696; cv=none; b=AidoK69uSM7NT3Wm7GAIVc6QCGpWssvvwDP5cFy1LGkk8tYSlWz/45KFEXuYx77DJSaE4j6mD2At7KCbt5/igY5IwgLtVL9XWj4jTb7gIrrGhKwSBDRBz3QmWlHUQJuo930gqXBei9d5cauCf8NaK+v2iQxkRsGu9e/iPusjar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124696; c=relaxed/simple;
	bh=FrMNpoU0KsNW0qg02rDXo3Uu0wX8loscUpEUTMv+OGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFeoGVbKXzsTNSpHmO1bM+WQr0evMNO+8IywvTMLRGK+rkYOGT4MvIn8U6pwJRbqoaWmF66lor2lLDlKDEmeVbtSeBrZf7MMbt6ureJ3iGE12OD0CGaW2qxMwclq8TUTD33oHRmrMVWnDHYDJHeX2D7ONftUTQPE4CkHFM7/GzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ByRUu2Ts; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ByRUu2Ts"
Message-ID: <9aa4278e-0f43-420b-b6b5-78a32263d7ec@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750124692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9j6dPiBh9J0ibfK+wZrIlMMj9iz4s5guo08DGg4VYmg=;
	b=ByRUu2TsHF2kz4dnEeUzXvAzZoJvp6QzwxAHILKnjkUbd27t2f/4c3I8MO1igzw19z9HJi
	cpyvTkgoFoearRR5vcWUdGSeM7Rq2Xlf7HcbDjOec5DcKIP71O+Oz0OxcFVDpIJBmrDo4y
	nZsqxe5Oulo0XOp0MXeyb4cF7JAsmS4=
Date: Tue, 17 Jun 2025 09:44:43 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: update git command examples in how-to.rst
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250616134003.3981866-1-dzm91@hust.edu.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250616134003.3981866-1-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 6/16/25 9:40 PM, Dongliang Mu 写道:
> This patch leverages `checkout -b` to shorten branch & checkout
> and fix the missing checkout.
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>

Acked-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,

Yanteng

> ---
>   Documentation/translations/zh_CN/how-to.rst | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
> index 569b0209385a..0896f13d8b8d 100644
> --- a/Documentation/translations/zh_CN/how-to.rst
> +++ b/Documentation/translations/zh_CN/how-to.rst
> @@ -177,8 +177,7 @@ git和邮箱配置
>   请执行以下命令，新建开发分支::
>   
>   	git checkout docs-next
> -	git branch my-trans
> -	git checkout my-trans
> +	git checkout -b my-trans
>   
>   译文格式要求
>   ------------
> @@ -286,7 +285,7 @@ warning 不需要解决::
>   然后执行以下命令为补丁追加更改::
>   
>   	git checkout docs-next
> -	git branch test-trans
> +	git checkout -b test-trans-new
>   	git am 0001-xxxxx.patch
>   	./scripts/checkpatch.pl 0001-xxxxx.patch
>   	直接修改您的翻译
