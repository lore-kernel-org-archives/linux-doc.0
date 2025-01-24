Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC06F1DB13B
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 09:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737710626; cv=none; b=jRK3aPnG6GA/XNPvEy4nVSfq4ztrC8Dcerad1uViSfOhH6vikDzYv4zkO4HoiKI0ST48ZFiuEB0fjT8pSTO99wylli3U+UTpKX6n09dAKv2O6c2SxK3GNJJivn6WLw/B2GcyPjRuGZ2eiC/wRJBWZjoYgRyId50F1X8GR1Fuxqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737710626; c=relaxed/simple;
	bh=IskieXm19Jn0qacRwLohJdRWoAtdNScnF07tIvd/Bjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kiz3jOEg7P8A6eh6A/o/2Hs+KMYnpxcIsdxL8bDFtruK3v7ew64hAjFXb8ue+uQMDJX2kJPk94k0GoYTmT6ddKUDrfLP9+F2xchkzQHa5Ky/Zz0TiDgghUiRHae3ishI3MUuTeB6xEf8ADeckAzEgShAh9+GqjKSFPtdxUveTas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MVdabUCW; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MVdabUCW"
Message-ID: <43863dec-89c7-4eb2-9cd3-8cf1f3b3e032@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737710622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5G/Lb40xX/R6OyufoD+AdDZ2ltJbskqD7RAFpBHF5/0=;
	b=MVdabUCWhVKUgltiBmAdk+RqNOZj7RfTsjT7PH+NzbVOSBcUslMLmaFPWtcOrVy+Vq1d8H
	OxPRJJVFYbac5rD5CzdOhDiSxINCMoNmb2OzD5eFnYf4d32xqjlTVyqNx/YiYuJ2+ojPB9
	I89AG/xxrNe6ogOoyN6QD9dqmyHjwNQ=
Date: Fri, 24 Jan 2025 17:23:36 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 6/7] docs/zh_CN: Add tpm xen-tpmfront Chinese
 translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1737603330.git.zhaoshuo@cqsoftware.com.cn>
 <570a7a7c6f55996c02dd2e474a4e8cbfa8f9ccc3.1737603330.git.zhaoshuo@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <570a7a7c6f55996c02dd2e474a4e8cbfa8f9ccc3.1737603330.git.zhaoshuo@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2025/1/23 13:17, Shuo Zhao 写道:
