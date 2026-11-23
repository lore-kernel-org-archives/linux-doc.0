Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414286;
	b=A4DCRdCcuKxKfbh+OmsVwQ22aMD5kmI/coc2dnihuP9x/Jk5+iz88hs8VVUWp/0mfcjD
	 gpsWstbpi1+BdlPDpQE5qs1jPHAYjefISJrku+mxCgg7lPbT9hXKvr9aDouv4pcPTtx5r
	 ewv9oPEOVMNu2/mwHFXtS/S7t4mUVJgR4nCodzoZ+H+p98JX2r5AsVYrL8JGiLxMmgUJV
	 h/UcEq7WkMBeCQ+n83pFUYUIuzu79zKqQYmsntcbVMkO0RXXwl7PsptXzZ6foWdDDwfFB
	 kaGZn64G3L/xHPPsb7v8WtZV6I/pJ39f/ABb+3UWi9Y00yhjmZiQkRxH8J/I4nSex6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=GwvMLEpH06q7oweFh5LKZ8RQkrZMsU7+3f+WbZdQx1g=;
	b=Dd+BWuPvikcRgmKyzbP/YfYt6Oo5FiG52WyXQRXet1tmNGocJuVbGQ5b66QfcQMiUj6J
	 e5Q5JI+fPotPvxe13on69vhgm6OXpIl7Ht07ykvp6BBlftNfrbgnzeDy7BQxmYO8EmlV9
	 eEgLoFNIqVa6RZhMZb3TQQWSHcSQf+RoDDI2BuGsWr0ec+kUX0fnMuvG+0akK/BrAxUDo
	 EioQrZRemu8o3b3FEdC1tBGZHfbrE+d7zKUC75pLnrDuVRP9lM4rBrU8U6b86otlYuESR
	 /GlN9xTvonJxbSiXm0aTbBHPEsnos4swKitWcuekhStAOV7LQnIvSfS+BQVf+/QFkAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=AuJUjnTC;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F26B606A31E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 06:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F26B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=AuJUjnTC
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67df3b1ca06so3118224d50.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 22:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795414285; x=1796019085; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwvMLEpH06q7oweFh5LKZ8RQkrZMsU7+3f+WbZdQx1g=;
        b=AuJUjnTCDQjW0sRwRqkQGsiRz50XnJQVN/9h3eRtAnqxV0IaqTgeMpJuWE3mreXHZ0
         u2Dw7h3nBX3Ar9XXtj4bp43M36cLvvdQYcjsAAxJFTaMuMtU3M4puk/LB+8kTFQZupyX
         eyIfE+2JhjPpcsCBYSMq4yMW+VCdu3YJiCIcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414285; x=1796019085;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwvMLEpH06q7oweFh5LKZ8RQkrZMsU7+3f+WbZdQx1g=;
        b=yeMYKavTv95qqGqjdM5rBhO6Md5ORCXkUyNHb1SWAWmsQy9Bp/quqImD9XH6Fe2DM0
         ONAg6duvydZVzxFBPll+0S7CqciUgk0aUxDuKbb2BIccTEefuSWRVCag0yqlxTOdxv+4
         7cffhnlMvBn6ooTYY8lDxqdaevlXbmdhas7jrEcNrcvoDmsErQzmKd0Yc9AKl+8g8w1T
         4/V+Dc1oNrK2uymcJJSG7WRwc2s/hTJl1di7GloMV793uQX3Nb+YT+Sa//xjHoUUPtfg
         /ntzlYXtS/X7ns/kFDmfas5Ps8QdSwHvUTUASwibd6xHQBnev66uvSpk2EeQ5J5CnuxA
         K7pg==
X-Forwarded-Encrypted: i=1; AL+hErGJrqKsLjm3hY/YTGxdHaBud88oGgc8tu5xRWn9gSc6jhvdWh6BjFDmXKcMJQzU6XdQ+V+c1PlPHtw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7MKlmPI7jKexGMbVuLln0dxFgFTOuZTQfS3MDXB/zlQM05xBU
	wUIhuyDyh6TC6QyM027VRTKIglGZXzqudP29R+7mQcQrbGcNUIa5P6BZ9HpRGBuseFw=
