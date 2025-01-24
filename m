Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0401DB13B
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737710670; cv=none; b=ekj98p7ao8KZwI5Th+w6JF6Xu7GjZVxTa0lroz1JSmdSKKPH3JGW3kVNfPBr8AntZ1VMGnfI/flHxnNmAE8jdDSdyY9X9FkyUC2nYmdaCRldHvrsoc7n+lr36I30wbZI6K0yjQbqn67plfEiIP9WZCvU7rmC8hGteyOvaSjB9/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737710670; c=relaxed/simple;
	bh=JqMFHLtOW7lj2HjdzozmOleDowiaNjLK77OivPAuhG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCyOauIBW+ZYpCpvnehiMz7AQOgI/z8M6ZM2YcjCJeDiYXHcPydrWhWnXtEZGk7NE87oYz88DijK370TQJqFZPPtnvv6LyCOER0ztSUxtUIV5iDtjUpAPkKK6tJWZSR/LRsF3Fchot86+8ZD98QcFzmVjpe/R3F/8XsCORw/5K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gjVv6zo/; arc=none smtp.client-ip=95.215.58.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gjVv6zo/"
Message-ID: <0ff0dd30-c401-43f8-aad2-e22b8c977dea@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737710664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bOtcZ7EvmNhd5BKtyXlQs3MSxDe7hGGjw+2Rwbh58Hg=;
	b=gjVv6zo/LgkmvroRiCcnlK3nQ+1RR1sYwEVMr2PRq8XTNIoJDpjrdmhgeyNP1i5phz/SWX
	5n4dtB4oY2WTkOcBb/LnzkSagag8seKWy2n43CUosBe50ps5EQncm0wHgEiVpl3mBPd4+A
	pLkO1cilFyQE840KVBq8fCnDbJCAuPE=
Date: Fri, 24 Jan 2025 17:24:19 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 7/7] docs/zh_CN: Add tpm tpm_ftpm_tee Chinese
 translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1737603330.git.zhaoshuo@cqsoftware.com.cn>
 <5de6312d2b9d23646eb306e74bae3f80ff28941d.1737603330.git.zhaoshuo@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <5de6312d2b9d23646eb306e74bae3f80ff28941d.1737603330.git.zhaoshuo@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2025/1/23 13:17, Shuo Zhao 写道:
> Translate .../security/tpm/tpm_ftpm_tee.rst into Chinese.
>
> Update the translation through commit e8bd417aab0c
> ("tpm/tpm_ftpm_tee: Document fTPM TEE driver")
>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   .../translations/zh_CN/security/tpm/index.rst |  4 +--
>   .../zh_CN/security/tpm/tpm_ftpm_tee.rst       | 31 +++++++++++++++++++
>   2 files changed, 32 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst
>
> diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
> index bf95200ca586..707646590647 100644
> --- a/Documentation/translations/zh_CN/security/tpm/index.rst
> +++ b/Documentation/translations/zh_CN/security/tpm/index.rst
> @@ -17,6 +17,4 @@
>      tpm_tis
>      tpm_vtpm_proxy
>      xen-tpmfront
> -
> -TODOLIST:
> -*   tpm_ftpm_tee
> +   tpm_ftpm_tee
> diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst b/Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst
> new file mode 100644
> index 000000000000..5901eee32563
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst
> @@ -0,0 +1,31 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/security/tpm/tpm_ftpm_tee.rst
> +
> +:翻译:
> + 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> +
> +===========
> +固件TPM驱动
> +===========
> +
> +本文档描述了固件可信平台模块（fTPM）设备驱动。
> +
> +介绍
> +====
> +
> +该驱动程序是用于ARM的TrustZone环境中实现的固件的适配器。该驱动
> +程序允许程序以与硬件TPM相同的方式与TPM进行交互。
> +
> +设计
> +====
> +
> +该驱动程序充当一个薄层，传递命令到固件实现的TPM并接收其响应。驱动
> +程序本身并不包含太多逻辑，更像是固件与内核/用户空间之间的一个管道。
> +
> +固件本身基于以下论文：
> +https://www.microsoft.com/en-us/research/wp-content/uploads/2017/06/ftpm1.pdf
> +
> +当驱动程序被加载时，它会向用户空间暴露 ``/dev/tpmX`` 字符设备，允许
> +用户空间通过该设备与固件TPM进行通信。

