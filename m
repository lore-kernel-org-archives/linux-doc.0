Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295499;
	b=R6s4m7dZULceZ0kPEU/EGyXEkn6ehl3SzsRDnwHr7eHDDf/9RwZ0EYDfdOvcMCjW5qYn
	 WQGcMhPucq8ZUm2r6uS/WtfE5RUU7zmJSaAb8BIOQfdEM30OEFcXD2jALb1SvTaZDrLSk
	 hb0wYlHTv7vOFHxPwbqcVlfn3TAFCAiiJJhosVEw3CCvV2UUTupODn+zOKyIoTiAIUuLM
	 kLhYOTVuwhdDcwP69Q1TmtdSvvhrZXKLFY7DYYXGwR/J+Ap0n2LuPZruOVbBQYbO7zcuk
	 CqTPo+6kqTTpObTH7Mg1zDVV8b0bbXiK3OiiNQUbGMyYCLR6zIIKuNoNMg42NyskrVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=+xEi/FXjAcaiOhZWzJNypC4CeC4XPVjT5VrS5d9n3Bw=;
	b=3iBMz7XvlbclLzW6ErzeEukL9mKchLXDCrPI2/4/1hSy6feJPVMVjBr15PMcA/+yJerd
	 LNdbpSEE897BFknzRshnHXz498WxkYyjRGqbLKSzeGPfppXmZMpKXJhxTUI9SLqJbyaBi
	 nf9KsBNIRmNOnBg9QNUGNuxqWWqftUkAmuipNVzwbpUXqFGEFe9rOF1M1m7YucuRxzGqk
	 0+0sjKa/mDgFJ6GOf+yG3RV4VrbwZkQaP+DZfal4k0eQ3g5H1bx+NUBIbxqqZvqeJGF6R
	 jSbdw7yYjMqCebSg4tFf3H0IjAYUC0LbUgBoSSMB2RXVIHG5jND5H5xjuMa4EMWVKmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=F0yCYTRH;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65BF606A321
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 17:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D65BF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=F0yCYTRH
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a05da1cc1fso1060295b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 10:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793295498; x=1793900298; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+xEi/FXjAcaiOhZWzJNypC4CeC4XPVjT5VrS5d9n3Bw=;
        b=F0yCYTRH1KCKgj1wamQyvj2+BZVTNOuWxMJPDP0xqDm8z2AXasRhnLVIjfTJB+urOA
         hYMOTEHqguCWwBanaJwRqINoqTBckwHx8a2498qdICI+n/lBDqGMFaBGSnDJTcqrlXwJ
         6N3EVeIucQlMqzblx8dYqq1ROCDLze9gT6aRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295498; x=1793900298;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xEi/FXjAcaiOhZWzJNypC4CeC4XPVjT5VrS5d9n3Bw=;
        b=PilT0M8pI2+JYJbUWxJAEktVnE2rHUt8TVa096mdT0Sq67l1tehJUgY8UieWQ3tQPd
         uYOxxxnWNpeFigIM2YScz8GD3//4ZD+v0nH/naYpiLoTXl7KLPcxbi+ZSMQsBeCytrd2
         wpcWgcKBuLhmOXmfl4DMTC7sFz/pR61re8coWpaC4DwgqFM+tTqLhWA/IkdFhNH12Twi
         9Dbq2BCtnAVdNhggXu14w2M522tU0UYRLiD2G+zdXHu3Z1wO2P9YcwBiYWcmaYo16U9Y
         nzNDHhAw/wge8PeU97puqv06fODdgNLrtHregOxc5hz69NcmLI0fozDwupsoavU0YsnX
         /gVg==
X-Forwarded-Encrypted: i=1; AKwUvByz+zEp3DULu/5fcQtd4XkIWXY4hUWb2XqVH+nRAXhgj+JsYdTK9SF8ptfCuPzH/d5WUKmpiPgpwys=@vger.kernel.org
X-Gm-Message-State: AFq9FYIw4X6yZFN76lxfrkbhonRUr0Q0mGgOyxlo2RxjopelWk28Wqro
	pDNSp/HRIWaquZqrqPVvQaUzWv7Njagy/oHNhcRCrTJB53hLUXiKnWSMKGGogAyRuWM=
