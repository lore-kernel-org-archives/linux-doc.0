Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E170620ADF6
	for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2024 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728650409; cv=none; b=NNBHVZ3Nf/GquFPY4Lnl4YB0/tzIO3zPs04Abvwo8ldlgJhu7ukq3sKBmFGCVmN6qS9+t4jy2FjRASPv2mkLBIrEz2cufHCULh8Y6KKZclgMrdKsLTYz8QnIN/Nd6gvhDQtqtyfHs9wDwDPRggtWQqRM6mJBsBGXoTl4IUYNihg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728650409; c=relaxed/simple;
	bh=5IlAh9eaa066hhQGOnvYY5FSh2X/uES0NpOXBYT3ads=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vl8BMQhncinOwFimWTY4uxNqVRgulFuqiedwOu3BhSQYrRBhg00iwU4Nk4uYLJJ5opIsvYP0+mJqONfDaJKBVKge6678yHOK30KluHKqeLA2KhJfHmDvxEg1dg4daR4bS3gj40xdqV6X/uw5BQmh72rZdz84EpXm1jNg+ZsVsJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HaNC17lq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HaNC17lq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-430576fe517so3504775e9.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2024 05:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728650405; x=1729255205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jjSlbY9SswHqtzN6SDsrxPeSXsZrtE+q4odZyT6wrQ8=;
        b=HaNC17lquVkRGtHUaF6tD43govv1FJI6NmceO1zgDgJZ+U9UYChndAG9uTkanrhzVS
         1WnBwDPIYveqwFQ0yguMoRuo10pFQwrjudKOHi3Nr2FIZKn6893R9G2RoQKlJJ6hTdkB
         wHdU/2zYr2g5w9GP8wlhg4o7FFjtUsstPa4Z8CNDBdVP72WEGxujGGtVY2c4O0Bfp3oV
         TNVo0GOWtxYTVkmMUOEBCbQ1wsogqrACeqJ2J1Mh7I77tNw1whrWZSaj+fYG6aAPvKLT
         ioWqgrJ6CtGjORZ6N4nkgwN/U4cjQplbMCau7StPMLxmByijBEJiuDZahtykg1gyWuIv
         kdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728650405; x=1729255205;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjSlbY9SswHqtzN6SDsrxPeSXsZrtE+q4odZyT6wrQ8=;
        b=M2wokWGRKZC2t1bQAUhzoKWPtnhwjAZgz4MZq1pqyf2cHV5A3uBymDXWFuW9lpSt/k
         YYd4TQOFI19d7eAU2hG218zlSRgCvY3cP7arEUALIQgCWUpXEFtFYRgCNCu8brhWGKyt
         os2r0oYrgoWN+THNbkvY5JBXBkpsBG0qWm4WKW8Ebp8O+e8FU78zRtB4VxhupbWXVwfb
         eiuACnfqi7rtH9oQPbVTGIRSKw8xQgg8y8TdyBGKmxl38FF6YcA3wZkanGQ4TmZREDXO
         4AcI9hxaGhOKPOLP7ZaukHRn4lB8NiMCUo/IUkh5GM3iO74nB9xnr4CDGRrZaC6tBgUP
         8FFw==
X-Forwarded-Encrypted: i=1; AJvYcCVNGuo3iHReb69+hJBTQnTOgGsJFwlTc19/zBJPrEIXu66RvFvE1PvO6R1SM5LlNk8YRWEdlSzn/DE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjHv1+GJbNMg90tMDW8cFMOsV8DLCrOIfPlVilTBUhjHcPSi4p
	ORVtig45vGIOiK/Afch3LbHqO51KfcdCQtfAb/Dy8KgiXYrn07M7mFbtha1Kc8M=
X-Google-Smtp-Source: AGHT+IEhQe5IOJxNuBhL2yrdbI7RCfIGYUA3aoA9RB8lzlagQHDT1wAq80U2DkWwx3uw87ra1cXEqQ==
X-Received: by 2002:a05:600c:1c18:b0:42c:ba61:d20b with SMTP id 5b1f17b1804b1-4311ded5e0emr9405775e9.3.1728650405221;
        Fri, 11 Oct 2024 05:40:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6cf960sm3833902f8f.63.2024.10.11.05.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 05:40:04 -0700 (PDT)
Message-ID: <f7829230-79d1-4282-902d-ae2ac2477dc5@linaro.org>
Date: Fri, 11 Oct 2024 14:40:02 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation/process: maintainer-soc: clarify
 submitting patches
To: Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
 soc@kernel.org
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org,
 Olof Johansson <olof@lixom.net>, Linus Walleij <linus.walleij@linaro.org>,
 linux-doc@vger.kernel.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Will Deacon <will@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley
 <conor@kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-arm-kernel@lists.infradead.org
References: <20240925095635.30452-1-krzysztof.kozlowski@linaro.org>
 <87wmijj0gq.fsf@trenco.lwn.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <87wmijj0gq.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/10/2024 19:18, Jonathan Corbet wrote:
>>
>> ---
>>
>> During our LPC ad-hoc BoF, we discussed improving Maintainer SoC docs
>> and I think I volunteered to write something.  The trouble is that
>> whatever I won't write in my notes, escapes my memory.
>>
>> I believe this is what we discussed.  Was there anything more to
>> write/document?
>>
>> Changes in v2:
>> 1. Fix missing closing ) (Conor).
>> 2. Style changes (in point 3.).
>> 3. Soften note that soc@kernel is not for discussing ("is usually not").
>> ---
>>  Documentation/process/maintainer-soc.rst | 42 +++++++++++++++++++++---
>>  1 file changed, 37 insertions(+), 5 deletions(-)
> 
> Applied, thanks.

Thanks Jon and Arnd. I got now notification that this was also applied
to soc tree, so it seems it got applied twice.

Best regards,
Krzysztof

