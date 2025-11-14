Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48631FFC6D
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 07:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.241.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763106370; cv=none; b=URbI05KzXTRxK3rEQB5dOS0B8es86Ru1mqVmZiGjPew10+foAQgx9+WY1l5CNCwELny8G83DWLlQPqdAtG7JzBZFJLhL0IyAhuYPPTgKrz91HvwuwV2dz6DW7RPWJkhx8B+qZaocmZ7GwC1CSG5YiFHT8FgMR6CncMyKP2c7xz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763106370; c=relaxed/simple;
	bh=VRCRICI8X4mdk3HijoD7X83T/Jau+SwWh21fr7Nb+IM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=beG7bnUA8Asqu5TpYjEKWaGvhR/JYbQm1g1akAKS2UhOReBXvVo03q+EfUE81YIWd8mREF+zEhCAuD6FxJxXm3sg8S3qjooRi0/KxJDEtDk2QzTpPJJTA1h/JEGTHV2bizoIMP/k3FGvZaYe22qnd5bmW1ER/iP9Msj8bhuLlCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=J0yCizk1; arc=none smtp.client-ip=159.100.241.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="J0yCizk1"
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.156])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 8122F200AF
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 07:45:59 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id C385D20057;
	Fri, 14 Nov 2025 07:45:51 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 3A49740086;
	Fri, 14 Nov 2025 07:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1763106351; bh=VRCRICI8X4mdk3HijoD7X83T/Jau+SwWh21fr7Nb+IM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J0yCizk11weJuGtlVdwQ3mNB8nuX0YN42HDDMl5+kRskECYSDCVXlqq3AgiecqpAd
	 A5qROiNMFEg2axfccJwTzqrZf2t8Au8IuVLcRKcxqLauvGD6lBvhWl3hbhdoS1O4uh
	 ib+1RPopwtowMr8XPUIfDxD4agDu+2XbOPWSq2Rg=
Received: from [192.168.0.64] (unknown [223.104.43.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id DCFFC41F99;
	Fri, 14 Nov 2025 07:45:47 +0000 (UTC)
Message-ID: <1a228389-14dc-4d2f-ba15-e9397c83a4c6@aosc.io>
Date: Fri, 14 Nov 2025 15:45:43 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] docs/zh_CN: Add blk-mq.rst translation
To: ke zijie <kezijie@leap-io-kernel.com>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1763105050.git.kezijie@leap-io-kernel.com>
 <f90d639dcb2a8064c6a5e85614c4da263b9942dc.1763105050.git.kezijie@leap-io-kernel.com>
Content-Language: en-US
From: WangYuli <wangyuli@aosc.io>
In-Reply-To: <f90d639dcb2a8064c6a5e85614c4da263b9942dc.1763105050.git.kezijie@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Queue-Id: 3A49740086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.10 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[kezijie.leap-io-kernel.com:server fail];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]

Hi 子杰,

On 2025/11/14 15:37, ke zijie wrote:
> Translate .../block/blk-mq.rst into Chinese.
> Add blk-mq into .../block/index.rst.
>
> Update the translation through commit 41bd33df4e18
> ("docs: block: blk-mq.rst: correct places -> place")
>
> Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
> ---
>   .../translations/zh_CN/block/blk-mq.rst       | 128 ++++++++++++++++++
>   .../translations/zh_CN/block/index.rst        |   3 +-
>   2 files changed, 130 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/block/blk-mq.rst
>
> diff --git a/Documentation/translations/zh_CN/block/blk-mq.rst b/Documentation/translations/zh_CN/block/blk-mq.rst
> new file mode 100644
> index 000000000000..b6933e8e96ed
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/block/blk-mq.rst
> @@ -0,0 +1,128 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/block/blk-mq.rst
> +
> +:翻译:
> +
> + 柯子杰 kezijie <kezijie@leap-io-kernel.com>
> +
> +:校译:
> +
> +
> +
> +================================================
> +多队列块设备I/O排队机制 (blk-mq)
> +================================================
> +
> +多队列块设备I/O排队机制是一组API，它使高速存储设备能够排队并同时向块设备

In general, there should be a space between Chinese characters and 
English words or numbers.

For example, write “多队列块设备 I/O 排队机制是一组 API，” rather than 
“多队列块设备I/O排队机制是一组API。”

Thanks,

--

WangYuli

