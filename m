Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945AE36A34D;
	Tue, 14 Jul 2026 03:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783998516; cv=none; b=d9aMIVtM8Fetmlu6+qZA7Til4U6DaOKOgM0HWYX3To3SNtKqoc0+VxXFvF2QXZaMiAG9pmAzuxOF7igMrBSvUIu6YFY/iegZeO4BvYOo/KCGztQyYKHXa7mlYHx/3LlZiWKgGTpqyy++KW9rV7amLqWFbx4d60MU18moSeTHOH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783998516; c=relaxed/simple;
	bh=/0ktWZomd1VQnqcpx1TyQ0GIN/rpYpzGlulTEsOvmk4=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=nFp4srVo0ZbkLhBwXwJNJinyiXWE7CakfcMXd6utzOuI6HMpwtHDYNzkDGMWwO5zpYRJKVqIpKTHEjIReqPtGWA189LqwKP9l7CQ4iukmSGGlkp8/LCrxiPd9Va6rbf6JNBo7Im23fNwKgVm668HN8TWMSOZzTe81/XTcuu5tgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gzklg4YBZz8XsC9;
	Tue, 14 Jul 2026 11:08:31 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 66E37qnV026777;
	Tue, 14 Jul 2026 11:07:52 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 14 Jul 2026 11:07:53 +0800 (CST)
X-Zmail-TransId: 2afa6a55a809552-5cf55
X-Mailer: Zmail v1.0
Message-ID: <20260714110753517WvFQ2LIOXx9u9wmDXSxTR@zte.com.cn>
In-Reply-To: <20260711173256542-prxp-gSW6zPAMKAp8GOM@zte.com.cn>
References: 20260711173112482SCQEM08VED2PT1pxUYOXk@zte.com.cn,20260711173256542-prxp-gSW6zPAMKAp8GOM@zte.com.cn
Date: Tue, 14 Jul 2026 11:07:53 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <wang.yaxin@zte.com.cn>, <akpm@linux-foundation.org>
Cc: <wang.yaxin@zte.com.cn>, <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>,
        <corbet@lwn.net>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzNdIGRlbGF5dG9wOiByZWZhY3RvciByZXBldGl0aXZlIGRlbGF5IGZpZWxkcyBpbnRvIGFycmF5IHdpdGggZW51bQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 66E37qnV026777
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 14 Jul 2026 11:08:31 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A55A82F.006/4gzklg4YBZz8XsC9

> Replace the 9 groups of (count, delay_total, delay_max, delay_max_ts)
> named fields in struct task_info with a struct delay_metrics array
> indexed by enum delay_type. This eliminates all unsafe pointer
> arithmetic via offsetof() from compare_tasks(),
> field_delay_max_and_ts(), and get_field_delay_values().
> 
> The struct field_desc now stores an enum delay_type index instead of
> four separate unsigned long offset values.
> 
> Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>

Acked-by: Xu Xin <xu.xin16@zte.com.cn>
