Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A991DB144
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737710530; cv=none; b=jrZF+9Qxj33cfCq3VwmRm2Bt172eCeMldSNKBavt/6g7y2y70B72nIbEqTvu17IgcYmIbU85pluaiRaAh4FU/+woPG9GQbgJeD/OYC5utwCY8sMov80f7qnfPXqd/nar7dZgXKDsoANau7GD39oe2O8DqXGdpZgpcbf7k1ESLTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737710530; c=relaxed/simple;
	bh=XTPGTSilOXOdqKQZOlvKAHVRp/hzmjNVwFM3qj3dV18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fWb49p1kn/LViVdUsUJ2FpQEMx4DHoDgt/kFBOQLEJuubxE64g3gcZ2w5jRxfIh4oTOe+8Fjug8SVNhIynJdDrVnwrq+PHlgH8H5fYdJAOv2mk+iaPdmceBA3kVx35YPXWM/bqdOvfKv0ofkLZ8+mHKixbSnwBV4z3Hs8TLj9tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K6AjYQ4c; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K6AjYQ4c"
Message-ID: <75dd7955-1216-4d20-926d-fe2b379b88a7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737710521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FUU8S1DHWO7tAJM3oE6H01aWC1kZN3vcq6JYobymq1k=;
	b=K6AjYQ4chb0qF2IWbgNprIvmNfAFFcznc9FU7rVIUcmgU9Z6opblHaYz/w4NB8Df6Ju4AM
	R+IRY0l5G7hEZUdXlRmx/1X30OdkOccBa0hXUYGrnYPeEjZV3JfJW3/prPi4my4vLXR2P5
	BvIZI6YvPtpqVTSkUsnFIUpTieMqBuc=
Date: Fri, 24 Jan 2025 17:21:56 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 5/7] docs/zh_CN: Add tpm tpm_vtpm_proxy Chinese
 translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1737603330.git.zhaoshuo@cqsoftware.com.cn>
 <f9798eaec76b27cc02fa47970bf623879377d422.1737603330.git.zhaoshuo@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <f9798eaec76b27cc02fa47970bf623879377d422.1737603330.git.zhaoshuo@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2025/1/23 13:17, Shuo Zhao 写道:
> Translate .../security/tpm/tpm_vtpm_proxy.rst into Chinese.
>
> Update the translation through commit 799a545bb938
> ("tpm: move documentation under Documentation/security")
>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   .../translations/zh_CN/security/tpm/index.rst |  2 +-
>   .../zh_CN/security/tpm/tpm_vtpm_proxy.rst     | 51 +++++++++++++++++++
>   2 files changed, 52 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst
>
> diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
> index 4ee8881a41a4..dd80816f8af8 100644
> --- a/Documentation/translations/zh_CN/security/tpm/index.rst
> +++ b/Documentation/translations/zh_CN/security/tpm/index.rst
> @@ -15,8 +15,8 @@
>      tpm_event_log
>      tpm-security
>      tpm_tis
> +   tpm_vtpm_proxy
>   
>   TODOLIST:
> -*   tpm_vtpm_proxy
>   *   xen-tpmfront
>   *   tpm_ftpm_tee
> diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst b/Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst
> new file mode 100644
> index 000000000000..bc92cfb684c3
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst
> @@ -0,0 +1,51 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/security/tpm/tpm_vtpm_proxy.rst
> +
> +:翻译:
> + 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> +
> +==========================
> +Linux容器的虚拟TPM代理驱动
> +==========================
> +
> +| 作者：
> +| Stefan Berger <stefanb@linux.vnet.ibm.com>
> +
> +本文档描述了用于Linux容器的虚拟可信平台模块（vTPM）代理设备驱动。
> +
> +介绍
> +====
> +
> +这项工作的目标是为每个Linux容器提供TPM功能。这使得程序能够像与物理系统
> +上的TPM交互一样，与容器中的TPM进行交互。每个容器都会获得一个唯一的、模
> +拟的软件TPM。
> +
> +设计
> +====
> +
> +为了使每个容器都能使用模拟的软件TPM，容器管理栈需要创建一对设备，其中
> +包括一个客户端TPM字符设备 ``/dev/tpmX`` （X=0,1,2...）和一个‘服务器端’
> +文件描述符。当文件描述符传被递给TPM模拟器时，前者通过创建具有适当主次
> +设备号的字符设备被移入容器，然后，容器内的软件可以使用字符设备发送TPM
> +命令，模拟器将通过文件描述符接收这些命令，并用它来发送响应。
> +
> +为了支持这一点，虚拟TPM代理驱动程序提供了一个设备 ``/dev/vtpmx`` ，该设备
> +用于通过ioctl创建设备对。ioctl将其作为配置设备的输入标志，例如这些标志指示
> +TPM模拟器是否支持TPM1.2或TPM2功能。ioctl的结果是返回‘服务器端’的文件描述符
> +以及创建的字符设备的主次设备号。此外，还会返回TPM字符设备的编号。例如，如果
> +创建了 ``/dev/tpm10`` ，则返回编号（ ``dev_num`` ）10。
> +
> +一旦设备被创建，驱动程序将立即尝试与TPM进行通信。来自驱动程序的所有命令
> +都可以从ioctl返回的文件描述符中读取。这些命令应该立即得到响应。
> +
> +UAPI
> +====
> +
> +该API在以下内核代码中：
> +
> +include/uapi/linux/vtpm_proxy.h
> +drivers/char/tpm/tpm_vtpm_proxy.c
> +
> +函数：vtpmx_ioc_new_dev

