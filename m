Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0E73702F8
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 05:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763530591; cv=none; b=W6UzQUdi7vaYK2CapywpOs5diQKgsPnnqi55bjLcadcEkyjkvNIsG55JwAJBVOpzjbX7+eAkcPfLlpOAdM3t65QxGhfiGnsiZIgy6CtB5u6XdGsLzeK5UlcTZTI1mL5+v8CNOgoe5f/XG5heLBRkDYgeMMY0+iN/Ch1BTgJVHP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763530591; c=relaxed/simple;
	bh=onaglPvnaVd+DYsNMgaRnCN5RS5TAWFhTeerwfKjL+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAhJ8LZ1nDeMqug/SD2UtsPOwiPNDXWoP1MVMvDm/WiSDcPHepVFEoDbgeVN6KJZBvXrDV+DYY1Pt9nrvZqRT38Kz7ypiLwk7XlGkI8vYYybOHeQOV62DnDjRIzsChN3j2BQWp8HvVS9GUbogf381AqJdsaZVyYax44jr5GUFAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U1ovemMw; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U1ovemMw"
Message-ID: <46e83102-64b5-4c4f-8f45-85b5d872484a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763530582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RBye/AyJjL/tLR4/mqiejtcGrwNvcR58kJdMaSL9zgg=;
	b=U1ovemMwo0E95+GdzZ61ROhsAgVP2rMBhPNApqtxuTVVcjNNmdJS+Tt8lS8jBnA2rvBXyk
	bjJwAQnS3TnGkx/nlPIOX7FEdqUY12G2dQ4lGS2O0kW66JdIT2VA09AIh/y9cODg2xpDmG
	IYXaBT+3+b+tSxl2P+vsGxCusiCC9jE=
Date: Wed, 19 Nov 2025 13:35:37 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/3] docs/zh_CN: Add block/index.rst translation
To: ke zijie <kezijie@leap-io-kernel.com>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 wangyuli@aosc.io, doubled@leap-io-kernel.com
References: <cover.1763519072.git.kezijie@leap-io-kernel.com>
 <3e4c8bab2c3d5f55daea8dca604981d486256d19.1763519072.git.kezijie@leap-io-kernel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <3e4c8bab2c3d5f55daea8dca604981d486256d19.1763519072.git.kezijie@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/11/19 10:38, ke zijie 写道:
> Translate .../block/index.rst into Chinese and update subsystem-apis.rst
> translation.
>
> Update the translation through commit 56cdea92ed91
> ("Documentation/block: drop the request.rst file")
>
> Reviewed-by: WangYuli <wangyl5933@chinaunicom.cn>
> Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>


Thanks,

Yanteng

> ---
>   .../translations/zh_CN/block/index.rst        | 34 +++++++++++++++++++
>   .../translations/zh_CN/subsystem-apis.rst     |  1 -
>   2 files changed, 34 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/block/index.rst
>
> diff --git a/Documentation/translations/zh_CN/block/index.rst b/Documentation/translations/zh_CN/block/index.rst
> new file mode 100644
> index 000000000000..1a5b214657dc
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/block/index.rst
> @@ -0,0 +1,34 @@
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
>
