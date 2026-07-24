Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10A94908BA;
	Fri, 24 Jul 2026 07:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784876572; cv=none; b=UOA3E2QqeDocWGIffuAEj1TuP090w7l2wifMVQcu1KtZi1pam1Q2evl2RgPSyyZ+iRb5RteXtH/8fIxppr5j82mTD7Sm+R+IuhOlc56AijER/OIJwWPhBltX4T9L+NUxbiZCmDo5F4YnPTIOIPpcfOrELGKtLEcBHGFlaC/Y9p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784876572; c=relaxed/simple;
	bh=fyYOn52f02mNvOG1SLLhq+Zsf6aq28K5dTIgc5ehU1Q=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=j3Ji02ApO1NDXMZxmWz5R8yxRGphQZo0NVeYC/6XCFUOywbiryb4EzS/kMVkeOU/HCp7K+x0+Zfojk4Jbaxm6OJsFXeLYB/d4vED4GGv20NljGcareQd6vvwWn6tYEOGUlLW3B0mZ7oaix36u0DBO8Xi6hFrVfeSqjl/21Y4Myk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4h5zTM0rhBz8Xrrv;
	Fri, 24 Jul 2026 15:02:47 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 66O72Zxa076189;
	Fri, 24 Jul 2026 15:02:35 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 24 Jul 2026 15:02:37 +0800 (CST)
X-Zmail-TransId: 2afa6a630e0d80f-c6de8
X-Mailer: Zmail v1.0
Message-ID: <20260724150237829qtdOI97kfw3f_HTM4YoD3@zte.com.cn>
In-Reply-To: <20260719233500.11f6cda016d60b286d0ee2b5@linux-foundation.org>
References: 20260718133420538UvsJFurowueTqxAaZ1cRP@zte.com.cn,20260719233500.11f6cda016d60b286d0ee2b5@linux-foundation.org
Date: Fri, 24 Jul 2026 15:02:37 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <akpm@linux-foundation.org>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <xu.xin16@zte.com.cn>, <wang.yaxin@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MyAwLzNdIHRvb2xzL2FjY291bnRpbmc6IHJlZmFjdG9yIGRlbGF5IGZpZWxkcyBhbmQgc2hhcmUgZm9ybWF0X3RpbWVzcGVjKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 66O72Zxa076189
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 24 Jul 2026 15:02:47 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A630E17.000/4h5zTM0rhBz8Xrrv

>>  CFLAGS := -I../include/uapi/
>>  
>>  PROGS := getdelays procacct delaytop
>> +OBJS := format_timespec.o
>>  
>>  all: $(PROGS)
>>  
>> +getdelays delaytop: %: %.o $(OBJS)
>> +	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)
>> +
>> +procacct: procacct.o
>> +	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)
>Does omitting $(CFLAGS) here break builds that require compiler flags during
>the link phase (such as -m32 for 32-bit cross-compilation)? 
>If CFLAGS is passed by the user or build system, it will be applied during
>object compilation but dropped during this link phase, which could cause
>architecture mismatches or missing symbol errors.

The Makefile's CFLAGS is only `-I../include/uapi/` — a compile-time flag.
The hypothetical `-m32` scenario requires explicit user override, which is
not how this Makefile is used in practice. Other kernel tools
(e.g. tools/mm/, tools/bpf/) also omit CFLAGS from link rules.

In our view, this review comment is not problematic, so no fix is needed.

>> +struct __kernel_old_timeval {
>> +	__kernel_long_t		tv_sec;
>> +	__kernel_long_t		tv_usec;
>> +};
>> +
>> +struct __kernel_old_timespec {
>> +	__kernel_long_t		tv_sec;
>> +	long			tv_nsec;
>Does missing the #ifndef __kernel_old_timeval guard around struct
>__kernel_old_timeval cause struct redefinition errors on architectures like
>sparc64, which define it as a macro in asm/posix_types.h?
>Also, does typing tv_nsec as long instead of __kernel_long_t in struct
>__kernel_old_timespec change the struct layout on x32, where long is 32-bit
>but __kernel_long_t is a 64-bit long long?

The issue pointed out in the first review comment does exist and will be
fixed in the next version.

The kernel's own `include/uapi/linux/time_types.h` uses plain `long`
for `tv_nsec`, not `__kernel_long_t`. The stub matches the kernel header
exactly 

In our view, the second review comment is not problematic, so no fix is needed.

>> @@ -728,10 +728,14 @@ static void fetch_and_fill_task_info(int pid, const char *comm)
>>  	nl_len = GENLMSG_PAYLOAD(&resp.n);
>>  	na = (struct nlattr *) GENLMSG_DATA(&resp);
>>  	while (nl_len > 0) {
>> +		if (na->nla_len < NLA_HDRLEN)
>> +			break;
>Could these netlink attribute header length checks be mentioned in the commit
>message or separated into a different patch?
>The commit message only describes simplifying the time_t overflow check
>and fixing a minor alignment issue, but the patch also silently introduces
>these minimum length checks in the attribute parsing loops across delaytop.c
>and getdelays.c.
>While these checks prevent infinite loops on malformed netlink messages,
>introducing functional changes without documenting them can make the review
>process more difficult.

We used to put modification logs in the changelog (on the cover), which is
not very intuitive. In the next version, we will update functional change
descriptions to the commit messages instead.

Thanks
Yaxin
