Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70372D5A07
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 05:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762407320; cv=none; b=RN1J3jKT7R53QH7senzVqvfz6mHlEbCmu51ct89N1tei5tsWm/JuNfl8ndYtb2fracxD6Yty61HplOwtQJBWKD/IWL310DTwVKPGKNVKtaOmdUBzCQQaf+mtUHXiRYM4P26RDoJhWK2ZwaNcjnUcH6b/KtXkDPh7dXEI5OiaiCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762407320; c=relaxed/simple;
	bh=jW8Ecmr5jd9+ijYWXvVMEEtpHOAriPwFDiD3dWIebtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IQUR/WO+8rc1eWI2QK5KqFUcF2iKxNZwEcGTuX+B8OQtu8BjZl9YFbPrql/04lRfeXyOCvlusSgi1nJZ7WyY+AS9x4h5NriSG+go3RLiaEzEb1oLUC0B//4whON5ZCgpaxiH8S8vwryBeoRN0TFmgPgpVMng6CiQ+OMPqVFZ2E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E81LWkWL; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E81LWkWL"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so580263b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 21:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762407318; x=1763012118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xqu+odkC5y2EUQD3P72UD8nqz7ztmWCfwzT6Wx3nK2g=;
        b=E81LWkWLvL/I8cJ/R/PgetxwBlzhMuyDLiFT8Q1Ph20irxQUVXuwc+pEsUuQy+p53t
         Qtz04OzhDE7HEsTAj6edqOgDRxU9caPzs5omrkH+maLrowcY7Di+ZLyyQnSKBY7RIhS5
         u9BAxoAa8FFxzaxghsAbcTyZ5RfXvoalgMFu73Buq2m70SqakCtn7M9FhJc7Tcd96hjv
         zx/iiVYlNHkgZ52L3kFdnwX80mz3n1RPpQQYaiYy1IvWyqSoIyV8RGfISvmx9jf/DAlq
         oi7omQkx2WSiBIkpRb3IhedztVF32Gcw1eAlfVAqTiY6JbpM1Q5Za8PP4MjftM5WNNxE
         GcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762407318; x=1763012118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xqu+odkC5y2EUQD3P72UD8nqz7ztmWCfwzT6Wx3nK2g=;
        b=Ca/bMpbbJmHnGmJ6MZqEzA0FY/HIu3ioLhBCpLoSDL9/E08QWwzQ1rwW49sPSMTY56
         akAxjyoXWjjCpLayv9r8E8x2g5TD6pJ5Ww7/XQL4cD9LRu5bQ9sxbSB3h4YLPgu46RHS
         koNdQZk8nRh3WMJ1iD+bZBL/TzDpzsGPOVB1aa1Q7F3D3FffP68Nts1ojkMq3R7bzq5h
         Eay9l37Fn9YhH3FeOFkGqvkbKofQoBiq6wNrmbGNSVUU2aJIULQ4H7VS8bA7fwEu/d6s
         BWD+bR6nGndMS7WV1mBDhKsr+IShQ3NBgH/NyslMwrQ/e78/iQFF+J6biPzWIaMbTZzc
         +Qrw==
X-Forwarded-Encrypted: i=1; AJvYcCWm9Hqll4FC4XGsQrFt1O2OuQ3qcPkQkoEpeYZVdR0auLXUZZBlPC/p/B2SCXUBF+bhZIF/4wo9320=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH7wnz14N4A162x3bQBvV0fkR/t/3EpPm9oU5hSTixSNc9F44B
	c6uIdEVYQYntiflAw9lDIIgZ0u1SipW96ZnW5dsUDznxn9ubzG3XH4jf
X-Gm-Gg: ASbGnct3uUpCKpltFrvNUCd5AtB5g3SpqSWVKNapOfEpGicGjAi8o+jnDoOCd99m9j7
	gQFF5cnl6Vk1pPF5D4JvmTS2NrT02KoRsI7cqTiO317dBmZfX0IJ5uob5lY4T8lRj1lcBdG7IwV
	JslvDX2U2gSi1V5KGr3hZ7H0fCeLgt7TVAzDVAy8DzB0nPBVWU5zT0pzQsKvLz2nKUdcliFGL9+
	yBiBGkwVQAwBUb1+syHb4iblLTF+D8ku4eEVEElNpMlGmQ/rfkJE9ftDPNEwpZfVGwZUyc6GHwN
	gpF1GolTrs3DxUTvQv+VbejA+h/T6B4b8mUBL3ileK8P2saiG/rb+tVezbTKRRAqsxv3ZdGvDCW
	1w+VGVDi65jgX5HiCKTy/RXARa0BIFKESR6mXQMih2OA5fyJxbR1yvwdBNIiTfdt8ZBk87030Fy
	XKWxp3zaidCoxrit/Aptid
