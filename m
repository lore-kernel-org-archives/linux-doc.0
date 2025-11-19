Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BEB21CC5C
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763536945; cv=none; b=R8JIqKzNq1B2rbvXJUOiTZO6Ei85nD5GQAwhdhPYk6Az6zgGJVJKTXqZSjob/xzd+YPj8/3NJxOyWArj8xkrLRYsREZjzW8nD9OoogpmOj/yoA0VFV046ITO7d/5OmCDfJIeqfgLAF/GGKX+DWztVh5lUXmCFW0pJeTRg2VeX/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763536945; c=relaxed/simple;
	bh=8oyXII9fvPYrTrEtOJhISzwPYhwrc2T/40tnQ5kl8t0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tBjBU1KiAFSuPJX1D7s8Veb4LbomypAjeEEWCIzHNNxxYAZs5pRbxP3Gb2GAvqe4+CRr2crUEnAeLh7eoECandDsqb7Lo0Do69gzitkgOVHe9dgJ2YbajhxGS/TqaaEkR9hm7NGXyeTLUi1ScagtTSto5BdzZJU4a1+F2oz5Ecs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dl5y4Yzu; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dl5y4Yzu"
Message-ID: <e2a979ee-7dcb-424e-893b-e60333259e15@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763536941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dk8CRIZy7FFLw2Ah8d1zcfkT/ANaUDPO5+9aUtPhWL0=;
	b=dl5y4YzuHjPj4Pr9m+kEmkuKHEeMmbV3OcBPboY02W8K9zZfv2EOQ+s+lqsq4xYlWONMXq
	lqEW/8azn97mMwYbZqpWnkrs+FuYOeyqLeZ0VXCyoviD8L7Ip6JFH0zq+nbfaKTFT+SRJc
	P9yyg5HxP/+lf1n0RUJ4oeqmyvH1DGM=
Date: Wed, 19 Nov 2025 15:21:53 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/3] docs/zh_CN: Add block/index.rst translation
To: ke zijie <kezijie@leap-io-kernel.com>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 wangyuli@aosc.io, doubled@leap-io-kernel.com
References: <cover.1763535919.git.kezijie@leap-io-kernel.com>
 <3e4c8bab2c3d5f55daea8dca604981d486256d19.1763535919.git.kezijie@leap-io-kernel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <3e4c8bab2c3d5f55daea8dca604981d486256d19.1763535919.git.kezijie@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/11/19 15:09, ke zijie 写道:
> Translate .../block/index.rst into Chinese and update subsystem-apis.rst
> translation.
>
> Update the translation through commit 56cdea92ed91
> ("Documentation/block: drop the request.rst file")
>
> Reviewed-by: WangYuli <wangyl5933@chinaunicom.cn>
> Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>

So, what happened between v4 and v5?  need a cover letter to write this.


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
> + 柯子杰 ke zijie <kezijie@leap-io-kernel.com>
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
