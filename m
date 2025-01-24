Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE7C1D63DF
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 06:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737701907; cv=none; b=TRvOXwxIJ+2D1XqV+scT3MKDKvjotzCMgsLNBBMzInUuvpUG9NMbDtpOfby67Nf4oXi/PVFTj+fd+rbuEf8EP7yTxqfurnalCFv9WVm5gg+XeCy36IbmUWbJA9SaXahUhPdeH9es5EZlQ7020Kt+AdaYs4hWTb4dG/DSzxFmLFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737701907; c=relaxed/simple;
	bh=emDoF1+7ch8JyvE8acgzYShgo5wVbOa53lJZLv7hoXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGMRK9AxgM511BHvEup92kGz9Q23oO3Jm2n/BW1JprNflOi9nEvJVXjZtxWD+Y0cyx7z5bKbHYsz+f0RWIx2RS8w7Y6Klhs8IQApR6YGOQiqXV17uVXZVScAaNkBDGPqIKZKwzYvkGJrFteXNzW0XtF9aQurcO75+D8kELjerMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p+5F6QNK; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p+5F6QNK"
Message-ID: <004b7650-ee76-414a-90f2-376a8c3f4a27@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737701897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cdy7OJ4Tm8m944NQJ0ib4efzCRGNYhkxDugch6lC5nY=;
	b=p+5F6QNKZ6fA6+xY+eM2nTfE9SP7ZQ0+w7zIknECtGdZNAwCEq4+2hAsu/Xora5hHB1uMe
	03YqFLIhaq4mU///sDxO16yL05vqI/bs9Fbi0nL2T5b73qUwyP+tq6iOV0YawWTsDTgclw
	/uGQficr5yJmU0alhBNpCK+yMXVb+hA=
Date: Fri, 24 Jan 2025 14:58:10 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/7] docs/zh_CN: Add tpm index Chinese translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1737603330.git.zhaoshuo@cqsoftware.com.cn>
 <900d91e8a2c7c35259005de5cff99e7bb4e7adf6.1737603330.git.zhaoshuo@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <900d91e8a2c7c35259005de5cff99e7bb4e7adf6.1737603330.git.zhaoshuo@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2025/1/23 13:17, Shuo Zhao 写道:
> Translate .../security/tpm/index.rst into Chinese
>
> Update the translation through commit 1d479e3cd652
> ("Documentation: tpm: Add TPM security docs toctree entry")
>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   .../translations/zh_CN/security/index.rst     |  2 +-
>   .../translations/zh_CN/security/tpm/index.rst | 22 +++++++++++++++++++
>   2 files changed, 23 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/security/tpm/index.rst
>
> diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
> index 38e9ce7cf471..0aacecabf0c0 100644
> --- a/Documentation/translations/zh_CN/security/index.rst
> +++ b/Documentation/translations/zh_CN/security/index.rst
> @@ -19,6 +19,7 @@
>      lsm
>      sak
>      siphash
> +   tpm/index
>      digsig
>      landlock
>   
> @@ -29,6 +30,5 @@ TODOLIST:
>   * lsm-development
>   * SCTP
>   * self-protection
> -* tpm/index
>   * secrets/index
>   * ipe
> diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
> new file mode 100644
> index 000000000000..a55d0a7bbc0f
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/tpm/index.rst
> @@ -0,0 +1,22 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/security/tpm/index.rst
> +
> +:翻译:
> + 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> +
> +================
> +可信平台模块文档
> +================
> +
> +.. toctree::
> +
> +
> +TODOLIST:
> +*   tpm_event_log
> +*   tpm-security
> +*   tpm_tis
> +*   tpm_vtpm_proxy
> +*   xen-tpmfront
> +*   tpm_ftpm_tee

