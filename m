Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1757613B584;
	Thu, 28 May 2026 04:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779943133; cv=none; b=FtNy+36iae0jRqGOPsROUy4+nDB1Z3sLsI32YGEnhw+R/ZuPEOzFMOwjQFApy3gxuTU4C10cDHs/PAp+b8O75q9XwkIgu3GaQKYJ86zAu2ZhC+wnG3fVysOPLC5hkxGhUpd8yMrpyTHzAqSF+oXKZLsKnAJP6Voi6GZuG0C0I7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779943133; c=relaxed/simple;
	bh=Sfjvvd0urNEf07kJyoqX3Sy/UGyHjNahfOlLUoNTqDg=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=gP07r5LkFh8pHfPXFBaBKvZbtlobkzKeZFZAv3fmGxNK8gjwIlGZYFB76aKtPR5qv2/33+j6bI7BXeUlkoU7bFIJW4RrPe3Dc5NiIU1a/Vpxa3n2LSFXkbQxZAeVu5YTKYxDqeWSAZi9HdYTLmjaHlIEW+VQYzBAIRJsE+TR3Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gQtzP57sgz8XrrJ;
	Thu, 28 May 2026 12:38:41 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 64S4cVGP080446;
	Thu, 28 May 2026 12:38:31 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 28 May 2026 12:38:31 +0800 (CST)
X-Zmail-TransId: 2afc6a17c6c7d92-9c210
X-Mailer: Zmail v1.0
Message-ID: <20260528123831981q8G996Pn9BETc1_hLOmho@zte.com.cn>
In-Reply-To: <20260527124210.19726c1c89a94b89310e5a47@linux-foundation.org>
References: 20260527215524044fG7XSpgveHiaFhraq0yAi@zte.com.cn,20260527124210.19726c1c89a94b89310e5a47@linux-foundation.org
Date: Thu, 28 May 2026 12:38:31 +0800 (CST)
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
        <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAwLzNdIGRlbGF5dG9wOiBhZGQgZGVsYXkgbWF4LCB0aW1lc3RhbXAgYW5kIHNvcnRpbmcgZm9yIHRvcCBsYXRlbmN5IGFuYWx5c2lz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 64S4cVGP080446
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Thu, 28 May 2026 12:38:41 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A17C6D1.000/4gQtzP57sgz8XrrJ

>> From: Wang Yaxin <wang.yaxin@zte.com.cn>
>> 
>> Previously delaytop only showed average delays. This patch adds:
>> 
>> 1. delay_max fields to track the maximum delay value for each delay type
>>    (cpu, blkio, irq, swapin, freepages, thrashing, compact, wpcopy)
>>    per task.
>> 
>> 2. The -t/--type option displays only the specified delay type with avg/max
>>    values side by side, allowing focused analysis:
>>      delaytop -t cpu    # Show only CPU delay with avg/max
>>      delaytop -t wpcopy # Show Copy-on-Write delay with avg/max
>> 
>> 3. Wall-clock timestamp when each maximum delay occurred, displayed in the
>>    MAX_TIMESTAMP column when using -t/--type option. This enables:
>>    - Identifying the time when a process experienced an abnormal delay max
>>    - Correlating delay max across multiple processes at the same timestamp
>>    - Cross-referencing with logs, traces, or other metrics at that time
>> 
>> 4. When using -t/--type option, tasks are sorted by maximum delay value in
>>    descending order (largest delay first), enabling quick identification of
>>    top N processes with highest delay spikes.
>
>Sounds useful.  Am I correct in assuming that you're a regular user of
>delaytop and that these changes are based on your experience with it?

This indeed comes from latency observation requirements in business
scenarios. Some of our tasks are highly latency-sensitive, so we
need to monitor the "delay max" of specific tasks and detect anomalies
in a timely manner. delaytop is very useful for observing task-level
latency.

Thanks for the review. I will submit the v2 patch to fix the potential
issues as suggested

Thanks
Yaxin
