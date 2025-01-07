Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617A6198E78
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 08:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736239986; cv=none; b=MAMEG9I+orJXjgvzm5rwwKGJjngtvpx7M2NWvuE3XBi3g4pCLYq7bwsWEtGr82BCJ2T6oDBIwspHi4ZKJ1MCEQ6182k9Swm7Vn2iXBg2YSITu2L6Vytmb56axdVf+hboTgDbD2M2IPRJssTkpwBeKPPmDc4t0kICuM4uMDvPogs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736239986; c=relaxed/simple;
	bh=RAZ8B2TjHNV2J3bRcyQ3voja76blAjKla1lrERpShDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNiKXsHo84HKu2/EI0s8L3f5T9a5qeLifHPoR+HUxBkU0SrNHxP1+9gI8r8tyEyOgaJvufB9/I/jzFX7RAGcrH+bKRXBPygGrPJrPIgXi5Ju9yxPjlwUff87xohmKD0SZFG16VQcISqxsuBmFZ29XopNY6PKe1+m1ktb+fIaE98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tI9DObh9; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tI9DObh9"
Message-ID: <dce2df44-62f9-4ade-a51d-42828171884f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736239975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nxPCTW6t6hAIX3dNXOZF3PlV+zZHru904oityxwPfLU=;
	b=tI9DObh9ybvORsqazqLUyNKiB1nZDXE+MEAe7hgGXuIWYm//ZtX5d2saG7SjcTmrwQ/kT6
	LKR9SswwdIga8Hw4ynffv51ZFNWQ0tJUEQJzjs+8X6Ni/7Zc5cA5d0sqcVioWDRNUfEgsC
	DrQeH2e9ltuFpqWR1b3VUT0q8pIxsHk=
Date: Tue, 7 Jan 2025 16:52:03 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: Add security IMA-templates Chinese
 translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <20241231072236.18836-1-zhaoshuo@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20241231072236.18836-1-zhaoshuo@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2024/12/31 15:22, Shuo Zhao 写道:
> Translate .../security/IMA-templates.rst into Chinese.
>
> Update the translation through commit 398c42e2c46c
> ("ima: support fs-verity file digest based version 3 signatures").
>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Reviewed-by: Yanteng Si <siyanteng@linux.dev>

