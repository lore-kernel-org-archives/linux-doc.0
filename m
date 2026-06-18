Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D301A680F
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 01:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781744636; cv=none; b=EygfkMHtfnGHngk1oyJYBxgNctBFd22zw+Y63zluYzt1wWlrWUY+m1scI4Kn4JuWowuFTGuCadtuYbuYCMLFwsB8SuwbDV6UTaJXQyytehrBLvu3spyyi4CeCCiNepwxjaWgRQZs6nRT7C2HQlwDCZ157/Qd8wEMGDY9uFVEKC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781744636; c=relaxed/simple;
	bh=8NG3M8I4loVexSJCQaUiVxHzwDgUQ0oCpnJY31CbjX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSLiMXEZxwGmHC3vHHObhalmuMHCfuKIX7chooksytjqxoZyryvNs0lGWD3CcHA9jFxYJsfz9eg1sjlHBjtLoz+KAQrHj021UDKsFy4w/nbqQIoEwi1Bwhjq8+GWKJx3nOPVV77x2zM9Bxjymi4yWSVw4tzPZ3/5T209Lv68xlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ByrPnjsw; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ByrPnjsw"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4863ee8474eso239713b6e.2
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 18:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781744634; x=1782349434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ARCAUgzsaxMbVd4A9yETRNbCU+OcaCiHeBSY4FFlaX8=;
        b=ByrPnjswI/KdaHJ4AmAnXOecUmb8YX2x046zj++jbpV5iM2+hthJ8hIONqpJha56nx
         WIGacQhyIPUWLOiWMsjJgRk4thu0J9CFCHAkC3Foy+gjeTU4O5fVPQSGdSZoxMTyWnMV
         fDxrrPuLzYIYuqT2Pxu2kU3cSwpWiKacnmh50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781744634; x=1782349434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARCAUgzsaxMbVd4A9yETRNbCU+OcaCiHeBSY4FFlaX8=;
        b=qrbI78xl0AAO8hefq67DWOWLb/U0DYkZ33BcqbdyCsILBoCTu1Mr/5nFuPUSJVL5ey
         lU82iZ1fKwb2yPk5DY5isol6MbbnzRbQwsd6COSOGc9K52RapGKc685cEaAc4y57jxZX
         BO6sSdjA7UBGErssCXtAMyaWmbdQabOzaItqmQHuAJrf+MGd11ks6lfYE3MgcuZSCl34
         kiiWMzTRxKY2fw1AAN9mj7LhAGFn/3U/+1vxCiFh4wsM+j746/NFTk9XDN/MKwtOzCa0
         LqijrXnOHNF0vQ5w5GGi1snUG1NH/tRP01p03J0AwSOYmOF2//r/2n/veZ27o0bmxb1A
         N+9g==
X-Forwarded-Encrypted: i=1; AFNElJ8rrjhC8hb861ViM3KN6fVUKGw8XjzNotiiYbrpFUc93F9bo/51tzSyWow8dsomnD6PQvjwK+L1BXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0AZQG3ziR4cooe0C2E/HrowWuUOOu+xYxSL3FYJalQO4ETzME
	GDdw7yyvJEK+i709WWojSBnVR778gg35fFtT/D/rKm1L4PVK+Nsr4lTOfxbpY7T+n/XCyldES10
	d7Gde
X-Gm-Gg: Acq92OHAxlQIqU8M9tWZqij4DBDxDy2w/l5GFKHWRWn4S1kO7shxXH6jvn6XK2FZKY/
	ozkUa9yFJWLJI4BdSaLnFw+h49SutIERn+sd3LV/6RKCqRK6JroUhx6w2XXs9VZUl2hA5kbv0ev
	abmhEsguBjvwq1xT3ffvbs8PFpgbkJO4/S1sH+K8m1RjvnSYsJ19/p3DNH4rUUEq/+ukZYdtWnr
	Xi3SMJnAvrCanXvlgMwmd017gIjgUG301gQXLPvu5b1MKlQOGLNryQHgxdMR+6eAV9Y6OOuvH2v
	I2ptcXJ4atrMEpLbRYAgq9KeVzQYNW9opyQMxTFvbxJQqaEgxiRq3YKlLXSelYGlMCGoFFBxbon
	WKC/asbSLqLBVvzZGiIFKDWPXXQukpbe6InPPcS7dGH0kXgZHL22xl1fWQq9/U0q4y6jNI1q0Lw
	UUKTNI5vW65sUaF5THfd7s
X-Received: by 2002:a05:6808:1797:b0:45c:8fa8:7497 with SMTP id 5614622812f47-489429eea8fmr5398284b6e.34.1781744633722;
        Wed, 17 Jun 2026 18:03:53 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4875dfadd66sm7366835b6e.14.2026.06.17.18.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 18:03:52 -0700 (PDT)
Message-ID: <865def83-a07e-4eba-b795-7da66e0e2d69@linuxfoundation.org>
Date: Wed, 17 Jun 2026 19:03:51 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest docs: remove reference to obsolete/archived
 wiki
To: Rafael Passos <rafael@rcpassos.me>, shuah@kernel.org, corbet@lwn.net
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260617235740.74029-1-rafael@rcpassos.me>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260617235740.74029-1-rafael@rcpassos.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/17/26 17:57, Rafael Passos wrote:
> This link in the docs point to a wiki that is no longer active.
> 
> The wiki was moved to archive.kernel.org, and there is a warning:
> "OBSOLETE CONTENT This wiki has been archived and the content is
> no longer updated."
> 
> Signed-off-by: Rafael Passos <rafael@rcpassos.me>
> ---
> 
>   Documentation/dev-tools/kselftest.rst | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index d7bfe320338c..64c0ec7428a2 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -15,11 +15,6 @@ able to run that test on an older kernel. Hence, it is important to keep
>   code that can still test an older kernel and make sure it skips the test
>   gracefully on newer releases.
>   
> -You can find additional information on Kselftest framework, how to
> -write new tests using the framework on Kselftest wiki:
> -
> -https://kselftest.wiki.kernel.org/
> -
>   On some systems, hot-plug tests could hang forever waiting for cpu and
>   memory to be ready to be offlined. A special hot-plug target is created
>   to run the full range of hot-plug tests. In default mode, hot-plug tests run


Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
