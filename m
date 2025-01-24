Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE56320B
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737710465; cv=none; b=qzoB8MSLODetVnyCx4heSRNk78NHwXnbTiq4XtBQsjdSffjYs40ftDEJdz6fWX1VxZcWyT0c1u4b+rUTjFBtpCtTXAhHJfyZZlLdR1Ax4v7sN+YVTk6HF8Etf0nYqMCG05DxCoVJUQtzDjq6tU+ENUitu8JZuXxVuNiR1yGtGfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737710465; c=relaxed/simple;
	bh=cViwMXcTCAYQnvjxHfK6DyDxVe2NedHRZJ8lmwWvtUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ICcVWh+iO62eJu5kXYM+N4BxuNqIPYx3HqVK1T1eadGB1WUyrOFCf08M+K+21TNuJzOhj0xBa9tdC3zUSq7CInhMQPA1mw7sadAWPQbaBgvXbFTJQgrVtfg3RBntSqPQTyWiu1GJ8/wwbC0tgESd7yr/y+X927FXz2glcwoKzuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BTR3E4qP; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BTR3E4qP"
Message-ID: <077ff96e-a0ca-4a71-93f0-93115181337f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737710454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TtgITH3sRrb6+pRPS1PqtRIA2A0NRTGYx103zOoMvIM=;
	b=BTR3E4qP2byIv4QVnqotcbT5gcONph6ABfvr39EG4/6lUfxCRED3CAW5gtIMjAcxRCWR6R
	HSDclIwrtaBk4XjnZWNcUjUlDJ0TV44uo4MsI5wxPGm412nUZBM645V61EYxlMymbeM7VP
	quDLRS5byw0cKHJm11Od3lrGvbleBC4=
Date: Fri, 24 Jan 2025 17:20:48 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 4/7] docs/zh_CN: Add tpm tpm_tis Chinese translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1737603330.git.zhaoshuo@cqsoftware.com.cn>
 <ac55092bc3f1b3ec51f3e2dd596616ade1a32076.1737603330.git.zhaoshuo@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <ac55092bc3f1b3ec51f3e2dd596616ade1a32076.1737603330.git.zhaoshuo@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2025/1/23 13:17, Shuo Zhao 写道:
> Translate .../security/tpm/tpm_tis.rst into Chinese.
>
> Update the translation through commit 8a55256a8462
> ("Documentation: tpm_tis")
>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   .../translations/zh_CN/security/tpm/index.rst |  2 +-
>   .../zh_CN/security/tpm/tpm_tis.rst            | 43 +++++++++++++++++++
>   2 files changed, 44 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_tis.rst
>
> diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
> index 46cdf7c1a1c1..4ee8881a41a4 100644
> --- a/Documentation/translations/zh_CN/security/tpm/index.rst
> +++ b/Documentation/translations/zh_CN/security/tpm/index.rst
> @@ -14,9 +14,9 @@
>   
>      tpm_event_log
>      tpm-security
> +   tpm_tis
>   
>   TODOLIST:
> -*   tpm_tis
>   *   tpm_vtpm_proxy
>   *   xen-tpmfront
>   *   tpm_ftpm_tee
> diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_tis.rst b/Documentation/translations/zh_CN/security/tpm/tpm_tis.rst
> new file mode 100644
> index 000000000000..0fb009f93e10
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/tpm/tpm_tis.rst
> @@ -0,0 +1,43 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/security/tpm/tpm_tis.rst
> +
> +:翻译:
> + 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> +
> +TPM FIFO接口驱动
> +================
> +
> +TCG PTP规范定义了两种接口类型：FIFO和CRB。前者基于顺序的读写操作，
> +后者基于包含完整命令或响应的缓冲区。
> +
> +FIFO（先进先出）接口被tpm_tis_core依赖的驱动程序使用。最初，Linux只
> +有一个名为tpm_tis的驱动，覆盖了内存映射（即 MMIO）接口，但后来它被
> +扩展以支持TCG标准所支持的其他物理接口。
> +
> +由于历史原因，最初的MMIO驱动被称为tpm_tis，而FIFO驱动的框架被命名为
> +tpm_tis_core。在tpm_tis中的“tis”后缀来自TPM接口规范，这是针对TPM1.x
> +芯片的硬件接口规范。
> +
> +通信基于一个由TPM芯片通过硬件总线或内存映射共享的20KiB 缓冲区，具体
> +取决于物理接线。该缓冲区进一步分为五个相等大小的4KiB缓冲区，为CPU和
> +TPM之间的通信提供等效的寄存器集。这些通信端点在TCG术语中称为localities。
> +
> +当内核想要向TPM芯片发送命令时，它首先通过在TPM_ACCESS寄存器中设置
> +requestUse位来保留locality0。当访问被授予时，该位由芯片清除。一旦完成
> +通信，内核会写入TPM_ACCESS.activeLocality位。这告诉芯片该本地性已被
> +释放。
> +
> +待处理的本地性由芯片按优先级降序逐个服务，一次一个：
> +
> +- Locality0优先级最低。
> +- Locality5优先级最高。
> +
> +关于localities的更多信息和含义，请参阅TCG PC客户端平台TPM 配置文件规范的第3.2节。
> +
> +参考文献
> +========
> +
> +TCG PC客户端平台TPM配置文件（PTP）规范
> +https://trustedcomputinggroup.org/resource/pc-client-platform-tpm-profile-ptp-specification/