X-Google-Smtp-Source: AGHT+IHdEFv9Zor3bc4Bu4OwuhNr0f57kycevNnexdIDViJx433B1mm7bsY0xFtLkvh/PAGC6U94nQ==
X-Received: by 2002:a05:6a00:1818:b0:7a9:7887:f0fa with SMTP id d2e1a72fcca58-7af6f5e1aebmr2587605b3a.1.1762407317929;
        Wed, 05 Nov 2025 21:35:17 -0800 (PST)
Received: from [192.168.4.196] ([73.222.117.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af82af1907sm1290495b3a.62.2025.11.05.21.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 21:35:17 -0800 (PST)
Message-ID: <c704e7d9-5bc9-43e6-98cf-d28c592b0f3b@gmail.com>
Date: Wed, 5 Nov 2025 21:35:14 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-new v2] mm/memcontrol: Flush stats when write stat file
To: Leon Huang Fu <leon.huangfu@shopee.com>, shakeel.butt@linux.dev
Cc: akpm@linux-foundation.org, cgroups@vger.kernel.org, corbet@lwn.net,
 hannes@cmpxchg.org, jack@suse.cz, joel.granados@kernel.org,
 kyle.meyer@hpe.com, lance.yang@linux.dev, laoar.shao@gmail.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 mclapinski@google.com, mhocko@kernel.org, muchun.song@linux.dev,
 roman.gushchin@linux.dev, yosry.ahmed@linux.dev
References: <6kh6hle2xp75hrtikasequ7qvfyginz7pyttltx6pkli26iir5@oqjmglatjg22>
 <20251106033045.41607-1-leon.huangfu@shopee.com>
Content-Language: en-US
From: JP Kobryn <inwardvessel@gmail.com>
In-Reply-To: <20251106033045.41607-1-leon.huangfu@shopee.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/25 7:30 PM, Leon Huang Fu wrote:
> On Thu, Nov 6, 2025 at 9:19 AM Shakeel Butt <shakeel.butt@linux.dev> wrote:
>>
>> +Yosry, JP
>>
>> On Wed, Nov 05, 2025 at 03:49:16PM +0800, Leon Huang Fu wrote:
>>> On high-core count systems, memory cgroup statistics can become stale
>>> due to per-CPU caching and deferred aggregation. Monitoring tools and
>>> management applications sometimes need guaranteed up-to-date statistics
>>> at specific points in time to make accurate decisions.
>>
>> Can you explain a bit more on your environment where you are seeing
>> stale stats? More specifically, how often the management applications
>> are reading the memcg stats and if these applications are reading memcg
>> stats for each nodes of the cgroup tree.
>>
>> We force flush all the memcg stats at root level every 2 seconds but it
>> seems like that is not enough for your case. I am fine with an explicit
>> way for users to flush the memcg stats. In that way only users who want
>> to has to pay for the flush cost.
>>
> 
> Thanks for the feedback. I encountered this issue while running the LTP
> memcontrol02 test case [1] on a 256-core server with the 6.6.y kernel on XFS,
> where it consistently failed.
> 
> I was aware that Yosry had improved the memory statistics refresh mechanism
> in "mm: memcg: subtree stats flushing and thresholds" [2], so I attempted to
> backport that patchset to 6.6.y [3]. However, even on the 6.15.0-061500-generic
> kernel with those improvements, the test still fails intermittently on XFS.
> 

I'm not against this change, but it might be worth testing on a 6.16 or
later kernel. There were some changes that could affect your
measurements. One is that flushing was isolated to individual subsystems
[0] and the other is that updating stats became lockless [1].

[0] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/kernel/cgroup/rstat.c?h=v6.18-rc4&id=5da3bfa029d6809e192d112f39fca4dbe0137aaf
[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/kernel/cgroup/rstat.c?h=v6.18-rc4&id=36df6e3dbd7e7b074e55fec080012184e2fa3a46
