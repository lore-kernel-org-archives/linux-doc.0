Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67B5257D
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 03:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739244975; cv=none; b=ksDp8J4JULTPJBA1erx/10vb8nItbfsWOHHNptlXP+15tJPT2RgstBPrcEO8pIiknfeWHbnbeaIsHPyObC2OJ5SVrf6SZoOWtequNMLUg+rQEp9eb/N/vTw07D7j8yJV8cwPld2JdG9q5fUWWf1J60VQHBsJh0b80FilZy09Ng4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739244975; c=relaxed/simple;
	bh=Nd3OsttfqSVWQLfY5oRb2oi6U20zKijo9zbybwrV0yQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCdtC4Y80/TOcc0Or4mlA/hHtAYTKTepHcm2CpFCA1CH46t/mozzUUru1TtqPjvI5AqVY0Lb4ir6Qoiv/adaUktws3F1euGvRNRHV7SAVgtGP3c4u3y5+PJO5Ea/pb3tPDnhip1APql+M+AOTLfOrRULZy/vrfzSbPPfZUUGvHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bocfiCTu; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bocfiCTu"
Message-ID: <58695044-2e80-441f-8751-9039010f8819@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739244970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KzzrfqV4w48S+WFxXWZs/n2n6sIfkJwMPFxFr+FJV6A=;
	b=bocfiCTu5k1hj6LslF4zVre0iTEnj9lvsXjKRiXzLXubKzUAO2lBbCFVhlKHUjaZibES8v
	PtXxMC8ppTzdrduFps8RK/J1FwWAbTERyHCZfQwWTBR9tKYu3irKmsl3KWneZngiqqt1Sc
	JT05EvnUa3XR24a1FzPxI/2ac7jwAPg=
Date: Tue, 11 Feb 2025 11:35:53 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/3] docs/zh_CN: Add keys index Chinese translation
To: zhangwei <zhangwei@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn, zhaoyuehui@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1738923258.git.zhangwei@cqsoftware.com.cn>
 <6e55a93d889871a872a3449cb186c28fb38fd3df.1738923258.git.zhangwei@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <6e55a93d889871a872a3449cb186c28fb38fd3df.1738923258.git.zhangwei@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2/7/25 6:18 PM, zhangwei 写道:
> Translate .../security/keys/index.rst into Chinese
>
> Update the translation through commit 5395d312dff0
> ("doc: ReSTify keys-trusted-encrypted.txt")
>
> Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,

Yanteng

> ---
>   .../zh_CN/security/keys/index.rst             | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/security/keys/index.rst
>
> diff --git a/Documentation/translations/zh_CN/security/keys/index.rst b/Documentation/translations/zh_CN/security/keys/index.rst
> new file mode 100644
> index 000000000000..7c28d003fb0a
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/keys/index.rst
> @@ -0,0 +1,22 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/security/keys/index.rst
> +
> +:翻译:
> +
> +
> +========
> +内核密钥
> +========
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +
> +TODOLIST:
> +* core
> +* ecryptfs
> +* request-key
> +* trusted-encrypted
