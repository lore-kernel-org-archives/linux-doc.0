Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA763B961B
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 06:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366602; cv=none; b=XWaDxqlXc1DI1/cu1kwQ/oCCfcl8WdjgTpbbZEY/Gi7T6MgIvXuktfW2vKlelyHMUsuW6q90jU5VO9kz34FMs2P+LczZ+A/Uk2c38KH9TMonhVL1J//xbzyhNCATuV3Te2Nn/ESlwGsv2HHsLjf5XQ6eOabGwJD5cAKP3jm18Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366602; c=relaxed/simple;
	bh=/XPZyDVtW0FyskQoBI95DtRJ8HUoFeRyY9lxEGJfA4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sIxtzuoqCh6nUu+BoZo54Jaawm/lgAldNOqw5xGhdZV1PAunDHuzNR9dBYkLPych/TtbKrbTp+KqHTJjhY2nsNs52jIct7KhDYlJQ1trRkRo2l4O4d1qEGupYdIqOAw3cJ02SKtMZ1NydWRTw7Z8K7M619s1lVP+g+voo5EmBgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W552ZJ6u; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W552ZJ6u"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4f0d37f93so725686a34.2
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 23:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789366599; x=1789971399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9l6TcC8yxA6i44GPZCrTXq0qAIOnsPIUcD2ascLJ07c=;
        b=W552ZJ6uST3QspZ1bSUIlGAs22oYWdsHf4HZfGTiEZbR6p3jvfrscNac5wZpvomqeT
         VKBCS2RBpCQTU2NDGnsvT6wDaEQEzAoxjrqg6QywnEgKb7fjQmKNuVYK6tAA/iU15z7I
         xh9MRObLat2gr0O1aUVsb9ausENcR2N6ji6uf1k1j1paSq7dF18BlBF6kXqBXeQ3sBP8
         4lp762pmqKnPIp3+CQqBwTAIHJoEVxFB26b0HL6J04y4dECqmM26NoerTqf8BcLTxLiG
         qFRhjL2crCl0U0P/F5/1DfZGDRVd+lwQtyKhXv7RP+N2OMVzGxiDevCnc44yPZlzM11D
         mdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789366599; x=1789971399;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9l6TcC8yxA6i44GPZCrTXq0qAIOnsPIUcD2ascLJ07c=;
        b=BBIh3ykaPBuOaxmry1YevwfuFwStITnb4OISdB21ZhIniCy6qnT9KNsaQ0zNsPfgyP
         K03O012N0DNZEf0likBSQcpMJbU2v4UryUde+kUUrd9mS8gsPFcuTdpLtODPprdm/wH6
         wpjrcq7dM68Giq+54rQDlFm7cuBn7oH+plSgxR8Vz1shzge50+GdJITFKZyX7QVzkkz4
         dDexkNOx3NyfGdX/2XI3KHH5HcCk3BvLSxSQlR5oaebd89p9pgg+vHXGdRw0xZlSBGOh
         PhcsjSh8UCq2LhqUezJC0bJ0Z5Nd6sa7YFXp4C5cXJvmoqV9oTmFGn+Zzzy9RS1hxjVd
         NFBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaZ7zyq2vbUa3Minqu6o70n7aOZirs6D9Jg6oKiJMSDirYgYZD8dhGgiUscBx9PmhgnFPsQQf4Zk0=@vger.kernel.org
X-Gm-Message-State: AFuF++lLeRIm2wV8bhcEFX7MDzy2dmJQtPZ8hZrerkncGpPMqJifawJG
	G9w7PilbtSXCn+ZEsGYzZfUVClQqWcncCZhVa2Ga+usbHelfv7CDdxyY
X-Gm-Gg: AYBFou2q/+UXGLl37VcJI/MeT3INFBFAsInDXLGsVz9aPmV762bK5F0KGpeY0xLQgVo
	sjt1i/xwsrJiZp+g5fMXiHoXaCVN+F4Ah/G7AfERITPZ8TKMPb88dB8hC4rmEoRBMf6pJnUkCL4
	H/eH+0eQvjPczD3XO9m3UtMJE6S5pCPVMBRK9xE6BS0+GNt7v2jR0k3Da/agTNxafYeDEIBpiZQ
	vLJAyXX1yVRlFZTDsXhNQzCqU19MoYp2e1v7Pq6DEtP5t1zrLSXZHnv5wJHi9/ZdoCKAIKc01k9
	RQCOhPlWx5mvMWK+/pqAuC7POXWr9CMsDMqRBV1He4a6F14NQYPHSZ4ytcaDenEaPc6bPewOoxY
	N/rwc22Eqmh93HZwm25BdxGwT3S/3lBwJyVFY6nEeFLIPHpW5U18JAeICg9Uw2q4K4d5M5rFiIo
	qjF0CJy48jK4rTJ46RGoyA+CSLmCchGdyQRz2ziDL7FVzGmLV8RWOg4wwG8lwTgdnX7xWjJTJR
X-Received: by 2002:a05:6830:4413:b0:800:a53f:707c with SMTP id 46e09a7af769-80897094151mr638955a34.2.1789366599490;
        Sun, 13 Sep 2026 23:16:39 -0700 (PDT)
Received: from [127.0.0.1] ([144.24.58.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f5ffd82bsm10128992a34.11.2026.09.13.23.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:16:38 -0700 (PDT)
Message-ID: <da053ac4-f4ee-4f1f-9bcd-b2f04b13f407@gmail.com>
Date: Mon, 14 Sep 2026 14:16:30 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/12] tracing: wprobe: x86: Add wprobe for watchpoint
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org
References: <178875277830.93794.14247844688761142429.stgit@devnote2>
 <307d6fd5-a8fa-4777-b513-9a8cce46f38a@gmail.com>
 <20260912223658.c4495241023f72e3cf48bf0c@kernel.org>
Content-Language: en-US
From: Jinchao Wang <wangjinchao600@gmail.com>
In-Reply-To: <20260912223658.c4495241023f72e3cf48bf0c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/12/2026 9:36 PM, Masami Hiramatsu (Google) wrote:
> On Fri, 11 Sep 2026 15:27:41 +0800
> Jinchao Wang <wangjinchao600@gmail.com> wrote:
> 
>> Hi Masami,
>>
>> I see the watch address update currently goes irq_work -> workqueue ->
>> on_each_cpu().  I would like to discuss that path.
>>
>> The race window wprobe may be used to watch can be very narrow --
>> sometimes it lives entirely inside a single function -- and the trigger
>> does not always run in in_task() context.  The current path defers the
>> update to a work item, so by the time the debug registers are updated the
>> window may already be gone.
>>
>> Now that we have modify_local_hw_breakpoint_addr(), the trigger could arm
>> the local CPU directly and use smp_call_function_single_async() for the
>> remote ones.  That should improve the overlap between the watch and the window.
> 
> Hm, that is a good idea. Maybe we can check the current context and if
> possible call modify_local_hw_breakcpoint_addr() directly for current
> CPU core, and kick irq_work for other cores.
> Does this make sense for you?

Yes, that makes sense.

> 
> Thanks,
> 
>>
>> What do you think?
>>
>> Thanks,
>> Jinchao
> 
> 

