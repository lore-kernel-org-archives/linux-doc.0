Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A40F430CE9;
	Tue,  4 Aug 2026 07:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827975; cv=none; b=GDbLRmMMuuYgcqgQv1g7Uzk2ErCQcLuRWozVDzdWIWLMSNaY6OzgFyk4+D9QLaumm5BNdBT7+U0iNVH/OEj4u54cFgjsAyTbzFiXkI0vNOK3T6sRCZ6mLQOCtnlnz79dcb8g3bpawtAocqeNEvALALs0Fs1ISXZj2EBdEMNGOXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827975; c=relaxed/simple;
	bh=SMNGzArOz/J72zqNYvHx7LQADrL2ZO6WVYJSbHH+Gqo=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=gdUexEVjEKBCF09h08/6nOkvHkSd5c9/5lMfgAf1qSXjug548RLz2+1V24AJEq6Emb75e2Tr2PSyWYttMReO9dYAq81j50WgnAsu05KTVDvUBxbAYdOlC+m/n84cbPG+TM4+79lxdgUfa/aUsvt02yxFp/x/oM4g+WycrU/0KmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hDlKX0sfcz57DCf;
	Tue, 04 Aug 2026 15:19:28 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 6747JJQv074381;
	Tue, 4 Aug 2026 15:19:19 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 4 Aug 2026 15:19:21 +0800 (CST)
X-Zmail-TransId: 2afc6a719279d8b-43e29
X-Mailer: Zmail v1.0
Message-ID: <202608041519217820D922dVk3H9V6-H82jVyk@zte.com.cn>
In-Reply-To: <20260724220543.7fdb36628c4726dec4c8e649@linux-foundation.org>
References: 2026072415043227725SuvoyQ3SGDOmHLp8tdn@zte.com.cn,20260724220543.7fdb36628c4726dec4c8e649@linux-foundation.org
Date: Tue, 4 Aug 2026 15:19:21 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>
Cc: <corbet@lwn.net>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <xu.xin16@zte.com.cn>,
        <wang.yaxin@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2NCAwLzNdIHRvb2xzL2FjY291bnRpbmc6IHJlZmFjdG9yIGRlbGF5IGZpZWxkcyBhbmQgc2hhcmUgZm9ybWF0X3RpbWVzcGVjKCnCoA==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6747JJQv074381
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 04 Aug 2026 15:19:28 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A719280.000/4hDlKX0sfcz57DCf

>Thanks.  Sashiko asks one question:
>    https://sashiko.dev/#/patchset/2026072415043227725SuvoyQ3SGDOmHLp8tdn@zte.com.cn
>
>> +/*
>> + * Copied from include/uapi/linux/time_types.h
>> + *
>> + * Uses the arch-dependent __kernel_long_t rather than a hardcoded
>> + * 'long' so that x32 (ILP32 on x86_64), where the kernel defines
>> + * __kernel_long_t as 'long long', gets the correct struct layout.
>> + *
>> + * __kernel_long_t is provided by <asm/posix_types.h> - included
>> + * below via <linux/types.h> on most systems, or directly here.
>> + */
>[ ... ]
>> +struct __kernel_old_timespec {
>> +	__kernel_long_t		tv_sec;
>> +	long			tv_nsec;
>Does this hardcoded long for tv_nsec cause an ABI layout mismatch on x32?
>The header comment above explicitly mentions avoiding a hardcoded long to
>ensure x32 gets the correct struct layout, but tv_nsec is defined as long
>here instead of __kernel_long_t. 
>If tools compile against this header on x32, it looks like they will get a
>32-bit tv_nsec instead of the 64-bit value expected by the core kernel UAPI,
>which could result in truncated timestamps or out-of-bounds structure access.

We cannot replace long with __kernel_long_t for tv_nsec.

struct __kernel_old_timespec is a frozen UAPI type with a fixed layout.
On x32, the kernel uses long for tv_nsec, producing a 12-byte struct.
Changing the stub to __kernel_long_t would yield a 16-byte struct,
breaking sizeof() and struct embedding for any tool that includes
this header.  tv_nsec only needs 32 bits (range 0..999,999,999), so
the kernel intentionally uses plain long here.

The comment about preferring __kernel_long_t applies to tv_sec, not
tv_nsec — the stub should, and already does, match the kernel UAPI
header byte-for-byte.

Thanks
Yaxin
