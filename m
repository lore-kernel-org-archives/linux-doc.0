Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC0335A95B
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763565344; cv=none; b=FX9CgZeaU/Ea60FqOG2xUZfwMciJbWuED3Baya+L5cCdQZ4Utsv0uEVdC+0P9gPdfSZjbLgaDFUWQHbiEICItloC4YOM7TltRz/B+jEATAgDTEBPt2U8R4vSzaYXBWW2rQM2PUA3FEjddj6H2i6fc9JtH89uXG5R1ymso80GQLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763565344; c=relaxed/simple;
	bh=WVF378LbFwLBB2wVbn6cwzLPzlccU3KtYUUzAqIYrzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GxdIRGUnXTEZB9glxEyYoz8naJnSGcFIB3TyW/w7hYGFgYaLEzg6+ECL51H9VQ5sKesUeSZ8PJTQ+ZiPKxAUreooTb0PkTyNk26c3qfn4Lk8CLnpp1vlLBUNKjEzGHoprVT0krG/gRrGmdzm/5IytNa6cNXkEgulTXIbw/agDSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZJdwe86q; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZJdwe86q"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47790b080e4so30047305e9.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763565341; x=1764170141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=40FUCiNe37Fnq+88hPBjHQqzpAUST38gJZwEDLQ1fMw=;
        b=ZJdwe86q+4Q/6YI37dQA4ZWLB+Cxk+F05Ct9ypBKlK+t/VYWSYZV5TYkwnA0lqBjdw
         YJOR8aDRymr41O4IExT2FYKZ6lx7DyfnKtBMA3eZPzs/6uRUaERvbATxqOZgCpvGxuRO
         7TBjuoN8+fed3IHk6deVz8LhcD0mDoKXCjjmdkbPqYMyuzSX5M2ViwUfv0cEvXRw7PkF
         7m0oSal1McamvJ30Bww8l+jy1kASqWtA4s0fDtDmXGFGYRmVTVhHgwSyricZxeTwyEmj
         uM6/cKQg1GvTeCo9cVPClRXyORNTpfOeLTj25mW64Va4KwOGuJqg/27ow9YXdHamHbo4
         IUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763565341; x=1764170141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40FUCiNe37Fnq+88hPBjHQqzpAUST38gJZwEDLQ1fMw=;
        b=X8mfpdt6gH6AwC9FrpNpDaBVxy5ieD4CSl4fGP0xK6HUW6LXIQ3IM5iDANYrbx+ewC
         bx5jaiMaGWD3M1BDJExtmQyzsNZAcCX74jma9gWljrPfzwz7AtecpQFNDVMmirYFVKiR
         s0EqlXL6xvOucwsZezyZl1uYfdXuh3kZBtGgpWd6N9tOWLSuYP6n+AciLpGIzDF7Mrlh
         UcuzUcSyma1HW7WsHhjuJHyUEmhZPUPiJniMUmofum6zH9+cGs7k6jjnkfJ0yEOT2i/R
         eRxxcNNjYpzgMH8JhA+dlPz0NboY+OIP7MMDY7iaRy8C3EJ8+jPUklQIpKoLhHg/08PT
         BULA==
X-Forwarded-Encrypted: i=1; AJvYcCXzAQo7RSAMGKung6lMFLSm+5YTsfZ6fwn2OrL9O2TiMPYP8VfwK5UoQnnxmBOeb/v2/w1JZRgXgRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNYt9RuWdJSYpgXzaB61pnHdKD01yb/64VTexpDCJw/Mk3e3mU
	0j6iqZg91Z4Jcl3uIFi5DHV8LqZPfNwxSwfIizSpjQ6jvhuTAUqdvV4i/AeU3kSqdMg=
