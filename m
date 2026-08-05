Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F4B346A11
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 18:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785955234; cv=none; b=PG3UrRJVfN+NdOmbOZAa3JUHgVKUD5WQQS4CDK1hzm+BRE1lcJnGSWXTSadIy0ltNHK0PQYP+iWQ3bdIIsnToHJZThSO5kyoeuQ/cxAsHA1m0S90wujWo1iOmM09W5v2Tas+qOGBpYQ/GFOZyZEYWwq2pGsrH+CslLFMARhpwY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785955234; c=relaxed/simple;
	bh=VQGa2upsx9ocdGpaWrZBxcuCg9RfD0ScMOypzzQQDBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dFZn0mIVAyMhdcJBtLWIrwzx3XnKg2K+fy4NXeyAxwBsyoOakfgXxzNigzpAdHjyHqHPoMCdakIwczYydf10fbJ/49R3c9OkLQrzn7Mx4+Smofl4pP5MjP7vy1C150L7XuHN8pTaSTqa/XhI9RZfhQSqUk4tDN07k9aweuOa9gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=If0wwIWl; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="If0wwIWl"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6acaee38a75so600549eaf.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Aug 2026 11:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1785955231; x=1786560031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2ZwIEMBkvqF+IdFhwC9OUYBf8UgY4VA+Dk6J9NvywQ=;
        b=If0wwIWlV9vl4M2gb1dy9+d9V2ovm8fwyIZdUxjfk9CPA0yB+OSIuIy8xXhG+htkEo
         DP4Ueee+UP4PQ4uGyiTxVgrqreUAL7RMkANq0QzRgmHDZ++imBM5mXZiqEJLAXNAbu8k
         TCITXeONyAohDu9U04dIFOYMROqbmVwxCt8uhj20LCAuc+lSpjsGQFhBbmgowki2Bcdb
         +9E10iFPENJbBC15aqpTcDvOYK5yHr6Aem8P2zG+rXt7liPJHefuIyvQYgS1hsv90mJ1
         ErEsqqVUNtBjVk6ZkDLT/KYGJgbsD2LAm5Sx1Q9FWDK37tlrNUbbjHeUHpyzDewlQpsz
         L/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785955231; x=1786560031;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2ZwIEMBkvqF+IdFhwC9OUYBf8UgY4VA+Dk6J9NvywQ=;
        b=diEFvXDuRiJGyh6dthDnXhWeDKchH0IsuJh/WfWTZp0jiSUzLsMuBDw7kNPgYOCSrJ
         V7z/jG455/2YelQFYckvuYzS7HvB6inE0sqNoUTy0RL8J8q/cx5SK+phWIlaM1VdrJpS
         U7TQMrByLO/Ve7AyucTKq23lpHTaSYQpi0bfqmTFS9j4QaLySntRbHiN0Kkng4WTC+jd
         95n5VU+ZFpziNnFnIihhM/+ePajTYRhPD+LC2mbqFiQiG7Ih0JD4vX5OkkWssta6cftH
         aNr+twBqpBWB/HOuE5QpfHXzhIkhsK7RO71ZG1zQUooRmoY9Jff6/GF7TUo2i2SsIRsa
         +eqg==
X-Forwarded-Encrypted: i=1; AHgh+RrtdFFi68vgzDTU+L4XD6Z2/iIVCGH9UYnR0pDXLpQbxqjsvlUeh2wm8D3wFIu2C3fe0wUxtyu7on8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvj+cl9wbmKYbM0FbTc/31w4N7L+D+S7RknCGlhL1g0/dirzXY
	XOxgfgk8j8kShkUsUYsKguGC17RSm1dKw/EPuVvXJ9PvxcDsH8yGQ57RYzFIP7VONG8=
