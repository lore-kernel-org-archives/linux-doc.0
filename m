Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869F833998
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 07:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737702123; cv=none; b=n7u3vOdEKcO3tRNgL1JjEYKaMj2FtprPfEYHEdbaJbwsSAKA5P5FuzMkvCSkGwYJYN6AJmxOTZJrj+1C0btUn+KRJ6Jvj2EuHEa87hdmiEZspKeNgRxFeE89mZwXLqnNZ+w1rKQ/YejOsJbpcMkdq7qmylmWxhdsOWKQcn8KBxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737702123; c=relaxed/simple;
	bh=aOHuDhuqFMkRFBjyntmgZWaPgUmTqqp/t6dyXcf4jUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmZosDm3wU70iK0pWzdJyeHM4fPNA2FFxo/Yvp/me0eF6jf7MHCLz6ScWQ3qQPJWLiDTE0L2lP4xLM0qtSaFrlsYz4nWBLqvbFQI5bBKWbU9vp8FTA5ambTNDOF4GZVbd0cFMm2/z1P4Yt81DZTwlTI23J6+VM5h2VB/YVE2neU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AddvkwAM; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AddvkwAM"
Message-ID: <02ff0851-1db6-4b42-8a48-334830144ca7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737702113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LPytlc7Z0ansdNTuieIqNU+kk2Wl11gOBnnGaoq75Zw=;
	b=AddvkwAManjVyEA9bc12nt7NoYtxptkERQ/QyMvMUTZIllN+pJPHe/Y6NKMnPSEWed8geV
	TVvSj2afcrslt+ZDeNYhj7huc8gCR8lh3D+0zo3PDa+0XRhBIitSAygVjiCXG6ccILx8nD
	B9+Pq+qDEAE1RUUN6PENsxgekciqCYU=
Date: Fri, 24 Jan 2025 15:01:48 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/7] docs/zh_CN: Add tpm tpm_event_log Chinese
 translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1737603330.git.zhaoshuo@cqsoftware.com.cn>
 <32c35c0504f262668996080b44dfe059a5266256.1737603330.git.zhaoshuo@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <32c35c0504f262668996080b44dfe059a5266256.1737603330.git.zhaoshuo@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2025/1/23 13:17, Shuo Zhao 写道:
> Translate .../security/tpm/tpm_event_log.rst into Chinese.
>
> Update the translation through commit 2ef5a7f1482c
> ("tpm: Document UEFI event log quirks")
>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   .../translations/zh_CN/security/tpm/index.rst |  2 +-
>   .../zh_CN/security/tpm/tpm_event_log.rst      | 49 +++++++++++++++++++
>   2 files changed, 50 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst
>
> diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
> index a55d0a7bbc0f..f324bd4dd093 100644
> --- a/Documentation/translations/zh_CN/security/tpm/index.rst
> +++ b/Documentation/translations/zh_CN/security/tpm/index.rst
> @@ -12,9 +12,9 @@
>   
>   .. toctree::
>   
> +   tpm_event_log
>   
>   TODOLIST:
> -*   tpm_event_log
>   *   tpm-security
>   *   tpm_tis
>   *   tpm_vtpm_proxy
> diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst b/Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst
> new file mode 100644
> index 000000000000..9c173291ac3e
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst
> @@ -0,0 +1,49 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/security/tpm/tpm_event_log.rst
> +
> +:翻译:
> + 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> +
> +===========
> +TPM事件日志
> +===========
> +
> +本文档简要介绍了什么是TPM日志，以及它是如何从预启动固件移交到操作系统的。
> +
> +介绍
> +====
> +
> +预启动固件维护一个事件日志，每当它将某些内容哈希到任何一个PCR寄存器时，该
> +日志会添加新条目。这些事件按类型分类，并包含哈希后的PCR寄存器值。通常，预
> +启动固件会哈希那些即将移交执行权或与启动过程相关的组件。
> +
> +其主要应用是远程认证，而它之所以有用的原因在[1]中第一部分很好地阐述了：
> +
> +认证用于向挑战者提供有关平台状态的信息。然而，PCR的内容难以解读；因此，当
> +PCR内容附有测量日志时，认证通常会更有用。尽管测量日志本身并不可信，但它们
> +包含比PCR内容更为丰富的信息集。PCR内容用于对测量日志进行验证。
> +
> +UEFI事件日志
> +============
> +
> +UEFI提供的事件日志有一些比较奇怪的特性。
> +
> +在调用ExitBootServices()之前，Linux EFI引导加载程序会将事件日志复制到由
> +引导加载程序自定义的配置表中。不幸的是，通过ExitBootServices()生成的事件
> +并不会出现在这个表里。
> +
> +固件提供了一个所谓的最终事件配置表排序来解决这个问题。事件会在第一次调用
> +EFI_TCG2_PROTOCOL.GetEventLog()后被镜像到这个表中。
> +
> +这引出了另一个问题：无法保证它不会在 Linux EFI stub 开始运行之前被调用。
> +因此，在 stub 运行时，它需要计算并将最终事件表的大小保存到自定义配置表中，
> +以便TPM驱动程序可以在稍后连接来自自定义配置表和最终事件表的两个事件日志时
> +跳过这些事件。
> +
> +参考文献
> +========
> +
> +- [1] https://trustedcomputinggroup.org/resource/pc-client-specific-platform-firmware-profile-specification/
> +- [2] The final concatenation is done in drivers/char/tpm/eventlog/efi.c

