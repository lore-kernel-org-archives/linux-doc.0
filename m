Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29134299943
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 01:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763429634; cv=none; b=j97bSaq1MeROL0Bzo898NMKLCQMce3r2iwwMIp4S3O/TkQOQzzPIxBDAycrGegBhkdDSijhUH+97Kbf1deHnZm7O0mgg3utmPNtkKtS6b1Im5pY/mBUvo2QJ8ILkahR1jsklOu42khZPYFsiGOLmwVHN39NlD801ktEEIvUWFL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763429634; c=relaxed/simple;
	bh=Nvvy+39nM+NpVQz5In0gMSwCGPTSvRbPgjT8CGIx4B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nz5vFlJvZzetiOgBVJ1gziz++uQyevILsOxNlQUReMrmm3vkEBiAvinDND8yTkaD/H6FdmKOKovwIFrNTdLFZed+EYamHC9AagW2Vs+6L+Tr7wMf8kU6OOPoNDN+k9sEYwNmfMCZSuwVeuf2WflxC3xe602X6YpCGPpGaUtoWwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XP9rnFzt; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XP9rnFzt"
Message-ID: <02520bd2-7154-437e-aa93-f1ff0756a0e3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763429618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OVzUhNITzmnZDf+Zm7CrHA9lh2uYm6Lzce5DrYz/r8Q=;
	b=XP9rnFztmRgstAZUiNYJeVONmxjr70MvSfOZnX5Y9Stxcr7hIDoECGt3h9MnVlHuwzLfxv
	fZ8CdmxoxOd2WPonU13wn/9Qw5APPvOB9JAjtoVwLt5jyeXbdGLQPsMQsiK8+O6fABPyDX
	wm9qaA9t2DxQCFew7+H1rUIg7gTm69M=
Date: Tue, 18 Nov 2025 09:33:29 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/3] docs/zh_CN: Add block/index.rst translation
To: ke zijie <kezijie@leap-io-kernel.com>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 wangyuli@aosc.io, doubled@leap-io-kernel.com
References: <cover.1763366835.git.kezijie@leap-io-kernel.com>
 <dceb4c59bc0d9a02246386cfed31a543d6a943b8.1763366835.git.kezijie@leap-io-kernel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <dceb4c59bc0d9a02246386cfed31a543d6a943b8.1763366835.git.kezijie@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/11/17 16:27, ke zijie 写道:
> Translate .../block/index.rst into Chinese and update subsystem-apis.rst
> translation.
>
> Update the translation through commit 56cdea92ed91
> ("Documentation/block: drop the request.rst file")
>
> Reviewed-by: WangYuli <wangyl5933@chinaunicom.cn>
> Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
> ---
>   .../translations/zh_CN/block/index.rst        | 36 +++++++++++++++++++
>   .../translations/zh_CN/subsystem-apis.rst     |  1 -
>   2 files changed, 36 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/block/index.rst
>
> diff --git a/Documentation/translations/zh_CN/block/index.rst b/Documentation/translations/zh_CN/block/index.rst
> new file mode 100644
> index 000000000000..45172f6d2659
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/block/index.rst
> @@ -0,0 +1,36 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/block/index.rst
> +
> +:翻译:
> +
> + 柯子杰 kezijie <kezijie@leap-io-kernel.com>
> +
> +:校译:
> +
> +
> +
There is no need for so many blank lines here.
> +=====
> +Block
> +=====
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +TODOList:
> +* bfq-iosched
> +* biovecs
> +* blk-mq
> +* cmdline-partition
> +* data-integrity
> +* deadline-iosched
> +* inline-encryption
> +* ioprio
> +* kyber-iosched
> +* null_blk
> +* pr
> +* stat
> +* switching-sched
> +* writeback_cache_control
> +* ublk
> \ No newline at end of file

A blank line is needed here.


I don't think these two are major issues, but they are not good after all.


Thanks,

Yanteng

> diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
> index 0f121f9b0f70..830217140fb6 100644
> --- a/Documentation/translations/zh_CN/subsystem-apis.rst
> +++ b/Documentation/translations/zh_CN/subsystem-apis.rst
> @@ -75,7 +75,6 @@ TODOList:
>
>   TODOList:
>
> -* block/index
>   * cdrom/index
>   * target/index
>
> --
> 2.25.1
>