X-Gm-Gg: AR+sD10zlut88viOLJmuWJweBAuOzs/cyV4XPrzleYa1MgxcPlWmdZUM5cbbISnlKQB
	8bTOdGxtIVJf5Pb72cGFe5ySxf0fVgNX64gPQ518ieU7Egd8kXtkQ4zEbWdaZ9DKNDT7xRV9cAE
	b2BxjRyL3f9VSN8msu7ZxZHPgzoaCQDenMWac1QpmGXyKdPlsIfJIEIFDTxHq29SvNe3d+U639n
	yEjS7H3Z2VeaikeLmKdtoCwKGXEmVCj34hYUGxFTKjCHMpqOccvMV7yBOJ2mdLTrVWEUZ1GW0f7
	RAi1sh7jZyFPFremegMTDl0oi7BFN2VXvHxDpFvUKGNWJPjdwHZMKzMYiTCTE3qsTdv769OsJMn
	RGSKgC6jNA11BtAN4bUMB5IDAHXILXloJLMpa4pFZJA879o/xWQanbKANhY+g6H8l6i0qwWzIV1
	K8NVeP7raTlXJzbB03W39RJBhFzAXJ7HPptwPYoKo5rx2ui+wiI09AtPZjmevsiJE/JMZ20p3pP
	3Zsy/MXp6AQ0/Ii
X-Received: by 2002:a05:6820:4d0b:b0:6a1:83aa:4439 with SMTP id 006d021491bc7-6ae96ed3988mr4754367eaf.18.1785955230895;
        Wed, 05 Aug 2026 11:40:30 -0700 (PDT)
Received: from [192.168.86.29] ([47.232.46.70])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae94012334sm4073784eaf.9.2026.08.05.11.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 11:40:29 -0700 (PDT)
Message-ID: <cc671848-f954-41bf-b7a9-ba34c29593ec@oss.tenstorrent.com>
Date: Wed, 5 Aug 2026 13:40:27 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH 1/2] riscv: hwprobe: export the availability of
 vector to user
To: Florian Weimer <fweimer@redhat.com>, Andy Chiu <tchiu@tenstorrent.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 kito.cheng@sifive.com, dfustini@oss.tenstorrent.com,
 greentime.hu@sifive.com, Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Nutty Liu <nutty.liu@hotmail.com>,
 Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
 Yao Zihong <zihong.plct@isrc.iscas.ac.cn>, Xu Lu
 <luxu.kernel@bytedance.com>, Aleksa Paunovic
 <aleksa.paunovic@htecgroup.com>, Jingwei Wang <wangjingwei@iscas.ac.cn>,
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 linux-api@vger.kernel.org, Jeffrey Law <jeffrey.law@oss.qualcomm.com>
References: <20260723222109.2229089-1-tchiu@tenstorrent.com>
 <20260723222109.2229089-2-tchiu@tenstorrent.com>
 <87bjbwk0q5.fsf@oldenburg.str.redhat.com>
From: Peter Bergner <bergner@oss.tenstorrent.com>
Content-Language: en-US
In-Reply-To: <87bjbwk0q5.fsf@oldenburg.str.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Back from vacation and I don't see that Florian's question was answered, so...
Also adding Jeff in on CC, since Jeff, Palmer and I have discussed this on the
GCC patch review call.


On 7/24/26 7:53 AM, Florian Weimer wrote:
> What is the expected behavior if RISCV_HWPROBE_KEY_EXT_ENABLED is not
> supported?

Unknown keys are ignored by the kernel modulo that the unknown key value
is reset to -1.  This means we can safely pass RISCV_HWPROBE_KEY_EXT_ENABLED
to both old and new kernels.

Andy did look at possibly adding a new "flag" value, rather than a new "key",
but old kernels basically rejected the entire hwprobe call for unknown flag
values and so doing that would not be a userspace simplification.


> We only get a true userspace simplification over hwprobe + prctl if we
> can disable vector extension usage if the kernel does not support
> RISCV_HWPROBE_KEY_EXT_ENABLED (so a V usage regression for older
> kernels).  Otherwise we'd have to use the new approach and, as a
> fallback, the old combination of hwprobe and prctl.

Since the kernel ignores unknown keys, we do get a userspace simplification
over hwprobe + prctl.  The plan is for our GLIBC IFUNC resolvers to just have
one hwprobe call (as they do now) with RISCV_HWPROBE_KEY_EXT_ENABLED as the
first key and RISCV_HWPROBE_KEY_IMA_EXT_0 as the second key.

We also don't need to have any configure time checks in GLIBC to see whether
we can pass the new key to the kernel or not, we can just blindly pass it in.
On old kernels, we'll get the "extension is present" result for the key
RISCV_HWPROBE_KEY_IMA_EXT_0 we're currently getting now, while on new kernels,
we'll get the better "extension is enabled" result.


Peter


