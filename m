Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B598E64AA4
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 02:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785985126; cv=none; b=buHzCheJ2te+eqB7lzi2zxrUFoIGn0KfSM9NBB3fgX+EkU8hctt1ogzj3GD8REOkhCBmeasfLU4TRluFvFn1nGKseeLiZWBTcf3X0NvwsVSD4mFiVsxVDEKdAxSSLDtV5LvQfbYOJ453SzSivHRP0ycE9+Nqn91uS2gZf6s0aoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785985126; c=relaxed/simple;
	bh=fsWRZDHmdhpEVey7PNeiNthgILPDQgnkk9V8OIsmTHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lh7APtwhUtQ11jbkmZbknyeo38IfwVk39JTGyI837wAPkoSvsdd9ihHfLkKdz9tK6ooweyUU5oBGit8lXdwWeADI8Qa/BWxg22LEZ3RUadrgs7hUMKt5FS6wIBDk/pXIwME+uYfz63ryocZyJmTNr+BX8/39bkLYuCi8nbIC/5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKDW0I+T; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKDW0I+T"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7ee4399c3abso1276030a34.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Aug 2026 19:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785985122; x=1786589922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cb3qpMNSQjkPFBRsgWqX2QuJCQXNljC6fDwPCJ7VZBs=;
        b=LKDW0I+TS5kgEgK5PhYaJHnShgS6TQ69xoyA9jq00AsOqWA6ZXC3bpIWJOSNjOrZ+V
         +0B8gISScl19XWere4KZOr7GItxoxVqmVmavHTTLlTe94vnSDzwPjgksiCBoF55PwB8A
         BuQHRWSSNs3YUtGX66F2aB+oMd0X72WsxxAXZiIu8LycsUSB4hfc4SdzintLZLntxaQu
         lxk3tB3f6lx5rheFOkVkMu8WPFu7lftePgBPpHuDm+oSKSPj8x347aGDNrlUGOXtqHZ1
         Bqe4TwzupE98ZPkyZVC6ZB/xLU69VGZc/4XSdBmwlYOuMmhpHy1Q/td9cjKgX5k4jw4Y
         lfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785985122; x=1786589922;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cb3qpMNSQjkPFBRsgWqX2QuJCQXNljC6fDwPCJ7VZBs=;
        b=bqpXQSaClHJsAZXDQVKLLMA5owVjQ4y/1RnVmOnQMvIvNIxyHF2y2IUL52/XFhMU0f
         eZe7X0rz/xhBS0G2jOT7nT3EQqgviVi8j23MMHwkeof9V7/+g72Pu4MdE5g+UROV7qz3
         StfrEv8fkS/iG/V3+90KFJSHA5U+FVSwhJDOcbU1BnvIlMZ4Zw/EfZD35FO5Jku7we1K
         8J/7huc9sNWbGeKpIil5Ty+NHhS29LFqa3S8JBbiExqx7YO1vJprf62AVSsxTRw/5LDP
         SuRM+KMkXklXp7CtmZALqaKZlX1APd1+TYBY1aOUwWnATMxk2jas+CjDiI9B6lgvMAqu
         GeOw==
X-Forwarded-Encrypted: i=1; AHgh+RqY7zoLLMO6aAKQnKnyUEuthIq7nXpKW/uKp9s6CtBJ+ZBtkgvhUzX4+0KvDRECGyY+M2I+fnR3fsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqP1Vyw8oE36NU9BP7jjlpS3f9UbLjVcAPLjQartyhXt0jGUAr
	GtrLPd7ozXcbAlwJ74e+8wgSm1v+xhq0+v1fuFpgDYISm7zWowBzfGEJ