> Translate .../security/tpm/xen-tpmfront.rst into Chinese.
>
> Update the translation through commit 9e255e2b9afe
> ("Documentation: drop optional BOMs")
>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   .../translations/zh_CN/security/tpm/index.rst |   2 +-
>   .../zh_CN/security/tpm/xen-tpmfront.rst       | 114 ++++++++++++++++++
>   2 files changed, 115 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/security/tpm/xen-tpmfront.rst
>
> diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
> index dd80816f8af8..bf95200ca586 100644
> --- a/Documentation/translations/zh_CN/security/tpm/index.rst
> +++ b/Documentation/translations/zh_CN/security/tpm/index.rst
> @@ -16,7 +16,7 @@
>      tpm-security
>      tpm_tis
>      tpm_vtpm_proxy
> +   xen-tpmfront
>   
>   TODOLIST:
> -*   xen-tpmfront
>   *   tpm_ftpm_tee
> diff --git a/Documentation/translations/zh_CN/security/tpm/xen-tpmfront.rst b/Documentation/translations/zh_CN/security/tpm/xen-tpmfront.rst
> new file mode 100644
> index 000000000000..fa085d98a99b
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/tpm/xen-tpmfront.rst
> @@ -0,0 +1,114 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/security/tpm/xen-tpmfront.rst
> +
> +:翻译:
> + 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> +
> +================
> +Xen的虚拟TPM接口
> +================
> +
> +作者：Matthew Fioravante (JHUAPL), Daniel De Graaf (NSA)
> +
> +本文档描述了用于Xen的虚拟可信平台模块（vTPM）子系统。假定读者熟悉
> +Xen和Linux的构建和安装，并对TPM和vTPM概念有基本的理解。
> +
> +介绍
> +----
> +
> +这项工作的目标是为虚拟客户操作系统（在Xen中称为DomU）提供TPM功能。这使得
> +程序能够像与物理系统上的TPM交互一样，与虚拟系统中的TPM进行交互。每个客户
> +操作系统都会获得一个唯一的、模拟的软件TPM。然而，vTPM的所有秘密（如密钥、
> +NVRAM 等）由vTPM管理域进行管理，该域将这些秘密封存到物理TPM中。如果创建这
> +些域（管理域、vTPM域和客户域）的过程是可信的，vTPM子系统就能将根植于硬件
> +TPM的信任链扩展到Xen中的虚拟机。vTPM的每个主要组件都作为一个独立的域实现，
> +从而通过虚拟机监控程序（hypervisor）提供安全隔离。
> +
> +这个mini-os vTPM 子系统是建立在IBM和Intel公司之前的vTPM工作基础上的。
> +
> +
> +设计概述
> +--------
> +
> +vTPM的架构描述如下::
> +
> +  +------------------+
> +  |    Linux DomU    | ...
> +  |       |  ^       |
> +  |       v  |       |
> +  |   xen-tpmfront   |
> +  +------------------+
> +          |  ^
> +          v  |
> +  +------------------+
> +  | mini-os/tpmback  |
> +  |       |  ^       |
> +  |       v  |       |
> +  |  vtpm-stubdom    | ...
> +  |       |  ^       |
> +  |       v  |       |
> +  | mini-os/tpmfront |
> +  +------------------+
> +          |  ^
> +          v  |
> +  +------------------+
> +  | mini-os/tpmback  |
> +  |       |  ^       |
> +  |       v  |       |
> +  | vtpmmgr-stubdom  |
> +  |       |  ^       |
> +  |       v  |       |
> +  | mini-os/tpm_tis  |
> +  +------------------+
> +          |  ^
> +          v  |
> +  +------------------+
> +  |   Hardware TPM   |
> +  +------------------+
> +
> +* Linux DomU:
> +               希望使用vTPM的基于Linux的客户机。可能有多个这样的实例。
> +
> +* xen-tpmfront.ko:
> +               Linux内核虚拟TPM前端驱动程序。该驱动程序为基于Linux的DomU提供
> +               vTPM访问。
> +
> +* mini-os/tpmback:
> +               Mini-os TPM后端驱动程序。Linux前端驱动程序通过该后端驱动程序连
> +               接，以便在Linux DomU和其vTPM之间进行通信。该驱动程序还被
> +               vtpmmgr-stubdom用于与vtpm-stubdom通信。
> +
> +* vtpm-stubdom:
> +               一个实现vTPM的mini-os存根域。每个正在运行的vtpm-stubdom实例与系统
> +               上的逻辑vTPM之间有一一对应的关系。vTPM平台配置寄存器（PCRs）通常都
> +               初始化为零。
> +
> +* mini-os/tpmfront:
> +               Mini-os TPM前端驱动程序。vTPM mini-os域vtpm-stubdom使用该驱动程序
> +               与vtpmmgr-stubdom通信。此驱动程序还用于与vTPM域通信的mini-os域，例
> +               如 pv-grub。
> +
> +* vtpmmgr-stubdom:
> +               一个实现vTPM管理器的mini-os域。系统中只有一个vTPM管理器，并且在整个
> +               机器生命周期内应一直运行。此域调节对系统中物理TPM的访问，并确保每个
> +               vTPM的持久状态。
> +
> +* mini-os/tpm_tis:
> +               Mini-osTPM1.2版本TPM 接口规范（TIS）驱动程序。该驱动程序由vtpmmgr-stubdom
> +               用于直接与硬件TPM通信。通信通过将硬件内存页映射到vtpmmgr-stubdom来实现。
> +
> +* 硬件TPM:
> +               固定在主板上的物理 TPM。
> +
> +与Xen的集成
> +-----------
> +
> +vTPM驱动程序的支持已在Xen4.3中通过libxl工具堆栈添加。有关设置vTPM和vTPM
> +管理器存根域的详细信息，请参见Xen文档（docs/misc/vtpm.txt）。一旦存根域
> +运行，与磁盘或网络设备相同，vTPM设备将在域的配置文件中进行设置
> +
> +为了使用诸如IMA（完整性测量架构）等需要在initrd之前加载TPM的功能，必须将
> +xen-tpmfront驱动程序编译到内核中。如果不使用这些功能，驱动程序可以作为
> +模块编译，并像往常一样加载。