Thanks,
Yanteng
> ---
>   .../zh_CN/security/IMA-templates.rst          | 97 +++++++++++++++++++
>   .../translations/zh_CN/security/index.rst     |  2 +-
>   2 files changed, 98 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/security/IMA-templates.rst
>
> diff --git a/Documentation/translations/zh_CN/security/IMA-templates.rst b/Documentation/translations/zh_CN/security/IMA-templates.rst
> new file mode 100644
> index 000000000000..b391c9d03882
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/IMA-templates.rst
> @@ -0,0 +1,97 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/security/IMA-templates.rst
> +
> +:翻译:
> + 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> +
> +===============
> +IMA模板管理机制
> +===============
> +
> +
> +介绍
> +====
> +
> +原始的 ``ima`` 模板是固定长度的，包含文件数据的哈希值和路径名。文件数据
> +哈希值限制为20字节(md5/sha1)。路径名是一个以空字符终止的字符串，长度限
> +制为255个字符内。
> +为了克服这些限制并添加额外的文件元数据，通过定义额外的模板来扩展当前版本
> +的IMA这是有必要的。例如，可能报告的信息包括索引节点的 UID/GID或索引节点
> +及访问它进程的LSM标签。
> +
> +然而，引入这个功能的主要问题是，每次定义一个新模板时，生成和显示度量列表
> +的函数都需要包含处理新格式的代码，因此，这些函数的规模随着时间的推移会
> +显著增长。
> +
> +提出的解决方案通过将模板管理与其余IMA代码分离来解决这个问题。该解决方案
> +的核心是定义两个新的数据结构：一个是模板描述符，用于确定度量列表中应包含
> +哪些信息；另一个是模板字段，用于生成和显示给定类型的数据。
> +
> +使用这些结构管理模板非常简单。为了支持一种新的数据类型，开发人员定义字段
> +标识符，并实现两个函数，分别为init()和show()，用于生成和显示度量条目。
> +定义一个新的模板描述符需要通过 ``ima_template_fmt`` 内核命令行参数指定
> +模板格式(一个由 ``|`` 字符分隔的字段标识符字符串)。在启动时，IMA通过将格
> +式转换从支持的模板字段集合中选取模板字段数组，来初始化所选的模板描述符。
> +
> +在初始化步骤之后，IMA将调用 ``ima_alloc_init_template()`` (这是为新模板
> +管理机制所打补丁中定义的新函数)，通过使用在内核配置选择的模板描述符或者新引
> +入的 ``ima_template`` 和 ``ima_template_fmt`` 内核命令行参数，生成一个新
> +的度量条目。在这一阶段，新架构的优势得以清晰展示：后一个函数将不会包含处理给
> +定模板的特定代码，而是简单地调用与所选模板描述符关联的模板字段的 ``init()``
> +方法，并将结果(指向已分配数据的指针和数据长度)存储在度量条目结构中。
> +
> +相同的机制也用于显示度量条目。函数 ``ima[_ascii]_measurements_show()`` 会为
> +每个条目检索用于生成该条目的模板描述符，并为模板字段结构数组中的每一项调用show()
> +方法。
> +
> +
> +
> +支持的模板字段和描述符
> +======================
> +
> +下面是支持的模板字段列表 ``('<identifier>': description)`` ，可以通过将其标识符
> +添加到格式字符串中用于定义新的模板描述符(后续将添加对更多数据类型的支持):
> +
> + - 'd'：事件的摘要(即测量文件的摘要)，通过SHA1或MD5哈希算法计算；
> + - 'n'：事件的名称(即文件名)，大小至多255字节；
> + - 'd-ng'：事件的摘要，通过任意哈希算法计算(字段格式：<hash algo>:digest)；
> + - 'd-ngv2'：与d-ng相同，但以"ima"或"verity"摘要类型为前缀
> +   (字段格式：<digest type>:<hash algo>:digest)；
> + - 'd-modsig'：不含附加modsig的事件摘要；
> + - 'n-ng'：事件的名称，没有大小限制；
> + - 'sig'：文件签名，基于文件的/文件系统验证的摘要[1]，或EVM便携式签名，
> +   如果'security.ima'包含文件哈希；
> + - 'modsig'：附加的文件签名；
> + - 'buf'：用于生成哈希的缓冲区数据，没有大小限制；
> + - 'evmsig'：EVM便携式签名；
> + - 'iuid'：索引节点的UID；
> + - 'igid'：索引节点的GID；
> + - 'imode'：索引节点的模式；
> + - 'xattrnames'：xattr名称的列表(由``|``分隔)，仅当xattr存在时；
> + - 'xattrlengths'：xattr长度的列表(u32)，仅当xattr存在时；
> + - 'xattrvalues'：xattr值的列表；
> +
> +
> +下面是已定义的模板描述符列表：
> +
> + - "ima"：其格式是 ``d|n`` ；
> + - "ima-ng"(默认)：其格式是 ``d-ng|n-ng`` ；
> + - "ima-ngv2"：其格式是 ``d-ngv2|n-ng`` ；
> + - "ima-sig"：其格式是 ``d-ng|n-ng|sig`` ；
> + - "ima-sigv2"：其格式是 ``d-ngv2|n-ng|sig`` ；
> + - "ima-buf"：其格式是 ``d-ng|n-ng|buf`` ；
> + - "ima-modsig"：其格式是 ``d-ng|n-ng|sig|d-modsig|modsig`` ；
> + - "evm-sig"：其格式是 ``d-ng|n-ng|evmsig|xattrnames|xattrlengths|xattrvalues|iuid|igid|imode`` ；
> +
> +
> +
> +使用
> +====
> +
> +要指定用于生成度量条目的模板描述符，目前支持以下方法:
> +
> + - 从内核配置所支持模板描述符中选择一个模板描述符( ``ima-ng`` 是默认选择)；
> + - 通过 ``ima_template=`` 参数从内核命令行指定模板描述符名称；
> + - 通过内核命令行参数 ``ima_template_fmt=`` 注册一个具有自定义格式的新模板描述符。
> diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
> index 3f68e3145322..bf42930c6fac 100644
> --- a/Documentation/translations/zh_CN/security/index.rst
> +++ b/Documentation/translations/zh_CN/security/index.rst
> @@ -15,6 +15,7 @@
>   .. toctree::
>      :maxdepth: 1
>   
> +   IMA-templates
>      lsm
>      siphash
>      digsig
> @@ -23,7 +24,6 @@
>   TODOLIST:
>   * credentials
>   * snp-tdx-threat-model
> -* IMA-templates
>   * keys/index
>   * lsm-development
>   * sak