X-Gm-Gg: AZFdTZcFeiHSfg9nrSmEt69si00o4IKh7W7klpx/Ek7FWcIvdAnX3I4VhtC80qsN6u+
	i9mILGCkhYL5dwAj6txOuGs6kD5OXcq2c3poMgZJCERKC0f8LRIwqO/9JZaCODokG/cTuBCrp/R
	uM3hzM8HlM4gLSGIxy0q/ejBq/m6CwtpehdKaj6dX3f7iCGVr0k8m6yymY4WW5HIlw7Zte5XF6F
	c9OfBmCLwoyj2UCUkVzN2IpNUTWulXCx7csq/OBjMRN0f3D5jVpNydv+nf/1Yayr4xLua6liX/L
	mijVjTIXODL/GUosQazQD+6EnpdiTvjR7rptEKNJUZT+xD7heZHLnEi8k+cFn5UT1lry/Tuk38f
	jVRl6A6hAvCskv62Po8m+FmcP4LYH2nP/QlQo846+bwGV/SPWGRueTphP0Kqz0LjngK0B3N3AeR
	iJjm0T8qi/rsqPegKlFD/70GspA1rOVNFsbOrOXIcg9XRGZqDjct30lNucNPc1z9h+hz4P9oNgz
	WwEPRELCHKN1MvM+dqUnwmhPywkQu/M+O5So5Y/ZXei6UIah8r1ccvpK3CXyB1I1b9HEOtSaQuj
	M7yAXcVNJqTtGYMkEd7HJvImMS6yzRTyeVXHdjv1SCkwugvp0s6xoW8Mu47AaFEvYaxhCd0BCTM
	GCdKbZ+RS0CgiI2LqqtxKqYfbhgMM9O66RqTgRGWNnv5ZD0wNh6JdVcCXUDO7OSmH3S3Vs5IId6
	B2tiEsO8HBLpUuB5bGFF4+jvyAGiUWDqDyQepYkqbRmTdB8TpgwHOehTmk6YzAWAHcdyh0iq/re
	dRIFQeFQeJAUtIkxF1NY7B2at3ODzGtS9nc97gNMqBx
X-Received: by 2002:a05:690e:4012:b0:67d:c046:4f71 with SMTP id 956f58d0204a3-67df43d2bb2mr4679580d50.23.1795414285477;
        Sun, 22 Nov 2026 22:11:25 -0800 (PST)
Received: from [172.20.0.3] (static-host-74-205-137-217.epbinternet.com. [74.205.137.217])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bc515sm43136087b3.19.2026.11.22.22.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:11:24 -0800 (PST)
Date: Sun, 22 Nov 2026 22:11:21 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: Omar Sandoval <osandov@osandov.com>,
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3] proc/kcore: allow disabling /proc/kcore at boot
In-Reply-To: <20261118-masken-disput-miesmacher-27d6baaae6a8@brauner>
References: <7c10f2e01b6f19229c83e81d887a87f5d1151841.1794904698.git.chris@chrisdown.name>
	<20261118-masken-disput-miesmacher-27d6baaae6a8@brauner>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <awPZCeNqLKVpnbKj@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Thanks for picking this up!

Christian Brauner writes:
>Iow, it would be nicer if someone took the time and came up with some
>boot setting that is a list of memory protection settings instead of
>spraying ever more kernel command line switches that nobody can
>reasonably remember or use.

Hmm, I agree that would be nicer, but I don't see a good way to do it. How
would you suggest going about it?

In my mind, the model one would have for a list like that is mitigations=,
but it didn't replace the specific switches, right? For example, retbleed=
and mds= have nevertheless stayed. In that case, the list sets their
defaults, but more specific switches win out over it.

These are the problems I see with a list like that:

1. I don't know where the list would live. A list of memory protection
    settings in procfs would cover two switches today (that is, kcore= and
    proc_mem.force_override=). Anything wider crosses into mm and security
    (I have similar switches out for slab hardening and mseal, for example),
    and it isn't clear to me who would own that or decide what goes on it.

2. Lockdown already has a list of what gives access to kernel memory,
    with entries for /proc/kcore, /dev/mem, kprobes and so on (although
    not for FOLL_FORCE), but lockdown= only takes the two levels.
    Selecting individual entries was proposed last year, and the lockdown
    maintainers turned it down because most entries can be bypassed when
    they are used on their own [1]. So a wider list would have to be a
    second one next to lockdown's.

Did you have something specific in mind in terms of a design and what it
would encompass?

Chris

[1] https://lore.kernel.org/r/2vldrnqs6fbljqqp6vbwmkushx6dxcpephgb6svmu5i64lijpy@lg37aflddv3b
