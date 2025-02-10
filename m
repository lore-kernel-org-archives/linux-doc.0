Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7013B1BEF93
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177481; cv=none; b=EI/3nR7eFD+iPkt+y3R7oVHDud+cFCP+t7y5rFQftkRGCGqnOEUC0VsDzV1hseLpYrWk3+CBg2yPQojvLACvutzyb7oagwJKpsuYLcGaHo17xVuhO8Zta8Oopz9RBafjFGJbIb/u/HPgLJ9NqCKExTueQXeNM27ywb8MmqMWChU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177481; c=relaxed/simple;
	bh=VSzvEUtYvjxhDq0cVB8QwX2GVIYpCJhal4JA989MpgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecANZdl3D4K4piKiQceWya/axvHfzz+qBOd5Tfk9WosrKgJvURbVWV3JhQpI0WrraRRkEhGH2Rgx10w17jf7AjJIxny/Q/21TQGD3b/CXRAa7ZSKrJe3VUAD1gYbiheD2vrXrKtCQeswQQupyAiSOBucZxU6s0n29Tn2S1PrdhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kDKx3syL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kDKx3syL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2162b5d2e1fso8091365ad.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 00:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739177479; x=1739782279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=utidBFegZ51RGnMTlrNDFUXWPuVtA3XlELFoY8vS94Q=;
        b=kDKx3syL6JUbijii361+LOUCkKZotau11RmUB/U6nMDXQmkCUx7uOiEmurKL3GCQA1
         aJ09NECtPyIHFxSL4lJf/7oPxKPtkOiVAjdL4usYb/P3YMP9IndfIdx40ph14oPZTC4j
         f8tNoWIhSWsADbHQTdBBaMovrvIFRV3R4ddAoQvsJv2CKEhqW1/EP6Hoh1qrKhug1v+j
         MmkoU8Qzrqj/mi6k5tnrblUkEvQWfy2Wvn6e9onSdvpcjSrDT0YwB0BDqnBuqoKfc7hz
         yV8bn/CEeV3nSmV+Hsv59Jhqo/Q2/+JMxMx115O60oMiXVav9XxbDc32U4z3da8g25dM
         NwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739177479; x=1739782279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utidBFegZ51RGnMTlrNDFUXWPuVtA3XlELFoY8vS94Q=;
        b=YZ5P8j008qWgFHuBjirFwXXQ3fonsVYCU54nJLS9/sIp9vsF4u18Na2+0l292thvtk
         CT+krBKr6ad3ELvsFkxFmkfifP0iMMN3gNazRZmPnhM4K1ib5iE/1XtSqeYQg6S8X6hQ
         80HaICFnUu1tj76fGCc8n0kmbwm52VtrE9tyTRTp59HLHoGIUAw85/93zMpkWTYQ+G8Z
         /g/UP8VPhSTSTrz8KgyRkSz2p9R8mHc7FwNZPsgAhj/h9dAtRMtsyktmdjtA5PRZQC5Y
         WPYtf8OSxri8mvgP3z86FpyyTtgt1XoVXgGZ3C/3jTf9YZfWVlCZ6BBipA1c2fzEOKEa
         KWBA==
X-Forwarded-Encrypted: i=1; AJvYcCXV1quXdDJn5x6HJ4TJm8kIK6sAhcQHunfC8StAIg/QLrme9wkCh870hxtrJnzIVS2hWvQgC55p+gw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZTisM/vCQV4KlAPkgIAxv3cPhcjDGF7xuGA1qDxFsD9homvHg
	l82ZrwyQRDeaPKHvm5W5YK+bf+ixnwZKSTZKbp1K3TPSm8Txf5/NNWUezQQy/tA=
X-Gm-Gg: ASbGnct44Jl5Xu0dLKhBPALHkbMUrW1KVFTbVJCjhyVCn4YoXTb1SjlM2y/vWX6VYtt
	+Pf8YrzRutEmQMw8oECefznJ5V9GtumNCA6PzD4Jnr4yvMDTbr2CNDmd0Yaoe05bv1bKj7OWGB7
	gzE3hve4Io2Eg0R3NMxsI1wQDLuCVjUvU8Kfc7MRR0xhuPRRuCInDWSYyCIiNMnzSAzkLVjecNw
	Z7Q58NVKHbDCyge5besGOElX0agXClz5oMlD0OBp9GdfcJVJi8AOiFh5UqoAOnFvqaFuY8YokIA
	Utdk86WDjhaai3LAkFd7FXeD6yPEoaulG/lA
X-Google-Smtp-Source: AGHT+IFUAdqXpu41mRA06Wl+FpWQb86T1CsWpESUEKDSpA71vOybRUd1sXXsypiSFJ1qz8iIhavMOw==
X-Received: by 2002:a17:902:f791:b0:215:2bfb:3cd7 with SMTP id d9443c01a7336-21f4e758bfamr82501645ad.10.1739177479311;
        Mon, 10 Feb 2025 00:51:19 -0800 (PST)
Received: from [10.4.234.23] ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c7b6sm72982115ad.196.2025.02.10.00.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 00:51:18 -0800 (PST)
Message-ID: <271250dc-d54d-4eb8-9d73-0535d2a24a26@bytedance.com>
Date: Mon, 10 Feb 2025 16:51:09 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH v2 0/3] Fix and cleanup and extend cpu.stat
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Yury Norov
 <yury.norov@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Bitao Hu <yaoma@linux.alibaba.com>, Chen Ridong <chenridong@huawei.com>,
 "open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250125052521.19487-1-wuyun.abel@bytedance.com>
 <bb16ae49-f591-4ab3-8d27-f649619b266b@bytedance.com>
 <Z6J8wbuXgiz_ly-q@slm.duckdns.org>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <Z6J8wbuXgiz_ly-q@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/5/25 4:46 AM, Tejun Heo Wrote:
> On Mon, Feb 03, 2025 at 04:11:27PM +0800, Abel Wu wrote:
>> Ping :)
>>
>> On 1/25/25 1:25 PM, Abel Wu Wrote:
>>> Patch 1: fixes an issue that forceidle time can be inconsistant with
>>> other cputimes.
>>>
>>> Patch 2: cleans up the #ifdef mess in cpu.stat.
> 
> I wasn't sure whether the new code was materially better than the existing.
> Can we try without this patch?
> 
>>> Patch 3: extend run_delay accounting to cgroup to show how severely
>>> a cgroup is stalled.
> 
> I'm not necessarily against adding this. Johannes, what do you think?

Hi Johannes, it would be very appreciated if you can take a look at this.
The newest version is:

https://lore.kernel.org/lkml/20250209061322.15260-3-wuyun.abel@bytedance.com/

Thanks!

