Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8C03E5EC0;
	Tue,  4 Aug 2026 09:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785834302; cv=none; b=rV6Z9f3QZZa3z6Vf7oHaS3UkNmhJmMH4rd8vIp0HO/vhaGIoZe0ZU/h0H4ezNAOyXlErvLHPJIQxlB95UBoz/4h5Qc7YtwD1quYILSb7meF4LEWtfHbriIo1KKuYXHl0An7bC6vcRO/6S3zY00wzD8xAKYXV1w7p86NsUVgR5QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785834302; c=relaxed/simple;
	bh=mkU+vD82/moEzc7Qbc2AQyIwtg30hDafXwtMtJGgr8M=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=SqGrtcPCnhkmbirEWRhkF5mKoa+DvVDaAWDtndPmMDim76kD7pB+R0wN+s/UnU2Jejh2mAoNNMx8jioM0eM0a8uBAPLQA4IrwMdGjYGmeghkk6iOse6E7lLbOpUzluX9IPMQP1/LLJKOcj4HP1qSyF87j12eqMVr1rscNjhxxJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hDng749Zcz8Xrrn;
	Tue, 04 Aug 2026 17:04:51 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 67494hGN056542;
	Tue, 4 Aug 2026 17:04:43 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 4 Aug 2026 17:04:45 +0800 (CST)
X-Zmail-TransId: 2afb6a71ab2d1bf-0c195
X-Mailer: Zmail v1.0
Message-ID: <20260804170445844sKtMq7g5zyVeX3R4pGpsv@zte.com.cn>
In-Reply-To: <20260804093109-0cb2911d-72cc-41af-84dc-e0ca14e16f96@linutronix.de>
References: 20260724220543.7fdb36628c4726dec4c8e649@linux-foundation.org,202608041519217820D922dVk3H9V6-H82jVyk@zte.com.cn,20260804093109-0cb2911d-72cc-41af-84dc-e0ca14e16f96@linutronix.de
Date: Tue, 4 Aug 2026 17:04:45 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <thomas.weissschuh@linutronix.de>
Cc: <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2NCAwLzNdIHRvb2xzL2FjY291bnRpbmc6IHJlZmFjdG9yIGRlbGF5IGZpZWxkcyBhbmQgc2hhcmUgZm9ybWF0X3RpbWVzcGVjKCnCoA==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 67494hGN056542
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 04 Aug 2026 17:04:51 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A71AB33.000/4hDng749Zcz8Xrrn

>> >> +struct __kernel_old_timespec {
>> >> +	__kernel_long_t		tv_sec;
>> >> +	long			tv_nsec;
>> >Does this hardcoded long for tv_nsec cause an ABI layout mismatch on x32?
>> >The header comment above explicitly mentions avoiding a hardcoded long to
>> >ensure x32 gets the correct struct layout, but tv_nsec is defined as long
>> >here instead of __kernel_long_t. 
>> >If tools compile against this header on x32, it looks like they will get a
>> >32-bit tv_nsec instead of the 64-bit value expected by the core kernel UAPI,
>> >which could result in truncated timestamps or out-of-bounds structure access.
>> 
>> We cannot replace long with __kernel_long_t for tv_nsec.
>
>The UAPI *is* in fact about to use __kernel_long_t for tv_nsec.
>See commit 79ced850e549 ("y2038: uapi: Use 64-bit
>__kernel_old_timespec::tv_nsec on x32") in -next.

Thanks for the clarification. I've verified that commit 79ced850e549 has
been merged into the next branch, where upstream changed `tv_nsec` of
`__kernel_old_timespec` to `__kernel_long_t`. I will update this
structure definition in our local header to keep our UAPI definitions
aligned with the mainline kernel.

Thanks
Yaxin