X-Gm-Gg: AYBFou2qfZaaHNU7hDK1ViMslGoqAQTEtw+GKZ/PflyfnU4Yha8XK3ZAB4H04AGN/AL
	KUAq+eUIzDfhEnx5BRxYXivp1dXfW/FDfzS/ko2YMnxKKgkhEyjRKSKyx6WDJtFdBRceo9gYEDZ
	h84NLFL4kMpHTlu2VQvImH+v54AD9pgLo3r2TQzQ24upb8dA30RTTFw86NNcwKE+Of5GeLnQRPb
	JvMOc0X4lO7fKyfKgI1Iwz8pu2xHG/v+sgAe0rBUoRLP25nN/3Z5HpC8RaLRzqMHw7VSniqKUgT
	mH/R+ca1U0R3fPnXyXxdP1J7gBjze97U2hEV9T+oJxObZZhoSP2o+jBbz6YGMHOCRFs1YAGD28g
	jdH5eHfwdWCRGJlF43q05gUPpYOpfD0PZyc6w3h3+mFUeDZNS1uJhyl+xMp2j9oSW/jmF5amGnP
	jV+L9oa0oZswfTv4ZBDG7+EmYnngzlq+g6Ec4QQ5sG5OgMMXr9kck0/izDt/fmAO8wMqrjJ+QQv
	s48vbB3eIb3X1OvocOoZpgruXg7XsIFom/GNW2egi6tVMt+3dOqKvePFuYDAHJCvOIBmsjbRddP
	ns0lJfdNQSBTW7co2pjwRHJ1ZHsQ6wEuTIbSrrPNHSXVJJLTCCJRSHglZMD/tT4G6zmlCjmdVLt
	edVhz+spa2+yBm/z7JU6dXToFNaCxubCRyL+GYm4/+GgtDdDWZIYXZPrpnwPclVJOdrVeJ915
X-Received: by 2002:a17:90b:1d44:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3ae57f631f6mr4570721a91.11.1793295497657;
        Thu, 29 Oct 2026 10:38:17 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb1ddsm5096378a91.5.2026.10.29.10.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:38:16 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:38:13 +0800
From: Chris Down <chris@chrisdown.name>
To: Omar Sandoval <osandov@osandov.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] proc/kcore: Allow disabling /proc/kcore at boot
Message-ID: <auOEhTNaKzu8dgEy@chrisdown.name>
References: <auAmuqZyUodq3iqk@chrisdown.name>
 <auKKisespDm1xLLg@os-N5J97HY9XQ>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auKKisespDm1xLLg@os-N5J97HY9XQ>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hi Omar,

Thanks for taking a look!

Omar Sandoval writes:
>The code looks correct, but is there a reason that /proc/kcore
>(CAP_SYS_RAWIO) is any more concerning than other ways to read kernel
>memory (e.g., CAP_BPF + CAP_PERFMON)?

Not in terms of what it can read, indeed. I would say the distinction is more 
about who needs each capability and what we can remove.

Abstractly speaking CAP_SYS_RAWIO may be needed for hardware access without 
necessarily wanting to grant general RAM access. STRICT_DEVMEM already makes 
that possible for /dev/mem, but /proc/kcore gives the same capability to do 
general purpose RAM reading anyway.

In our case in particular, a process with CAP_SYS_RAWIO doesn't necessarily 
have CAP_BPF and CAP_PERFMON, so keeping BPF available doesn't make removing 
kcore redundant.  On the hosts in question, BPF tracing and BPF LSM are part of 
the monitoring and sandboxing we rely on, so we can't remove it from the kernel 
entirely, but we nevertheless keep CAP_BPF and CAP_PERFMON away from guest 
facing processes. Nothing on those host uses /proc/kcore, so we remove it as 
one more gap to close.

For that reason those hosts already run with CONFIG_PROC_KCORE=n, while other 
hosts keep kcore to aid debugging, since they have a different threat model.  
This patch, then, lets us preserve those choices while using the same kernel 
image.

In retrospect I should have explained that better in the commit message :-) I 
can update it for v2. Does that make more sense? Let me know if I can clarify 
further.

Thanks!
