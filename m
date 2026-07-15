Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8A530BF70
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 06:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784095794; cv=none; b=a8S322KtieZfMEx3ehMsEIdvjXPGMLtrJQA1qjZpcidmNAg2cXeo1QqgKuC4DAa/eRVN33o4Kf+CmumHVKk9mBj6iQq5hlWODv+CnGGRP7iX79VzbQ1lqEDDkitZxEVewpNVkZdRQsX7qRolOJzPbwMNzFjn1cJ0f7XzXzv7g0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784095794; c=relaxed/simple;
	bh=7OxzrEp3Uph1BCupSIr8N9UDD4zAcSCrSYHlYWLoJOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6sT7PnXhx2MgpKdhuhPLo+yPWElm9of4zZpEZtlkKWtta0x8KiKr67yaNZeUlR2IfCxSHWBa7gUygiJlqb55TtbAQ9spyZINah0ese3UF5CWgmn7wL1F3jjAdjZ/Nnsn939jPp1+crlQRY5nI+HNpZ/uLZIR8OHcNw+Jp8+uk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=otMDBys/; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="otMDBys/"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-902fc790cd5so52752116d6.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 23:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784095792; x=1784700592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ap/ZWoF+KZdLbcGYr44YI42fQGqxWw5khi4hfnBFVEw=;
        b=otMDBys/Bks0jEHGsAvXZpXaFz7hbccWpIXkNDKbiNDxe5suMy8ygPnUWjY0YHAFjC
         t86drEEk9lclnKWtwEzvcuM9lWattRFJgT9NpBH/JlFs6Nn0/OPcp8jDMFpU7RvL5Yv2
         hRVluy+Y+FTr7vqRFWpPX6v6/zJsx7zYOnJVxViqsEVeHyDyNEcc0Ao9MB1TSTC0dYVT
         k+P+7PZdiFfWOslzE+ckIIZCBdRKkz/zRFn3NOHUPTAAqBraFsuptJeQ5Nd52P87rGj6
         co3gnTekgAUrZkLrctvt0db1J+pbbaP0trsfj2fJWKlW4eGM1ZwFf03SYivu+23J45sa
         1Gww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784095792; x=1784700592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ap/ZWoF+KZdLbcGYr44YI42fQGqxWw5khi4hfnBFVEw=;
        b=I+u2S1r176Hc1fbZGach+XN8IE7MxbD73mHemT4Q3JKWr2G5fCXR2RVQfhg6r3kfCs
         DK0fSQx9rxAKwnG1IQULYqNKeFcbUgChDeu0Z4yC3yMAJug2DVDD5rbg+rNaVs9dqi1R
         /E1/QdM0nJElUWkCqzM3SUOCnEcI3c03zcX9i4OvJ1pfuYEi82b4JdoNZSiPE3UAb+P2
         vDwhOaF5faots6GwtzUO0LpgrtKF8WXADIILUT1dTBHGacOTMvcPSHTupFd0SRxfDt5M
         9bSJOwqyBu4fq2GNN2N9/P+bLsimGokMVNwIEB/KSqcGVujverJsyVNE1cxf0GIEcEtq
         n5Gw==
X-Forwarded-Encrypted: i=1; AHgh+RrJV9yWK7lRQ4QRWrRiNpFOSlhL0973v0bREYS3hYWD3i4DKOM2Yzjc/tSorKw6OOVf5e99lJBbuEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCxxCNVqZ38P1j7suTq7JyqHtQvjWCeBzPsQtBwYdVlk+yXG49
	dFFJGKqzPCfzT7xVVCD5xj61cMb5P2EzJgk+0stYR1yVdL47OteN3+NoO4MS7PtTQPPId9nU
X-Gm-Gg: AfdE7clGyKC1cYPY59hL5SsPmVZNNSoq0+Blbto83LGs/4eAu42wu5yznWlnvr31+Hq
	fOFpTVBXq2AF5CIofJCIJj/0eA8pV5C5UruM+rVnmzDLSxRqRfAzMGrlPt0IgfndmcY6Paajl77
	zvWpDgNwyipSC1wbWKGXK5tpPLLmU+JegJLxUFcq6guML28J9hY43N/AnQ/52wBXbD7QIyy4Fdh
	byBHV/g/MJ4t+7yWNUjbH1nyHpXEDyiJ4jYoTCxpeO3t18LJJjRLWY2ZqunMmCPhixQzIex2oRD
	CzLXf3J/S4Zhyp18N/QYDfoJyQwV94+IIKsY4zB5av73MuASsh6q4BKSl6JuJiQCTEiNM00g3Dx
	ZFBKSXeEIdjSmOPQnjvnmgBkvLySkAYUPNimymunQTq3RW9hfinK32MX9Ss+f6DjYX1vQQro9K2
	iEKIcYjAGV9Tp7CYILGgFenAGdhw9tBVD++i3a7ZjwNLJM10vXhLGhfQh4I5cNiqWgJQ==
