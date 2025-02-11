Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3098257D
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 03:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739245020; cv=none; b=aT/Ao74x1Pwr+RxZxYZrOPaP/hf5Rq08n3gmqQEeuP21+kpptBNzpfwpn/I1eI226T5Jw2Da0Ta06UaDtoHdWwc3Erhm6gDQsskd8UvZlOb7LJsvDP6VJdMiSsBqab6W04cN+484V8I23vB6tORBUgDtxZPx45xHFwNgYPqqfNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739245020; c=relaxed/simple;
	bh=ZeM36trgGkvIMCwvJrbSXu+2f7Vv9aXH1f+tuci+bjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHobkOzu/V/W5QmCAhDwyaAnb1vjDJ8rOtzrqPoMtrOcnQqFVjTfdPenKoeUJVyxk48EtETdTIxWWv8wB21ePI2nVgbH/AdwZ4WkW2pJ+p4NIJwC6RKGVBXwISRzFRJd4NfSiIbZu1cPpk6xRYoJULPehQGRjhZJcIihYvr67fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=scU74cNq; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="scU74cNq"
Message-ID: <6dd30cc8-a06d-44f4-b190-fb648fca5457@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739245015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQR21hkEJObD5gwv2k6U3G6jUrx1zKZjR5AY8z8K0xQ=;
	b=scU74cNq4nT870giWaa8rcIKyKrgABoJW5F0lvT356qD4c1HPasw0mw4APh/D4mU55X2wR
	xd1DJ6fd/ZaDdH0IIleP2f2rwKiVlCiu+5Mz3AGvXm+GJ3glZSaoKirC1ysZtcg9EwHQLk
	zbCZl+AXlCGPtJZ53aKmpM36dyzWVeE=
Date: Tue, 11 Feb 2025 11:36:40 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 3/3] docs/zh_CN: Add secrets index Chinese translation
To: zhangwei <zhangwei@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn, zhaoyuehui@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1738923258.git.zhangwei@cqsoftware.com.cn>
 <57978b69f643c1aacf78804affde4c819960fd3c.1738923258.git.zhangwei@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <57978b69f643c1aacf78804affde4c819960fd3c.1738923258.git.zhangwei@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2/7/25 6:18 PM, zhangwei 写道:
> Translate .../security/secrets/index.rst into Chinese
>
> Update the translation through commit 7419995a331c
> ("docs: security: Add secrets/coco documentation")
>
> Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,

Yanteng
> ---
>   .../zh_CN/security/secrets/index.rst            | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/security/secrets/index.rst
>
> diff --git a/Documentation/translations/zh_CN/security/secrets/index.rst b/Documentation/translations/zh_CN/security/secrets/index.rst
> new file mode 100644
> index 000000000000..5ea78713f10e
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/secrets/index.rst
> @@ -0,0 +1,17 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/security/secrets/index.rst
> +
> +:翻译:
> +
> +=====================
> +密钥文档
> +=====================
> +
> +.. toctree::
> +
> +
> +TODOLIST:
> +
> +* coco