X-Gm-Gg: ASbGncsbuGddQ/4/9KcxNB5HNWKFXNmzOcGRd59ipPvKIbdeRqjJ/Oc3zSgdmpcXuTT
	iBf4B/97WuW0OjrqRKKhefjzRdMgC5zr2LzdMBAu0ovTbHtteJBJEj8jlBGQFGj0s09IhPTrqEE
	zAH6vq8TyyIAk9lisCUeGCFzc5GUGOvcBb7t858NASkNGOyXKmiY5+cLqWBqCCih5EdYCA5p6O8
	XbEd0HQiODbjQPaSTcBdcb/f+lxlXUGCD/8eEHI/BFigQQaucP6tYfLRBxxP2arWdqD59y1gDXF
	DIl1dadVuAahR1RukINYlu2Qra2x2m2DNJc/mJJnNVZrDIieZdjZCR/M86x5JZ/NVVVOKUPnTy4
	WusGIS+36vT+chiYmBZK/WtKEMrZE2S1rKH8bm2Z2OqMIkeXhFpzqacvDMuV8Dj7JTfGj8ruT0t
	y/bG5e6bub9CUayWoYspd4r33npw4=
X-Google-Smtp-Source: AGHT+IEdJcHPoiyWTs3kHkkIy8jDxEKTn292cUpANiNFB7Utp4jeLkleNQmmD+5zgCoeUg929Agzig==
X-Received: by 2002:a5d:5f49:0:b0:42b:36f4:cd21 with SMTP id ffacd0b85a97d-42b593742e7mr20124823f8f.40.1763565340777;
        Wed, 19 Nov 2025 07:15:40 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b62dsm38526469f8f.24.2025.11.19.07.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:15:40 -0800 (PST)
Message-ID: <b503a2aa-2f63-49f1-a7c5-c8c19cb5922f@linaro.org>
Date: Wed, 19 Nov 2025 15:15:39 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
 <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
 <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
 <CAJ9a7Vg9HsMsTP-zroTgaaKWTPkSXE1u5WMORuqMLKSDDz2HSw@mail.gmail.com>
 <43a60afe-5170-4801-ae70-9243cf7b45b8@linaro.org>
 <20251119123647.GC8204@e132581.arm.com>
 <a199db90-a344-40e0-8628-b4c3b56fc92c@linaro.org>
 <20251119143751.GD8204@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251119143751.GD8204@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/11/2025 2:37 pm, Leo Yan wrote:
> On Wed, Nov 19, 2025 at 01:55:15PM +0000, James Clark wrote:
> 
> [...]
> 
>>>     static ssize_t format_attr_contextid_show(struct device *dev,
>>>                                               struct device_attribute *attr,
>>>                                               char *page)
>>>     {
>>>     #if IS_ENABLED(CONFIG_ARM64)
>>>          if (is_kernel_in_hyp_mode())
>>>                  return contextid2_show(dev, attr, page);
>>>     #endif
>>>
>>>          return contextid1_show(dev, attr, page);
>>
>> Not having an #else implies that the contextid1_show() part is valid when
>> !CONFIG_ARM64, but that isn't right. That's why I had the WARN_ON because
>> it's dead code.
> 
> Based on ETMv3/v4 spec, would contextid1 always be valid ?  (Though we do
> not support context ID for ETMv3 yet).
> 

It's not currently supported for ETMv3 in perf mode, which is the 
relevant thing here. So format_attr_contextid_show() never gets called 
for ETMv3 (equivalent to !CONFIG_ARM64).

Based on the spec it may be supported, but that's a different discussion 
and I doubt anyone wants it so it's unlikely to be added.

>> Personally I would drop the is_visible(). It makes sense for dynamically
>> hidden things, but these are all compile time. IMO it's cleaner to just not
>> include them to begin with, rather than include and then hide them. Then the
>> extra condition in format_attr_contextid_show() isn't needed because the
>> function doesn't exist:
> 
> This is fine for me, though in general I think the dynamic approach is
> readable and extendable than the compile-time approach.
> 
> Thanks,
> Leo

I agree in a perfect world, but it seems to have caused confusion and 
wasn't that clean because is_kernel_in_hyp_mode() only exists for arm64.

I'll send a new version without it.