X-Received: by 2002:a05:620a:7083:b0:914:b9a2:f29d with SMTP id af79cd13be357-93083c95a80mr670626385a.37.1784095792251;
        Tue, 14 Jul 2026 23:09:52 -0700 (PDT)
Received: from [198.18.0.1] ([48.45.163.146])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930759c63fbsm589045485a.22.2026.07.14.23.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 23:09:51 -0700 (PDT)
Message-ID: <bc580a14-bd65-4ec4-a27c-fb81d800dccd@gmail.com>
Date: Wed, 15 Jul 2026 02:09:39 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/13] mm/kwatch: add hardware breakpoint backend
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260714182243.10687-1-wangjinchao600@gmail.com>
 <20260714183206.12688-1-wangjinchao600@gmail.com>
 <20260714171438.226faf7b@gandalf.local.home>
Content-Language: en-US
From: Jinchao Wang <wangjinchao600@gmail.com>
In-Reply-To: <20260714171438.226faf7b@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/14/2026 5:14 PM, Steven Rostedt wrote:
> On Wed, 15 Jul 2026 02:32:06 +0800
> Jinchao Wang <wangjinchao600@gmail.com> wrote:
> 
>> --- /dev/null
>> +++ b/include/trace/events/kwatch.h
>> @@ -0,0 +1,57 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#undef TRACE_SYSTEM
>> +#define TRACE_SYSTEM kwatch
>> +
>> +#if !defined(_TRACE_KWATCH_H) || defined(TRACE_HEADER_MULTI_READ)
>> +#define _TRACE_KWATCH_H
>> +
>> +#include <linux/tracepoint.h>
>> +#include <linux/ptrace.h>
>> +
>> +#define KWATCH_STACK_DEPTH 8
>> +
>> +struct trace_seq;
>> +const char *kwatch_trace_print_stack(struct trace_seq *p,
>> +				     const unsigned long *stack,
>> +				     unsigned int nr);
>> +
>> +TRACE_EVENT(kwatch_hit,
>> +	TP_PROTO(unsigned long ip, unsigned long sp, unsigned long addr,
>> +		 u64 time_ns,
>> +		 unsigned long *stack_entries, unsigned int stack_nr),
>> +	TP_ARGS(ip, sp, addr, time_ns, stack_entries, stack_nr),
>> +
>> +	TP_STRUCT__entry(
>> +		__field(unsigned long, ip)
>> +		__field(unsigned long, sp)
>> +		__field(unsigned long, addr)
>> +		__field(u64, time_ns)
> 
> Move the time_ns to the first field, as unsigned long on 32 bit
> architectures is 4 bytes, and this will make 4 byte "hole" in the event.
Will fix in v2.> 
> 
>> +		__field(unsigned int, stack_nr)
> 
> Make stack_nr the last element for the same reason.

Will fix in v2.

> 
>> +		__array(unsigned long, stack, KWATCH_STACK_DEPTH)
> 
> Make the above a dynamic array based on stack entries.
> 
> 		__dynamic_array(unsigned long, stack, min_t(unsigned int, stack_nr,
> 			  KWATCH_STACK_DEPTH);

Much better than always paying for the full depth - will convert to
__dynamic_array (and use __get_dynamic_array() in TP_fast_assign and
TP_printk as you showed) in v2.

Thank you for the review!

Thanks,
Jinchao

> 
> 
>> +	),
>> +
>> +	TP_fast_assign(
>> +		unsigned int i;
> 		unsigned long *stack = __get_dynamic_array(stack);
>> +
>> +		__entry->ip = ip;
>> +		__entry->sp = sp;
>> +		__entry->addr = addr;
>> +		__entry->time_ns = time_ns;
>> +		__entry->stack_nr = min_t(unsigned int, stack_nr,
>> +					  KWATCH_STACK_DEPTH);
>> +		for (i = 0; i < __entry->stack_nr; i++)
>> +			__entry->stack[i] = stack_entries[i];
> 
> 			stack[i] = stack_entries[i];
> 
>> +	),
>> +
>> +	TP_printk("KWatch HIT: time=%llu.%06lu ip=%pS addr=0x%lx%s",
>> +		  __entry->time_ns / 1000000000ULL,
>> +		  (unsigned long)((__entry->time_ns / 1000ULL) % 1000000ULL),
>> +		  (void *)__entry->ip, __entry->addr,
>> +		  kwatch_trace_print_stack(p, __entry->stack,
> 
> 		  kwatch_trace_print_stack(p, __get_dynamic_array(stack),
> 
>> +					   __entry->stack_nr))
>> +);
>> +
> 
> -- Steve

