Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D80234987
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919775; cv=none; b=JHiLPL/Zmg+Pys2NjXKvAs4jUyuDLmeLZFfjrL9IgnIsPxxBntT7H9TjXfSOAE0vrSHiYZ97TEXvz6BiAYcrBVg6vjWx1ksriyZBV7lotV7OIFREpm4lonAIUKEdEiHeSUm9jf5vZlUEWpL7QoLEExu08LezM+lKx2JUCQznbMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919775; c=relaxed/simple;
	bh=atqP75+HJRz2RK3tG3LDTZipLVEuQAHbH77yDUX1UHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQum0ySTTvFYgPu3PTmJlH0tSS7VjGojklcSjjdeYJrytYm3q0RPPZ+Aej0A7wqh36l+eIb78V4pMmCFBqkmvgkzfvNhCS03V8juOCkmCFCKjsSujsiDP5wR6E4sd7jZt8W8LAH/Y66LBmIgDWDb9B++f9rU4aXaJtGJldKpEHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qeP7yrLl; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qeP7yrLl"
Message-ID: <116da9a0-125c-4760-9a21-184db65eddfd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738919770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=omI1qo9LOPL0reR+VdkIMl+fUT7dTAnamBjfQ/u7Oq4=;
	b=qeP7yrLlC1jkX9oNtoF/4uAI7HyK+v6mGgtrONdyX/eppZOi2MMAzmvWg5qq1pE6hbcK8O
	rqrUX9C2BuHDfQyYnamDSy9hMtS+ysOQGrraWSG4AAE5yYt50+JPOvnfy3YZBwrJhG1gTL
	cCZL/o1SLBFtEl4CwTZvMoV/eOmeOK4=
Date: Fri, 7 Feb 2025 17:16:00 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] docs/zh_CN: Update the translation of dev-tools/ubsan
 to v6.14-rc1
To: WangYuli <wangyuli@uniontech.com>, alexs@kernel.org, corbet@lwn.net,
 dzm91@hust.edu.cn
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 horms@kernel.org, zhanjun@uniontech.com, guanwentao@uniontech.com,
 chenlinxuan@uniontech.com
References: <2B33A00C9F5BECC7+20250207084821.251531-1-wangyuli@uniontech.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <2B33A00C9F5BECC7+20250207084821.251531-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2/7/25 4:48 PM, WangYuli 写道:
> Commit 918327e9b7ff ("ubsan: Remove CONFIG_UBSAN_SANITIZE_ALL")
> removed the CONFIG_UBSAN_SANITIZE_ALL configuration option. Update
> the Chinese documentation accordingly and revise the document format
> by the way.
>
> Link: https://lore.kernel.org/all/6F05157E5E157493+20250123043258.149643-1-wangyuli@uniontech.com/
> Link: https://lore.kernel.org/all/fb3c5ec4-eabc-48c0-bf0b-d20cad978b4f@linux.dev/
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,

Yanteng

> ---
> Changelog:
>   *v1->v2: Update commit title to v6.14-rc1 and add Dongliang Mu's Chinese name.
>    v2->v3: Remove the ".. _cn_ubsan:" tag.
> ---
>   .../translations/zh_CN/dev-tools/ubsan.rst    | 33 +++++++++----------
>   1 file changed, 15 insertions(+), 18 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/dev-tools/ubsan.rst b/Documentation/translations/zh_CN/dev-tools/ubsan.rst
> index 2487696b3772..81ef6f77caeb 100644
> --- a/Documentation/translations/zh_CN/dev-tools/ubsan.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/ubsan.rst
> @@ -3,7 +3,14 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/dev-tools/ubsan.rst
> -:Translator: Dongliang Mu <dzm91@hust.edu.cn>
> +
> +:翻译:
> +
> + 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
> +
> +:校译:
> +
> + 王昱力 WangYuli <wangyuli@uniontech.com>
>   
>   未定义行为消毒剂 - UBSAN
>   ====================================
> @@ -55,30 +62,20 @@ GCC自4.9.x [1_] （详见 ``-fsanitize=undefined`` 选项及其子选项）版
>   
>   使用如下内核配置启用UBSAN::
>   
> -	CONFIG_UBSAN=y
> -
> -使用如下内核配置检查整个内核::
> -
> -        CONFIG_UBSAN_SANITIZE_ALL=y
> -
> -为了在特定文件或目录启动代码插桩，需要在相应的内核Makefile中添加一行类似内容:
> +  CONFIG_UBSAN=y
>   
> -- 单文件（如main.o）::
> -
> -    UBSAN_SANITIZE_main.o := y
> -
> -- 一个目录中的所有文件::
> -
> -    UBSAN_SANITIZE := y
> -
> -即使设置了``CONFIG_UBSAN_SANITIZE_ALL=y``，为了避免文件被插桩，可使用::
> +排除要被检测的文件::
>   
>     UBSAN_SANITIZE_main.o := n
>   
> -与::
> +排除一个目录中的所有文件::
>   
>     UBSAN_SANITIZE := n
>   
> +当全部文件都被禁用，可通过如下方式为特定文件启用::
> +
> +  UBSAN_SANITIZE_main.o := y
> +
>   未对齐的内存访问检测可通过开启独立选项 - CONFIG_UBSAN_ALIGNMENT 检测。
>   该选项在支持未对齐访问的架构上(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y)
>   默认为关闭。该选项仍可通过内核配置启用，但它将产生大量的UBSAN报告。
