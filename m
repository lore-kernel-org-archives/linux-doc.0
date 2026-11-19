Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795092419;
	b=uxpBJeZ94+jQzFXVQhBUa/VLQVlScZPaZZpQCbL46PWG19TaeduRwdyK1/QdLQrusfcC
	 O7lFSA9d7pXE/9E3KC5qRrTXkj+Kun9DBIvyymXKVSHRfrffZqVPOiro04BTJgrX07Efx
	 XmdLh1siMVFUkXRX0vQuKwWAhHuQGafryaVCO+VxE2eXKEcN83/BoAlqjarcVdexMo/JW
	 FpqtqnBq5gBgvvVvyOPPppCW6Nn9kCyzVIRzJDZhM3cJ8fvscRVX5G86ZFgrDCj4g174P
	 NDVo3+pyWixHZr+yY1HDI0y6GsAaxjg35WNGDJ3RPpNVMyskOGQHqh2L19fWaB/B9Hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:X-Original-From:From:Mime-Version:User-Agent:
	 Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
	b=XI6l/j4nxVXOxLcEnuqq3105C7dD0AgqJpKXvKJFCV9avFT+CrlCue6ISzopDtsO8Bua
	 XWVmeaXKFuceQffFRPDXVNdmh0cKs6M1WEWJdR5w2BXPUuaXSEibqV806C8v5u+yfbY/s
	 jXVGGtSfw9zNrPPeD8I4G6RVkb4UDmgBws5rGX6a7kbMJqX6V3GxIX/fozmViOlu/ImQZ
	 C3I2mRTqyL4gWvkQTr9m07s82WQKtdGwG8+koPie7ubNDMLB1tPt1dXzwFGhoRY4G9U58
	 MuoWqf34Go67B8KRjMZz6HaKCakwjy9bO7PNHJp4YHhewxKj5j015sbPh//C3EGUAgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PVBcFpas;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE39B606A325
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 12:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE39B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PVBcFpas
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b335eeb340so18995857b3.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 04:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795092418; cv=none;
        d=google.com; s=arc-20260327;
        b=le+zJ5PEMQa1LRneybsdt7GN5NOKUGQeuSQAnEpDimfxQM6AqkE+Ex2r/GZJibOLVe
         sgdd6NWwXfS1rhZsfl9CfMVb0KeR48mAUV9Y1hGKWIaWieSuSdREGe2skHGlquRtkxI4
         tKk6Zqiz4JpbyTzdr0BF1R/9X2OaTPX0YruRkkXnTZE2e2bZeyjbYw01C5i/3qZaP5yA
         3M2wUwtQ8r5xOAi97jpFdEjiPtn/ZdgeXBXx8XjOyQmzndLnJKtfM+kONDrsE96Pv8fs
         52wTJMTcJ43oT/D5RXp5i8k3F0SntimHWh7R5ASy8hn/UM+b3UuzafdqIX2rVCwt3fDQ
         qkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:mime-version:from
         :references:in-reply-to:dkim-signature;
        bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
        fh=/MpHYTF3dXy8zhu45vey/xoKVjdhYCHwChihY5lh0RE=;
        b=VH99SJpXJ0DWeOAYeKu0BOqyhzJcX3NTcGhX2JH84OHLp5EtTXBdoMzmWMqj2hLqOV
         GgZCGs1s3pkJRMMLRwYcSCu1jQ0gWVdh0t7jrTCff1nYHHy67yr1ZI95oFsq7OIb+9s7
         0Fwb3ILm3IoGf26LIKKAMyE95vlVbBjSFwFy+NxquPb8aOLWP4Wr0fMMsUKCNP57kAJb
         AbdlPYfpTHXEQU2IdC1PxQMLJRPUZR0/6ymkfFpjoK4y6bE9kr7Og3eQvETkgugmw7HV
         cYitjdjewrb152U/vV8KdgzPqiWm0cik/8INjtAIdT2hu5hXrg4HG8mPmNZ7aANQHqUl
         T31Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795092418; x=1795697218; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
        b=PVBcFpas1O8smDHU+vAfrzG+rYFHrAQDcyNbr5hyCzToAVKVsl0IlJXf1fAxNIbcMS
         fFaMWPOIOO67Ge+lHCBqORfslCkWcgsu2TU0CDhp0qWnbg6+8wd7eFEzAt8d9VaDLdM2
         pIjVG+zDtEvZo9sQ2wU79yJo/+foxmdaxtCiOxYBKT/lgB6jYwTQteAv7sk54loaJZia
         mX5J+YP3UglKO1N9wQZ9BdscQDjZ++aBfNEbhKM2S5kXHY6gfg9HbHNxGiT/9zxGPwAu
         Yem+qoolbm7IdPNK2zTIsK6XZBZs0XnAfsi3gMxB3mjZAeIml7J0XqLZc4D9Hma1qGqM
         px/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092418; x=1795697218;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
        b=HjBN2pl3uvAmYbDq8YU0C+JfnjgziIoUgqs4V/+/WRy9BVblgNp9a8+JJ20VwmST8b
         N0IWKkUQe4yYdw8yYgRaf/TzHGtHBXK13s7ZcQjsb+XIu59JU48T4DMouEFw5wzFrk6x
         TIAQoCXu7FxfiFyW0m40j8KSqIC/fF/RBYsO8sLv7poP3wKrt+UXjgNGZeUVzU72VpbF
         H4p12YuCi8VBgq/0Nq+Tv/8xiKWMm9/J4XbuejKkQ4MQXDOm92s6eMsUXmLPe5NtzHrv
         iySyZtE74i8QRyDaO7wK4hniW+L2k95JteIDkEPnUMbu2p8UMxoEjJGtd3f8sbe/7/2F
         Imow==
