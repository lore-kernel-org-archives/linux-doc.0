Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E633921DE
	for <linux-doc@vger.kernel.org>; Sun, 24 May 2026 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779619485; cv=none; b=mmY304k6y70sU8FmBAzT6fofWLT05UVDOBmd1a/H00jvFamV/+El5bjjVN/2wYnfiseh0I18bnRve/KHeDgqj2aMrUMtczsJ5OTWaY5LXLBxhs/a5fx+Lrykc9mRS9uW3aHxfTFbPPvRcrRrdIC+1zRTdNcQcj+/aS0uA37LGVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779619485; c=relaxed/simple;
	bh=K00LVbaDHh2B15+pqVD6wJ7Cttb/87EnhsvkZqrmQYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pTvloTSBfIkVAWORrvtMbGgQz9+ATvan5rVNWzWUp/lrC99ouV96IRUSYyiGnnttVEUvU+8MvLq4/twT6WFAzWEfsSKR5Mb5am/Yz7HGHoV0FGit1QUt88Az4TaAD11FqBB/ZuphQbOmbC4wDGEw44s7Gxwpae29xmas2Z+hh1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PZoVxX+M; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PZoVxX+M"
Message-ID: <05ee738e-37ea-4697-99de-4cec914066b4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779619469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fsm2jTkXekCiogIzIaGvA7FTIo/raz14hyiHpVGaXto=;
	b=PZoVxX+MVxusT7P6WmLb1oyHapocl6f/oOeEdJfWMAeEpCb3Wg1y64Fv2ZiN7xlras6A5s
	BhE1HwzmVFIvBrbZNVpEH+VhJykHxmWHFch911PbpeTh8P2LqPHaFySoDPg+WElO/6Px+k
	B9aeEGJnVKZJqCOiGzvnOzzczbBFlFw=
Date: Sun, 24 May 2026 18:44:10 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: fix KASAN SW_TAGS mode description
To: chengyaqiang <chengyaqiang@chengyaqiang.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
 corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, chengyaqiang@tsinghua.edu.cn
References: <20260522075735.2022734-1-chengyaqiang@chengyaqiang.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260522075735.2022734-1-chengyaqiang@chengyaqiang.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 5/22/26 3:57 PM, chengyaqiang wrote:
> From: chengyaqiang <chengyaqiang@tsinghua.edu.cn>
> 
> CONFIG_KASAN_SW_TAGS enables Software Tag-Based KASAN mode, not Hardware
> Tag-Based mode. Fix the incorrect translation in the Chinese documentation.
> 
> The original text incorrectly described both CONFIG_KASAN_SW_TAGS and
> CONFIG_KASAN_HW_TAGS as "基于硬件标签" (hardware tag-based).  Correct
> CONFIG_KASAN_SW_TAGS to "基于软件标签" (software tag-based).
> 
> Signed-off-by: chengyaqiang <chengyaqiang@tsinghua.edu.cn>
> ---
>  Documentation/translations/zh_CN/dev-tools/kasan.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/dev-tools/kasan.rst b/Documentation/translations/zh_CN/dev-tools/kasan.rst
> index fd2e3afbdfad..767b280d8af0 100644
> --- a/Documentation/translations/zh_CN/dev-tools/kasan.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/kasan.rst
> @@ -79,7 +79,7 @@ KASAN只支持SLUB。
>  	  CONFIG_KASAN=y
>  
>  同时在 ``CONFIG_KASAN_GENERIC`` (启用通用KASAN模式)， ``CONFIG_KASAN_SW_TAGS``
> -(启用基于硬件标签的KASAN模式)，和 ``CONFIG_KASAN_HW_TAGS`` (启用基于硬件标签
> +(启用基于软件标签的KASAN模式)，和 ``CONFIG_KASAN_HW_TAGS`` (启用基于硬件标签
>  的KASAN模式)之间进行选择。
>  
>  对于软件模式，还可以在 ``CONFIG_KASAN_OUTLINE`` 和 ``CONFIG_KASAN_INLINE``

Looks good,

Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>

Thanks,
Zenghui