X-Gm-Gg: AR+sD13JTHWwaQ77/SbqhK4fMeACY843Wv4hdJQIxURYBcMv+U7zKjdgcooCjGJm9Kl
	rCNqCsRzIQqV7ZO7qmchRZ/22//tIJb/KQJJLFCDy2IbAnQs0lLeTAhV6+3jFUyQ/iQGpg9NH6o
	loYQiyJd8UPUej7TKdmedSqCy5rKQkcbhCVxto88JAoA8TjyFICuMMEXZIVG5QUnLKk8+sfZDYO
	1KDYYByU0DleZGto5J/FgeYqK/TmK72lsgXD4rpa6ir8I9oQQV2ep6w0GXfeiH121w8iP6hzcGg
	AzPTdjXXOatENn8J4CHppFzW4vmk4BHJJwI9CHIb9WEDofD7IkyYrdf+PSg6G4uqCeLntQPPlT1
	n/EbHD6orW/4xHUpP4kH/BuWUzOsrKtVuFsgV0/uwwrhZ12X4kfaHFwQ7sDf4EHgYLvUJBIxp45
	DqBNzqI4t0IGOOPEGZWk2RLZ7P48vH+U3iWOo0mk2isU9ORRmuDRE3jz5baEAYYos=
X-Received: by 2002:a05:6820:4dcd:b0:6a1:363d:bc42 with SMTP id 006d021491bc7-6ae96c55f8fmr6311046eaf.15.1785985121804;
        Wed, 05 Aug 2026 19:58:41 -0700 (PDT)
Received: from [127.0.0.1] ([144.24.58.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae93cbf7a9sm4532734eaf.2.2026.08.05.19.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 19:58:41 -0700 (PDT)
Message-ID: <c21f0ba6-912d-45ff-8636-b69a0ddc92e4@gmail.com>
Date: Thu, 6 Aug 2026 10:58:27 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/11] tracing: wprobe: Add watchpoint probe event
 based on hardware breakpoint
Content-Language: en-US
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org
References: <178565870538.714490.11309825813968306287.stgit@devnote2>
 <178565875046.714490.17724442147958346980.stgit@devnote2>
 <20260803070356.GV49951@noisy.programming.kicks-ass.net>
 <20260804080035.6b719368c9328bbdd8219867@kernel.org>
 <20260803230840.GJ687043@noisy.programming.kicks-ass.net>
 <20260806090641.e59484ac570b0f842bc930bc@kernel.org>
From: Jinchao Wang <wangjinchao600@gmail.com>
In-Reply-To: <20260806090641.e59484ac570b0f842bc930bc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/6/2026 8:06 AM, Masami Hiramatsu (Google) wrote:
> On Tue, 4 Aug 2026 01:08:40 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
>> On Tue, Aug 04, 2026 at 08:00:35AM +0900, Masami Hiramatsu wrote:
>>> On Mon, 3 Aug 2026 09:03:56 +0200
>>> Peter Zijlstra <peterz@infradead.org> wrote:
>>>
>>>> On Sun, Aug 02, 2026 at 05:19:10PM +0900, Masami Hiramatsu (Google) wrote:
>>>>> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>>>>>
>>>>> Add a new probe event for the hardware breakpoint called wprobe-event.
>>>>> This wprobe allows user to trace (watch) the memory access at the
>>>>> specified memory address.
>>>>
>>>> s/the memory/the kernel memory/
>>>
>>> Indeed.
>>>
>>>>
>>>>> The new syntax is;
>>>>>
>>>>>  w[:[GROUP/]EVENT] [r|w|rw]@[ADDR|SYM][:SIZE] [FETCH_ARGs]
>>>>>
>>>>> User also can use $addr to fetch the accessed address and $value to fetch
>>>>> the accessed memory value (shorthand for '+0($addr)'). No other variables
>>>>> are supported.
>>>>
>>>> This seems limited to kernel addresses only? Should not also userspace
>>>> addresses be supported?
>>>
>>> Hmm, for x86, yes, since it causes a trap after executing (all page fault
>>> are handled). But other architecture like arm64 may not be able to support
>>> it because it needs to enable watchpoint after major page fault.
>>> At this step, I would like to limit it just for kernel memory.
>>
>> Sure, but suppose you were to add userspace, what would the ABI be?
> 
> Ahh, sorry. It was misreading, I mean it should be only for the kernel address,
> not for user space. So I don't want to add userspace. (I answered the first one)
> 
> Thank you,
> 

Keeping wprobe limited to kernel addresses makes sense to me.
Userspace watchpoints are already supported by the perf hardware-breakpoint API,
and supporting them in wprobe would add unnecessary complexity.

An explicit address check could also make this boundary clear.

>>
>> That is, don't paint yourself in a corner etc.
> 
> 