X-Forwarded-Encrypted: i=1; AL+hErHfKuCIQQuRBhi8zBV7S6+1yw/6oI7qBRBfuKr2F+jAYZIsv0jRS+2+6jBB7pJqkviEnWoObisndBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+170vyFhASoGHMxQ3ZQXRQFGKDSTQAhHlpXNX93cNekvTE7GQR
	U4gVAYZqxtTBM4MvAObnQGM9LNAmM38pUupqaxY+K+CfiDRSqKRvp3Ppq27g5EZAfZKODz0BwBD
	WzX9XQBWCy5INKpIq1d4qqBBJGZQ7fnqRx4DlC8VN8w==
X-Gm-Gg: AZFdTZfK1rPRqd2qBEOM5FxCX0kCOQcXLveuw0WMLulOzTqWWxciKE3uH+fZiC+uKml
	Z5Khq8u0cIVeuegDPPrVFhqP4CjzbOQWIfYV6KeY/ablucmvshTBenct5HU1u3vPJ2Dx/2b8rVH
	g3uoBnVvrQqEP/wVqQCUiB07bTbqiJmXNv87oZriXFCW23k3HvfBl5R+rUSwm2OAw2gFv5qOI/p
	Zp3qo22WT30FP5nHpdjFwGiUxAVVDhXEcVlu7uyLZ7UN4t9h5UW56ladZM/GyF4kweNwj/YnZT3
	cbXGFLqSzOK80QdveZr1fXCN3VYW6U+5aeYbVqgOg7/bOTObpxUek/lPG1U/oYHJUDV1cXX/joW
	kyGXqpWRmWteJChNjYiaGzSszolVg0SueINJwlQ==
X-Received: by 2002:a05:690c:7405:b0:8b3:3fe5:f6ab with SMTP id
 00721157ae682-8b4fecfa349mr19565437b3.24.1795092417770; Thu, 19 Nov 2026
 04:46:57 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 19 Nov 2026 04:46:57 -0800
In-Reply-To: <29e631f0-c135-bea4-0a3b-81dd715cef54@kernel.org>
References: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com> <29e631f0-c135-bea4-0a3b-81dd715cef54@kernel.org>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Date: Thu, 19 Nov 2026 04:46:57 -0800
X-Gm-Features: AclHuK_VCp2Kj6TuYw_2lEwgIiu0LS1C49sX3AV2M1eYDrqr2PQ_yG1as_cK4Hg
Message-ID: <CACnXVne49x1JEPZhCaQzofGDuZa65F6cRpE5Pzj=3s0rzpHUcg@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] riscv: add SBI Supervisor Software Events support
To: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, 
	Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Yuanzhu <yuanzhu@bytedance.com>, Yicong Yang <yang.yicong@picoheart.com>, 
	Susheng Yang <yang.susheng@zte.com.cn>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On 10/6/26 6:21 PM, Paul Walmsley wrote:
> Hi Zhanpeng Zhang,
>
> On Fri, 11 Sep 2026, Zhanpeng Zhang wrote:
>
>> [...]
>
> Thanks for taking this series forward.  Could you please rebase this
> series against the current riscv/for-next branch and repost?  I tried
> pulling the series in, but it needs quite a few updates since we've
> queued up quite a few patches that touch SBI.
>

I've posted v13 [1], rebased onto riscv/for-next at 642fb67393c1. Could
you pick it up for the next merge window?

I'll address the crash-kernel kexec restriction in a separate follow-up.

Thanks,
Zhanpeng

[1]
https://lore.kernel.org/r/20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com/

> thanks,
>
>
> - Paul
